SET prm2_id = select prm2_id from prm2_sub where prm2_sub_id = $prm2_sub_id ;
SET prm1_id = select prm1_id from prm2_sub_employees where employee_id=$employee_id;

DELETE FROM prm2_sub_employees  WHERE employee_id=$employee_id;

UPDATE prm2_sub
SET 
prm2_sub_nb_employees = prm2_sub_nb_employees-1,
modified_at=CURRENT_TIMESTAMP
WHERE prm2_sub_id=$prm2_sub_id

SET prm1_doc_url= SELECT prm1_doc_url FROM prm1_doc WHERE prm1_id  = $prm1_id ;
INSERT INTO files_to_erase (file_url) VALUES ($prm1_doc_url);
DELETE FROM prm1_doc WHERE prm1_id  = $prm1_id;

DELETE FROM prm1 WHERE prm1_id=$prm1_id;

select 
    'redirect' as component,
    '/d_prm2_sub_employees/prm2_sub_employee_main_display_4.sql?prm2_sub_id='||$prm2_sub_id||'&prm2_id='||$prm2_id    as link: