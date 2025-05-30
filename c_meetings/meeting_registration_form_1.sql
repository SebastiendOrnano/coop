SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

SELECT 
    'form'                                        as component,
    'S''incrire à un événement interne'           as title,
    'S''inscrire'                                 as validate,
    'Clear'                                       as reset,
    '/c_meetings/meeting_registration_create_0.sql?event_id='||$event_id as action;

SELECT 
    'event_date'              as name,
    'Date de l''évenement'    as label,
    'date'                    as type,
    (select event_date from events where event_id=$event_id) as value,
   2                         AS width,
     TRUE                     as readonly;

SELECT
    'event_start_hour' as name,
    'text' as type,  
    'heure début' as label,
         TRUE                     as readonly,
    (select event_start_hour from events where event_id=$event_id) as value,
    2 as width;

SELECT
    'event_name'          as name,
    'text'                as type,  
    'Nom de l''événement'                  as label,
    8 AS width,
    TRUE                as readonly,
    (select event_name from events where event_id=$event_id) as value;


 SELECT 
    'participant_gender'        as name,
    'Genre'               as label,
    'select'                as type,
    2                     AS width,
    (SELECT user_gender FROM users 
    INNER JOIN sessions ON users.user_id = sessions.user_id  WHERE sessions.session_token = sqlpage.cookie('session_token')
    ) as value,
    'Choisir un genre...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="gender"
    ORDER BY  i.choice_label ASC;

SELECT
    'participant_first_name' as name,
    'text' as type,
     (
    SELECT user_first_name FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id  WHERE sessions.session_token = sqlpage.cookie('session_token')
    ) as value,
    'Prénom' as label,
    5 AS width;;

SELECT
    'participant_last_name' as name,
    'text' as type,  
    'Nom' as label,
    (
    SELECT user_last_name FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id  WHERE sessions.session_token = sqlpage.cookie('session_token')
    ) as value,
    TRUE as required,
    5 AS width;

SELECT 
    'participant_contact_phone' as name,
    'Téléphone' as label,
    'text' as type,
      (
    SELECT user_phone FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id  WHERE sessions.session_token = sqlpage.cookie('session_token')
    ) as value,
    3 AS width,
    -- TRUE as required,
   (select regex_value from regex where regex_name='phone')         as pattern,
   (select regex_description from regex where regex_name='phone')          as description;
 
SELECT 
    'participant_contact_email' as name,
    'Email' as label,
    'text' as type, 
       (
    SELECT user_email FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id  WHERE sessions.session_token = sqlpage.cookie('session_token')
    ) as value,
    8 AS width,
    TRUE as required,
   (select regex_value from regex where regex_name='email')         as pattern,
   (select regex_description from regex where regex_name='email')          as description;

 SELECT 
    'participant_age' as name,
    'Age' as label,
    'number'       as type, 
    4 AS width,
    '18' as description;

 SELECT 
    'participant_postal_code' as name,
    'Code postal' as label,
    'text'       as type, 
    4 AS width,
    '75000' as description;


SELECT 'participant_rgpd_validation' AS name, 
       'J''ai pris connaissance des mentiones légales et des conditions générales (voir ci-dessous) d''utilisation et j''en accepte les termes ' AS label,
       TRUE AS required,
        'yes'        as value,
       'checkbox' AS type;

select 
    'alert'           as component,
    'alert-circle'    as icon,
    'yellow'             as color,
    TRUE              as important,
    TRUE              as dismissible,
    '[Consulter les conditions générales de vente CGV ](/b_about/orga_CGV.sql)' as description_md;














