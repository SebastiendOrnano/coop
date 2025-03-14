SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion éditeur'         as title,
    '/a_panels/panel_editor_3.sql' as link;

select 
    'datagrid'              as component,
    'panel_project_display' as id,
    'Gestion des projets'   as title;
select 
    '/e_project_meetings/project_meeting_place_display_3.sql'         as link,
    'Gestion des lieux de réunion'                  as description,
    'map-search'                                              as icon,
    'green'                                             as color;
select 
    '/e_projects/project_map_private_display_3.sql'         as link,
    'Carte des projets '                  as description,
    'pin'                                              as icon,
    'green'                                             as color;

-- Display list of projets
SELECT 'table' AS component, 
    'Liste des projets'   AS title, 
    'View'           AS markdown,
    TRUE             AS sort, 
    TRUE             AS search;

SELECT
    project_id               AS Id,
    project_name            AS Nom,
    project_category        AS Categorie,
   '[Participants](/e_project_participants/project_participant_main_display_3.sql?project_id='||project_id||')
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hub](/e_projects/project_hub_display_3.sql?project_id='||project_id||')'  AS View
FROM projects
WHERE project_name IS NOT NULL AND project_status !='archived'
ORDER BY project_id ASC;
