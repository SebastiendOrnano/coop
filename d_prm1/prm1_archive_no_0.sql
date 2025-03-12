UPDATE prm1 
SET prm1_selected='no', modified_at = CURRENT_TIMESTAMP


RETURNING 
'redirect' AS component, 
'/d_prm1/prm1_archive_display_4.sql' AS link;


