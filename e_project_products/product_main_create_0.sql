SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN  '/e_project_products/product_main_display_4.sql'
ELSE  '/e_project_products/product_main_display_3.sql'
END;

INSERT INTO project_products
(
	product_name,
	product_status,
	product_ienes_url,
	product_functional_unit,
	product_unit,
	product_category_id,
	product_climate_change_indicator,
	product_summary
	)
VALUES 
(
	:product_name,
	'active',
	:product_ienes_url,
	:product_functional_unit,
	:product_unit,
	:product_category_id,
	:product_climate_change_indicator,
	:product_summary
)

RETURNING 'redirect' AS component,
$redirect_link  AS link;


