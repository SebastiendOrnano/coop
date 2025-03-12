INSERT INTO rss
(
rss_feed,
rss_title,
rss_link,
rss_description, 
rss_category,
rss_status,
rss_item_title,
rss_item_link,
rss_item_table,
rss_item_description
)

SELECT 
:rss_feed,
:rss_title,
:rss_link,
:rss_description, 
:rss_category,
:rss_status,
:rss_item_title,
:rss_item_link,
:rss_item_table,
:rss_item_description

WHERE :rss_title IS NOT NULL
 
 RETURNING  'redirect' AS component,
'/a_rss/rss_main_display_5.sql' AS link;