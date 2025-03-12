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
    '/e_projects/project_main_display_4.sql'     as link;
 select 
    'Retour au hub du projet'            as title,
    '/e_projects/project_hub_display_4.sql?project_id='||$project_id     as link;   

SET project_name= select project_name FROM projects where project_id=$project_id;





SELECT 
    'form'      AS component,
    'Choisir un participant individuel' as validate,
    'stat_worksequence_workhours_participant3_csv_0.sql?project_id='||$project_id AS action;

select 
   'employee_id' as name,
    'Nom de l''employé' as label,
    'select' as type,
    8 AS width,
    TRUE as searchable,
    'Saisissez quelques lettres du nom que vous cherchez ou choississez dans la liste' as empty_option,
    json_group_array(json_object('label', i.prm1_last_name || '   ' || i.prm1_first_name, 'value',e.employee_id)) AS options
    FROM prm1 as i
    LEFT JOIN (SELECT employee_id, prm1_id, prm2_sub_id FROM prm2_sub_employees) as e
    on e.prm1_id=i.prm1_id
    LEFT JOIN (SELECT worksequence_id, employee_id FROM project_participants_worksequence) as p
    on p.employee_id=e.employee_id
    LEFT JOIN (SELECT worksequence_id, worksequence_name, workpackage_id, worksequence_start_date_scheduled, worksequence_start_date_actual, worksequence_start_hour_scheduled, worksequence_start_hour_actual, worksequence_end_hour_scheduled, worksequence_end_hour_actual, worksequence_duration_scheduled, worksequence_status  FROM project_worksequences) as s
    ON p.worksequence_id = s.worksequence_id
    LEFT JOIN (SELECT workpackage_id, workpackage_name, project_id FROM project_workpackages) as w
    ON s.workpackage_id = w.workpackage_id
    LEFT JOIN (SELECT project_id, project_name FROM projects) as p
    ON p.project_id = w.project_id
    WHERE p.project_id = $project_id AND s.worksequence_status='active' AND e.prm2_sub_id=:prm2_sub_id
    ORDER BY i.prm1_last_name ASC,i.prm1_first_name ASC;
