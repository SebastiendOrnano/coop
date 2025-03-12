SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_1.sql') AS properties;

SELECT 'form' AS component,
    'Changer de nom d''utilisateur' AS title,
    'Changer le nom d''utilisateur' AS validate,
    'Clear' as reset,
    '/a_users/user_username_update_0.sql?user_id='||$user_id AS action;

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

SELECT 'username' AS name,
   'nom d''utilisateur actuel' AS label,
   TRUE AS readonly,
   6 as width,
   (select username FROM users where user_id=$user_id) as value;

SELECT 'username_new' AS name,
    'nouveau nom d''utilisateur' AS label,
     6 as width,
    TRUE AS required;


