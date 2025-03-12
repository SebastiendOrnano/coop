SET orga_id = SELECT orga_id FROM orga_dept WHERE orga_dept_id = :orga_dept_id;
SET orga_doc_url = sqlpage.persist_uploaded_file('orga_doc_url', 'x_docs', 'doc,docx,odt,md,pdf,jpg,jpeg,png');
SET orga_doc_url_old= SELECT orga_doc_url FROM orga_dept WHERE orga_doc_id = $orga_doc_id;
SET orga_doc_url_old_to_erase = CASE WHEN $orga_doc_url IS NOT NULL OR $orga_doc_url !='' THEN $orga_doc_url_old ELSE '' END;
INSERT INTO files_to_erase (file_url) VALUES ($orga_doc_url_old_to_erase);

UPDATE orga_docs
SET
    orga_doc_title = :orga_doc_title,    
    orga_doc_author = :orga_doc_author,
    orga_doc_url=
    CASE  
    WHEN $orga_doc_url IS NULL OR $orga_doc_url ='' THEN orga_doc_url
    ELSE $orga_doc_url
    END,
    orga_doc_summary = :orga_doc_summary,
    orga_doc_keywords = :orga_doc_keywords,
    orga_doc_date_publication = :orga_doc_date_publication, 
    orga_doc_date_period = :orga_doc_date_period,
    orga_doc_format = :orga_doc_format,
    orga_doc_lang =  :orga_doc_lang,
    orga_doc_number_page =  :orga_doc_number_page,
    orga_doc_category = :orga_doc_category,
    orga_doc_publication =  :orga_doc_publication,
    orga_doc_type =  :orga_doc_type,
    orga_doc_edition = :orga_doc_edition,
    orga_dept_id=
    (SELECT CASE
    WHEN :orga_dept_id IS NULL AND (orga_dept_id  != '' OR orga_dept_id  IS NOT NULL) THEN orga_dept_id 
    WHEN :orga_dept_id IS NULL AND (orga_dept_id  = '' OR orga_dept_id IS  NULL) THEN ''
    ELSE :orga_dept_id   END),  
    orga_id=$orga_id,
    modified_at = CURRENT_TIMESTAMP

WHERE orga_doc_id = $orga_doc_id

RETURNING 
'redirect' AS component, 
'/b_orga_doc/orga_doc_main_display_4.sql' as link;

