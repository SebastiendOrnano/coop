SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN '/e_project_docs/project_doc_main_display_4.sql?project_id='||$project_id
ELSE '/e_project_docs/project_doc_main_display_3.sql?project_id='||$project_id
END;

UPDATE  project_docs 
SET 
project_id=$project_id,
project_doc_title=:project_doc_title, 
project_doc_url=: project_doc_url,
project_doc_summary=:project_doc_summary,
project_doc_lang=:project_doc_lang,
project_doc_cloud_format=:project_doc_cloud_format,
project_doc_category=:project_doc_category,
project_doc_type=:project_doc_type,
project_doc_status=:project_doc_status
WHERE project_doc_id=$project_doc_id

RETURNING  'redirect' AS component,
$redirect_link AS link;