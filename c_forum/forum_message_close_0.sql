SET topic_id=(SELECT topic_id FROM forum_messages WHERE message_id=$message_id);


UPDATE forum_messages
SET
message_status='closed',
modified_at=CURRENT_TIMESTAMP
WHERE message_id=$message_id

RETURNING 
'redirect' AS component, 
'/c_forum/forum_message_display_5.sql?topic_id='||$topic_id AS link;