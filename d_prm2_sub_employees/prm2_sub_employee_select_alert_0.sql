SET redirect_link1 = 
(
    SELECT
    CASE
    WHEN
    (SELECT employee_selected FROM prm2_sub_employees WHERE  employee_selected='yes') IS NULL OR  (SELECT employee_selected FROM prm2_sub_employees WHERE  employee_selected='yes') =''
    THEN '/d_prm2_sub_employees/prm2_sub_employee_main_select_alert1_4.sql?prm2_sub_id='||$prm2_sub_id||'&prm2_id='||$prm2_id
    ELSE ''
    END
);

SELECT 'redirect' AS component, $redirect_link1 AS link
WHERE $redirect_link1 != '' OR $redirect1 IS NOT NULL;

set prm2_id = select prm2_id from prm2_sub where prm2_sub_id = $prm2_sub_id;

SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN '/d_prm2_sub_employees/prm2_sub_employee_main_display_4.sql?prm2_sub_id='||$prm2_sub_id||'&prm2_id='||$prm2_id
ELSE '/d_prm2_sub_employees/prm2_sub_employee_main_display_4.sql?prm2_sub_id='||$prm2_sub_id||'&prm2_id='||$prm2_id
END;


INSERT INTO prm1 
(
prm1_gender, 
prm1_first_name, 
prm1_last_name, 
prm1_email, 
prm1_date_birthday, 
prm1_phone, 
prm1_category, 
prm1_function,
prm1_status,
prm1_cv_short, 
prm1_cv_long
)
    
SELECT 
:prm1_gender, 
:prm1_first_name, 
:prm1_last_name, 
:prm1_email, 
:prm1_date_birthday, 
:prm1_phone,
:prm1_category,
:prm1_function,
'active', 
:prm1_cv_short, 
:prm1_cv_long
    
WHERE :prm1_email IS NOT NULL;

SET prm1_id = SELECT prm1_id FROM prm1 WHERE prm1_email = :prm1_email;

INSERT INTO prm2_sub_employees
(
prm1_id,
prm2_id, 
prm2_sub_id, 
employee_category, 
employee_function, 
employee_title, 
employee_since, 
employee_status
)
    
SELECT 
$prm1_id,
$prm2_id, 
$prm2_sub_id, 
:employee_category, 
:employee_function, 
:employee_title, 
:employee_since, 
'active'

UPDATE prm2_sub
SET 
prm2_sub_nb_employees = prm2_sub_nb_employees+1,
modified_at=CURRENT_TIMESTAMP
WHERE prm2_sub_id=$prm2_sub_id
 
RETURNING  'redirect' AS component,
$redirect_link AS link;


