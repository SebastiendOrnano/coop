-- on vérifie si le nouveau nom d'utilisateur n'est pas déjà utilisé

SET redirect_link = (
    SELECT
        CASE
            WHEN EXISTS (
                SELECT 1 
                FROM users
                WHERE username = :username_new
            ) 
            THEN '/a_users/user_username_update_alert1_1.sql'
            ELSE ''
        END
);

SELECT 'redirect' AS component, $redirect_link AS link
WHERE $redirect_link != '' OR $redirect IS NOT NULL;

-- l'utilisateur est en principe connecté avec son email/password mais on fait une ultime vérif que cela est bien le cas.

SET user_id = (SELECT user_id FROM sessions WHERE sessions.session_token = sqlpage.cookie('session_token')); 

-- mise a jour du mot de passe dans la base

UPDATE  users
SET 
username= :username_new, 
modified_at = CURRENT_TIMESTAMP
WHERE user_id = $user_id   
  
RETURNING  'redirect' AS component,
'/a_users/user_email_update_confirm_1.sql' AS link;


