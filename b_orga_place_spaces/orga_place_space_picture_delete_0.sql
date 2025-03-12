SET space_id= SELECT space_id from place_spaces_pictures WHERE space_picture_id  = $space_picture_id;
SET space_picture_url= (SELECT space_picture_url FROM place_spaces_pictures WHERE  space_picture_id = $space_picture_id);
INSERT INTO files_to_erase (file_url) VALUES ($space_picture_url);

DELETE FROM place_spaces_pictures WHERE space_picture_id  = $space_picture_id;

select 'redirect' as component,
'/b_orga_place_spaces/orga_place_space_picture_display_4.sql?space_id='||$space_id as link;