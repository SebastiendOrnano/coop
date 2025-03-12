INSERT INTO choices_items
(
	choice_label,
	choice_value,
	choice_category_id,
	choice_status
)
VALUES 
(
	:choice_label,
	:choice_value,
	:choice_category_id,
	'active'
)

RETURNING 'redirect' AS component,
'/a_choices/choice_main_display_5.sql' AS link;


