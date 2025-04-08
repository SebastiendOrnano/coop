DELETE FROM project_products_categories
WHERE product_category_id  = $product_category_id

RETURNING
'redirect' AS component,
'/e_project_products/product_category_main_display_4.sql' AS link;