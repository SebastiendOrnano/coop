set prm2_id = select prm2_id from prm2_sub where prm2_sub_id = $prm2_sub_id;
set prm1_id = :prm1_id;

SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN '/d_prm2_sub_employees/prm2_sub_employee_main_display_4.sql?prm2_sub_id='||$prm2_sub_id||'&prm2_id='||$prm2_id
ELSE '/d_prm2_sub_employees/prm2_sub_employee_main_display_3.sql?prm2_sub_id='||$prm2_sub_id||'&prm2_id='||$prm2_id
END;


UPDATE prm1
SET
prm1_first_name = :prm1_first_name,
prm1_last_name= :prm1_last_name,

    prm1_gender = CASE 
    WHEN :prm1_gender IS NULL OR :prm1_gender = '' 
    THEN prm1_gender
    ELSE :prm1_gender END,

    prm1_category = CASE 
    WHEN :prm1_category IS NULL OR :prm1_category = '' 
    THEN prm1_category
    ELSE :prm1_category END,

    prm1_status = CASE 
    WHEN :prm1_status IS NULL OR :prm1_status = '' 
    THEN prm1_status
    ELSE :prm1_status END,

    prm1_function = CASE 
    WHEN :prm1_function IS NULL OR :prm1_function = '' 
    THEN prm1_function
    ELSE :prm1_function END,
prm1_phone = :prm1_phone, 
prm1_email = :prm1_email,
prm1_date_birthday = : prm1_date_birthday,
prm1_cv_short = :prm1_cv_short, 
prm1_cv_long = :prm1_cv_long,
modified_at = CURRENT_TIMESTAMP
WHERE prm1_id =  $prm1_id;

UPDATE prm2_sub_employees
SET 
    employee_title = CASE 
    WHEN :employee_title IS NULL OR :employee_title = '' 
    THEN employee_title
    ELSE :employee_title END,

    employee_category = CASE 
    WHEN :employee_category IS NULL OR :employee_category = '' 
    THEN employee_category
    ELSE :employee_category END,

    employee_status = CASE 
    WHEN :employee_status IS NULL OR :employee_status = '' 
    THEN employee_status
    ELSE :employee_status END,

    employee_function = CASE 
    WHEN :employee_function IS NULL OR :employee_function = '' 
    THEN employee_function
    ELSE :employee_function END,

    employee_since = CASE 
    WHEN :employee_since IS NULL OR :employee_since = '' 
    THEN employee_since
    ELSE :employee_since END,
modified_at = CURRENT_TIMESTAMP
WHERE employee_id = $employee_id
 
RETURNING  'redirect' AS component,
$redirect_link AS link;


