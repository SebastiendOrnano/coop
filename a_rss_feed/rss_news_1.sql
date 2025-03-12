select 'http_header' as component, 'application/rss+xml' as content_type;
select 'shell-empty' as component;
select
  'rss' as component,
  'Suivi des actus internes' as title,
  'http://localhost:8080/b_news/news_private_display_1.sql' as link,
  'Suivi des actus internes sur le site Coop' as description,
  'fr' as language,
  'Social' as category;

SELECT
  'Nouvelle actu :    ' ||news_title AS title,
  'http://localhost:8080/b_news/news_private_display_1.sql' AS link,
  SUBSTR( news_content, 1, 50)||'...'   AS description

FROM
    news
WHERE news_public_private='private' AND news_status='online';