UPDATE prm3_docs
SET     
    prm3_doc_keywords = CASE 
    WHEN :prm3_doc_keywords IS NULL OR :prm3_doc_keywords = '' 
    THEN prm3_doc_keywords
    ELSE :prm3_doc_keywords END,
   
    prm3_doc_date_publication = CASE 
    WHEN :prm3_doc_date_publication IS  NULL OR :prm3_doc_date_publication = '' 
    THEN prm3_doc_date_publication 
    ELSE :prm3_doc_date_publication END,
    
    prm3_doc_format = CASE 
    WHEN :prm3_doc_format IS NULL OR :prm3_doc_format = '' 
    THEN prm3_doc_format 
    ELSE :prm3_doc_format END,
    
    prm3_doc_category = CASE 
    WHEN :prm3_doc_category IS NULL OR :prm3_doc_category = '' 
    THEN prm3_doc_category 
    ELSE :prm3_doc_category END,
    
    prm3_doc_status = CASE 
    WHEN :prm3_doc_status IS NULL OR :prm3_doc_status = '' 
    THEN prm3_doc_status 
    ELSE  :prm3_doc_status END,
    
    prm3_doc_type = CASE 
    WHEN :prm3_doc_type IS  NULL OR :prm3_doc_type = '' 
    THEN prm3_doc_type 
    ELSE :prm3_doc_type END,
   
    modified_at = CURRENT_TIMESTAMP

WHERE 
    prm3_doc_selected = 'yes';

UPDATE prm3_docs
SET prm3_doc_selected='no', modified_at = CURRENT_TIMESTAMP

RETURNING 'redirect' AS component, 
'/d_prm3_doc/prm3_doc_select_no_0.sql?prm3_id='||$prm3_id AS link;