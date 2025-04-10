SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

SET username = (
    SELECT users.username FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 


select 
    'datagrid'                                      as component,
    'Panneau d''administration éditeur projets'         as title,
    'project_supervisor_panel'                               as id,
    'datagrid_panel'                                as class,
    'Vous êtes loggé comme :  '||$username      as description_md;

select 
    'GROUPES DE TRAVAIL'                          as title,
    '/c_workspaces/workspace_main_display_3.sql'       as link,
    'Groupes de travail'                          as description,
    'users-group'                                 as icon,
    'blue'                                        as color;

select 
    'PERSONS'                            as title,
    '/d_prm1/prm1_main_display_3.sql'           as link,
    'Création, suivi des personnes physiques' as description,
    'user-plus'                                      as icon,
     'green'                                         as color;

select 
    'COMPAGNIES'                     as title,
    '/d_prm2/prm2_main_display_3.sql'               as link,
    'Création, suivi des organisations'             as description,
    'affiliate'                                     as icon,
    'red'                                           as color;

select 
    'GROUPS'                     as title,
    '/d_prm3/prm3_main_display_3.sql'               as link,
    'Création, suivi des groupes'                   as description,
    'users-group'                                   as icon,
    'blue'                                          as color;

select 
    'project'                                   as title,
    '/e_project/project_main_display_3.sql'       as link,
    'Gestion des projets'         as description,
    'chart-dots-2'                                         as icon,
    'yellow'                                        as color;


select 
    'datagrid'                                  as component,
    'Activités au sein de la communauté'         as title,
    'supervisor_editor'                         as id,
    'datagrid_panel'                            as class,
    'Vous êtes loggé comme :  '||$username      as description_md;


select 
    'Gestion des événenements'                    as title,
    '/c_meetings/meeting_main_display_3.sql'      as link,
    'Gestion des évenements'                      as description,
    'list-details'                                as icon,
    'green'                                       as color;

select 
    'Actus'                                      as title,
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



