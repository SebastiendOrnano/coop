-- on vérifie si l'utilisateur ne s'est pas trompé dans la saisie

SET redirect_link = (
    SELECT
        CASE
            WHEN :password_new_check != :password_new
            THEN '/a_users/user_password_update_alert2_1.sql'
            ELSE ''
        END
);

SELECT 'redirect' AS component, $redirect_link AS link
WHERE $redirect_link != '' OR $redirect IS NOT NULL;

-- l'utilisateur est en principe connecté avec son email/password mais on fait une ultime vérif que cela est bien le cas.

SET user_id = (SELECT user_id FROM sessions WHERE sessions.session_token = sqlpage.cookie('session_token')); 

SELECT
    'authentication' AS component,
    '/a_users/user_password_update_alert1_1.sql'  AS link,
    :password AS password,
    (SELECT password_hash  FROM users WHERE user_id = $user_id) AS password_hash;


-- mise a jour du mot de passe dans la base

UPDATE  users
SET password_hash = sqlpage.hash_password(:password_new), modified_at = CURRENT_TIMESTAMP
WHERE user_id = $user_id   
  
RETURNING  'redirect' AS component,
'/a_users/user_password_update_confirm_1.sql' AS link;


