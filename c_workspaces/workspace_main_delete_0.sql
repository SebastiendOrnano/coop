DELETE FROM workspace_participants
WHERE workspace_id  = $workspace_id ;

INSERT INTO files_to_erase (file_url) SELECT workdoc_url FROM workdocs WHERE  workspace_id  = $workspace_id ;

DELETE FROM workdocs
WHERE workspace_id  = $workspace_id ;

DELETE FROM workmeeting_participants
WHERE workspace_id  = $workspace_id ;

DELETE FROM workmeetings
WHERE workspace_id  = $workspace_id ;

DELETE FROM workspaces
WHERE workspace_id  = $workspace_id 
RETURNING
'redirect' AS component,
'/c_workspaces/workspace_main_display_4.sql' AS link;