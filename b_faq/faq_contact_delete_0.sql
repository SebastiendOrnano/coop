DELETE FROM faq_contacts 
WHERE contact_id = $contact_id

RETURNING 
'redirect' AS component, 
'/b_faq/faq_contact_display_4.sql' AS link;