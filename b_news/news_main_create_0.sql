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

INSERT INTO news
(
	news_title,
	news_public_private,
	news_status,
	news_category,
	news_date,
	news_content,
	news_img_url
)

VALUES 
(
	:news_title,
	:news_public_private,
	:news_status,
	:news_category,
	:news_date,
	:news_content,
	sqlpage.persist_uploaded_file('news_img_url', 'x_news_pictures', 'pdf,jpg,jpeg,png,gif')
)

RETURNING 'redirect' AS component,
	$redirect_link AS link;


