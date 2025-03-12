SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

select 
    'datagrid'              as component,
    'panel_orga_display' as id,
    'Gestion des événements' as title;

select 
    '/a_panels/panel_editor_3.sql'         as link,
    'Retour au tableau de bord superviseur'    as description,
    'corner-down-left-double'                  as icon,
    TRUE                                       as active,
    'white'                                    as color;

select 
     '/c_meetings/meeting_main_display_3.sql'          as link,
    'Retour à la gestion des événements'           as description,
    'corner-down-left'                                as icon,
    'green'                                        as color;

select 

    '/c_meetings/meeting_main_form_3.sql'     as link,
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
   '['||e.event_name||' ](/b_events/event_private_poster_1.sql?event_id=' || e.event_id || ')'    AS View
FROM events AS e
LEFT JOIN place_spaces AS s 
ON s.space_id = e.space_id
WHERE e.event_name IS NOT NULL AND e.event_status !='archived' AND e.event_date > CURRENT_DATE
ORDER BY   s.space_name ASC, e.event_date ASC;

