
--SET anonymous 
SET anonymous1=  select(sqlpage.random_string(8));
SET anonymous2=  select(sqlpage.random_string(8));
SET anonymous3=  select(sqlpage.random_string(8));

--update

UPDATE users 
SET  
    user_first_name=$anonymous1, 
    user_last_name=$anonymous2, 
    user_phone='000000',
    user_email=$anonymous3||'@nowhere.com',
    user_status='archived'
    modified_at = CURRENT_TIMESTAMP
WHERE user_selected='yes'

RETURNING
   'redirect' AS component,
   '/b_users/user_main_display_4.sql' as link;

