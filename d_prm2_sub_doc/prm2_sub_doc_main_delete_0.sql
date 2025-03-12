SET prm2_sub_doc_url= (SELECT prm2_sub_doc_url  FROM prm2_sub_docs WHERE  prm2_sub_doc_id = $prm2_sub_doc_id);
INSERT INTO files_to_erase (file_url) VALUES ($prm2_sub_doc_url);

set prm2_id = SELECT prm2_id from prm2_sub where prm2_sub_id=$prm2_sub_id;

DELETE FROM prm2_sub_docs
WHERE prm2_sub_doc_id = $prm2_sub_doc_id
RETURNING
   'redirect' AS component,
'/d_prm2_sub_doc/prm2_sub_doc_main_display_4.sql?prm2_sub_id='||$prm2_sub_id||'&prm2_id='||$prm2_id AS link;