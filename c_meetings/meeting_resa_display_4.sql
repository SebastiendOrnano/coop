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
    'datagrid'              as component,
    'panel_meeting_display' as id,
    'Gestion des événements' as title;

select 

    '/c_meetings/meeting_main_form_4.sql'     as link,
    'Création d''un nouvel événement'                  as description,
    'confetti'                                      as icon,
    'yellow'                                         as color;





select 
    'divider'              as component,
    'Vérification de la disponibilité des salles' as contents,
    'left'                 as position,
    'black'                as color;

-- Display list of organizations
SELECT 'table' AS component, 
    'Vérification de la disponibilité des salles'   AS title, 
    'View'           AS markdown,
    TRUE             AS sort, 
    TRUE             AS search;

SELECT
    s.space_name             AS Salle,
    e.event_date             AS Date,
    e.event_start_hour       AS heure,
    e.event_status           As statut,
   '['||e.event_name||' ](/b_events/event_poster_4.sql?event_id=' || e.event_id || ')'    AS View
FROM events AS e
LEFT JOIN place_spaces AS s 
ON s.space_id = e.space_id
WHERE e.event_name IS NOT NULL AND e.event_status !='archived' AND e.event_date > CURRENT_DATE
ORDER BY   s.space_name ASC, e.event_date ASC;

