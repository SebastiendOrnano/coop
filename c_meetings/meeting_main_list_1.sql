SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell.sql') AS properties;

SET adress = Select place_adress FROM place LEFT JOIN events ON place.place_id = events.place_id WHERE event_id = $event_id;

SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE 
WHEN $user_role = 'supervisor' THEN  '/c_meetings/meeting_main_display_4.sql'
WHEN $user_role = 'editor' THEN  '/c_meetings/meeting_main_display_3.sql'
ELSE ''
END;

SET redirect_title =
CASE WHEN $user_role = 'supervisor'  OR $user_role = 'editor' THEN  'Gestion des événements internes'
ELSE ''
END;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    $redirect_title    as title,
    $redirect_link     as link;


select 
    'list'                 as component,
    'Nos prochaines manifestions internes' as title;

select 

    CONCAT(
    e.event_date,'   à  ',e.event_start_hour,'  
## ',e.event_name,'     
',
p.place_adress,'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;',p.place_postal_code,'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;',p.place_town,'  
',event_summary
    )                                AS description_md,
    'calendar-check'                 as icon,
    '/c_meetings/meeting_main_poster_1.sql?event_id='||e.event_id    as link,
    '/c_meetings/meeting_main_poster_1.sql?event_id='||e.event_id    as view_link
    FROM events AS e
    LEFT JOIN 
    place AS p ON p.place_id = e.place_id
    WHERE  event_name IS NOT NULL AND event_status !='archived' AND event_public_private='private' AND event_date > CURRENT_DATE;