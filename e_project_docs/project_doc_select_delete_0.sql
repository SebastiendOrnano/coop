INSERT INTO files_to_erase (file_url) 
select project_doc_url from project_docs
where project_doc_selected = "yes";

DELETE FROM project_docs
WHERE project_doc_selected = "yes"

RETURNING 
'redirect' AS component, 
'/e_project_docs/project_doc_select_display_4.sql?project_id='||$project_id as link;