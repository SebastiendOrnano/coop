UPDATE prm2_sub_employees
SET employee_selected = 'yes'
FROM   (SELECT prm1_id  FROM prm1 WHERE prm1_selected = 'yes') AS selection2
WHERE   prm2_sub_employees.prm1_id = selection2.prm1_id;

DELETE prm2_sub_employees
WHERE employee_selected = 'yes';

UPDATE prm1_doc
SET prm1_doc_selected = 'yes'
FROM   (SELECT prm1_id  FROM prm1 WHERE prm1_selected = 'yes') AS selection2
WHERE   prm1_doc.prm1_id = selection2.prm1_id;

INSERT INTO files_to_erase (file_url) 
select prm1_doc_url from prm1_doc
where prm1_doc_selected='yes';

DELETE prm1_doc
WHERE prm1_doc_selected='yes';

DELETE FROM prm1
WHERE prm1_selected = 'yes'
RETURNING
   'redirect' AS component,
   '/d_prm1/prm1_select_display_4.sql)' as link;