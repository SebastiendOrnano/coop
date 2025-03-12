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
    'Choisir une entreprise' as validate,
    'stat_worksequence_workhours_participant2_csv_0.sql?project_id='||$project_id AS action;

select 
   'prm2_sub_id' as name,
    'Nom du participant' as label,
    'select' as type,
    8 AS width,
    TRUE as searchable,
    'Saisissez quelques lettres du nom que vous cherchez ou choississez dans la liste' as empty_option,
    json_group_array(json_object('label', i.prm2_sub_name, 'value', i.prm2_sub_id)) AS options
    FROM prm2_sub as i
    LEFT JOIN (SELECT worksequence_id, prm2_sub_id FROM project_participants_worksequence) as p
    on p.prm2_sub_id=i.prm2_sub_id
    LEFT JOIN (SELECT worksequence_id, worksequence_name, workpackage_id, worksequence_start_date_scheduled, worksequence_start_date_actual, worksequence_start_hour_scheduled, worksequence_start_hour_actual, worksequence_end_hour_scheduled, worksequence_end_hour_actual, worksequence_duration_scheduled, worksequence_status  FROM project_worksequences) as s
    ON p.worksequence_id = s.worksequence_id
    LEFT JOIN (SELECT workpackage_id, workpackage_name, project_id FROM project_workpackages) as w
    ON s.workpackage_id = w.workpackage_id
    LEFT JOIN (SELECT project_id, project_name FROM projects) as p
    ON p.project_id = w.project_id
    WHERE p.project_id = $project_id AND s.worksequence_status='active'
    ORDER BY i.prm2_sub_name ASC;
