SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE
WHEN $user_role = 'admin' THEN '/a_panels/panel_admin_5.sql'
WHEN $user_role = 'supervisor' THEN '/a_panels/panel_supervisor_4.sql'
WHEN $user_role = 'editor' THEN '/a_panels/panel_editor_3.sql'
WHEN $user_role = 'viewer' THEN '/'
ELSE '/a_sessions/session_create_alert3.sql'
END;

SELECT
    'redirect' AS component,
    $redirect_link AS link;
