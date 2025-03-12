UPDATE members 
SET member_publish='yes', modified_at = CURRENT_TIMESTAMP
WHERE member_id = $member_id

RETURNING 
'redirect' AS component, 
'/b_members/member_main_display_4.sql' AS link;


