UPDATE faq_questions 
SET 
question_status='archived',
modified_at=current_timestamp
WHERE question_id = $question_id

RETURNING 
'redirect' AS component, 
'/b_faq/faq_main_display_4.sql' AS link;