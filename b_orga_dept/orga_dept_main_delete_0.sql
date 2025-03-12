SET member_picture_url= SELECT member_picture_url FROM members WHERE orga_dept_id  = $orga_dept_id ;
INSERT INTO files_to_erase (file_url) VALUES ($member_picture_url);

DELETE FROM members
WHERE orga_dept_id  = $orga_dept_id 

SET orga_doc_url= SELECT orga_doc_url FROM orga_docs WHERE orga_dept_id  = $orga_dept_id ;
INSERT INTO files_to_erase (file_url) VALUES ($orga_doc_url);

DELETE FROM orga_docs
WHERE orga_dept_id  = $orga_dept_id 

SET orga_dept_logo_url= SELECT orga_dept_logo_url FROM orga_dept WHERE orga_dept_id  = $orga_dept_id;
INSERT INTO files_to_erase (file_url) VALUES ($orga_dept_logo_url);

DELETE FROM orga_dept
WHERE orga_dept_id  = $orga_dept_id 
RETURNING
'redirect' AS component,
'/b_orga_dept/orga_dept_main_display_4.sql?orga_id='||$orga_id AS link;