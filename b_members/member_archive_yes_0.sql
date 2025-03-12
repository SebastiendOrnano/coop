UPDATE members 
SET member_selected = CASE 
when member_selected ='yes' then 'no'
ELSE 'yes' END
WHERE member_id = $member_id

RETURNING 
'redirect' AS component, 
'/b_members/member_archive_display_4.sql' AS link;


