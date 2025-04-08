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

select 
    'form'   as component,
    '' as validate;

SELECT
    'project_id' as name,
    TRUE as readonly,
    'Id ' as label,
    1 as width,
   $project_id as value;

SELECT
    'project_name' as name,
    TRUE as readonly,
    'Nom du projet de rattachement' as label,
    11 as width,
    (select project_name  from project WHERE project_id = $project_id) as value;

select 
    'chart'             as component,
    'bar'               as type,
    'green'             as color,
    'Bilan carbone par tranche de travaux (kg CO2 eq.) ' as title,
    TRUE                as labels;
select 
    w.workpackage_type as label,
    SUM(m.material_carbon_footprint)  as value
FROM project_workpackage_materials as m
LEFT JOIN (select workpackage_id, workpackage_name, workpackage_type, project_id from project_workpackage) as w
ON m.workpackage_id=w.workpackage_id
LEFT JOIN (select project_id, project_name from project) as p
ON w.project_id=p.project_id
where p.project_id=$project_id
GROUP BY m. workpackage_id;




