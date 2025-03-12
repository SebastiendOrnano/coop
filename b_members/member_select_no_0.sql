UPDATE members 
SET 
member_selected = 'no'

RETURNING 
'redirect' AS component, 
'/b_members/member_select_display_4.sql' AS link;


