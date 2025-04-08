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
SET     
    project_doc_author = CASE 
    WHEN :project_doc_author IS NULL OR :project_doc_author = '' 
    THEN project_doc_author
    ELSE :project_doc_author END,

    project_doc_keywords = CASE 
    WHEN :project_doc_keywords IS NULL OR :project_doc_keywords = '' 
    THEN project_doc_keywords
    ELSE :project_doc_keywords END,
   
    project_doc_date_publication = CASE 
    WHEN :project_doc_date_publication IS  NULL OR :project_doc_date_publication = '' 
    THEN project_doc_date_publication 
    ELSE :project_doc_date_publication END,
    
    project_doc_date_period = CASE 
    WHEN :project_doc_date_period IS NULL OR :project_doc_date_period = '' 
    THEN project_doc_date_period 
    ELSE :project_doc_date_period END,
    
    project_doc_format = CASE 
    WHEN :project_doc_format IS NULL OR :project_doc_format = '' 
    THEN project_doc_format 
    ELSE :project_doc_format END,
    
    project_doc_lang = CASE 
    WHEN :project_doc_lang IS NULL OR :project_doc_lang = '' 
    THEN project_doc_lang 
    ELSE :project_doc_lang END,
     
    project_doc_category = CASE 
    WHEN :project_doc_category IS NULL OR :project_doc_category = '' 
    THEN project_doc_category 
    ELSE :project_doc_category END,
      
    project_doc_type = CASE 
    WHEN :project_doc_type IS  NULL OR :project_doc_type = '' 
    THEN project_doc_type 
    ELSE :project_doc_type END,
    
    project_doc_status = CASE 
    WHEN :project_doc_status IS  NULL OR :project_doc_status = '' 
    THEN project_doc_status 
    ELSE :project_doc_status END,

    modified_at = CURRENT_TIMESTAMP

WHERE 
    project_doc_selected = 'yes';

UPDATE project_docs
SET 
    project_doc_selected='no',
    modified_at = CURRENT_TIMESTAMP

RETURNING 
'redirect' AS component, 
$redirect_link AS link;