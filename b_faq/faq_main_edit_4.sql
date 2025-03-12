SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

SET contact_id=SELECT contact_id FROM faq_questions WHERE question_id = $question_id;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Superviseur'         as title,
    '/a_panels/panel_supervisor_4.sql' as link;
select 
    'Gestion FAQ'                             as title,
    '/b_faq/faq_main_display_4.sql'                  as link;




SELECT 
'form'                                        as component,
'Repondre'                                    as validate,
'Clear'                                       as reset,
'faq_main_update_0.sql?question_id='||$question_id as action;

SELECT 
    'contact_last_name'     AS name,
    'auteur'                AS label,
    6                       AS width,
    (SELECT contact_last_name FROM faq_contacts WHERE contact_id = $contact_id) AS value,
    TRUE as readonly;

SELECT 
    'contact_email'          AS name,
    'Email'                 AS label,
    6                       AS width,
    (SELECT contact_email FROM faq_contacts WHERE contact_id = $contact_id) AS value,
    TRUE as readonly;

SELECT 
    'question'                  AS name,
    'Sujet'                     AS label,
    'text'                      as type,
    (SELECT question FROM faq_questions WHERE question_id = $question_id) AS value,
    'Reformulation éventuelle pour la FAQ'         as description;

SELECT 
    'question_content'               AS name,
    'question'                       AS label,
    'textarea'                       as type,
    (SELECT question_content FROM faq_questions WHERE question_id = $question_id) AS value,
    'Reformulation éventuelle pour la FAQ'         as description;

SELECT 
    'answer'                         AS name,
    'réponse'                         AS label,
    (SELECT answer FROM faq_questions WHERE question_id = $question_id) AS value,
    'textarea'                       as type,
    'rédaction possible en markdown' as description;

SELECT 
    'answer_yes_no'        as name,
    'Valider la réponse'   as label,
    'select'                as type,
    3                       AS width,
    (SELECT answer_yes_no FROM faq_questions WHERE question_id = $question_id) AS value,
    'Choisir dans la liste...'  as empty_option,
    '[{"label": "Oui", "value": "yes"},
    {"label": "Non", "value": "no"}
    ]' as options;

SELECT 
    'faq_yes_no'                        as name,
    'FAQ OK ?'   as label,
    'select'                            as type,
    3                                   AS width,
    true                                       as required,
   (SELECT faq_yes_no FROM faq_questions WHERE question_id = $question_id) AS value,
    'Choisir dans la liste...'  as empty_option,
    '[{"label": "Oui", "value": "yes"},
    {"label": "Non", "value": "no"}
    ]' as options;

SELECT 
    'question_public_private'                       as name,
    'FAQ publique ou privée ?'                 as label,
    'select'                                   as type,
    3                                          AS width,
    true                                       as required,
   (SELECT question_public_private FROM faq_questions WHERE question_id = $question_id) AS value,
    'Choisir dans la liste...'  as empty_option,
    '[{"label": "Publique", "value": "public"},
    {"label": "Privée", "value": "private"}
    ]' as options;

SELECT 
    'question_category'                        as name,
    'Catégorie FAQ'                            as label,
    'select'                                   as type,
    3                                          AS width,
    true                                       as required,
    (SELECT question_category FROM faq_questions WHERE question_id = $question_id) AS value,
    'Choisir dans la liste...'                                                     as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="question_category"
    ORDER BY  i.choice_label ASC;
SELECT 
    'question_status'                        as name,
    'Statut de publication'                  as label,
    'select'                                as type,
    3                                       AS width,
    true                                    as required,
    (SELECT question_status FROM faq_questions WHERE question_id = $question_id) AS value,
    'Choisir dans la liste...'  as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="status"
    ORDER BY  i.choice_label ASC;