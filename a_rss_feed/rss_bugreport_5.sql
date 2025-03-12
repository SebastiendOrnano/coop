select 'http_header' as component, 'application/rss+xml' as content_type;
select 'shell-empty' as component;
select
  'rss' as component,
  'Suivi des inscriptions' as title,
  'http://localhost:8080/c_debug/debug_main_display_5.sql' as link,
  'Suivi des nouvelles discussion sur le forum sur le site Coop' as description,
  'fr' as language;

SELECT
  topicname AS title,
  'http://localhost:8080/c_debug/debug_main_display_5.sql' as link

FROM
  forum_topics
WHERE forum_type ='debug';