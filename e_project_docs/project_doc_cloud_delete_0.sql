DELETE FROM project_docs
WHERE project_doc_id = $project_doc_id

select 'redirect' as component,
'/e_project_docs/project_doc_display_4.sql?project_id='||$project_id as link;