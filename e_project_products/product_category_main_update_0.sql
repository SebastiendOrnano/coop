SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN  '/e_project_products/product_category_main_display_4.sql'
ELSE  '/e_project_products/product_category_main_display_3.sql'
END;

UPDATE project_products_categories
SET
product_category_name = :product_category_name,
product_category_summary = :product_category_summary,
product_category_status = 
    CASE 
    WHEN :product_category_status IS NULL OR :product_category_status = '' 
    THEN product_category_status
    ELSE :product_category_status END,
modified_at = CURRENT_TIMESTAMP
WHERE product_category_id=$product_category_id

RETURNING 'redirect' AS component,
$redirect_link AS link;