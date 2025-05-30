SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

set workpackage_name = select workpackage_name from project_workpackage where workpackage_id = $workpackage_id;
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
    'Hub projet'            as title,
    '/e_project/project_hub_display_4.sql?project_id='||$project_id       as link;
select 
    'Hub lot de travaux'            as title,
    '/e_project_workpackage/workpackage_hub_display_4.sql?workpackage_id='||$workpackage_id     as link;

select 
    'datagrid'              as component,
    'Calcul du bilan carbone matériaux du lot de travaux' as title,
    'panel_project_display' as id;
select 
    '/e_project_workpackage_materials/material_main_form_step1_4.sql?workpackage_id='||$workpackage_id      as link,
    'Création d''un materiau'                  as description,
    'alarm-smoke'                                      as icon,
    'yellow'                                         as color;
select 
    '/e_project_workpackage_materials/material_archive_display_4.sql?workpackage_id='||$workpackage_id           as link,
    'Visualiser les materiaus achivées'           as description,
    'archive'                                     as icon,
    'green'                                              as color;

select 
    'divider' as component,
    'Bilan carbone - Liste des materiaux sur le de travaux : '||$workpackage_name    as contents,
    'blue' as color;

SELECT 
    'table'               AS component, 
    'Liste des materiaux sur le de travaux : '||$workpackage_name AS title, 
    TRUE                  AS sort, 
    'View'                AS markdown,
    'Inv'                AS markdown, 
    FALSE                 AS search;

SELECT
    m.material_id                            AS Id,
    p.product_name                           AS Nom,
    p.product_climate_change_indicator       AS Indicator,
    m.material_equiv_fonctional_units        as EquivUnitFonction,
    m.material_carbon_footprint              as BilanCarbone,
'[Edit](/e_project_workpackage_materials/material_main_edit_4.sql?material_id=' 
||m.material_id|| 
') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Delete](/e_project_workpackage_materials/material_main_delete_alert_4.sql?material_id=' 
||m.material_id||
')'    AS View
FROM project_workpackage_materials as m
LEFT JOIN (select product_id, product_name,product_climate_change_indicator from project_products ) as p
ON p.product_id = m.product_id
WHERE m.material_status='active' and m.workpackage_id=$workpackage_id
ORDER BY p.product_name ASC;

