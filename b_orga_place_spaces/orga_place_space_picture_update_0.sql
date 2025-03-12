SET place_id = SELECT place_id FROM place_spaces_pictures WHERE space_picture_id = $space_picture_id;
SET space_id = SELECT space_id FROM place_spaces_pictures WHERE space_picture_id = $space_picture_id;
SET space_picture_url = sqlpage.persist_uploaded_file('space_picture_url', 'x_pictures_spaces', 'doc,docx,odt,md,pdf,jpg,jpeg,png');
SET space_picture_url_old = SELECT space_picture_url FROM place_spaces_pictures WHERE space_picture_id=$space_picture_id;
SET space_picture_url_old_to_erase = CASE WHEN $space_picture_url IS NOT NULL OR $space_picture_url !='' THEN $space_picture_url_old ELSE '' END;
INSERT INTO files_to_erase (file_url) VALUES ($space_picture_url_old_to_erase);


UPDATE place_spaces_pictures 
SET 
space_picture_title=:space_picture_title,
space_picture_status=:space_picture_status,
space_picture_format=:space_picture_format,
space_picture_url =
CASE  
WHEN $space_picture_url IS NULL OR $space_picture_url ='' THEN space_picture_url
ELSE $space_picture_url
END,
space_picture_summary=:space_picture_summary,
modified_at = CURRENT_TIMESTAMP

WHERE space_picture_id=$space_picture_id

RETURNING  'redirect' AS component,
'/b_orga_place_spaces/orga_place_space_picture_display_4.sql?space_id='||$space_id AS link;
