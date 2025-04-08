
SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN  '/e_project_products/product_main_display_4.sql?'
ELSE  '/e_project_products/product_main_display_3.sql?'
END;

DELETE FROM project_products WHERE product_id  = $product_id;

select 'redirect' as component,
$redirect_link as link;