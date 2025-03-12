DELETE FROM choices_categories
WHERE choice_category_id  = $choice_category_id

RETURNING
'redirect' AS component,
'/a_choices/choice_category_display_5.sql' AS link;