UPDATE forum_topics
SET 
topic_status='archived', 
modified_at = CURRENT_TIMESTAMP
WHERE topic_id = $topic_id

RETURNING 
'redirect' AS component, 
'/c_forum/forum_main_display_5.sql' AS link;


