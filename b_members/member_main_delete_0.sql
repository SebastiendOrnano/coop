SET member_picture_url= (SELECT member_picture_url FROM members WHERE member_id = $member_id);

INSERT INTO files_to_erase (file_url)
VALUES ($member_picture_url);

DELETE FROM members
WHERE member_id = $member_id
RETURNING
   'redirect' AS component,
   '/b_members/member_main_display_4.sql' as link;