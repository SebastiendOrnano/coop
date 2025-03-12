SET orga_dept_id= SELECT orga_dept_id from members where member_id=$member_id;


SET orga_dept_id=(select orga_dept_id from members where member_id=$member_id);

UPDATE members
SET 
orga_id='', 
orga_dept_id='',
modified_at = CURRENT_TIMESTAMP
WHERE member_id = $member_id

select 'redirect' as component,
'/b_orga_dept/orga_dept_member_main_display_4.sql?orga_dept_id='||$orga_dept_id as link;