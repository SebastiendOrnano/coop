SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN '/d_prm1_doc/prm1_doc_select_display_4.sql?prm1_id='||$prm1_id
ELSE '/d_prm1_doc/prm1_doc_select_display_3.sql?prm1_id='||$prm1_id
END;

UPDATE prm1_doc 
SET prm1_doc_selected = 
(CASE 
    WHEN prm1_doc_selected ='yes' then 'no'
    ELSE 'yes' END)
WHERE prm1_doc_id = $prm1_doc_id

RETURNING 
'redirect' AS component, 
$redirect_link AS link;


