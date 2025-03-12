SET prm2_id = SELECT prm2_id FROM prm2_sub WHERE prm2_sub_id = $prm2_sub_id;

SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN '/d_prm2_sub_doc/prm2_sub_doc_main_display_4.sql?prm2_sub_id='||$prm2_sub_id||'&prm2=id'||$prm2_id 
ELSE '/d_prm2_sub_doc/prm2_sub_doc_main_display_3.sql?prm2_sub_id='||$prm2_sub_id||'&prm2=id'||$prm2_id 
END;




INSERT INTO prm2_sub_docs 
( 
prm2_sub_doc_title, 
prm2_sub_doc_author, 
prm2_sub_doc_url,
prm2_sub_doc_summary, 
prm2_sub_doc_keywords,
prm2_sub_id,
prm2_id,
prm2_sub_doc_date_publication, 
prm2_sub_doc_date_period, 
prm2_sub_doc_lang,
prm2_sub_doc_format,
prm2_sub_doc_category,
prm2_sub_doc_type,
prm2_sub_doc_status
)

SELECT 
:prm2_sub_doc_title, 
:prm2_sub_doc_author, 
sqlpage.persist_uploaded_file('prm2_sub_doc_url', 'x_docs', 'doc,docx,odt,md,pdf,jpg,jpeg,png'),
:prm2_sub_doc_summary, 
:prm2_sub_doc_keywords,
$prm2_sub_id, 
$prm2_id,
:prm2_sub_doc_date_publication, 
:prm2_sub_doc_date_period,
COALESCE(NULLIF(:doc_org_lang, ''), 'FR'),
:prm2_sub_doc_format,
:prm2_sub_doc_category,
:prm2_sub_doc_type,
'online'

WHERE :prm2_sub_doc_title IS NOT NULL

RETURNING  'redirect' AS component,
$redirect_link        AS link;