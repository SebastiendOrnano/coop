select 'http_header' as component, 'application/rss+xml' as content_type;

select 'shell-empty' as component;

select
  'rss' as component,
  rss_title as title,
  rss_link as link,
  rss_description as description,
  'fr' as language,
  rss_category as category
FROM rss WHERE rss_id='3';

SELECT
  rss_item_title AS title,
  rss_item_link AS link,
  rss_item_description AS description

FROM rss WHERE rss_id='3';