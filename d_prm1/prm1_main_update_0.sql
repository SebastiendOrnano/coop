SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN '/d_prm1/prm1_main_display_4.sql'
ELSE '/d_prm1/prm1_main_display_3.sql'
END;

UPDATE prm1
SET
    prm1_gender = CASE 
    WHEN :prm1_gender IS NULL OR :prm1_gender = '' 
    THEN prm1_gender
    ELSE :prm1_gender END,

    prm1_status = CASE 
    WHEN :prm1_status IS NULL OR :prm1_status = '' 
    THEN prm1_status
    ELSE :prm1_status END,


    prm1_category = CASE 
    WHEN :prm1_category IS NULL OR :prm1_category = '' 
    THEN prm1_category
    ELSE :prm1_category END,

    prm1_function = CASE 
    WHEN :prm1_function IS NULL OR :prm1_function = '' 
    THEN prm1_function
    ELSE :prm1_function END,

prm1_first_name=:prm1_first_name, 
prm1_last_name=:prm1_last_name, 
prm1_email=:prm1_email, 
prm1_phone=:prm1_phone, 
prm1_date_birthday=:prm1_date_birthday, 
prm1_function=:prm1_function, 
prm1_cv_short=:prm1_cv_short, 
prm1_cv_long=:prm1_cv_long,
modified_at = CURRENT_TIMESTAMP

WHERE prm1_id = $prm1_id

RETURNING 
'redirect' AS component, 
$redirect_link AS link;


