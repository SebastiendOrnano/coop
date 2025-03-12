select 'http_header' as component, 'application/rss+xml' as content_type;
select 'shell-empty' as component;
select
  'rss' as component,
  'Suivi des inscriptions' as title,
  'http://localhost:8080/a_users/users_new_display_5.sql' as link,
  'Suivi des inscriptions sur le site Coop' as description,
  'fr' as language;

SELECT
  'Nouvelle inscription :    ' ||username AS title,
  'http://localhost:8080/a_users/users_new_display_5.sql' AS link,
 '<strong>Email:&nbsp;&nbsp; </strong> ' || user_email || '<br /><strong> Motivation:&nbsp;&nbsp;</strong> ' || user_short_cv AS description

FROM
  users
WHERE user_status IS NULL OR user_status = '' OR user_role = '' OR user_role IS NULL;