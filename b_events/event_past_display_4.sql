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
    '/b_events/event_main_display_4.sql'     as link;



select 
    'divider'              as component,
    'Liste des événements passés ou archivés' as contents,
    'left'                 as position,
    'black'                as color;

-- Display list of organizations
SELECT 'table' AS component, 
    'Liste des événements passés ou archivés'   AS title, 
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
   '[Particip](/b_events/event_registration_display_4.sql?event_id=' || e.event_id || ')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[View](/b_events/event_poster_4.sql?event_id=' || e.event_id || ')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Edit](/b_events/event_main_edit_4.sql?event_id=' || e.event_id || ')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Delete](/b_events/event_main_delete_alert_4.sql?event_id=' || e.event_id|| ')'    AS View
FROM events AS e
LEFT JOIN place_spaces AS s 
ON s.space_id = e.space_id
WHERE e.event_date < CURRENT_DATE
ORDER BY e.event_date DESC;

