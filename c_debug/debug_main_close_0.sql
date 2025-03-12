UPDATE forum_topics
SET
topic_status='closed',
modified_at=CURRENT_TIMESTAMP
WHERE topic_id=$topic_id

RETURNING 
'redirect' AS component, 
'/c_debug/debug_main_display_5.sql' AS link;