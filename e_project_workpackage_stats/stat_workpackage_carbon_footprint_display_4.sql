SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

set project_id=select project_id from project_workpackage where workpackage_id=$workpackage_id ;

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
    ' hub du projet'            as title,
    '/e_project/project_hub_display_4.sql?project_id='||$project_id     as link; 
select 
    'Hub lot de travaux'            as title,
    '/e_project_workpackage/workpackage_hub_display_4.sql?workpackage_id='||$workpackage_id     as link;
 select 
    'Gestion matériaux'            as title,
    '/e_project_workpackage_materials/material_main_display_4.sql?workpackage_id='||$workpackage_id as link;

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
    'Nom de la tranche de travaux de rattachement' as label,
    5 as width,
    (select project_name  from project WHERE project_id = $project_id) as value;
SELECT
    'workpackage_id' as name,
    TRUE as readonly,
    'Id ' as label,
    1 as width,
   $workpackage_id as value;

SELECT
    'workpackage_name' as name,
    TRUE as readonly,
    'Nom de la tranche de travaux de rattachement' as label,
    5 as width,
    (select workpackage_name  from project_workpackage WHERE workpackage_id = $workpackage_id) as value;

SET workpackage_carbon_footprint = SELECT SUM(material_carbon_footprint) from project_workpackage_materials where  workpackage_id=$workpackage_id;

select  'text' as component;
select 'Total empreinte carbone de la tranche de travaux :  '||$workpackage_carbon_footprint||' kg CO2 eq.' as contents_md


select 
    'chart'             as component,
    'bar'               as type,
    'green'             as color,
    'Bilan carbone par matériaux dans la tranche de travaux (kg CO2 eq.) ' as title,
    TRUE                as labels;
select 
    p.product_name               as label,
    SUM(m.material_carbon_footprint)  as value
FROM project_workpackage_materials as m
LEFT JOIN (select product_id, product_name from project_products) as p
ON p.product_id=m.product_id
where m.workpackage_id=$workpackage_id
GROUP BY p.product_name;






