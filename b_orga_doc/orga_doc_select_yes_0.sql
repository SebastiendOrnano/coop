UPDATE orga_docs 
SET orga_doc_selected = 
(CASE 
    WHEN orga_doc_selected ='yes' then 'no'
    ELSE 'yes' END)
WHERE orga_doc_id = $orga_doc_id

RETURNING 
'redirect' AS component, 
'/b_orga_doc/orga_doc_select_display_4.sql' AS link;


