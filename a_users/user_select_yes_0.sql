UPDATE users 
SET user_selected = 
CASE 
WHEN user_selected ='yes' then 'no'
ELSE 'yes' END
WHERE user_id = $user_id

RETURNING 
'redirect' AS component, 
'/a_users/user_select_display_5.sql' AS link;


