SET redirect_link1 =
(
    SELECT
        CASE
            WHEN  :product_choice_category='independant'
            THEN '/e_project_products/product_category_main_form1_4.sql'
            ELSE '/e_project_products/product_category_main_form2_4.sql'
        END
);

SELECT 
	'redirect' AS component, 
	$redirect_link1 AS link
	WHERE $redirect_link1 != '' OR $redirect1 IS NOT NULL;


