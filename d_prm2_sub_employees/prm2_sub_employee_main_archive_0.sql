SET prm2_id = select prm2_id from prm2_sub where prm2_sub_id = $prm2_sub_id ;
SET prm1_id = select prm1_id from prm2_sub_employees where employee_id=$employee_id;

UPDATE prm2_sub_employees 
SET
employee_status='archived',
modified_at=CURRENT_TIMESTAMP
WHERE employee_id=$employee_id;

UPDATE prm2_sub
SET 
prm2_sub_nb_employees = prm2_sub_nb_employees-1,
modified_at=CURRENT_TIMESTAMP
WHERE prm2_sub_id=$prm2_sub_id

UPDATE prm1
SET
prm1_status='archived',
modified_at=CURRENT_TIMESTAMP
WHERE prm1_id=$prm1_id;

select 
    'redirect' as component,
    '/d_prm2_sub_employees/prm2_sub_employee_main_display_4.sql?prm2_sub_id='||$prm2_sub_id||'&prm2_id='||$prm2_id    as link: