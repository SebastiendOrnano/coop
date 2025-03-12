DELETE FROM users
WHERE user_selected = 'yes'
RETURNING
   'redirect' AS component,
   '/b_users/user_main_display_4.sql)' as link;