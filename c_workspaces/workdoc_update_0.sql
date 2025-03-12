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

SET workdoc_url = sqlpage.persist_uploaded_file('workdoc_url', 'x_docs', 'doc,docx,odt,md,pdf,jpg,jpeg,png');
SET workdoc_url_old = SELECT workdoc_url FROM workdocs WHERE workdoc_id=$workdoc_id;
SET workdoc_url_old_to_erase = CASE WHEN $workdoc_url IS NOT NULL OR $workdoc_url !='' THEN $workdoc_url_old ELSE '' END;
INSERT INTO files_to_erase (file_url) VALUES ($workdoc_url_old_to_erase);

UPDATE  workdocs 
SET 
workspace_id=$workspace_id,
workdoc_title=:workdoc_title, 
workdoc_author=:workdoc_author, 
workdoc_url=
    CASE  
    WHEN $workdoc_url IS NULL OR $workdoc_url ='' THEN workdoc_url
    ELSE $workdoc_url
    END,
workdoc_summary=:workdoc_summary,
workdoc_version=:workdoc_version, 
workdoc_lang=:workdoc_lang,
workdoc_format=:workdoc_format,
workdoc_category=:workdoc_category,
workdoc_type=:workdoc_type,
workdoc_status=:workdoc_status
WHERE workdoc_id=$workdoc_id

RETURNING  'redirect' AS component,
$redirect_link AS link;