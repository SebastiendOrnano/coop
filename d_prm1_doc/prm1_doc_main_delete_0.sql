SET prm1_doc_url= (SELECT prm1_doc_url  FROM prm1_doc WHERE prm1_doc_id = $prm1_doc_id );
SET prm1_id = (SELECT prm1_id  FROM prm1_doc WHERE prm1_doc_id = $prm1_doc_id );

INSERT INTO files_to_erase (file_url) VALUES ($prm1_doc_url);

DELETE FROM prm1_doc
WHERE prm1_doc_id = $prm1_doc_id
RETURNING
   'redirect' AS component,
   '/d_prm1_doc/prm1_doc_main_display_4.sql?prm1_id='||$prm1_id as link;