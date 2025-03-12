SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN '/c_workspaces/workforum_topic_display_4.sql?workspace_id='||$workspace_id
ELSE '/c_workspaces/workforum_topic_display_3.sql?workspace_id='||$workspace_id
END;

SET topic_author_id = (
    SELECT users.user_id FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
);

-- Insert new topic
INSERT INTO forum_topics
(
topic_author_id,
topic_name, 
topic_category,
topic_status,
forum_type,
workspace_id
)
SELECT
$topic_author_id,
:topic_name, 
:topic_category,
'online',
'forum_wkps',
$workspace_id
WHERE :topic_name IS NOT NULL;

-- Get the last inserted topic ID

SET topic_id = (SELECT MAX(topic_id) FROM forum_topics WHERE topic_name = :topic_name);

-- Insert initial message if topic ID is valid
 

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
message_status,
message_rank
)
SELECT 
$topic_id,
$message_author_id, 
:message_content,
'online',
'main'
WHERE :message_content IS NOT NULL OR :message_content!='';

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
