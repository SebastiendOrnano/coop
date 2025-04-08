SET project_doc_url= (SELECT project_doc_url  FROM project_docs WHERE  project_doc_id = $project_doc_id);
INSERT INTO files_to_erase (file_url) VALUES ($project_doc_url);


DELETE FROM project_docs
WHERE project_doc_id = $project_doc_id
RETURNING
   'redirect' AS component,
   '/e_project_docs/project_doc_main_display_4.sql?project_id='||$project_id AS link;