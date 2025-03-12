SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

select 
    'datagrid'              as component,
    'Gestion des événements internes' as title;

select 
    '/a_panels/panel_supervisor_4.sql'         as link,
    'Retour au tableau de bord superviseur'    as description,
    'corner-down-left-double'                  as icon,
    TRUE                                       as active,
    'white'                                    as color;

select 
    '/c_meetings/meeting_main_display_4.sql'    as link,
    'Retour à la gestion des meetings'          as description,
    'users-group'                               as icon,
    'blue'                                      as color;



select 
    'divider'              as component,
    'Liste des événements internes à venir' as contents,
    'left'                 as position,
    'black'                as color;

-- Display list of organizations
SELECT 'table' AS component, 
    'View'           AS markdown,
    TRUE             AS sort, 
    TRUE             AS search;

SELECT
    e.event_id               AS Id,
    e.event_name             AS Nom,
    e.event_status           As statut,
    e.event_date             AS Date,
    e.event_start_hour       AS heure,
    s.space_name             AS Salle,
    e.event_participants_nb          AS NB_inscrits,
    CASE 
    WHEN e.event_registration = 'no' 
    THEN 'Entrée libre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[View](/c_meetings/meeting_main_poster_1.sql?event_id='||e.event_id||')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Edit](/c_meetings/meeting_main_edit_3.sql?event_id='||e.event_id||')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Delete](/c_meetings/meeting_main_delete_alert_4.sql?event_id='||e.event_id||')' 
    ELSE '[Particip](/c_meetings/meeting_registration_display_4.sql?event_id='||e.event_id||')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[View](/c_meetings/meeting_main_poster_1.sql?event_id='||e.event_id||')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Edit](/c_meetings/meeting_main_edit_4.sql?event_id='||e.event_id||')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Delete](/c_meetings/meeting_main_delete_alert_4.sql?event_id='||e.event_id||')'  
    END  AS View
FROM events AS e
LEFT JOIN place_spaces AS s 
ON s.space_id = e.space_id
WHERE  event_public_private='private' AND e.event_date < CURRENT_DATE
ORDER BY e.event_date DESC;

