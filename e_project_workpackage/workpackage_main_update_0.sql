SET project_id = (select project_id from project_workpackage where workpackage_id=$workpackage_id);

SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN  '/e_project/project_hub_display_4.sql?project_id='||$project_id
ELSE  '/e_project/project_hub_display_3.sql?project_id='||$project_id
END;


SET workpackage_date_end_scheduled = DATE(:workpackage_date_start_scheduled,'+'||:workpackage_duration_scheduled||' days');
SET workpackage_date_end_actual = DATE(:workpackage_date_start_actual,'+'||:workpackage_duration_actual||' days');


UPDATE project_workpackage
SET 
workpackage_name=:workpackage_name,
workpackage_status=:workpackage_status,
workpackage_summary=:workpackage_summary,
workpackage_todo=:workpackage_todo,
workpackage_status=:workpackage_status,
workpackage_type=:workpackage_type,
workpackage_mode=:workpackage_mode,
workpackage_cost_estimated=:workpackage_cost_estimated,
workpackage_cost_actual=:workpackage_cost_actual,
workpackage_date_start_scheduled=:workpackage_date_start_scheduled,
workpackage_date_start_actual=:workpackage_date_start_actual,
workpackage_date_end_scheduled=$workpackage_date_end_scheduled,
workpackage_date_end_actual=$workpackage_date_end_actual,
workpackage_duration_scheduled=:workpackage_duration_scheduled,
workpackage_duration_actual=:workpackage_duration_actual,
workpackage_completion_percentage=:workpackage_completion_percentage,
modified_at = CURRENT_TIMESTAMP
WHERE workpackage_id = $workpackage_id


WITH RECURSIVE cte_child(workpackage_id,workpackage_parent_id, workpackage_date_start_scheduled, workpackage_duration_scheduled, workpackage_date_end_scheduled) AS 
(
    SELECT
        s.workpackage_id,
        s.workpackage_parent_id,
        s.workpackage_date_start_scheduled,
        s.workpackage_duration_scheduled,
        s.workpackage_date_end_scheduled
    FROM project_workpackage as s
    WHERE s.workpackage_id = $workpackage_id  
    
    UNION ALL  
    
    SELECT 
        s.workpackage_id,
        s.workpackage_parent_id,
        DATE(JULIANDAY(c.workpackage_date_start_scheduled)+ c.workpackage_duration_scheduled),
        s.workpackage_duration_scheduled,
        s.workpackage_date_end_scheduled
     FROM project_workpackage as s
     join cte_child  as c on c.workpackage_id = s.workpackage_parent_id
)

--select * from cte_child;

UPDATE project_workpackage as s
SET workpackage_date_start_scheduled = c.workpackage_date_start_scheduled from cte_child as c WHERE s.workpackage_id IN (SELECT c.workpackage_id  FROM cte_child);

UPDATE project_workpackage
SET 
workpackage_date_end_scheduled = DATE(workpackage_date_start_scheduled,'+'||workpackage_duration_scheduled||' days'),
modified_at = CURRENT_TIMESTAMP

select 'redirect' as component,
$redirect_link as link;


