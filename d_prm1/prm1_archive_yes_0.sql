UPDATE prm1 
SET prm1_selected = CASE 
when prm1_selected ='yes' then 'no'
ELSE 'yes' END
WHERE prm1_id = $prm1_id

RETURNING 
'redirect' AS component, 
'/d_prm1/prm1_archive_display_4.sql' AS link;


