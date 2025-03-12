
UPDATE orga_docs
SET 
orga_id=:orga_id, 
orga_dept_id=:orga_dept_id,
modified_at = CURRENT_TIMESTAMP
WHERE orga_doc_id = :orga_doc_id

select 'redirect' as component,
'/b_orga_dept/orga_dept_doc_display_4.sql?orga_dept_id='||$orga_dept_id as link;


