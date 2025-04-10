SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_5.sql') AS properties;

SET username = (
    SELECT users.username FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

select 
    'datagrid'                                        as component,
    'Panneau d''administration superviseur'           as title,
    'Vous êtes loggé comme :  '||$username            as description_md;

select 
    'INFO SITE'                                    as title,
    'Infos administratives... sur le site'          as description,
    'help-octagon'                                  as icon,
    'green'                                         as color,
    '/a_info/section_main_display_5.sql'            as link;

select 
    '/a_users/user_new_display_5.sql'       as link,
    'red'                                   as color,
    'NEW USERS'                             as title,
    'Gestion des comptes en attente'        as description,
    'user-exclamation'                      as icon;

select 
    '/a_users/user_main_display_5.sql'      as link,
    'green'                                 as color,
    'USERS'                                 as title,
    'Gestion des utilisateurs'              as description,
    'user-exclamation'                      as icon;

select 
    '/c_forum/forum_main_display_5.sql'      as link,
    'blue'                                   as color,
    'FORUM'                                  as title,
    'Modération du forum'                    as description,
    'arrows-random'                          as icon;

select 
    '/c_debug/debug_main_display_5.sql'      as link,
    'blue'                                   as color,
    'BUG REPORT'                             as title,
    'Bug report'                             as description,
    'bug'                                    as icon;

select 
    '/a_process/process_main_display_5.sql'    as link,
    'orange'                                   as color,
    'PROCESS'                                  as title,
    'Gestion des processus'                    as description,
    'automation'                               as icon;

select 
    '/a_rss/rss_main_display_5.sql'     as link,
    'blue'                              as color,
    'RSS'                               as title,
    'Liste des liens RSS à copier'      as description,
    'rss'                               as icon;

select 
    '/a_info/section_help_display_5.sql'     as link,
    'green'                                  as color,
    'DOC COOP'                               as title,
    'Gestion Help Dev'                       as description,
    'help-circle'                            as icon;

select 
    '/a_info/help_dev_FR_5.sql'     as link,
    'yellow'                        as color,
    'HELP FR'                       as title,
    'Aide pour les dev'             as description,
    'help'                          as icon;

select 
    '/a_info/help_dev_EN_5.sql'    as link,
    'red'                          as color,
    'HELP EN'                      as title,
    'Help for dev'                 as description,
    'help'                         as icon;

select 
    '/a_sessions/session_stats_5.sql'    as link,
    'green'                                as color,
    'STAT SESSIONS'                     as title,
    'Statistiques connexions'           as description,
    'database-x'                         as icon;

select 
    '/a_sessions/session_purge_alert_5.sql'    as link,
    'red'                                      as color,
    'PURGE SESSIONS'                           as title,
    'Purge sessions table'                     as description,
    'database-x'                               as icon;

select 
    '/a_docs_purge/doc_purge_display_5.sql'    as link,
    'yellow'                             as color,
    'PURGE DOCS'                        as title,
    'Purge useless docs'                 as description,
    'database-x'                         as icon;

select 
    'blue'                           as color,
    'SqlPage version'                as title,
    sqlpage.version()                as description,
    'device-ipad-question'           as icon;

select 
    '/a_choices/choice_main_display_5.sql'    as link,
    'red'                                     as color,
    'CHOICES'                                 as title,
    'Listes of choices'                       as description,
    'list-check'                              as icon;

select 
    '/a_choices/regex_main_display_5.sql'    as link,
    'red'                                     as color,
    'REGEX'                                 as title,
    'Regex pattern'                        as description,
    'brackets-contain'                     as icon;




