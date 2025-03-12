SET prm2_id = SELECT prm2_id from prm2_sub where prm2_sub_id=$prm2_sub_id;

INSERT INTO files_to_erase (file_url) 
select prm2_sub_doc_url from prm2_sub_docs
where prm2_sub_doc_selected = "yes";

DELETE FROM prm2_sub_docs
WHERE prm2_sub_doc_selected = "yes"

RETURNING 
'redirect' AS component, 
'/d_prm2_sub_doc/prm2_sub_doc_select_display_4.sql?prm2_sub_id='||$prm2_sub_id||'&prm2_id='||$prm2_id as link;