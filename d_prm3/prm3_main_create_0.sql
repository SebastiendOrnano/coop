SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN  '/d_prm3/prm3_main_display_4.sql'
ELSE  '/d_prm3/prm3_main_display_3.sql'
END;

INSERT INTO prm3
(
	prm3_name,
	prm3_summary,
	prm3_status,
	prm3_type,
	prm3_category,
	prm3_formal,
	prm3_date_creation
)
VALUES 
(
	:prm3_name,
	:prm3_summary,
	'active',
	:prm3_type,
	:prm3_category,
	:prm3_formal,
	:prm3_date_creation
)

RETURNING 'redirect' AS component,
$redirect_link AS link;


