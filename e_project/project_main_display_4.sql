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
    'datagrid'              as component,
    'panel_project_display' as id,
    'Gestion des projets'   as title;
select 
    '/e_project/project_main_form_4.sql'             as link,
    'Création d''un nouveau projet'                   as description,
    'chart-dots-2'                                      as icon,
    'yellow'                                         as color;
select 
    '/e_project/project_map_private_display_4.sql'         as link,
    'Carte des projets '                  as description,
    'pin'                                              as icon,
    'red'                                             as color;
select 
    '/e_project/project_archive_display_4.sql'             as link,
    'Visualiser les projets achivés'                       as description,
    'archive'                                              as icon,
    'green'                                                as color;
select 
    '/e_project_meeting/project_meeting_place_display_4.sql'         as link,
    'Gestion des lieux de réunion'                  as description,
    'map-search'                                              as icon,
    'blue'                                             as color;

select 
    '/e_project_products/product_main_display_4.sql'         as link,
    'Base de données matériaux'                                   as description,
    'database'                                                    as icon,
    'brown'                                                         as color;

-- Display list of projets
SELECT 'table' AS component, 
    'Liste des projets'   AS title, 
    'View'           AS markdown,
    'Nom'           AS markdown,
    TRUE             AS sort, 
    TRUE             AS search;

SELECT
    project_id               AS Id,
    '['||project_name||'](/e_project/project_hub_display_4.sql?project_id='||project_id||')' AS Nom,
    project_category        AS Categorie,
   '[Edit](/e_project/project_main_edit_4.sql?project_id='||project_id||')
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Delete](/e_project/project_main_delete_alert_4.sql?project_id='|| project_id||')'    AS View
FROM project
WHERE project_name IS NOT NULL AND project_status !='archived'
ORDER BY project_id ASC;
