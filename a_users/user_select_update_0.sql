UPDATE users 
SET
    user_gender = CASE 
    WHEN :user_gender IS NULL OR :user_gender = '' 
    THEN user_gender
    ELSE :user_gender END,

    user_status = CASE 
    WHEN :user_status IS NULL OR :user_status = '' 
    THEN user_status
    ELSE :user_status END,

    user_role = CASE 
    WHEN :user_role IS NULL OR :user_role = '' 
    THEN user_role
    ELSE :user_role END,

    user_lang = CASE 
    WHEN :user_lang IS NULL OR :user_lang = '' 
    THEN user_lang
    ELSE :user_lang END,

    user_level = CASE 
    WHEN :user_level IS NULL OR :user_level = '' 
    THEN user_level
    ELSE :user_level END,

    user_group = CASE 
    WHEN :user_group IS NULL OR :user_group = '' 
    THEN user_group
    ELSE :user_group END,

modified_at = CURRENT_TIMESTAMP
WHERE user_selected = 'yes';

UPDATE users 
SET user_selected='no', modified_at = CURRENT_TIMESTAMP
RETURNING 
'redirect' AS component, 
'/a_users/user_select_display_5.sql' AS link;


