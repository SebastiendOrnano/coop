-- vérif si le nom d'utilisateur n'est pas déjà utilisé 
-- vérif si le mot de passe a été correctement saisi

SET redirect_link = (
    SELECT
        CASE
            WHEN EXISTS (
                SELECT 1 
                FROM users
                WHERE username = :username OR user_email=:user_email
            ) 
            THEN '/a_users/user_main_create_alert1.sql'
            WHEN :password_check != :password
            THEN '/a_users/user_main_create_alert2.sql'
            ELSE ''
        END
);

SELECT 'redirect' AS component, $redirect_link AS link
WHERE $redirect_link != '' OR $redirect IS NOT NULL;

-- creation de l'utilisateur dans la base

    INSERT INTO users 
    (
    username, 
    password_hash,
    user_gender,
    user_first_name, 
    user_last_name,  
    user_email, 
    user_phone, 
    user_short_cv,
    user_status, 
    rgpd_validation
    )
   VALUES 
   (
    :username, 
    sqlpage.hash_password(:password), 
    :user_gender,
    :user_first_name, 
    :user_last_name,
     :user_email, 
     :user_phone, 
     :user_short_cv,
     'active', 
     'yes'
     )
    
    ON CONFLICT (username) DO NOTHING
    RETURNING  'redirect' AS component,
    '/a_users/user_main_create_confirm.sql' AS link;


