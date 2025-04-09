SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;


select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Editeur'         as title,
    '/a_panels/panel_editor_3.sql' as link;
 select 
    'Retour à la liste des projets'            as title,
    '/e_project/project_main_display_3.sql'     as link;   
 select 
    'Retour au hub du projet'            as title,
    '/e_project/project_hub_display_3.sql?project_id='||$project_id     as link;   

select 
    'datagrid'              as component,
    'panel_building_display' as id,
    'Gestion des bâtiments' as title;
select 
    '/e_project_building/building_main_form_3.sql?project_id='||$project_id     as link,
    'Création d''un nouveau lieu'                  as description,
    'building-community'                                      as icon,
    'yellow'                                         as color;


-- Display list of places
SELECT 'table' AS component, 
    'Liste des salles'   AS title, 
    'View'           AS markdown,
    TRUE             AS sort, 
    TRUE             AS search;

SELECT
    building_id         AS Id,
   building_name        AS Nom,
   building_town        AS Ville,
   '[Map](/e_project_building/building_location_display_3.sql?building_id='||building_id||')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   [view](/e_project_building/building_main_profile_3.sql?building_id='||building_id||')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   [rooms](/e_project_building_rooms/room_main_display_3.sql?building_id='|| building_id|| ')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   [Edit](/e_project_building/building_main_edit_3.sql?building_id=' || building_id ||')'    AS View
FROM project_building 
WHERE project_id=$project_id 
AND building_status !='archived' 
ORDER BY building_id ASC;
