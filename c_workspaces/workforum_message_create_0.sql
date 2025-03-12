SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 
SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN '/c_workspaces/workforum_message_display_4.sql?topic_id='||$topic_id||'&workspace_id='||$workspace_id
ELSE '/c_workspaces/workforum_message_display_3.sql?topic_id='||$topic_id||'&workspace_id='||$workspace_id
END;

SET author = (
    SELECT users.username FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET message_author_id = (
    SELECT users.user_id FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

INSERT INTO forum_messages 
(
topic_id, 
message_author_id,
message_content,
message_status
)
SELECT 
$topic_id, 
$message_author_id, 
:message_content,
'online'
WHERE :message_content IS NOT NULL;

SET message_id = (SELECT MAX(message_id) FROM forum_messages WHERE topic_id = $topic_id);

INSERT INTO workdocs
(
message_id,
workspace_id,
workdoc_url,
workdoc_status
)
SELECT
$message_id,
$workspace_id,
CASE WHEN sqlpage.persist_uploaded_file('workdoc_url', 'x_workspace_docs', 'doc,docx,odt,md,pdf,jpg,jpeg,png')IS NOT NULL OR sqlpage.persist_uploaded_file('workdoc_url', 'x_workspace_docs', 'doc,docx,odt,md,pdf,jpg,jpeg,png') !='' THEN sqlpage.persist_uploaded_file('workdoc_url', 'x_workspace_docs', 'doc,docx,odt,md,pdf,jpg,jpeg,png')
ELSE '' END,
'online';

UPDATE forum_topics
SET
number_messages = number_messages +1,
modified_at = CURRENT_TIMESTAMP
WHERE topic_id=$topic_id

RETURNING 
'redirect' AS component, 
$redirect_link AS link;