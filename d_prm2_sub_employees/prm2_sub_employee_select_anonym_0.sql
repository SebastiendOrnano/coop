SET prm2_id = select prm2_id from prm2_sub where prm2_sub_id = $prm2_sub_id ;
SET prm1_id = select prm1_id from prm2_sub_employees where employee_id=$employee_id;

SET anonymous1=  select(sqlpage.random_string(8));
SET anonymous2=  select(sqlpage.random_string(8));
SET anonymous3=  select(sqlpage.random_string(8));

SET nb_employees_selected = SELECT COUNT(*) FROM prm2_sub_employees WHERE employee_selected='yes';

UPDATE prm2_sub_employees 
SET
employee_status='archived',
modified_at=CURRENT_TIMESTAMP
WHERE employee_selected='yes';

UPDATE prm2_sub
SET 
prm2_sub_nb_employees = prm2_sub_nb_employees-nb_employees_selected,
modified_at=CURRENT_TIMESTAMP
WHERE prm2_sub_id=$prm2_sub_id

UPDATE prm1
p.prm1_status='archived'
p.prm1_first_name=$anonymous1, 
p.prm1_last_name=$anonymous2, 
p.prm1_phone='000000',
p.prm1_email=$anonymous3||'@nowhere.com',
p.prm1_status='archived',
p.modified_at = CURRENT_TIMESTAMP
FROM  prm1 as p
LEFT JOIN (SELECT prm1_id, employee_selected FROM prm2_sub_employees) as e
ON p.prm1_id = e.prm1_id
WHERE e.employee_selected='yes';

UPDATE prm1_doc
SET 
d.prm1_doc_status='archived'
FROM  prm1_doc as d
LEFT JOIN (SELECT prm1_id, prm1_selected FROM prm1) as p
ON d.prm1_id = p.prm1_id
WHERE p.prm1_selected='archived';


select 
    'redirect' as component,
    '/d_prm2_sub_employees/prm2_sub_employee_main_display_4.sql?prm2_sub_id='||$prm2_sub_id||'&prm2_id='||$prm2_id    as link: