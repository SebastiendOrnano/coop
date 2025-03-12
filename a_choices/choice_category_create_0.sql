INSERT INTO choices_categories
(
	choice_category_name,
	choice_category_summary,
	choice_category_status
)
VALUES 
(
	:choice_category_name,
	:choice_category_summary,
	'active'
)

RETURNING 'redirect' AS component,
'/a_choices/choice_category_display_5.sql' AS link;


