SET member_picture_url= SELECT member_picture_url FROM members WHERE project_id  = $project_id;
INSERT INTO files_to_erase (file_url) VALUES ($member_picture_url);

DELETE FROM members
WHERE project_id  = $project_id;

SET project_doc_url= SELECT project_doc_url FROM project_doc WHERE project_id  = $project_id;
INSERT INTO files_to_erase (file_url) VALUES ($project_doc_url);

DELETE FROM project_doc
WHERE project_id  = $project_id;

SET project_dept_logo_url= SELECT project_dept_logo_url FROM project_dept WHERE project_id  = $project_id;
INSERT INTO files_to_erase (file_url) VALUES ($project_dept_logo_url);

DELETE FROM project_dept
WHERE project_id  = $project_id;

SET project_logo_url= SELECT project_logo_url from projects WHERE project_id  = $project_id;
INSERT INTO files_to_erase (file_url) VALUES ($project_logo_url);

DELETE from projects
WHERE project_id  = $project_id

RETURNING
'redirect' AS component,
'/e_projects/project_main_display_4.sql' AS link;