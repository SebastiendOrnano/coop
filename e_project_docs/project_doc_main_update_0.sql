
SET project_doc_url = sqlpage.persist_uploaded_file('project_doc_url', 'x_docs', 'doc,docx,odt,md,pdf,jpg,jpeg,png');
SET project_doc_url_old= SELECT project_doc_url FROM project_docs WHERE project_doc_id = $project_doc_id;
SET project_doc_url_old_to_erase = CASE WHEN $project_doc_url IS NOT NULL OR $project_doc_url !='' THEN $project_doc_url_old ELSE '' END;
INSERT INTO files_to_erase (file_url) VALUES ($project_doc_url_old_to_erase);

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

UPDATE project_docs
SET
    project_doc_title = :project_doc_title,    
    project_doc_author = :project_doc_author,
    project_doc_url=
    CASE  
    WHEN $project_doc_url IS NULL OR $project_doc_url ='' THEN project_doc_url
    ELSE $project_doc_url
    END,
    project_doc_summary = :project_doc_summary,
    project_doc_keywords = :project_doc_keywords,
    project_doc_date_publication = :project_doc_date_publication, 
    project_doc_date_period = :project_doc_date_period,
    project_doc_format = :project_doc_format,
    project_doc_lang =  :project_doc_lang,
    project_doc_category = :project_doc_category,
    project_doc_type =  :project_doc_type,
    project_doc_status = 
    CASE  
    WHEN :project_doc_status IS NULL OR :project_doc_status ='' THEN project_doc_status
    ELSE :project_doc_status
    END,
    modified_at = CURRENT_TIMESTAMP

WHERE project_doc_id = $project_doc_id

RETURNING 
'redirect' AS component, 
$redirect_link as link;

