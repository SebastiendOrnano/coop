SET prm3_doc_url= (SELECT prm3_doc_url  FROM prm3_docs WHERE prm3_doc_id = $prm3_doc_id );
SET prm3_id = (SELECT prm3_id  FROM prm3_docs WHERE prm3_doc_id = $prm3_doc_id );

INSERT INTO files_to_erase (file_url) VALUES ($prm3_doc_url);

DELETE FROM prm3_docs
WHERE prm3_doc_id = $prm3_doc_id
RETURNING
   'redirect' AS component,
   '/d_prm3_doc/prm3_doc_main_display_4.sql?prm3_id='||$prm3_id as link;