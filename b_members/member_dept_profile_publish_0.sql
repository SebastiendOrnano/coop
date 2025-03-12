SET orga_dept_id= SELECT orga_dept_id FROM members WHERE member_id = $member_id;

UPDATE members 
SET member_publish='yes', modified_at = CURRENT_TIMESTAMP
WHERE member_id = $member_id

RETURNING 
'redirect' AS component, 
'/b_orga_dept/orga_dept_member_main_display_4.sql?orga_dept_id='||$orga_dept_id AS link;


