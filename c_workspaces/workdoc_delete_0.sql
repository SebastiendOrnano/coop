SET workdoc_url= (SELECT workdoc_url FROM workdocs WHERE  workdoc_id = $workdoc_id);
INSERT INTO files_to_erase (file_url) VALUES ($workdoc_url);

DELETE FROM workdocs
WHERE workdoc_id = $workdoc_id

select 'redirect' as component,
'/c_workspaces/workdoc_display_4.sql?workspace_id='||$workspace_id as link;