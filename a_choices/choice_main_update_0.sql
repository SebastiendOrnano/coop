UPDATE choices_items
SET
choice_label = :choice_label,
choice_value = :choice_value,
choice_category_id = 
    CASE 
    WHEN :choice_category_id IS NULL OR :choice_category_id = '' 
    THEN choice_category_id
    ELSE :choice_category_id END,
choice_status = 
    CASE 
    WHEN :choice_status IS NULL OR :choice_status = '' 
    THEN choice_status
    ELSE :choice_status END,

modified_at = CURRENT_TIMESTAMP
WHERE choice_id=$choice_id

RETURNING 'redirect' AS component,
'/a_choices/choice_main_display_5.sql' AS link;