
DELETE FROM project_participants WHERE prm3_id  = $prm3_id;

DELETE FROM project_participants_workpackage WHERE prm3_id  = $prm3_id;

DELETE FROM project_participants_worksequence WHERE prm3_id  = $prm3_id;


SET prm3_doc_url= SELECT prm3_doc_url FROM prm3_docs WHERE prm3_id  = $prm3_id;
INSERT INTO files_to_erase (file_url) VALUES ($prm3_doc_url);

DELETE FROM prm3_docs WHERE prm3_id  = $prm3_id;

DELETE FROM prm3_participants WHERE prm3_id  = $prm3_id;

DELETE FROM prm3 WHERE prm3_id  = $prm3_id

RETURNING
'redirect' AS component,
'/d_prm3/prm3_main_display_4.sql' AS link;