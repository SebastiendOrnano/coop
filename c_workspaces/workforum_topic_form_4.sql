SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

select
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion superviseur'         as title,
    '/a_panels/panel_supervisor_4.sql' as link;
select 
     '/c_workspaces/workspace_main_display_4.sql'             as link,
    'Retour espaces de travail'           as title;
select 
    '/c_workspaces/workspace_hub_display_4.sql?workspace_id='||$workspace_id  as link,
    'Retour espace du groupe de travail'                                      as title;

-- Form for adding a new topic and initial message
select 
    'form'  as component, 
    'Lancer une discussion'  as title,
    'Valider'                           as validate,
    'Clear'                              as reset,
    '/c_workspaces/workforum_topic_create_0.sql?workspace_id='||$workspace_id  as action;

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
    where choice_category_name="topic_category"
    ORDER BY  i.choice_label ASC;

SELECT 
    'message_content'  AS name, 
    'Votre message'  as label,
    'textarea'       as type, 
    'Your message' AS placeholder,
    'Vous pouvez rédifer en markdown !' as description,
    TRUE as required;

select 
    'file' as type, 
    'workdoc_url' as name,
    'Document à partager' as label,
    'size max : 5 MB' as description,
    '*'  as accept;
