SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell.sql') AS properties;


SET project_number = select count(*) from project where project_status='active';
SET project_worksequence = select count(*) from project_worksequence where worksequence_status='active';
SET number_hours = select SUM(worksequence_duration_scheduled) from project_worksequence  where worksequence_status='active';
SET number_participants = select SUM(worksequence_nb_participants) from project_worksequence  where worksequence_status='active';
SET total_hours = $number_hours * $number_participants;

SET project_id = '1';

SET project_name= select project_name FROM project where project_id=$project_id;

SET workpackage_id = select workpackage_id from project_workpackage where project_id=$project_id and workpackage_status='active';
SET worksequence_id = select worksequence_id from project_worksequence where workpackage_id=$workpackage_id and worksequence_status='active';
SET worksequence_nb_participants = select  worksequence_nb_participants from project_worksequence where worksequence_id=$worksequence_id  and worksequence_status='active';

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
    'Projets'   as title,
    $project_number                 as value,
    'green'                            as value_color,
    4                                 as size,
    'Projets en cours'                as description,
    'building'                       as icon,
    'green'                           as icon_color,
    '/b_about/orga_about.sql'         as link,
    'Découvrez nos actions'           as button_text,
    'green'                           as button_color;
select 
    'Interventions'                       as title,
    $project_worksequence                as value,
    'blue'                                as value_color,
    4                                      as size,
    'shovel-pitchforks'                   as icon,
    'blue'                           as icon_color,
    'Nombre total des chantiers menés'    as description,
    '/b_about/orga_team.sql'               as link,
    'Notre équipe !'                       as button_text,
    'blue'                                 as button_color;
select 
    'Heures de travail'            as title,
    $duration_actual/60              as value,
    'red'                          as value_color,
    4                              as size,
    'clock-hour-4'                 as icon,
    'red'                           as icon_color,
    'Total des heures du travail accompli par nos équipes ' as description,
    '/b_about/orga_doc.sql'                     as link,
    'Nos rapports d''activité'                  as button_text,
    'red'                                       as button_color;
