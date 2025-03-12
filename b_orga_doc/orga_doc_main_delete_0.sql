SET orga_doc_url= (SELECT orga_doc_url  FROM orga_docs WHERE  orga_doc_id = $orga_doc_id);
INSERT INTO files_to_erase (file_url) VALUES ($orga_doc_url);

DELETE FROM orga_docs
WHERE orga_doc_id = $orga_doc_id
RETURNING
   'redirect' AS component,
   '/b_orga_doc/orga_doc_main_display_4.sql' as link;