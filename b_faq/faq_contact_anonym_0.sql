
--SET anonymous 
SET anonymous1=  select(sqlpage.random_string(8));
SET anonymous2=  select(sqlpage.random_string(8));
SET anonymous3=  select(sqlpage.random_string(8));

--update

UPDATE faq_contacts 
SET  
    contact_first_name=$anonymous1, 
    contact_last_name=$anonymous2, 
    contact_email=$anonymous3||'@nowhere.com',
    contact_status='archived',
    modified_at = CURRENT_TIMESTAMP
WHERE contact_id=$contact_id

RETURNING
   'redirect' AS component,
   '/b_faq/faq_contact_display_4.sql' as link;

