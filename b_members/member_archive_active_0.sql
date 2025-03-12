UPDATE members 
SET member_status = 'active' 
WHERE member_selected ='yes';

UPDATE members
SET member_selected ='no' WHERE member_selected ='yes'

RETURNING 
'redirect' AS component, 
'/b_members/member_archive_display_4.sql' AS link;


