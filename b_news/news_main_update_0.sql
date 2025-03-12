SET news_img_url = sqlpage.persist_uploaded_file('news_img_url', 'x_news_pictures', 'jpg,jpeg,png');
SET news_img_old_url= SELECT news_img_url FROM news WHERE news_id=$news_id;
SET news_img_old_to_erase = CASE WHEN $news_img_url IS NOT NULL OR $news_img_url !='' THEN $news_img_old_url ELSE '' END;
INSERT INTO files_to_erase (file_url) VALUES ($news_img_old_to_erase);

SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN '/b_news/news_main_display_4.sql'
ELSE '/b_news/news_main_display_3.sql'
END;

UPDATE news
SET
news_title=:news_title,
news_public_private = 
    CASE 
    WHEN :news_public_private IS NULL OR :news_public_private = '' 
    THEN news_public_private
    ELSE :news_public_private END,
news_status = 
    CASE 
    WHEN :news_status IS NULL OR :news_status = '' 
    THEN news_status
    ELSE :news_status END,
news_img_url=
    CASE  
    WHEN $news_img_url IS NULL OR $news_img_url ='' THEN news_img_url
    ELSE $news_img_url
    END,
news_category = 
    CASE 
    WHEN :news_category  IS NULL OR :news_category  = '' 
    THEN news_category 
    ELSE :news_category  END,
news_date=:news_date,
news_content=:news_content,
modified_at = CURRENT_TIMESTAMP
WHERE news_id=$news_id

RETURNING 'redirect' AS component,
$redirect_link AS link;