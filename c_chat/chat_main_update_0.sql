UPDATE forum_topics
SET
topic_name=:topic_name, 
topic_category=:topic_category,
topic_status=:topic_status,
chat_target=:chat_target,
modified_at=CURRENT_TIMESTAMP
WHERE topic_id=$topic_id;

UPDATE forum_messages 
SET
message_content=:message_content
WHERE topic_id=$topic_id

RETURNING 
'redirect' AS component, 
'/c_chat/chat_main_display_5.sql' AS link;