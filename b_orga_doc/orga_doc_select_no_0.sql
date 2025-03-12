UPDATE orga_docs 
SET orga_doc_selected = 'no'
RETURNING 
'redirect' AS component, 
'/b_orga_doc/orga_doc_select_display_4.sql' AS link;


