SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion éditeur'         as title,
    '/a_panels/panel_editor_3.sql' as link;
 select 
    'Retour à la liste des projets'            as title,
    '/e_project/project_main_display_3.sql'     as link;   
 select 
    'Retour au hub du projet'            as title,
    '/e_project/project_hub_display_3.sql?project_id='||$project_id     as link;
 select 
    'Liste des discussion en cours'            as title,
    '/e_project_forum/project_forum_main_display_3.sql?project_id='||$project_id     as link;


SELECT 
    'form'                  AS component,
    'actualiser le message' as validate,
    'clear'                 as reset,
    '/e_project_forum/project_forum_message_update_0.sql?project_forum_message_id='||$project_forum_message_id AS action;

SELECT 
    'project_forum_message_content'           AS name, 
    'textarea'                        as type, 
    (SELECT project_forum_message_content FROM project_forum_messages WHERE project_forum_message_id=$project_forum_message_id) as value,
    'Contenu de la contribution'    as label,
    TRUE                               as required;


SELECT 
    'project_forum_message_content'  AS name, 
    'Contenu du message'  as label,
    'textarea'       as type, 
    'Your message' AS placeholder, 
    (SELECT project_forum_message_content  FROM project_forum_messages WHERE project_forum_message_id=$project_forum_message_id) as value,
    TRUE as required;

SELECT 
    'project_forum_message_status'            as name,
    'Statut de publication'    as label,
    'select'                 as type,
    (select project_forum_message_status FROM project_forum_messages WHERE  project_forum_message_id=$project_forum_message_id) as value,
    TRUE                     as required,
    2                        AS width,
    'Choisir un statut dans la liste...'    as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="status_publication"
    ORDER BY  i.choice_label ASC;





