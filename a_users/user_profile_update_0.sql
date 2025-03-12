SET user_id = 
(
    SELECT users.user_id FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

UPDATE users 
SET 
user_gender=:user_gender,
user_first_name=:user_first_name,
user_last_name=:user_last_name, 
user_phone=:user_phone, 
user_lang=:user_lang, 
user_short_cv=:user_short_cv, 
modified_at = CURRENT_TIMESTAMP
WHERE user_id = $user_id

RETURNING  'redirect' AS component,
'/a_users/user_profile_update_confirm_1.sql' AS link;

