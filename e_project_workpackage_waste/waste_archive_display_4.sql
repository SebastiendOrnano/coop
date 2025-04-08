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
    'Projets'            as title,
    '/e_project/project_main_display_4.sql'     as link;
 select 
    'Hub du projet'            as title,
    '/e_project/project_hub_display_4.sql?project_id='||$project_id     as link; 
select 
    'Hub lot de travaux'    as title,
    '/e_project_workpackage/workpackage_hub_display_4.sql?workpackage_id='||$workpackage_id as link;
select 
    'Déchets actifs'            as title,
    '/e_project_workpackage_waste/waste_main_display_4.sql?workpackage_id='||$workpackage_id    as link;



select 
    'divider' as component,
    'Base des matériaux archivés'    as contents,
    'blue' as color;

SELECT 
    'table'               AS component, 
    'Liste des matériaux' AS title, 
    TRUE                  AS sort, 
    'View'                AS markdown, 
    FALSE                 AS search;

SELECT
    m.waste_id              AS Id,
    m.waste_name            AS Nom,
    m.waste_category        as Type,
    p.prm2_name                as Fournisseur,
'[Edit](/e_project_workpackage_waste/waste_main_edit_4.sql?waste_id=' 
||m.waste_id|| 
') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Delete](/e_project_workpackage_waste/waste_main_delete_alert_4.sql?waste_id=' 
||m.waste_id||
')'    AS View
FROM project_workpackage_waste as m
LEFT JOIN (select prm2_id, prm2_name from prm2) as p
on m.provider_id = p.prm2_id
WHERE m.waste_status!='active'
ORDER BY m.waste_category ASC;

