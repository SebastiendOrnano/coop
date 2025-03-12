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
    'datagrid'              as component,
    'panel_event_display' as id;

select 
    '/b_events/event_resa_display_4.sql'             as link,
    'Vérif occupation des salles'                    as description,
    'users-group'                                    as icon,
    'blue'                                           as color;


select 
    '/b_events/event_main_form_4.sql'               as link,
    'Création d''un nouvel événement'               as description,
    'confetti'                                      as icon,
    'yellow'                                        as color;

select 
    '/b_events/event_main_list.sql'                   as link,
    'Liste des événements'                            as description,
    'users-group'                                     as icon,
    'blue'                                            as color;

select 
    '/b_events/event_archive_display_4.sql'             as link,
    'Visualiser les événements achivées'                as description,
    'archive'                                           as icon,
    'red'                                               as color;

select 
    '/b_events/event_past_display_4.sql'             as link,
    'Visualiser les événements terminés'             as description,
    'calendar-clock'                                 as icon,
    'green'                                          as color;

select 
    'divider'              as component,
    'Liste des événements à venir' as contents,
    'left'                 as position,
    'black'                as color;

-- Display list of organizations
SELECT 'table' AS component, 
    'Liste des événements à venir'   AS title, 
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
LEFT JOIN (select space_id, space_name from place_spaces) AS s 
ON s.space_id = e.space_id
WHERE e.event_name IS NOT NULL AND e.event_status ='active' AND e.event_public_private = 'public' AND e.event_date > CURRENT_DATE
ORDER BY e.event_date DESC;

