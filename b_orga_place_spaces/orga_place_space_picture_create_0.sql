SET place_id = SELECT place_id FROM place_spaces WHERE space_id = $space_id;

INSERT INTO place_spaces_pictures 
( 
place_id,
space_id,
space_picture_title,
space_picture_status,
space_picture_format,
space_picture_url,
space_picture_summary
)

SELECT
$place_id,
$space_id,
:space_picture_title,
:space_picture_status,
:space_picture_format, 
sqlpage.persist_uploaded_file('space_picture_url', 'x_pictures_spaces', 'pdf,jpg,jpeg,png,svg,obj'),
:space_picture_summary

WHERE :space_picture_title IS NOT NULL

RETURNING  'redirect' AS component,
'/b_orga_place_spaces/orga_place_space_picture_display_4.sql?space_id='||$space_id AS link;
