SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

SET workspace_title = SELECT workspace_title from workspaces where workspace_id=$workspace_id;

SET user_id = (
    SELECT users.user_id AS userID FROM users
    INNER JOIN sessions ON userID = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
);

SET workspace_coordinator = 
CASE
WHEN (SELECT workspace_coordinator_id FROM workspaces WHERE workspace_id=$workspace_id)= $user_id 
THEN 'coordinator'
ELSE ''
END;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Éditeur'         as title,
     '/a_panels/panel_editor_3.sql' as link;
select 
    'Liste des espaces de travail'            as title,
    '/c_workspaces/workspace_main_display_3.sql' as link;


select 
    'datagrid'                                         as component,
    'panel_hub_workspace_display' as id,
    'ESPACE DE TRAVAIL DU GROUPE : '||$workspace_title as title;

select 
    '/c_workspaces/workspace_participants_display_3.sql?workspace_id='||$workspace_id        as link,
    'Membres du groupe de travail'                                                          as description,
    'users-group'                                                                           as icon,
    'blue'                                                                                  as color;

select 
    '/c_workspaces/workchat_display_3.sql?workspace_id='||$workspace_id        as link,
    'Discussions perso en cours (chat)'                                        as description,
    'messages'                                                                 as icon,
    'green'                                                                    as color;

select 
    '/c_workspaces/workforum_topic_display_3.sql?workspace_id='||$workspace_id    as link,
    'Discussions collectives en cours (forum)'                        as description,
    'arrows-random'                                                         as icon,
    'red'                                                                   as color;

select 
    '/c_workspaces/workdoc_form_3.sql?workspace_id='||$workspace_id    as link,
    'Ajouter un document'                       as description,
    'book'                                      as icon,
    'green'                                     as color;

select 
    '/c_workspaces/workdoc_display_3.sql?workspace_id='||$workspace_id        as link,
    'Liste des documents'                                                     as description,
    'library'                                                                 as icon,
    'yellow'                                                                  as color;

select 
    '/c_workspaces/workdoc_cloud_form_3.sql?workspace_id='||$workspace_id    as link,
    'Ajouter un doc en ligne'                               as description,
    'cloud-share'                                      as icon,
    'green'                                     as color;

select 
    '/c_workspaces/workdoc_cloud_display_3.sql?workspace_id='||$workspace_id        as link,
    'Liste des documents en ligne'                              as description,
    'cloud-down'                                          as icon,
    'red'                                              as color;

SELECT
    CASE
    WHEN $workspace_coordinator = 'coordinator' 
    THEN '/c_workspaces/workmeeting_form_3.sql?workspace_id='||$workspace_id  
    ELSE '' END  as link,
    CASE
    WHEN $workspace_coordinator = 'coordinator'  
    THEN 'Création d''une réunion' 
    ELSE '' END  as description,
    CASE
    WHEN $workspace_coordinator = 'coordinator' 
    THEN 'calendar-time' 
    ELSE '' END  as  icon,
    CASE
    WHEN $workspace_coordinator = 'coordinator' 
    THEN  'yellow' 
    ELSE '' END  as color;


select 
    'divider'              as component,
    'Liste des événements à venir' as contents,
    'left'                 as position,
    'black'                as color;

-- Display list of organizations
SELECT 'table' AS component, 
    'Liste des événements à venir'   AS title, 
    'Alert'          AS markdown,
    'View'           AS markdown,
    TRUE             AS sort, 
    TRUE                  as small,
    TRUE             AS search;

SELECT
    CASE WHEN (SELECT e.workmeeting_alert IS NULL OR e.workmeeting_alert = 'alert_end') THEN '' ELSE '![warning](/x_icons/warning32px.png)' END  as  Alert,
    CASE WHEN (SELECT e.workmeeting_alert IS NULL OR e.workmeeting_alert = 'alert_end') THEN '' ELSE e.workmeeting_alert END  AS alert_type,
    CASE WHEN (SELECT e.workmeeting_alert IS NULL OR e.workmeeting_alert = 'alert_end') THEN '' ELSE 'red' END  as _sqlpage_color,
    e.workmeeting_title             AS Nom,
    e.workmeeting_status           As statut,
    CASE 
    WHEN e.workmeeting_visio='yes' THEN 'visio'
    ELSE 'présentiel'  END            As type,
    e.workmeeting_date             AS Date,
    e.workmeeting_hour_start       AS heure,
   '[View - Register](/c_workspaces/workmeeting_participants_display_3.sql?workmeeting_id='||e.workmeeting_id||'&workspace_id='||$workspace_id||')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
    ||CASE
    WHEN $workspace_coordinator = 'coordinator'
    THEN '[Edit](/c_workspaces/workmeeting_edit_3.sql?workmeeting_id='||e.workmeeting_id||'&workspace_id='||$workspace_id||')' 
    ELSE ''
    END
    AS View
FROM workmeetings AS e
LEFT JOIN place_spaces AS s 
ON s.space_id = e.space_id
WHERE e.workmeeting_title IS NOT NULL AND e.workmeeting_status !='archived' AND e.workmeeting_date > CURRENT_DATE AND workspace_id=$workspace_id
ORDER BY e.workmeeting_date DESC;

