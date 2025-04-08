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

INSERT INTO project_docs 
( 
project_doc_title, 
project_doc_author, 
project_doc_url,
project_doc_summary, 
project_doc_keywords,
project_id,
project_doc_date_publication, 
project_doc_date_period, 
project_doc_lang,
project_doc_format,
project_doc_category,
project_doc_type,
project_doc_local_cloud,
project_doc_status
)

SELECT 
:project_doc_title, 
:project_doc_author, 
sqlpage.persist_uploaded_file('project_doc_url', 'x_docs', 'doc,docx,odt,md,pdf,jpg,jpeg,png'),
:project_doc_summary, 
:project_doc_keywords,
$project_id,
:project_doc_date_publication, 
:project_doc_date_period,
COALESCE(NULLIF(:doc_org_lang, ''), 'FR'),
:project_doc_format,
:project_doc_category,
:project_doc_type,
'local',
'online'

WHERE :project_doc_title IS NOT NULL

RETURNING  'redirect' AS component,
$redirect_link        AS link;