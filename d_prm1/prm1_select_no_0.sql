SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN '/d_prm1/prm1_select_display_4.sql'
ELSE '/d_prm1/prm1_select_display_3.sql'
END;


UPDATE prm1 
SET 
prm1_selected = 'no'

RETURNING 
'redirect' AS component, 
$redirect_link AS link;

