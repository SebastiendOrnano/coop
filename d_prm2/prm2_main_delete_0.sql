
DELETE FROM prm2_sub_employees WHERE prm2_id  = $prm2_id;

SET prm2_doc_url= SELECT prm2_doc_url from prm2_sub_doc WHERE prm2_id  = $prm2_id;
INSERT INTO files_to_erase (file_url) VALUES ($prm2_doc_url);

DELETE from prm2_sub_doc WHERE prm2_id  = $prm2_id;

SET prm2_sub_logo_url= SELECT prm2_sub_logo_url from prm2_sub WHERE prm2_id  = $prm2_id;
INSERT INTO files_to_erase (file_url) VALUES ($prm2_sub_logo_url);

DELETE from prm2_sub WHERE prm2_id  = $prm2_id;

SET prm2_logo_url= SELECT prm2_logo_url from prm2 WHERE prm2_id  = $prm2_id;
INSERT INTO files_to_erase (file_url) VALUES ($prm2_logo_url);


DELETE from prm2 WHERE prm2_id  = $prm2_id

RETURNING
'redirect' AS component,
'/d_prm2/prm2_main_display_4.sql' AS link;