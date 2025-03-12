SET news_img_url= (SELECT news_img_url FROM news WHERE news_id  = $news_id);

INSERT INTO files_to_erase
(
    file_url
)
VALUES
(
    $news_img_url
);

DELETE FROM news
WHERE news_id  = $news_id

RETURNING
'redirect' AS component,
'/b_news/news_main_display_4.sql' AS link;