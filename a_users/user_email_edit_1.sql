SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_1.sql') AS properties;

SELECT 'form' AS component,
    'Changer d''email''' AS title,
    'Changer l''email' AS validate,
    '/a_users/user_email_update_0.sql?user_id='||$user_id AS action;


SELECT 'user_first_name' AS name,
    'prénom' AS label,
    TRUE AS readonly,
    6 as width,
    (select user_first_name FROM users where user_id=$user_id) as value;

SELECT 'user_last_name' AS name,
    'nom de famille' AS label,
    TRUE AS readonly,
    6 as width,
    (select user_last_name FROM users where user_id=$user_id) as value;


SELECT 
    'user_email' AS name,
    'email actuel' AS label,
   TRUE AS readonly,
        6 as width,
    (select user_email FROM users where user_id=$user_id) as value;

 SELECT 
    'user_email_new' AS name,
    'nouvel email' AS label,
    'text' AS type,
        6 as width,
   (select regex_value from regex where regex_name='email')         as pattern,
   (select regex_description from regex where regex_name='email')          as description;


