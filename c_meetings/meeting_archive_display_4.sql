SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Superviseur'         as title,
    '/a_panels/panel_supervisor_4.sql' as link;
select 
    'gestion des événements'            as title,
    '/c_meetings/meeting_main_display_4.sql'     as link;



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
WHERE e.event_name IS NOT NULL AND e.event_status ='archived' AND event_public_private='private' AND e.event_date > CURRENT_DATE
ORDER BY e.event_date DESC;

