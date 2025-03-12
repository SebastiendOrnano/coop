DELETE FROM sessions
WHERE DATE(created_at) < DATE('now')

RETURNING 'redirect' AS component, 
'/a_panels/panel_admin_5.sql' AS link;