INSERT INTO files_to_erase (file_url)
SELECT prm1_doc_url FROM prm1_doc WHERE  prm1_doc_selected = 'yes';

DELETE FROM prm1_doc
WHERE prm1_doc_selected = "yes"

RETURNING 
'redirect' AS component, 
'/d_prm1_doc/prm1_doc_select_no_0.sql?prm1_id='||$prm1_id AS link;