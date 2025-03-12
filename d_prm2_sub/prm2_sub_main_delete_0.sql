DELETE FROM prm3_participants WHERE prm2_sub_id  = $prm2_sub_id;

DELETE FROM project_participants WHERE prm2_sub_id = $prm2_sub_id;

DELETE FROM project_participants_workpackage WHERE prm2_sub_id = $prm2_sub_id;

DELETE FROM project_participants_worksequence WHERE prm2_sub_id = $prm2_sub_id;

DELETE FROM prm2_sub_employees WHERE prm2_sub_id  = $prm2_sub_id;

SET prm2_sub_doc_url= SELECT prm2_sub_doc_url FROM prm2_sub_doc WHERE prm2_sub_id  = $prm2_sub_id ;
INSERT INTO files_to_erase (file_url) VALUES ($prm2_sub_doc_url);

DELETE FROM prm2_sub_doc WHERE prm2_sub_id  = $prm2_sub_id ;

SET prm2_sub_logo_url= SELECT prm2_sub_logo_url FROM prm2_sub WHERE prm2_sub_id  = $prm2_sub_id;
INSERT INTO files_to_erase (file_url) VALUES ($prm2_sub_logo_url);

DELETE FROM prm2_sub WHERE prm2_sub_id  = $prm2_sub_id 
RETURNING
'redirect' AS component,
'/d_prm2_sub/prm2_sub_main_display_4.sql?prm2_id='||$prm2_id AS link;