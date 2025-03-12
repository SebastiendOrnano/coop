SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

SET place_id = SELECT place_id FROM place_spaces_pictures WHERE space_picture_id = $space_picture_id;
SET space_id = SELECT space_id FROM place_spaces_pictures WHERE space_picture_id = $space_picture_id;

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
    '/b_orga_place_spaces/orga_place_space_main_display_4.sql?space_id='||$space_id as link;
select 
    'liste des images attachées à la salle'                     as title,
    '/b_orga_place_spaces/orga_place_space_picture_display_4.sql?space_id='||$space_id as link;



select 
    'divider' as component,
    'Nom du lieu de rattachement'    as contents,
    'blue' as color;

select 
    'form'   as component,
    '' as validate;

SELECT
    'space_id' as name,
    TRUE as readonly,
    'Id ' as label,
    1 as width,
   $space_id as value;

SELECT
    'space_name' as name,
    TRUE as readonly,
    'Nom du lieu de rattachement' as label,
    11 as width,
    (select space_name  FROM place_spaces WHERE space_id = $space_id) as value;
 
select 
    'divider' as component,
    'images rattachées au lieu'    as contents,
    'blue' as color;



SELECT 
    'form' as component,
    'Attacher une image à une salle' as title,
    'Créer' as validate,
    'Clear' as reset,
    '/b_orga_place_spaces/orga_place_space_picture_update_0.sql?space_picture_id='||$space_picture_id as action;

select 
    'space_id' as name,
    'hidden' as type,
    $space_id as value,
    'id' as label;

SELECT
'space_picture_title' as name,
'text' as type,  
'Nom' as label,
(select space_picture_title from place_spaces_pictures where space_picture_id=$space_picture_id) as value,
 6 AS width,
TRUE as required;

SELECT 
'space_picture_status'            as name,
'Statut'                 as label,
'select'                 as type,
3                              AS width,
TRUE                     as required,
(select space_picture_status from place_spaces_pictures where space_picture_id=$space_picture_id) as value,
'Choisir un statut dans la liste...'    as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="status"
    ORDER BY  i.choice_label ASC;

 SELECT 
'space_picture_format'            as name,
'Format'                 as label,
'select'                       as type,
3                              AS width,
(select space_picture_format from place_spaces_pictures where space_picture_id=$space_picture_id) as value,
'Choisir un format dans la liste...'    as  empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="img_format"
    ORDER BY  i.choice_label ASC;

select 
    'file' as type, 
    'space_picture_url' as name,
    'Photo à insérer' as label,
    'image/*' as accept;

SELECT
'space_summary' as name,
'textarea' as type,
(select space_picture_summary from place_spaces_pictures where space_picture_id=$space_picture_id) as value,
'Disposition, équipement, lumière...' as description,
'Présentation de la salle' as label;






















