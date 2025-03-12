UPDATE  rss
SET
rss_feed=:rss_feed,
rss_title=:rss_title,
rss_link=:rss_link,
rss_description=:rss_description, 
rss_category=:rss_category,
rss_status = 
    CASE 
    WHEN :rss_status IS NULL OR :rss_status = '' 
    THEN rss_status
    ELSE :rss_status END,
rss_item_title=:rss_item_title,
rss_item_link=:rss_item_link,
rss_item_table=:rss_item_table,
rss_item_description=:rss_item_description,
modified_at=CURRENT_TIMESTAMP

WHERE rss_id=$rss_id
 
 RETURNING  'redirect' AS component,
'/a_rss/rss_main_display_5.sql' AS link;