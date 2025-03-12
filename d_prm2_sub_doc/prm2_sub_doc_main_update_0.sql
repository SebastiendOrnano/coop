SET prm2_id= SELECT prm2_id FROM prm2_sub WHERE prm2_sub_id=$prm2_sub_id;

SET prm2_sub_doc_url = sqlpage.persist_uploaded_file('prm2_sub_doc_url', 'x_docs', 'doc,docx,odt,md,pdf,jpg,jpeg,png');
SET prm2_sub_doc_url_old= SELECT prm2_sub_doc_url FROM prm2_sub_docs WHERE prm2_sub_doc_id = $prm2_sub_doc_id;
SET prm2_sub_doc_url_old_to_erase = CASE WHEN $prm2_sub_doc_url IS NOT NULL OR $prm2_sub_doc_url !='' THEN $prm2_sub_doc_url_old ELSE '' END;
INSERT INTO files_to_erase (file_url) VALUES ($prm2_sub_doc_url_old_to_erase);

SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN '/d_prm2_sub_doc/prm2_sub_doc_main_display_4.sql?prm2_sub_id='||$prm2_sub_id||'&prm2_id='||$prm2_id 
ELSE '/d_prm2_sub_doc/prm2_sub_doc_main_display_3.sql?prm2_sub_id='||$prm2_sub_id||'&prm2_id='||$prm2_id 
END;


SET prm2_id = SELECT prm2_id from prm2_sub where prm2_sub_id=$prm2_sub_id;

UPDATE prm2_sub_docs
SET
    prm2_sub_doc_title = :prm2_sub_doc_title,    
    prm2_sub_doc_author = :prm2_sub_doc_author,
    prm2_sub_doc_url=
    CASE  
    WHEN $prm2_sub_doc_url IS NULL OR $prm2_sub_doc_url ='' THEN prm2_sub_doc_url
    ELSE $prm2_sub_doc_url
    END,
    prm2_sub_doc_summary = :prm2_sub_doc_summary,
    prm2_sub_doc_keywords = :prm2_sub_doc_keywords,
    prm2_sub_doc_date_publication = :prm2_sub_doc_date_publication, 
    prm2_sub_doc_date_period = :prm2_sub_doc_date_period,
    prm2_sub_doc_format = :prm2_sub_doc_format,
    prm2_sub_doc_lang =  :prm2_sub_doc_lang,
    prm2_sub_doc_category = :prm2_sub_doc_category,
    prm2_sub_doc_type =  :prm2_sub_doc_type,
    prm2_sub_doc_status = 
    CASE  
    WHEN :prm2_sub_doc_status IS NULL OR :prm2_sub_doc_status ='' THEN prm2_sub_doc_status
    ELSE :prm2_sub_doc_status
    END,
    modified_at = CURRENT_TIMESTAMP

WHERE prm2_sub_doc_id = $prm2_sub_doc_id

RETURNING 
'redirect' AS component, 
$redirect_link as link;

