SET prm2_sub_id= SELECT prm2_sub_id from prm2_sub_doc where prm2_sub_doc_id=$prm2_sub_doc_id;


UPDATE prm2_sub_doc
SET 
prm2_id='', 
prm2_sub_id='',
modified_at = CURRENT_TIMESTAMP
WHERE prm2_sub_doc_id = $prm2_sub_doc_id

select 'redirect' as component,
'/d_prm2_sub/prm2_sub_doc_display_4.sql?prm2_sub_id='||$prm2_sub_id as link;