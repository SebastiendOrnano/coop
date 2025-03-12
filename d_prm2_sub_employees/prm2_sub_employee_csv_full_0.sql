select 
    'csv'                             as component,
    'Télécharger la liste des employés' as title,
    'prm1_full_list.csv'              as filename,
    'file-download'    as icon,
    'green'            as color,
    ';'                as separator,
    TRUE               as bom;

SELECT 
p.prm1_id,
p.prm1_gender,
p.prm1_first_name,
p.prm1_last_name,
p.prm1_phone,
p.prm1_email,
p.prm1_category,
p.prm1_function,
p.prm1_date_birthday,
p.prm1_cv_short,
p.prm1_cv_long,
p.prm1_status,
e.employee_id,
e.employee_title,
e.employee_function,
e.employee_category,
e.employee_status,
e.employee_since
FROM prm1 AS p 
LEFT JOIN (SELECT employee_id, employee_title, employee_function, employee_category, employee_status,employee_since, prm2_sub_id, prm1_id, prm2_id FROM prm2_sub_employees) as e
ON p.prm1_id = e.prm1_id
WHERE e.prm2_sub_id=$prm2_sub_id;


