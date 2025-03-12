SET prm1_doc_url = sqlpage.persist_uploaded_file('prm1_doc_url','x_docs','doc,docx,odt,md,pdf,jpg,jpeg,png');
SET doc_old_url= SELECT prm1_doc_url FROM prm1_doc WHERE prm1_doc_id=$prm1_doc_id;
SET doc_old_to_erase = CASE WHEN $prm1_doc_url IS NOT NULL OR $prm1_doc_url !='' THEN $doc_old_url ELSE '' END;
INSERT INTO files_to_erase (file_url) VALUES ($doc_old_to_erase);
SET prm1_id = (SELECT prm1_id  FROM prm1_doc WHERE prm1_doc_id = $prm1_doc_id );

SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN    '/d_prm1_doc/prm1_doc_main_display_4.sql?prm1_id='||$prm1_id
ELSE    '/d_prm1_doc/prm1_doc_main_display_3.sql?prm1_id='||$prm1_id
END;


UPDATE prm1_doc
SET
    prm1_doc_title = :prm1_doc_title,    
    prm1_doc_author = :prm1_doc_author,
    prm1_doc_url= 
    CASE  
    WHEN $prm1_doc_url IS NULL OR $prm1_doc_url ='' THEN prm1_doc_url
    ELSE $prm1_doc_url
    END,
    prm1_doc_summary = :prm1_doc_summary,
    prm1_doc_keywords = :prm1_doc_keywords,
    prm1_doc_date_publication = :prm1_doc_date_publication, 
    prm1_doc_date_period = :prm1_doc_date_period,
    prm1_doc_format = :prm1_doc_format,
    prm1_doc_lang =  :prm1_doc_lang,
    prm1_doc_category = :prm1_doc_category,
    prm1_doc_status =  :prm1_doc_status,
    prm1_doc_type =  :prm1_doc_type,
    modified_at = CURRENT_TIMESTAMP

WHERE prm1_doc_id = $prm1_doc_id

RETURNING 
'redirect' AS component, 
$redirect_link as link;

