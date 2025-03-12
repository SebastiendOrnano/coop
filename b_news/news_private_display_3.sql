SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;

select 
    'Retour au panneau d''administation'         as title,
    '/a_panels/panel_editor_3.sql' as link;

select 
    'Gestion des actus'         as title,
    '/b_news/news_main_display_3.sql' as link;

select 
    'divider'                   as component,
    'Preview'  as contents,
    'left'                      as position,
    6                           as size,
    'red'                      as color;

select 
    'foldable'        as component,
    'news_list_id'    as id;

select 
    'news_content_class'                    as class,
    DATE(news_date)||' |  '||news_title  as title,
    CASE 
    WHEN news_img_url IS NULL OR news_img_url = '' THEN  news_content
    ELSE 
    '![]('||news_img_url||')

'|| news_content
    END  as description_md
   FROM news
   WHERE news_id=$news_id;