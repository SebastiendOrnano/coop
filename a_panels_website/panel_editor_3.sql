SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

SET username = (
    SELECT users.username FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

select 
    'datagrid'                                  as component,
    'Activités au sein de la communauté'         as title,
    'supervisor_editor'                         as id,
    'datagrid_panel'                            as class,
    'Vous êtes loggé comme :  '||$username      as description_md;


select 
    'EVENTS'                    as title,
    '/c_meetings/meeting_main_display_3.sql'      as link,
    'Gestion des évenements'                      as description,
    'list-details'                                as icon,
    'green'                                       as color;

select 
    'NEWS'                                      as title,
    '/b_news/news_main_display_3.sql'            as link,
    'News'                                       as description,
    'text-scan-2'                                as icon,
    'orange'                                      as color;

select 
    '/a_rss/rss_main_display_3.sql'     as link,
    'red'                               as color,
    'RSS'                               as title,
    'Liens RSS à copier'                as description,
    'rss'                               as icon;

select 
    '/a_process/process_editor_display_3.sql'  as link,
    'lue'                                      as color,
    'PROCESS'                                  as title,
    'Processus'                                as description,
    'automation'                               as icon;

select 
    'GROUPES DE TRAVAIL'                          as title,
    '/c_workspaces/workspace_main_display_3.sql'       as link,
    'Groupes de travail'                          as description,
    'users-group'                                 as icon,
    'blue'                                        as color;

