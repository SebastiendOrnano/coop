INSERT INTO files_to_erase (member_picture_url)
SELECT member_picture_url FROM members
where  member_selected = 'yes';

DELETE FROM members
WHERE member_selected = 'yes'
RETURNING
   'redirect' AS component,
   '/b_members/member_select_display_4.sql)' as link;