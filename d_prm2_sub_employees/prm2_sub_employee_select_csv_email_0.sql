SELECT
    'csv'              as component,
    'Télécharger email-téléphone des employés sélectionnés' as title,
    'email_membres'           as filename,
    'csv'              as class,
    'file-download'    as icon,
    'yellow'            as color,
    ';'                as separator,
    TRUE               as bom;

SELECT
    e.employee_id      as IdEmploye,
    p.prm1_first_name  as prénom,
    P.prm1_last_name   as nom,
    p.prm1_email       as email, 
    p.prm1_phone       as phone
    FROM prm1 as p
LEFT JOIN (SELECT employee_id, prm2_sub_id, prm1_id, employee_status, employee_selected FROM prm2_sub_employees) as e
ON p.prm1_id = e.prm1_id
WHERE e.prm2_sub_id = $prm2_sub_id  AND e.employee_selected = 'yes';




