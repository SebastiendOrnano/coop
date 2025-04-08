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
'/e_project_products/product_category_main_display_4.sql' AS link;