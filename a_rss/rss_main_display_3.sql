SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;







select 
    'title'        as component,
    'RSS'         as title,
    'Liste des liens à copier pour s''abonner à un flux RSS' as contents;

select 
    'divider' as component;



SELECT 
    'table'               AS component, 
    'Étapes du processus' AS title, 
    TRUE                  AS sort, 
    'View'                AS markdown, 
    FALSE                 AS search;

SELECT
    rss_title              AS Title,
    rss_feed               AS link
FROM rss
WHERE rss_category='editor'
ORDER BY created_at ASC;

