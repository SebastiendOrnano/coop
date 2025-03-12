select 'http_header' as component, 'application/rss+xml' as content_type;
select 'shell-empty' as component;
select
  'rss' as component,
  'Suivi des inscriptions' as title,
  'http://localhost:8080/c_debug/debug_main_display_5.sql' as link,
  'Suivi des inscription sur le site Coop' as description,
  'fr' as language,
  'Social' as category,
  FALSE as explicit,
  'https://sql.datapage.app/favicon.ico' as image_url,
  'admin Coop' as author,
  'episodic' as type;

SELECT
  topic_name AS title,
  'http://localhost:8080/c_debug/debug_main_display_5.sql' AS link,
   topic_category AS description

FROM
    forum_topics;