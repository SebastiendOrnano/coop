SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

set workpackage_name = select workpackage_name from project_workpackage where workpackage_id = $workpackage_id;
SET project_id = select project_id from project_workpackage where workpackage_id=$workpackage_id;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Superviseur'         as title,
    '/a_panels/panel_supervisor_4.sql' as link;
 select 
    'Projets'            as title,
    '/e_project/project_main_display_4.sql'     as link;
 select 
    'Hub du projet'            as title,
    '/e_project/project_hub_display_4.sql?project_id='||$project_id     as link; 
select 
    'Hub lot de travaux'    as title,
    '/e_project_workpackage/workpackage_hub_display_4.sql?workpackage_id='||$workpackage_id as link;

select 
    'datagrid'              as component,
    'panel_project_display' as id;
select 
    '/e_project_workpackage_waste/waste_main_form_step1_4.sql?workpackage_id='||$workpackage_id      as link,
    'Création d''un déchet'                  as description,
    'trash'                                      as icon,
    'yellow'                                         as color;
select 
    '/e_project_workpackage_waste/waste_archive_display_4.sql?workpackage_id='||$workpackage_id           as link,
    'Visualiser les déchets achivées'           as description,
    'archive'                                     as icon,
    'green'                                              as color;



select 
    'divider' as component,
    'Liste des déchets sur le de travaux : '||$workpackage_name    as contents,
    'blue' as color;

SELECT 
    'table'               AS component, 
    'Liste des déchets sur le de travaux : '||$workpackage_name AS title, 
    TRUE                  AS sort, 
    'View'                AS markdown,
    'Inv'                AS markdown, 
    FALSE                 AS search;

SELECT
    m.waste_id                     AS Id,
    m.waste_name                   AS Nom,
    c.product_category_name        AS Catégorie,
    m.waste_quantity               as Quantité,
    m.waste_value||'  €'           as Value,
    p.prm2_name                    as Récupérateur,
'[Edit](/e_project_workpackage_waste/waste_main_edit_4.sql?waste_id=' 
||m.waste_id|| 
') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Delete](/e_project_workpackage_waste/waste_main_delete_alert_4.sql?waste_id=' 
||m.waste_id||
')'    AS View
FROM project_workpackage_waste as m
LEFT JOIN (select prm2_id, prm2_name from prm2) as p
on m.recipiend_id = p.prm2_id
LEFT JOIN (select product_category_id, product_category_name from project_products_categories) as c
on c.product_category_id=m.waste_category_id
LEFT JOIN (SELECT workpackage_id from project_workpackage) as w
on w.workpackage_id=m.workpackage_id
WHERE m.waste_status='active' and w.workpackage_id=$workpackage_id
ORDER BY  m.waste_name  ASC;

