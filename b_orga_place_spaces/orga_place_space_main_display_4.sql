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
    'Gestion des lieux'            as title,
    '/b_orga_places/orga_place_main_display_4.sql'     as link;


select 
    'divider' as component,
    'Nom du lieu de rattachement'    as contents,
    'blue' as color;

select 
    'form'   as component,
    '' as validate;

SELECT
    'place_id' as name,
    TRUE as readonly,
    'Id ' as label,
    1 as width,
   $place_id as value;

SELECT
    'place_name' as name,
    TRUE as readonly,
    'Nom du lieu de rattachement' as label,
    11 as width,
    (select place_name  FROM place WHERE place_id = $place_id) as value;
 
select 
    'divider' as component,
    'salles rattachées au lieu'    as contents,
    'blue' as color;

SELECT 
    'table'               AS component, 
    'Liste des salles rattachées au lieu' AS title, 
    TRUE                  AS sort, 
    'View'                AS markdown, 
    FALSE                 AS search;

SELECT
    space_id            AS Id,
    space_name            AS Nom,
    space_level            AS Niveau,
    space_capacity_seats      AS Assis,
    space_capacity_standup as Debout,
'[Pict](/b_orga_place_spaces/orga_place_space_picture_display_4.sql?space_id=' 
||space_id||
  ') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Edit](/b_orga_place_spaces/orga_place_space_main_edit_4.sql?space_id=' 
||space_id|| 
') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Delete](/b_orga_place_spaces/orga_place_space_main_delete_alert_4.sql?space_id=' 
||space_id||
')'    AS View
FROM place_spaces
WHERE place_id = $place_id
ORDER BY space_id ASC;



set place_name=(select place_name  FROM place WHERE place_id = $place_id);

select 
    'button' as component,
    'sm'     as size;
select 
    '/b_orga_place_spaces/orga_place_space_main_form_4.sql?place_id='||$place_id     as link,
    'green' as outline,
    TRUE as important,
    'Créer une nouvelle salle'  as title,
    'copy-plus'  as icon;


