SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

SET project_name = select project_name from projects where project_id=$project_id;

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
    '/e_projects/project_main_display_4.sql'     as link;
 select 
    'Retour au hub du projet'            as title,
    '/e_projects/project_hub_display_4.sql?project_id='||$project_id     as link; 

select 
    'chart'             as component,
    'bar'               as type,
    TRUE                as horizontal,
    'Temps de travail cumulés pour les personnes physiques individuelles (PRM1) sur le projet : '||$project_name as title,
    'green'             as color,
    TRUE                as labels;
select 
    i.prm1_first_name||' '||i.prm1_last_name as label,
    'green' as color,
   (((substr (s.worksequence_end_hour_actual,1,2)*60 * s.worksequence_nb_participants) + (substr (s.worksequence_end_hour_actual,4,2) * s.worksequence_nb_participants))-(( substr (s.worksequence_start_hour_actual,1,2)*60  * s.worksequence_nb_participants)+substr (s.worksequence_start_hour_actual,4,2)  * s.worksequence_nb_participants))/60  as value
    FROM prm1 as i
    LEFT JOIN (select worksequence_id, prm1_id from project_participants_worksequence) as p ON p.prm1_id = i.prm1_id
    LEFT JOIN (select workpackage_id, worksequence_id, worksequence_end_hour_actual,worksequence_nb_participants, worksequence_start_hour_actual from project_worksequences) as s ON p.worksequence_id = s.worksequence_id
    LEFT JOIN (select workpackage_id, project_id from project_workpackages) as w ON w.workpackage_id = s.workpackage_id
    where w.project_id=$project_id;

select 
    'chart'             as component,
    'bar'               as type,
    TRUE                as horizontal,
    'Temps de travail cumulés pour les entreprises (PRM2) sur le projet : '||$project_name as title,
    'blue'             as color,
    TRUE                as labels;
select 
    i.prm2_sub_name as label,
    'blue' as color,
   (((substr (s.worksequence_end_hour_actual,1,2)*60 * s.worksequence_nb_participants) + (substr (s.worksequence_end_hour_actual,4,2) * s.worksequence_nb_participants))-(( substr (s.worksequence_start_hour_actual,1,2)*60  * s.worksequence_nb_participants)+substr (s.worksequence_start_hour_actual,4,2)  * s.worksequence_nb_participants))/60  as value
    FROM prm2_sub as i
    LEFT JOIN (select worksequence_id, prm2_sub_id from project_participants_worksequence) as p ON p.prm2_sub_id = i.prm2_sub_id
    LEFT JOIN (select workpackage_id, worksequence_id, worksequence_end_hour_actual,worksequence_nb_participants, worksequence_start_hour_actual from project_worksequences) as s ON p.worksequence_id = s.worksequence_id
    LEFT JOIN (select workpackage_id, project_id from project_workpackages) as w ON w.workpackage_id = s.workpackage_id
    where w.project_id=$project_id;

select 
    'chart'             as component,
    'bar'               as type,
    TRUE                as horizontal,
    'Temps de travail cumulés pour les groupes (PRM3) sur le projet : '||$project_name as title,
    'red'             as color,
    TRUE                as labels;
select 
    i.prm3_name as label,
    'red' as color,
   (((substr (s.worksequence_end_hour_actual,1,2)*60 * s.worksequence_nb_participants) + (substr (s.worksequence_end_hour_actual,4,2) * s.worksequence_nb_participants))-(( substr (s.worksequence_start_hour_actual,1,2)*60  * s.worksequence_nb_participants)+substr (s.worksequence_start_hour_actual,4,2)  * s.worksequence_nb_participants))/60  as value
    FROM prm3 as i
    LEFT JOIN (select worksequence_id, prm3_id from project_participants_worksequence) as p ON p.prm3_id = i.prm3_id
    LEFT JOIN (select workpackage_id, worksequence_id, worksequence_end_hour_actual,worksequence_nb_participants, worksequence_start_hour_actual from project_worksequences) as s ON p.worksequence_id = s.worksequence_id
    LEFT JOIN (select workpackage_id, project_id from project_workpackages) as w ON w.workpackage_id = s.workpackage_id
    where w.project_id=$project_id;