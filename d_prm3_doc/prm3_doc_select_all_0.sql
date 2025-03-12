SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN   ' /d_prm3_doc/prm3_doc_select_display_4.sql?prm3_id='||$prm3_id
ELSE   '/d_prm3_doc/prm3_doc_select_display_3.sql?prm3_id='||$prm3_id
END;


UPDATE prm3_docs 
SET prm3_doc_selected = 'yes'
RETURNING 
'redirect' AS component, 
$redirect_link AS link;


