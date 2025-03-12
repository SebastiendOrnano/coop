SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Superviseur'         as title,
    '/a_panels/panel_supervisor_4.sql' as link;

select 
    'Gestion des événements'            as title,
    '/b_events/event_main_display_4.sql' as link;


SELECT
    'text' as component,
    CASE
    WHEN (SELECT event_picture_url from events WHERE event_id = $event_id) IS NULL OR (SELECT event_picture_url from events WHERE event_id = $event_id) ='' THEN ''
    ELSE '![Affiche]('||(SELECT event_picture_url from events WHERE event_id = $event_id )||')' END as contents_md;

SELECT
    'title' as component,
    TRUE as center,
    (select event_name from events where event_id=$event_id) as contents;

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

select 
    'divider'            as component,
    'Lieu'               as contents,
    'blue'               as color,
    5                    as size,
    TRUE                 as bold,
    'left'               as position;

SELECT
    'text' as component,
    'event_place' as id,
     $lieu||'  
'||$adress as contents_md;

SET place_id = (SELECT place_id from events WHERE event_id = $event_id);

SELECT
    'text' as component,
    '[**Repérer le lieu sur une carte**](/b_events/event_map.sql?place_id='||$place_id||'&event_id='||$event_id||')' as contents_md;
 
SET program = 
CASE 
WHEN (SELECT event_program_url ='' OR event_program_url IS NULL from events WHERE event_id = $event_id ) then ''
ELSE 'Découvrir le programme complet-> [Programme]('||(SELECT event_program_url from events WHERE event_id = $event_id )||')'
END;

select 
    'divider'            as component,
    'Présentation'               as contents,
    'blue'               as color,
    5                    as size,
    TRUE                 as bold,
    'left'               as position;

SELECT
    'text' as component,
   (SELECT event_summary from events WHERE event_id = $event_id)||'  

'||$program as contents_md;

select 
    'divider'            as component,
    'Infos pratiques'    as contents,
    'blue'               as color,
    5                    as size,
    TRUE                 as bold,
    'left'               as position;

SELECT
    'text' as component,
     '**DATE** :  '||(SELECT event_date from events WHERE event_id = $event_id ) as contents_md;

SELECT
    'text' as component,
    '**HEURE DÉBUT** :  '||(SELECT event_start_hour from events WHERE event_id = $event_id ) as contents_md;

SET event_audience_target = 
CASE 
WHEN (SELECT event_audience_target ='' OR event_audience_target IS NULL from events WHERE event_id = $event_id ) then ''
ELSE '**PUBLIC CONCERNÉ** :  '||(SELECT event_audience_target from events WHERE event_id = $event_id)
END;

SELECT
    'text' as component,
    $event_audience_target as contents_md;

SET nb_max_participants = 
CASE 
WHEN (SELECT event_participants_nb_max ='' OR event_participants_nb_max IS NULL from events WHERE event_id = $event_id ) then ''
ELSE '**Nb MAX DE PARTICIPANTS** :  '||(SELECT event_participants_nb_max from events WHERE event_id = $event_id)
END;

SELECT
    'text' as component,
    $nb_max_participants as contents_md;

SET registration = 
CASE 
WHEN (SELECT event_registration ='no' OR event_registration IS NULL from events WHERE event_id = $event_id ) then ''
ELSE '**RÉSERVATION OBLIGATOIRE ->**  [s''inscrire](/b_events/event_registration_form.sql?event_id='||$event_id||')'
END;

SELECT
    'text' as component,
    $registration as contents_md;

SET entrance_fee = 
CASE 
WHEN (SELECT event_entrance_fee ='' OR event_program_url IS NULL from events WHERE event_id = $event_id ) then '**ENTRÉE GRATUITE**'
ELSE '**PRIX ''ENTRÉE** :  '||(SELECT event_entrance_fee from events WHERE event_id = $event_id)
END;

SELECT
    'text' as component,
    $entrance_fee as contents_md;

SET participants = 
CASE 
WHEN (SELECT event_participants_nb='' OR event_participants_nb IS NULL from events WHERE event_id = $event_id) then '0'
ELSE (SELECT event_participants_nb from events WHERE event_id = $event_id)
END;

SELECT
    'text' as component,
    'Nb de participants : '||$participants as contents_md;

select 
    'divider'            as component,
    'liste des participants'    as contents,
    'blue'               as color,
    5                    as size,
    TRUE                 as bold,
    'left'               as position;

-- Display list of organizations
SELECT 'table' AS component, 
    'Liste des participants'   AS title, 
    'View'           AS markdown,
    TRUE             AS sort, 
    TRUE             AS search;

SELECT
    participant_id                  AS Id,
    participant_first_name          AS Prénom,
    participant_last_name           AS Nom,
    participant_age                 AS Age,
    participant_contact_email        AS Mail
 
FROM event_participants
WHERE event_id=$event_id
ORDER BY created_at ASC;
