SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 
SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN  '_4.sql'
ELSE  '_3.sql'
END;


SET redirect_link1 =
(
    SELECT
        CASE
            WHEN  :product_choice_category='independant'
            THEN '/e_project_products/product_category_main_form1'||$redirect_link
            ELSE '/e_project_products/product_category_main_form2'||$redirect_link
        END
);

SELECT 
	'redirect' AS component, 
	$redirect_link1 AS link
	WHERE $redirect_link1 != '' OR $redirect1 IS NOT NULL;


