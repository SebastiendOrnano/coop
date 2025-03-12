SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_1.sql') AS properties;


-- Form for adding a new topic and initial message
select 
    'form'  as component, 
    'Signaler un bug ou faire une demande d''amélioration de la plateforme'  as title,
    'Valider'                           as validate,
    'Clear'                              as reset,
    '/c_debug/debug_main_create_0.sql'  as action;

SELECT 
    'Sujet'             as label,
    'topic_name'        AS name,
    'text'              as type, 
    'Enter topic title' AS placeholder, 
    TRUE as required;

SELECT 
    'topic_category'            as name,
    'Categorie'                 as label,
    'select'                    as type,
    TRUE                        as required,
    4                           AS width,
    'Choisir une catégorie dans la liste...'    as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="debug_category"
    ORDER BY  i.choice_label ASC;


SELECT 
    'debug_target'  AS name, 
    'Section / fonctionnalité / table de données concernée'  as label,
    'textarea'       AS ype, 
    'module / table concernée : ' AS placeholder, 
    TRUE as required;


SELECT 
    'message_content'  AS name, 
    'Votre message'  as label,
    'textarea'       as type, 
    'Your message' AS placeholder,
    'Vous pouvez rédifer en markdown !' as description,
    TRUE as required;
