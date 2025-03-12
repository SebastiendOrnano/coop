
UPDATE users 
SET 
user_role=:user_role, 
user_group=:user_group, 
user_level=:user_level,
user_status=:user_status, 
modified_at = CURRENT_TIMESTAMP
WHERE user_id = $user_id

RETURNING 'redirect' AS component, '/a_users/user_main_display_5.sql' AS link;

