DELETE FROM forum_messages WHERE topic_id = $topic_id;

DELETE FROM forum_topics WHERE topic_id = $topic_id
RETURNING
   'redirect' AS component,
   '/c_forum/forum_main_display_5.sql' as link;