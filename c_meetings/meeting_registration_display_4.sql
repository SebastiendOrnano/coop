SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

select 
    'datagrid'              as component,
    'panel_orga_display' as id,
    'Gestion des partenaires de l''organisation' as title;

select 
    '/a_panels/panel_supervisor_4.sql'         as link,
    'Retour au tableau de bord superviseur'    as description,
    'corner-down-left-double'                  as icon,
    TRUE                                       as active,
    'white'                                    as color;

select 
    '/c_meetings/meeting_main_display_4.sql'           as link,
    'Retour à la liste des événements'                 as description,
    'users-group'                                      as icon,
    'blue'                                             as color;

select 
    '/c_meetings/meeting_participants_csv_email_0.sql?event_id='||$event_id    as link,
    'Télécharger la liste des participants'                                    as description,
    'users-group'                                                              as icon,
    'blue'                                                                     as color;

SET lieu = (
    SELECT s.space_name
FROM events e
LEFT JOIN place_spaces s ON s.space_id = e.space_id
WHERE e.event_id = $event_id
);

SET adress = (
    SELECT CONCAT(place_adress, '       
', place_postal_code, '     ', place_town)
    FROM events
    LEFT JOIN (
        SELECT place_adress, place_postal_code, place_town 
        FROM place
    ) ON place_id = events.place_id
    WHERE event_id = $event_id
);

SELECT
    'title' as component,
    TRUE as center,
    (select event_name from events where event_id=$event_id) as contents;

SELECT
    'text' as component,
    'event_place' as id,
     $lieu||'  
'||$adress as contents_md;

SELECT
    'text' as component,
     '**DATE** :  '||(SELECT event_date from events WHERE event_id = $event_id ) as contents_md;


-- Display list of organizations
SELECT 'table' AS component, 
    'Liste des événements'   AS title, 
    'View'           AS markdown,
    TRUE             AS sort, 
    TRUE             AS search;

SELECT
    participant_id                     AS Id,
    participant_first_name             AS Prénom,
    participant_last_name               AS Nom,
    participant_function                 AS Fonction,
    participant_contact_email            AS Mail
FROM event_participants
WHERE event_id=$event_id
ORDER BY created_at ASC;
