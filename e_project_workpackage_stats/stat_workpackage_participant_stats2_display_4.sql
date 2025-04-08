SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

SET project_id = select project_id from project_workpackage where workpackage_id=$workpackage_id;
SET workpackage_name= select workpackage_name FROM project_workpackage where workpackage_id=$workpackage_id;
SET project_name= select project_name FROM project where project_id=$project_id;
SET worksequence_id = select worksequence_id from project_worksequence where workpackage_id=$workpackage_id and worksequence_status='active';
SET worksequence_nb_participants = select  worksequence_nb_participants from project_worksequence where worksequence_id=$worksequence_id  and worksequence_status='active';

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Superviseur'         as title,
    '/a_panels/panel_supervisor_4.sql' as link;
 select 
    'Hub du projet'            as title,
    '/e_project/project_hub_display_4.sql?project_id='||$project_id      as link;
 select 
    'Hub du lot de travaux'            as title,
    '/e_project_workpackage/workpackage_hub_display_4.sql?workpackage_id='||$workpackage_id    as link; 

select 
    'chart'             as component,
    'bar'               as type,
    TRUE                as horizontal,
    'Temps de travail cumulés pour les personnes physiques individuelles (PRM1) sur le lot de travaux : '||$workpackage_name as title,
    'green'             as color,
    TRUE                as labels;
select 
    i.prm1_first_name||' '||i.prm1_last_name as label,
    'green' as color,
   (((substr (s.worksequence_end_hour_actual,1,2)*60 * s.worksequence_nb_participants) + (substr (s.worksequence_end_hour_actual,4,2) * s.worksequence_nb_participants))-(( substr (s.worksequence_start_hour_actual,1,2)*60  * s.worksequence_nb_participants)+substr (s.worksequence_start_hour_actual,4,2)  * s.worksequence_nb_participants))/60  as value
    FROM prm1 as i
    LEFT JOIN (select worksequence_id, prm1_id, employee_id from project_worksequence_participants where employee_id IS NULL or employee_id='') as p ON p.prm1_id = i.prm1_id
    LEFT JOIN (select workpackage_id, worksequence_id, worksequence_end_hour_actual,worksequence_nb_participants, worksequence_start_hour_actual from project_worksequence) as s ON p.worksequence_id = s.worksequence_id
    LEFT JOIN (select workpackage_id, project_id from project_workpackage) as w 
    ON w.workpackage_id = s.workpackage_id
    where w.workpackage_id=$workpackage_id;

select 
    'chart'             as component,
    'bar'               as type,
    TRUE                as horizontal,
    'Temps de travail cumulés pour les entreprises (PRM2) sur le lot de travaux : '||$workpackage_name as title,
    'blue'             as color,
    TRUE                as labels;
select 
    i.prm2_sub_name as label,
    'blue' as color,
   (((substr (s.worksequence_end_hour_actual,1,2)*60 * s.worksequence_nb_participants) + (substr (s.worksequence_end_hour_actual,4,2) * s.worksequence_nb_participants))-(( substr (s.worksequence_start_hour_actual,1,2)*60  * s.worksequence_nb_participants)+substr (s.worksequence_start_hour_actual,4,2)  * s.worksequence_nb_participants))/60  as value
    FROM prm2_sub as i
    LEFT JOIN (select worksequence_id, prm2_sub_id from project_worksequence_participants) as p ON p.prm2_sub_id = i.prm2_sub_id
    LEFT JOIN (select workpackage_id, worksequence_id, worksequence_end_hour_actual,worksequence_nb_participants, worksequence_start_hour_actual from project_worksequence) as s ON p.worksequence_id = s.worksequence_id
    LEFT JOIN (select workpackage_id, project_id from project_workpackage) as w ON w.workpackage_id = s.workpackage_id
    where w.workpackage_id=$workpackage_id;

select 
    'chart'             as component,
    'bar'               as type,
    TRUE                as horizontal,
    'Temps de travail cumulés pour les employé (PRM2-sub-employés) sur le lot de travaux : '||$workpackage_name as title,
    'green'             as color,
    TRUE                as labels;
select 
    i.prm1_first_name||' '||i.prm1_last_name||' / '||e.prm2_sub_name as label,
    'green' as color,
   (((substr (s.worksequence_end_hour_actual,1,2)*60 * s.worksequence_nb_participants) + (substr (s.worksequence_end_hour_actual,4,2) * s.worksequence_nb_participants))-(( substr (s.worksequence_start_hour_actual,1,2)*60  * s.worksequence_nb_participants)+substr (s.worksequence_start_hour_actual,4,2)  * s.worksequence_nb_participants))/60  as value
    FROM prm1 as i
    LEFT JOIN (select worksequence_id, prm1_id, prm2_sub_id, employee_id from project_worksequence_participants where employee_id IS NOT NULL or employee_id !='') as p ON p.prm1_id = i.prm1_id
    LEFT JOIN (select prm2_sub_id, prm2_sub_name from prm2_sub) as e on e.prm2_sub_id = p.prm2_sub_id
    LEFT JOIN (select workpackage_id, worksequence_id, worksequence_end_hour_actual,worksequence_nb_participants, worksequence_start_hour_actual from project_worksequence) as s ON p.worksequence_id = s.worksequence_id
    LEFT JOIN (select workpackage_id, project_id from project_workpackage) as w 
    ON w.workpackage_id = s.workpackage_id
    where w.workpackage_id=$workpackage_id;

select 
    'chart'             as component,
    'bar'               as type,
    TRUE                as horizontal,
    'Temps de travail cumulés pour les groupes (PRM3) sur le lot de travaux : '||$workpackage_name as title,
    'red'             as color,
    TRUE                as labels;
select 
    i.prm3_name as label,
    'red' as color,
   (((substr (s.worksequence_end_hour_actual,1,2)*60 * s.worksequence_nb_participants) + (substr (s.worksequence_end_hour_actual,4,2) * s.worksequence_nb_participants))-(( substr (s.worksequence_start_hour_actual,1,2)*60  * s.worksequence_nb_participants)+substr (s.worksequence_start_hour_actual,4,2)  * s.worksequence_nb_participants))/60  as value
    FROM prm3 as i
    LEFT JOIN (select worksequence_id, prm3_id from project_worksequence_participants) as p ON p.prm3_id = i.prm3_id
    LEFT JOIN (select workpackage_id, worksequence_id, worksequence_end_hour_actual,worksequence_nb_participants, worksequence_start_hour_actual from project_worksequence) as s ON p.worksequence_id = s.worksequence_id
    LEFT JOIN (select workpackage_id, project_id from project_workpackage) as w ON w.workpackage_id = s.workpackage_id
    where w.workpackage_id=$workpackage_id;