-- Redirect the user back to the form if no file was uploaded
select 'redirect' as component, '/member_main_edit_4.sql' as link
where sqlpage.uploaded_file_mime_type('Image') NOT LIKE 'image/%';

SET member_picture_url = sqlpage.persist_uploaded_file('member_picture_url', 'x_pictures_events', 'pdf,jpg,jpeg,png');
SET member_picture_old_url= SELECT member_picture_url FROM members WHERE member_id=$member_id;
SET member_picture_old_to_erase = CASE WHEN $member_picture_url IS NOT NULL OR $member_picture_old_url !='' THEN $member_picture_old_url ELSE '' END;
INSERT INTO files_to_erase (file_url) VALUES ($member_picture_old_to_erase);

UPDATE members
SET 
member_picture_title=:member_picture_title, 
member_picture_url=$member_picture_url
WHERE member_id =$member_id


RETURNING 'redirect' AS component, '/b_members/member_picture_form_4.sql?member_id=' || member_id  AS link;
