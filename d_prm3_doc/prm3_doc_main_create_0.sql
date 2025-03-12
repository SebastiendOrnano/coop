SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN    '/d_prm3_doc/prm3_doc_main_display_4.sql?prm3_id='||$prm3_id
ELSE    '/d_prm3_doc/prm3_doc_main_display_3.sql?prm3_id='||$prm3_id
END;


INSERT INTO prm3_docs 
( 
prm3_id,
prm3_doc_title, 
prm3_doc_url,
prm3_doc_summary, 
prm3_doc_keywords,
prm3_doc_date_publication, 
prm3_doc_format,
prm3_doc_category,
prm3_doc_type,
prm3_doc_status
)

VALUES
(
$prm3_id,  
:prm3_doc_title, 
sqlpage.persist_uploaded_file('prm3_doc_url', 'x_docs', 'doc,docx,odt,md,pdf,jpg,jpeg,png'),
:prm3_doc_summary, 
:prm3_doc_keywords,
:prm3_doc_date_publication, 
:prm3_doc_format,
:prm3_doc_category,
:prm3_doc_type,
:prm3_doc_status
)

RETURNING  'redirect' AS component,
$redirect_link AS link;