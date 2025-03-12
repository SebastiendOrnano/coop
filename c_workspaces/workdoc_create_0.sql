SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN '/c_workspaces/workdoc_display_4.sql?workspace_id='||$workspace_id
ELSE '/c_workspaces/workdoc_display_3.sql?workspace_id='||$workspace_id
END;


INSERT INTO workdocs 
( 
workspace_id,
workdoc_title, 
workdoc_author, 
workdoc_url,
workdoc_summary, 
workdoc_lang,
workdoc_format,
workdoc_category,
workdoc_type,
workdoc_status
)

SELECT
$workspace_id,
:workdoc_title, 
:workdoc_author, 
sqlpage.persist_uploaded_file('workdoc_url', 'x_docs', 'doc,docx,odt,md,pdf,jpg,jpeg,png'),
:workdoc_summary, 
COALESCE(NULLIF(:doc_org_lang, ''), 'FR'),
:workdoc_format,
:workdoc_category,
:workdoc_type,
'online'

WHERE :workdoc_title IS NOT NULL

RETURNING  'redirect' AS component,
$redirect_link AS link;