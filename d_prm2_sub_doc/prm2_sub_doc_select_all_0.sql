SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN '/d_prm2_sub_doc/prm2_sub_doc_select_display_4.sql?prm2_sub_id='||$prm2_sub_id
ELSE '/d_prm2_sub_doc/prm2_sub_doc_select_display_3.sql?prm2_sub_id='||$prm2_sub_id
END;




UPDATE prm2_sub_docs 
SET prm2_sub_doc_selected = 'yes'
RETURNING 
'redirect' AS component, 
$redirect_link AS link;


