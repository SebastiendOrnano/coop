select 'http_header' as component, 'application/rss+xml' as content_type;

select 'shell-empty' as component;

SET rss_id=4

select
  'rss' as component,
  rss_title as title,
  rss_link as link,
  rss_description as description,
  'fr' as language,
  rss_category as category
  FROM rss WHERE rss_id=$rss_id;

SET rss_item_title= SELECT rss_item_title FROM rss WHERE rss_id=$rss_id;
SET rss_item_link= SELECT rss_item_link FROM rss WHERE rss_id=$rss_id;
SET rss_item_description= SELECT rss_item_description FROM rss WHERE rss_id=$rss_id;
SET rss_item_table= SELECT rss_item_table FROM rss WHERE rss_id=$rss_id;


SELECT
  $rss_item_title AS title,
  $rss_item_link AS link,
  $rss_item_description AS description,
  FROM $rss_item_table;