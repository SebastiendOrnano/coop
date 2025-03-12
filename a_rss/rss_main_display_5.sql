SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_5.sql') AS properties;


select 
    'datagrid'               as component,
    'process_step_display'   as id;

select 
    '/a_panels/panel_admin_5.sql'               as link,
    'Retour au tableau de bord admin'          as description,
    'corner-down-left-double'                  as icon,
    TRUE                                       as active,
    'white'                                    as color;

select 
    '/a_rss/rss_main_form_5.sql'    as link,
    'Créer un  lien RSS'                                       as description,
    'rss'                                                as icon,
    'green'                                                     as color;





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
    rss_id                 AS Id,
    rss_title              AS Title,
    rss_feed               AS link,
    rss_category           AS Catégorie,
   '[Edit](/a_rss/rss_main_edit_5.sql?rss_id=' || rss_id ||  ') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Delete](/a_rss/rss_main_delete_0.sql?rss_id=' || rss_id ||')'    AS View
FROM rss
ORDER BY created_at ASC;

