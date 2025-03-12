SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_1.sql') AS properties;


select 
    'divider'                   as component,
    'Nos dernières actualités internes'  as contents,
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
   WHERE news_status='active' AND news_date > date('now', '-3 month') AND news_public_private='private';