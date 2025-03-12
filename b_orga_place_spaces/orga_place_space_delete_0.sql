DELETE FROM place_spaces
WHERE space_id  = $space_id;

DELETE FROM place_spaces sWHERE space_id  = $space_id 
RETURNING
'redirect' AS component,
'/b_orga_place_spaces/orga_place_space_main_display_4.sql' AS link;