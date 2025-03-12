--SET anonymous;
SET anonymous1=  select(sqlpage.random_string(8));
SET anonymous2=  select(sqlpage.random_string(8));
SET anonymous3=  select(sqlpage.random_string(8));


UPDATE members 
SET  
   member_first_name=$anonymous1, 
   member_last_name=$anonymous2, 
   member_picture_url='/x_pictures_persons/silhouette_homme.png', 
   member_phone='000000',
   member_email=$anonymous3||'@nowhere.com',
   member_status='archived',
   modified_at = CURRENT_TIMESTAMP
WHERE member_id=$member_id

RETURNING
   'redirect' AS component,
   '/b_members/member_main_display_4.sql' as link;

