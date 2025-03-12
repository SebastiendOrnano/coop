SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion éditeur'         as title,
    '/a_panels/panel_editor_3.sql' as link;



select 
    'datagrid'              as component,
    'panel_news_display' as id,
    'Gestion des news' as title;

select 
    '/b_news/news_main_form_3.sql'     as link,
    'Création d''une news'             as description,
    'user-plus'                        as icon,
    'yellow'                            as color;



-- Display list of organizations
SELECT 'table' AS component, 
    'Liste des news'   AS title, 
    'View'           AS markdown,
    TRUE             AS sort, 
    TRUE             AS search;

SELECT
    news_id                        AS Id,
    news_title                     AS Titre,
    news_status                    AS Status,
    news_public_private            AS PublicPrivate,
    news_date                      AS Date,
   '[Preview](/b_news/news_private_display_3.sql?news_id=' || news_id || ')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Edit](/b_news/news_main_edit_3.sql?news_id=' || news_id || ')'    AS View
FROM news
WHERE news_title IS NOT NULL AND news_status !='archived'
ORDER BY news_id ASC;
