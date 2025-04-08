INSERT INTO project_products_categories
(
	product_category_parent_id,
	product_category_name,
	product_category_summary,
	product_category_status
)
VALUES 
(
	:product_category_parent_id,
	:product_category_name,
	:product_category_summary,
	'active'
)

RETURNING 'redirect' AS component,
'/e_project_products/product_category_main_display_4.sql' AS link;


