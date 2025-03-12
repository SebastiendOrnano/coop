SET project_id = (select project_id from project_sprints where sprint_id=$sprint_id);

SELECT 
	'redirect' AS component, 
	$redirect_link1 AS link
	WHERE $redirect_link1 != '' OR $redirect1 IS NOT NULL;

SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN  '/e_project_sprints/sprint_main_display_4.sql?project_id='||$project_id
ELSE  '/e_project_sprints/sprint_main_display_3.sql?project_id='||$project_id
END;


SET sprint_date_end_scheduled = DATE(:sprint_date_start_scheduled,'+'||:sprint_duration_scheduled||' days');
SET sprint_date_end_actual = DATE(:sprint_date_start_actual,'+'||:sprint_duration_actual||' days');


UPDATE project_sprints 
SET 
sprint_name=:sprint_name,
sprint_status=:sprint_status,
sprint_summary=:sprint_summary,
sprint_todo=:sprint_todo,
sprint_date_start_scheduled=:sprint_date_start_scheduled,
sprint_date_start_actual=:sprint_date_start_actual,
sprint_date_end_scheduled=$sprint_date_end_scheduled,
sprint_date_end_actual=$sprint_date_end_actual,
sprint_duration_scheduled=:sprint_duration_scheduled,
sprint_duration_actual=:sprint_duration_actual,
sprint_completion_percentage=:sprint_completion_percentage,
modified_at = CURRENT_TIMESTAMP
WHERE sprint_id = $sprint_id


WITH RECURSIVE cte_child(sprint_id,sprint_parent_id, sprint_date_start_scheduled, sprint_duration_scheduled, sprint_date_end_scheduled) AS 
(
    SELECT
        s.sprint_id,
        s.sprint_parent_id,
        s.sprint_date_start_scheduled,
        s.sprint_duration_scheduled,
        s.sprint_date_end_scheduled
    FROM project_sprints as s
    WHERE s.sprint_id = $sprint_id  
    
    UNION ALL  
    
    SELECT 
        s.sprint_id,
        s.sprint_parent_id,
        DATE(JULIANDAY(c.sprint_date_start_scheduled)+ c.sprint_duration_scheduled),
        s.sprint_duration_scheduled,
        s.sprint_date_end_scheduled
     FROM project_sprints as s
     join cte_child  as c on c.sprint_id = s.sprint_parent_id
)

--select * from cte_child;

UPDATE project_sprints as s
SET sprint_date_start_scheduled = c.sprint_date_start_scheduled from cte_child as c WHERE s.sprint_id IN (SELECT c.sprint_id  FROM cte_child);

UPDATE project_sprints
SET 
sprint_date_end_scheduled = DATE(sprint_date_start_scheduled,'+'||sprint_duration_scheduled||' days'),
modified_at = CURRENT_TIMESTAMP

select 'redirect' as component,
$redirect_link as link;