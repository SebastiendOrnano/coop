SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Superviseur'         as title,
    '/a_panels/panel_supervisor_4.sql' as link;
 select 
    'Retour à la liste des projets'            as title,
    '/e_project/project_main_display_4.sql'     as link;
 select 
    'Retour au hub du projet'            as title,
    '/e_project/project_hub_display_4.sql?project_id='||$project_id     as link;   

SET project_name= select project_name FROM project where project_id=$project_id;

SET workpackage_id = select workpackage_id from project_workpackage where project_id=$project_id and workpackage_status='active';
SET worksequence_id = select worksequence_id from project_worksequence where workpackage_id=$workpackage_id and worksequence_status='active';
SET worksequence_nb_participants = select  worksequence_nb_participants from project_worksequence where worksequence_id=$worksequence_id  and worksequence_status='active';


select 
    'title'     as component,
    'Analyse de la réprtition des temps de travail pour le projet :   '||$project_name    as contents,
    1          as level;

SET duration_scheduled = WITH work_hours_scheduled AS 
    (
    SELECT
    SUM(substr (s.worksequence_end_hour_scheduled, 1,2)*60 * s.worksequence_nb_participants) AS end_hour_scheduled,
    SUM(substr (s.worksequence_start_hour_scheduled, 1,2)*60  * s.worksequence_nb_participants) as start_hour_scheduled,
    SUM(substr (s.worksequence_end_hour_scheduled, 4,2) * s.worksequence_nb_participants)  as end_hour_scheduled_mn,
    SUM(substr (s.worksequence_start_hour_scheduled, 4,2)  * s.worksequence_nb_participants) as start_hour_scheduled_mn
    FROM project_worksequence as s
    LEFT JOIN (select workpackage_id, project_id from project_workpackage) as w ON w.workpackage_id = s.workpackage_id
    where w.project_id=$project_id
    )
    SELECT  (end_hour_scheduled+end_hour_scheduled_mn)-(start_hour_scheduled + start_hour_scheduled_mn) 
    FROM work_hours_scheduled;

SET duration_actual =  WITH work_hours_actual AS 
    (
    SELECT
    SUM(substr (s.worksequence_end_hour_actual,1,2)*60 * s.worksequence_nb_participants) AS end_hour_actual,
    SUM(substr (s.worksequence_start_hour_actual,1,2)*60  * s.worksequence_nb_participants) AS start_hour_actual,
    SUM(substr (s.worksequence_end_hour_actual,4,2) * s.worksequence_nb_participants) AS end_hour_actual_mn,
    SUM(substr (s.worksequence_start_hour_actual,4,2)  * s.worksequence_nb_participants) as start_hour_actual_mn
    FROM project_worksequence as s
    LEFT JOIN (select workpackage_id, project_id from project_workpackage) as w ON w.workpackage_id = s.workpackage_id
    where w.project_id=$project_id
    )
    SELECT (end_hour_actual+end_hour_actual_mn)-(start_hour_actual + start_hour_actual_mn) 
    FROM work_hours_actual;



select 
    'columns' as component;
select 
    'TOTAL Heures de travail prévues'   as title,
    $duration_scheduled/60              as value,
    'red'                            as value_color,
    4                                 as size,
    $project_name||' :   Nb d''heures prévues'                as description,
    'shovel-pitchforks'                       as icon,
    'red'                           as icon_color,
    'red'                           as button_color;
select 
    'TOTAL Heures de travail réalisées'   as title,
   $duration_actual/60                 as value,
    'green'                            as value_color,
    4                                 as size,
    $project_name||' :   Nb d''heures réalisées'                as description,
    'shovel-pitchforks'                       as icon,
    'green'                           as icon_color,
    'green'                           as button_color;

select 
    'chart'             as component,
    'bar'               as type,
    TRUE                as horizontal,
    'Répartition des temps de travail prévues par séquence' as title,
    'red'             as color,
    TRUE                as labels;
select 
    '(scheduled    '||s.worksequence_name||'--'||workpackage_name as label,
    'red' as color,
   (((substr (s.worksequence_end_hour_scheduled,1,2)*60 * s.worksequence_nb_participants) + (substr (s.worksequence_end_hour_scheduled,4,2) * s.worksequence_nb_participants))-(( substr (s.worksequence_start_hour_scheduled,1,2)*60  * s.worksequence_nb_participants)+substr (s.worksequence_start_hour_scheduled,4,2)  * s.worksequence_nb_participants))/60  as value
    FROM project_worksequence as s
    LEFT JOIN (select workpackage_id, workpackage_name, project_id from project_workpackage) as w 
    ON w.workpackage_id = s.workpackage_id
    where w.project_id=$project_id;

select 
    'chart'             as component,
    'bar'               as type,
    TRUE                as horizontal,
    'Répartition des temps de travail réel  par séquence' as title,
    'green'             as color,
    TRUE                as labels;
select 
    '(actual)       '||s.worksequence_name||'--'||workpackage_name as label,
    'green' as color,
   (((substr (s.worksequence_end_hour_actual,1,2)*60 * s.worksequence_nb_participants) + (substr (s.worksequence_end_hour_actual,4,2) * s.worksequence_nb_participants))-(( substr (s.worksequence_start_hour_actual,1,2)*60  * s.worksequence_nb_participants)+substr (s.worksequence_start_hour_actual,4,2)  * s.worksequence_nb_participants))/60  as value
    FROM project_worksequence as s
    LEFT JOIN (select workpackage_id, workpackage_name, project_id from project_workpackage) as w 
    ON w.workpackage_id = s.workpackage_id
    where w.project_id=$project_id;



