-- vérif si le nom d'utilisateur n'est pas déjà utilisé 
-- vérif si l'email' existe déjà

SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET suffix_role = 
(
	    SELECT
        CASE
            WHEN $user_role = "supervisor" THEN '_4'
            WHEN $user_role = "editor" THEN '_3'
        END
);

SET redirect_link1 = (
    SELECT
      CASE
           WHEN EXISTS (
                SELECT 1 
                FROM prm1
                WHERE CONCAT (prm1_first_name,prm1_last_name) = CONCAT (:prm1_first_name,:prm1_last_name)
            ) 
            THEN '/d_prm2_sub_employees/prm2_sub_employee_main_create_alert1'||$suffix_role||'.sql'
            WHEN 
            EXISTS (
                SELECT 1 
                FROM prm1
                WHERE prm1_email= :prm1_email) 
            THEN '/d_prm2_sub_employees/prm2_sub_employee_main_create_alert2'||$suffix_role||'.sql'
            ELSE ''
        END
);

SET redirect_link2 =  CONCAT($redirect_link1,'?prm2_sub_id=',$prm2_sub_id) ;

SELECT 'redirect' AS component,
$redirect_link2 AS link
WHERE $redirect_link2 != '' OR $redirect2 IS NOT NULL;


SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN '/d_prm2_sub_employees/prm2_sub_employee_main_display_4.sql?prm2_sub_id='||$prm2_sub_id
ELSE '/d_prm2_sub_employees/prm2_sub_employee_main_display_3.sql?prm2_sub_id='||$prm2_sub_id
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
prm2_sub_id, 
employee_category, 
employee_function, 
employee_title, 
employee_since, 
employee_status
)
    
SELECT 
$prm1_id,
$prm2_sub_id, 
:employee_category, 
:employee_function, 
:employee_title, 
:employee_since, 
'active';

UPDATE prm2_sub
SET 
prm2_sub_nb_employees = prm2_sub_nb_employees+1,
modified_at=CURRENT_TIMESTAMP
WHERE prm2_sub_id=$prm2_sub_id
 
RETURNING  'redirect' AS component,
$redirect_link AS link;
