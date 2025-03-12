SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN '/c_workspaces/workdoc_cloud_display_4.sql?workspace_id='||$workspace_id
ELSE '/c_workspaces/workdoc_cloud_display_3.sql?workspace_id='||$workspace_id
END;


INSERT INTO workdocs_cloud 
( 
workspace_id,
workdoc_cloud_title,  
workdoc_cloud_url,
workdoc_cloud_summary, 
workdoc_cloud_lang,
workdoc_cloud_format,
workdoc_cloud_category,
workdoc_cloud_type,
workdoc_cloud_status
)

SELECT
$workspace_id,
:workdoc_cloud_title, 
:workdoc_cloud_url,
:workdoc_cloud_summary, 
COALESCE(NULLIF(:doc_org_lang, ''), 'FR'),
:workdoc_cloud_format,
:workdoc_cloud_category,
:workdoc_cloud_type,
'online'

WHERE :workdoc_cloud_title IS NOT NULL

RETURNING  'redirect' AS component,
$redirect_link AS link;