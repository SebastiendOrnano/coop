select 'http_header' as component, 'application/rss+xml' as content_type;
select 'shell-empty' as component;
select
  'rss' as component,
  'Suivi des messages' as title,
  'http://localhost:8080/b_faq/faq_main_display_4.sql' as link,
  'Suivi des messages envoyés sur le site Coop' as description,
  'fr' as language;
select
  'Bonjour' as title,
  'http://localhost:8080/b_faq/faq_main_display_4.sql' as link,
  'dernier message reçu' as description;