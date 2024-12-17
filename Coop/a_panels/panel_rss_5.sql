SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_5.sql') AS properties;

select 
    'title'        as component,
    'RSS'         as title,
    'Liste des liens à copier pour s''abonner à un flux RSS' as contents;

select 
    'divider' as component;

select
    'text' as component,
    'USERS :  notification nouveau compte'  as contents,
    'http://localhost:8080/a_rss/rss_users_5.sql' as contents_md,
    'rss'  as icon;
    
select
    'text' as component,
    'FAQ notification messages reçus par le formulaire contact'  as contents,
    'http://localhost:8080/a_rss/rss_faq_5.sql' as contents_md,
    'rss'  as icon;





