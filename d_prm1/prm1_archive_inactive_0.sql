UPDATE prm1 
SET prm1_status = 'inactive' 
WHERE prm1_selected ='yes';

UPDATE prm1
SET prm1_selected ='no' WHERE prm1_selected ='yes'

RETURNING 
'redirect' AS component, 
'/d_prm1/prm1_archive_display_4.sql' AS link;


