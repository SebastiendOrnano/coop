--SET anonymous;
SET anonymous1=  select(sqlpage.random_string(8));
SET anonymous2=  select(sqlpage.random_string(8));
SET anonymous3=  select(sqlpage.random_string(8));


UPDATE prm1 
SET  
   prm1_first_name=$anonymous1, 
   prm1_last_name=$anonymous2, 
   prm1_phone='000000',
   prm1_email=$anonymous3||'@nowhere.com',
   prm1_status='archived',
   modified_at = CURRENT_TIMESTAMP
WHERE prm1_id=$prm1_id

RETURNING
   'redirect' AS component,
   '/d_prm1/prm1_main_display_4.sql' as link;

