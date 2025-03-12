SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell.sql') AS properties;

select 
    'list'                 as component,
    'Nos prochaines manifestions' as title;

select 
    CONCAT(
    e.event_date,'   à  ',e.event_start_hour,'  
## ',e.event_name,'     
',
p.place_adress,'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;',p.place_postal_code,'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;',p.place_town,'  
',event_summary
    )                                AS description_md,
    'calendar-check'                 as icon,
    '/b_events/event_poster.sql?event_id='||e.event_id    as link,
    '/b_events/event_poster.sql?event_id='||e.event_id    as view_link
    FROM events AS e
    LEFT JOIN (select place_adress, place_postal_code, place_town, place_id from place) AS p 
    ON p.place_id = e.place_id
    WHERE  e.event_name IS NOT NULL AND e.event_status ='active' AND e.event_public_private ='public' AND e.event_date > CURRENT_DATE;