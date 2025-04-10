SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

SET username = (
    SELECT users.username FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 


select 
    'datagrid'                                       as component,
    'GESTION DU SITE INTERNET'                       as title,
    'supervisor_panel'                               as id,
    'datagrid_panel'                                 as class,
    'Vous êtes loggé comme :  '||$username           as description_md;

select 
    'FAQ'                                           as title,
    'Questions - Réponses'                          as description,
    'help-octagon'                                  as icon,
    'blue'                                          as color,
    '/b_faq/faq_main_display_4.sql'                 as link;

select 
    'MEMBERS'                                       as title,
    '/b_members/member_main_display_4.sql'           as link,
    'Création, suivi des membres de l''organisation' as description,
    'user-plus'                                      as icon,
     'green'                                         as color;

select 
    'ORGANIZATIONS'                                as title,
    '/b_orga/orga_main_display_4.sql'               as link,
    'Création, suivi des organisations'             as description,
    'affiliate'                                     as icon,
    'red'                                           as color;

select 
    'DOCS'                                         as title,
    '/b_orga_doc/orga_doc_main_display_4.sql'       as link,
    'Gestion des documents institutionnels'         as description,
    'books'                                         as icon,
    'yellow'                                        as color;

select 
    'PARTNERS'                                        as title,
    '/b_orga_partners/orga_partner_display_4.sql'     as link,
    'Gestion des partenaires institutionnels'         as description,
    'affiliate'                                       as icon,
    'orange'                                          as color;

select 
    'PLACES'                                        as title,
    '/b_orga_places/orga_place_main_display_4.sql'  as link,
    'Gestion des lieux'                             as description,
    'map-pin'                                       as icon,
    'red'                                           as color;

select 
    'EVENTS'                                        as title,
    '/b_events/event_main_display_4.sql'            as link,
    'Gestion des evenements publics'                as description,
    'confetti'                                      as icon,
    'blue'                                          as color;

select 
    'MEETINGS'                                      as title,
    '/c_meetings/meeting_main_display_4.sql'        as link,
    'Gestion des evenements privés'                 as description,
    'calendar-clock'                                as icon,
    'orange'                                        as color;

select 
    'NEWS'                                     as title,
    '/b_news/news_main_display_4.sql'          as link,
    'Gestion des actualités'                   as description,
    'text-scan-2'                              as icon,
    'green'                                    as color;

select 
    '/a_rss/rss_main_display_4.sql'     as link,
    'red'                              as color,
    'RSS'                               as title,
    'Liste des liens RSS à copier'      as description,
    'rss'                               as icon;

select 
    '/a_process/process_supervisor_display_4.sql'  as link,
    'blue'                                      as color,
    'PROCESS'                                  as title,
    'Processus'                                as description,
    'automation'                               as icon;

select           
    'WORKSPACES'                                 as title,
    '/c_workspaces/workspace_main_display_4.sql'  as link,
    'Groupes de travail'                          as description,
    'users-group'                                 as icon,
    'green'                                        as color;

