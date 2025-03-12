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


INSERT INTO prm1_doc 
( 
prm1_id,
prm1_doc_title, 
prm1_doc_author, 
prm1_doc_url,
prm1_doc_summary, 
prm1_doc_keywords,
prm1_doc_date_publication, 
prm1_doc_date_period, 
prm1_doc_lang,
prm1_doc_format,
prm1_doc_category,
prm1_doc_type,
prm1_doc_status
)

VALUES
(
$prm1_id,  
:prm1_doc_title, 
:prm1_doc_author, 
sqlpage.persist_uploaded_file('prm1_doc_url', 'x_docs', 'doc,docx,odt,md,pdf,jpg,jpeg,png'),
:prm1_doc_summary, 
:prm1_doc_keywords,
:prm1_doc_date_publication, 
:prm1_doc_date_period,
:prm1_doc_lang,
:prm1_doc_format,
:prm1_doc_category,
:prm1_doc_type,
:prm1_doc_status
)

RETURNING  'redirect' AS component,
$redirect_link AS link;