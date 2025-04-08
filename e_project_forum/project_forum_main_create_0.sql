SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN '/e_project_forum/project_forum_main_display_4.sql?project_id='||$project_id
ELSE '/e_project_forum/project_forum_main_display_3.sql?project_id='||$project_id
END;

SET project_forum_topic_author_id = (
    SELECT users.user_id FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
);

-- Insert new topic
INSERT INTO project_forum_topics
(
project_id,
project_forum_topic_author_id,
project_forum_topic_name, 
project_forum_topic_category,
project_forum_topic_status,
forum_type
)
SELECT
$project_id,
$project_forum_topic_author_id,
:project_forum_topic_name, 
:project_forum_topic_category,
'online',
'forum'
WHERE :project_forum_topic_name IS NOT NULL;

-- Get the last inserted topic ID

SET project_forum_topic_id = (SELECT project_forum_topic_id FROM project_forum_topics WHERE project_forum_topic_name = :project_forum_topic_name);

-- Insert initial message if topic ID is valid

 SET project_forum_message_author_id = (
    SELECT users.user_id FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

INSERT INTO project_forum_messages
(
project_forum_topic_id, 
project_forum_message_author_id,
project_forum_message_content,
project_forum_message_status,
project_forum_message_rank
)
VALUES
($project_forum_topic_id,
$project_forum_message_author_id, 
:project_forum_message_content,
'online',
'main')


RETURNING 
'redirect' AS component, 
$redirect_link AS link;