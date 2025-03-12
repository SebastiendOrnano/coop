UPDATE faq_questions 
SET
question=:question, 
question_content=:question_content,
answer=:answer, 
answer_yes_no=:answer_yes_no,  
faq_yes_no=:faq_yes_no,
question_public_private=:question_public_private,
question_category=:question_category,
question_status=:question_status,
modified_at=current_timestamp
WHERE question_id = $question_id

RETURNING 
'redirect' AS component, 
'/b_faq/faq_main_display_4.sql' AS link;