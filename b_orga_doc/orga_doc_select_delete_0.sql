DELETE FROM orga_docs
WHERE orga_doc_selected = "yes"

RETURNING 
'redirect' AS component, 
'/b_orga_doc/orga_doc_select_display_4.sql' AS link;