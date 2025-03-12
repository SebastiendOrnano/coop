SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;
select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;

select 
    'Retour au panneau d''administation'         as title,
    '/a_panels/panel_supervisor_4.sql' as link;

select 
    'Gestion des actus'         as title,
    '/b_news/news_main_display_4.sql' as link;

select 
    'foldable'        as component,
    'news_list_id'    as id;
select 
    'news_content_id'              as id,
    DATE(news_date)||' |  '||news_title  as title,
    CASE 
    WHEN news_img_url IS NULL OR news_img_url = '' THEN  news_content
    ELSE 
    '![]('||news_img_url||')

'|| news_content
    END  as description_md
   from news
   where news_id=$news_id;