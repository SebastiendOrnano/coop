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

UPDATE prm3
SET
prm3_name=:prm3_name,
prm3_summary=:prm3_summary,
prm3_status = 
    CASE 
    WHEN :prm3_status IS NULL OR :prm3_status = '' 
    THEN prm3_status
    ELSE :prm3_status END,
prm3_type = 
    CASE 
    WHEN :prm3_type IS NULL OR :prm3_type = '' 
    THEN prm3_type
    ELSE :prm3_type END,
prm3_category = 
    CASE 
    WHEN :prm3_category IS NULL OR :prm3_category = '' 
    THEN prm3_category
    ELSE :prm3_category END,
prm3_formal = 
    CASE 
    WHEN :prm3_formal IS NULL OR :prm3_formal = '' 
    THEN prm3_formal
    ELSE :prm3_formal END,
prm3_date_creation=:prm3_date_creation,
modified_at = CURRENT_TIMESTAMP
WHERE prm3_id=$prm3_id

RETURNING 'redirect' AS component,
$redirect_link AS link;