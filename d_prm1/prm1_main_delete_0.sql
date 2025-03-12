SET prm1_doc_url= SELECT prm1_doc_url FROM prm1_doc WHERE prm1_id  = $prm1_id ;
INSERT INTO files_to_erase (file_url) VALUES ($prm1_doc_url);

DELETE FROM prm2_sub_employees WHERE prm1_id = $prm1_id;

DELETE FROM prm3_participants WHERE prm1_id = $prm1_id;

DELETE FROM project_participants WHERE prm1_id = $prm1_id;

DELETE FROM project_participants_workpackage WHERE prm1_id = $prm1_id;

DELETE FROM project_participants_worksequence WHERE prm1_id = $prm1_id;

DELETE FROM prm1_doc WHERE prm1_id  = $prm1_id;

DELETE FROM prm1 WHERE prm1_id = $prm1_id

RETURNING
   'redirect' AS component,
   '/d_prm1/prm1_main_display_4.sql' as link;