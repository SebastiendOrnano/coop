UPDATE regex
SET
regex_name = :regex_name,
regex_value = :regex_value,
regex_description = :regex_description,
regex_comment = :regex_comment,
regex_status = 
    CASE 
    WHEN :regex_status IS NULL OR :regex_status = '' 
    THEN regex_status
    ELSE :regex_status END,

modified_at = CURRENT_TIMESTAMP
WHERE regex_id=$regex_id

RETURNING 'redirect' AS component,
'/a_choices/regex_main_display_5.sql' AS link;