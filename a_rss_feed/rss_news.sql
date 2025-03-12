select 'http_header' as component, 'application/rss+xml' as content_type;
select 'shell-empty' as component;
select
  'rss' as component,
  'Suivi des actus du site COOP' as title,
  'http://localhost:8080/b_news/news_public_display.sql' as link,
  'Suivi des actualités sur le site Coop' as description,
  'fr' as language,
  'Social' as category;

SELECT
  'Nouvelle actu :    ' ||news_title AS title,
 'http://localhost:8080/b_news/news_public_display.sql' as link,
  SUBSTR( news_content, 1, 50)||'...'   AS description

FROM
    news
WHERE news_public_private='public' AND news_status='online';