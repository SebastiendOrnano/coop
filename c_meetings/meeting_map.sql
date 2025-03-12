SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell.sql') AS properties;


SELECT 
    'button'                                      as component;
SELECT
    'Retour à l''évévenement'                     as title,
    'green'                                       as color,
    '/b_events/event_poster.sql?event_id='||$event_id as link;

SELECT
    'map'   as component,    
    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png' as tile_source,
    12   as zoom;

SELECT
    'Lieu de l''évenement' as title,
    place_latitude  as latitude,
    place_longitude as longitude

    from place
    where place_id=$place_id;
