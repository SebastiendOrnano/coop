SET prm2_id = select prm2_id from prm2_sub where prm2_sub_id = $prm2_sub_id ;

SET nb_employees_selected = SELECT COUNT(*) FROM prm2_sub_employees  WHERE employee_selected='yes';

UPDATE prm1
SET prm1_selected = 'yes'
FROM   (SELECT prm1_id FROM prm2_sub_employees WHERE employee_selected = 'yes') AS selection
WHERE prm1.prm1_id = selection.prm1_id;

UPDATE prm1_doc
SET prm1_doc_selected = 'yes'
FROM   (SELECT prm1_id  FROM prm1 WHERE prm1_selected = 'yes') AS selection2
WHERE   prm1_doc.prm1_id = selection2.prm1_id;

DELETE FROM prm2_sub_employees  WHERE employee_selected='yes';

UPDATE prm2_sub
SET 
prm2_sub_nb_employees = prm2_sub_nb_employees-$nb_employees_selected,
modified_at=CURRENT_TIMESTAMP
WHERE prm2_sub_id=$prm2_sub_id

INSERT INTO files_to_erase (file_url) 
select prm1_doc_url from prm1_doc
where prm1_doc_selected='yes';

DELETE FROM prm1_doc  WHERE prm1_doc_selected='yes';

DELETE FROM prm1 WHERE prm1_selected='yes';

select 
    'redirect' as component,
    '/d_prm2_sub_employees/prm2_sub_employee_select_display_4.sql?prm2_sub_id='||$prm2_sub_id||'&prm2_id='||$prm2_id    as link: