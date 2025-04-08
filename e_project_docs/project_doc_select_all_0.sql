SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN '/e_project_docs/project_doc_select_display_4.sql?project_id='||$project_id
ELSE '/e_project_docs/project_doc_select_display_3.sql?project_id='||$project_id
END;


UPDATE project_docs 
SET project_doc_selected = 'yes'
RETURNING 
'redirect' AS component, 
$redirect_link AS link;


