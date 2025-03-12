UPDATE sessions
SET
logout_at=CURRENT_TIMESTAMP
WHERE session_token = sqlpage.cookie('session_token');

UPDATE sessions
SET
session_duration=unixepoch(logout_at) - unixepoch(created_at)
WHERE session_token = sqlpage.cookie('session_token');


/* for a website management without sessions tracking
DELETE FROM sessions 
WHERE session_token = sqlpage.cookie('session_token');
*/

SELECT 
    'cookie' AS component, 
    'session_token' AS name, 
    TRUE AS remove;

SELECT 'redirect' AS component, '/' AS link;