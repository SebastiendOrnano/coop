DELETE FROM users
WHERE user_id = $user_id

RETURNING 'redirect' AS component, 
'/a_users/user_main_display_5.sql' AS link;