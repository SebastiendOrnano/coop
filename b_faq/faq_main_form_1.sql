SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell.sql') AS properties;

SET user_id = (
    SELECT users.user_id AS userID FROM users
    INNER JOIN sessions ON userID = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 


SELECT'text' as component,
'**Votre question sera lue par le superviseur et éventuellement ajoutée à la FAQ interne**

*Rappel : Prière de lire les [Mentions légales](/a_about/orga_legal.sql) et les [CGU](/a_about/orga_CGU.sql) avant de déposer un message.*'as contents_md;


SELECT 
    'form'                 as component,
    'Votre question'        as title,
    'Envoyer'               as validate,
    'faq_main_create_0.sql' as action;

SELECT 
    'contact_gender'        as name,
    'Genre'                 as label,
    'text'                as type,
    true                    as readonly,
    (select user_gender from users where user_id=$user_id) as value,
    3                       AS width,
    'Choisir un genre...'  as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="gender"
    ORDER BY  i.choice_label ASC;
SELECT
    'contact_first_name'   as name,
    'text'                 as type,  
    'votre prénom'         as label,
    true                    as readonly,
    (select user_first_name from users where user_id=$user_id) as value,
    4                       AS width,
    TRUE                    as required,
    'votre nom'            AS placeholder;

SELECT
    'contact_last_name'   as name,
    'text'                as type,  
    'votre nom'           as label,
    5                      AS width,
    true                    as readonly,
    (select user_last_name from users where user_id=$user_id) as value,
    TRUE                  as required,
    'votre nom'           AS placeholder;

SELECT 
    'contact_email'         as name,
    'votre email'           as label,
    'text'                  as type, 
    'votre email'           AS placeholder, 
    true                    as readonly,
    (select user_email from users where user_id=$user_id) as value,
    TRUE                   as required,
   (select regex_value from regex where regex_name='email')         as pattern,
   (select regex_description from regex where regex_name='email')          as description;

SELECT 
    'question'                 as name,
    'textarea'                 as type,
    'objet de votre question'  as label,
    'doit être renseigné'       as description,
    TRUE                        as required ;

SELECT 
    'question_content'     as name,
    'textarea'             as type,
    'Votre question'      as label,
    'votre message'       AS placeholder,
    TRUE                   as required, 
    'doit être renseigné' as description;