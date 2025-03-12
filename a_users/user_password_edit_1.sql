SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_1.sql') AS properties;

SELECT 'form' AS component,
    'Changer de mot de passe' AS title,
    'Changer le mot de passe' AS validate,
    '/a_users/user_password_update_0.sql?user_id='||$user_id AS action;

SELECT 'username' AS name,
   'nom d''utilisateur' AS label,
   TRUE AS readonly,
   4 as width,
   (select username FROM users where user_id=$user_id) as value;

SELECT 'last_name' AS name,
    'nom de famille' AS label,
    TRUE AS readonly,
    4 as width,
    (select user_last_name FROM users where user_id=$user_id) as value;

SELECT 'first_name' AS name,
    'prénom' AS label,
    TRUE AS readonly,
    4 as width,
    (select user_first_name FROM users where user_id=$user_id) as value;

SELECT 
    'user_email' AS name, 
    'votre email actuel' AS label,
    'at' as prefix_icon, 
     6 as width,
    TRUE AS readonly,
    (select user_email FROM users where user_id=$user_id) as value,
    'votre email' as placeholder;

SELECT 'password' AS name, 
       'password' AS type,
        'lock' as prefix_icon, 
          6 as width,
        'Votre mot de passe actuel (pour controle)' AS label,
    (select regex_value from regex where regex_name='password')         as pattern,
    (select regex_description from regex where regex_name='password')          as description;

SELECT 'password_new' AS name, 
       'password' AS type,
        'Votre nouveau mot de passe' AS label,
    (select regex_value from regex where regex_name='password')         as pattern,
    (select regex_description from regex where regex_name='password')          as description;

SELECT 'password_new_check' AS name, 
       'password' AS type,
        'Contrôle du nouveau mot de passe' AS label,
    (select regex_value from regex where regex_name='password')         as pattern,
    (select regex_description from regex where regex_name='password')          as description;

