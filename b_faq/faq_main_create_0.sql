INSERT INTO faq_contacts 
(
contact_gender, 
contact_first_name,
contact_last_name,
contact_email, 
contact_rgpd 
) 
VALUES 
(
:contact_gender, 
:contact_first_name,
:contact_last_name,
:contact_email, 
'yes'
)

SET contact_id= SELECT MAX(contact_id) FROM faq_contacts WHERE contact_email = :contact_email;

SET question_public_private = CASE WHEN sqlpage.cookie('session_token') = '' or sqlpage.cookie('session_token') IS NULL THEN 'public' ELSE 'private' END;

INSERT INTO faq_questions
(
contact_id, 
question, 
question_content,
question_public_private
) 
VALUES 
(
$contact_id, 
:question, 
:question_content,
$question_public_private
)

RETURNING 'redirect' AS component, 'faq_main_sent_confirm.sql' AS link;