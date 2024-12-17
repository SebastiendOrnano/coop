SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_5.sql') AS properties;

select 
    'datagrid'              as component,
    'Panneau d''administration superviseur'         as title,
    'gestion des utilisateurs, modération du forum...' as description_md;


select 
    '/a_panels/panel_rss_5.sql'     as link,
    'orange' as color,
    'RSS' as title,
    'Liste des liens RSS à copier'  as description,
    'rss'  as icon;

select 
    '/a_users/user_main_display_5.sql'     as link,
    'green' color,
    'utilisateurs' as title,
    'Gestion des utilisateurs'  as description,
    'rss'  as icon;

select 
    '/b_faq/faq_display_5.sql'     as link,
    'yellow' color,
    'FAQ' as title,
    'Gestion des messages reçus'  as description,
    'rss'  as icon;

select 
    '/c_forum/forum_topic_display_5.sql'     as link,
    'blue' as color,
    'FORUM' as title,
    'Modération des discussions'  as description,
    'rss'  as icon;

select 
    '/a_process/process_display_5.sql'     as link,
    'orange' color,
    'PROCESS' as title,
    'Gestion des processus'  as description,
    'rss'  as icon;

select 
    '/a_info/section_display_5.sql'     as link,
    'green' color,
    'INFO SITE' as title,
    'Gestion des infos sur le site web'  as description,
    'rss'  as icon;

select 
    '/a_help/section_display_5.sql'     as link,
    'yellow' color,
    'HELP' as title,
    'Gestion de l''aide pour les dev'  as description,
    'rss'  as icon;


