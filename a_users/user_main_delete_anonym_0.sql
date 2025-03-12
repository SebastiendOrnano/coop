--SET anonymous 
SET anonymous1=  sqlpage.random_string(8);
SET anonymous2=  sqlpage.random_string(8);
SET anonymous3=  sqlpage.random_string(8);

UPDATE users
SET 
user_first_name=$anonymous1,
user_last_name=$anonymous2, 
user_phone='000000',
user_email=$anonymous3||'@nowhere.com', 
user_status='archived',
modified_at = CURRENT_TIMESTAMP 
WHERE user_id=$user_id

RETURNING 'redirect' AS component, 
'/a_users/user_main_display_5.sql' AS link;

