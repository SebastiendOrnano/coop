SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

SET place_id = SELECT place_id FROM place_spaces WHERE space_id = $space_id;


select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Superviseur'                 as title,
    '/a_panels/panel_supervisor_4.sql'   as link;
select 
    'liste des salles actives'                     as title,
    '/b_orga_places/orga_place_main_display_4.sql' as link;
select 
    'Salle de rattachement'                     as title,
    '/b_orga_place_spaces/orga_place_space_main_display_4.sql?place_id='||$place_id  as link;

set space_name=(select space_name  FROM place_spaces WHERE space_id = $space_id);

select 
    'datagrid' as component;
select 
    '/b_orga_place_spaces/orga_place_space_picture_form_4.sql?space_id='||$space_id     as link,
    'Nouvelle image / plan'  as description,
    'photo-scan'  as icon;


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
   $space_id as value;

SELECT
    'place_name' as name,
    TRUE as readonly,
    'Nom du lieu de rattachement' as label,
    11 as width,
    (select space_name  FROM place_spaces WHERE space_id = $space_id) as value;
 
select 
    'divider' as component,
    'images rattachées au lieu'    as contents,
    'blue' as color;

SELECT 
    'table'               AS component, 
    'Liste des images rattachées au lieu' AS title, 
    TRUE                  AS sort,
    'Img'                  AS markdown, 
    'View'                AS markdown, 
    FALSE                 AS search;

SELECT
      '![view picture]('||space_picture_url||')' AS Img,
    space_picture_id            AS Id,
    space_picture_title            AS Nom,
    space_picture_format            AS Format,
'[Edit](/b_orga_place_spaces/orga_place_space_picture_edit_4.sql?space_picture_id=' 
||space_picture_id|| 
') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Delete](/b_orga_place_spaces/orga_place_space_picture_delete_alert_4.sql?space_picture_id=' 
||space_picture_id||
')'    AS View
FROM place_spaces_pictures
WHERE space_id = $space_id
ORDER BY space_picture_id ASC;






