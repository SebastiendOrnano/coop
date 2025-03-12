
UPDATE prm2_sub_docs
SET     
    prm2_sub_doc_author = CASE 
    WHEN :prm2_sub_doc_author IS NULL OR :prm2_sub_doc_author = '' 
    THEN prm2_sub_doc_author
    ELSE :prm2_sub_doc_author END,

    prm2_sub_doc_keywords = CASE 
    WHEN :prm2_sub_doc_keywords IS NULL OR :prm2_sub_doc_keywords = '' 
    THEN prm2_sub_doc_keywords
    ELSE :prm2_sub_doc_keywords END,
   
    prm2_sub_doc_date_publication = CASE 
    WHEN :prm2_sub_doc_date_publication IS  NULL OR :prm2_sub_doc_date_publication = '' 
    THEN prm2_sub_doc_date_publication 
    ELSE :prm2_sub_doc_date_publication END,
    
    prm2_sub_doc_date_period = CASE 
    WHEN :prm2_sub_doc_date_period IS NULL OR :prm2_sub_doc_date_period = '' 
    THEN prm2_sub_doc_date_period 
    ELSE :prm2_sub_doc_date_period END,
    
    prm2_sub_doc_format = CASE 
    WHEN :prm2_sub_doc_format IS NULL OR :prm2_sub_doc_format = '' 
    THEN prm2_sub_doc_format 
    ELSE :prm2_sub_doc_format END,
    
    prm2_sub_doc_lang = CASE 
    WHEN :prm2_sub_doc_lang IS NULL OR :prm2_sub_doc_lang = '' 
    THEN prm2_sub_doc_lang 
    ELSE :prm2_sub_doc_lang END,
     
    prm2_sub_doc_category = CASE 
    WHEN :prm2_sub_doc_category IS NULL OR :prm2_sub_doc_category = '' 
    THEN prm2_sub_doc_category 
    ELSE :prm2_sub_doc_category END,
      
    prm2_sub_doc_type = CASE 
    WHEN :prm2_sub_doc_type IS  NULL OR :prm2_sub_doc_type = '' 
    THEN prm2_sub_doc_type 
    ELSE :prm2_sub_doc_type END,
    
    prm2_sub_doc_status = CASE 
    WHEN :prm2_sub_doc_status IS  NULL OR :prm2_sub_doc_status = '' 
    THEN prm2_sub_doc_status 
    ELSE :prm2_sub_doc_status END,

    modified_at = CURRENT_TIMESTAMP

WHERE 
    prm2_sub_doc_selected = 'yes';

UPDATE prm2_sub_docs
SET prm2_sub_doc_selected='no', modified_at = CURRENT_TIMESTAMP

RETURNING 'redirect' AS component, 
'/d_prm2_sub_doc/prm2_sub_doc_select_no_0.sql?prm2_sub_id='||$prm2_sub_id AS link;