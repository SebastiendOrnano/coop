DELETE FROM workdocs_cloud
WHERE workdoc_cloud_id = $workdoc_cloud_id

select 'redirect' as component,
'/c_workspaces/workdoc_cloud_display_4.sql?workspace_id='||$workspace_id as link;