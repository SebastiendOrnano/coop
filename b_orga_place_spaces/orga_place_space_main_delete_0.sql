SET place_id= SELECT place_id from place_spaces where space_id=$space_id;
SET space_picture_url= (SELECT space_picture_url FROM place_spaces_pictures WHERE  space_id  = $space_id);
INSERT INTO files_to_erase (file_url) VALUES ($space_picture_url);


DELETE FROM place_spaces WHERE space_id  = $space_id;

select 'redirect' as component,
'/b_orga_place_spaces/orga_place_space_main_display_4.sql?place_id='||$place_id as link;