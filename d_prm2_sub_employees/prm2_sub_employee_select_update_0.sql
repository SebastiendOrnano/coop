set prm2_id = select prm2_id from prm2_sub where prm2_sub_id = $prm2_sub_id;

SET redirect_link1 = 
(
    SELECT
        CASE
        WHEN 
        (SELECT employee_selected from prm2_sub_employees where employee_selected='yes') IS NULL or (SELECT employee_selected from prm2_sub_employees where employee_selected='yes') =''
        THEN '/d_prm2_sub_employees/prm2_sub_employee_main_select_alert1_4.sql?prm2_sub_id='||$prm2_sub_id||'&prm2_id='||$prm2_id
        ELSE ''
        END
);

SELECT 'redirect' AS component, $redirect_link1 AS link
WHERE $redirect_link1 != '' OR $redirect1 IS NOT NULL;

SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN '/d_prm2_sub_employees/prm2_sub_employee_select_no_0.sql?prm2_sub_id='||$prm2_sub_id||'&prm2_id='||$prm2_id
ELSE '/d_prm2_sub_employees/prm2_sub_employee_select_no_0.sql?prm2_sub_id='||$prm2_sub_id||'&prm2_id='||$prm2_id
END;


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
WHERE employee_selected = 'yes'
 
RETURNING  'redirect' AS component,
$redirect_link AS link;


