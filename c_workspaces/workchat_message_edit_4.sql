SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

select
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Superviseur'         as title,
    '/a_panels/panel_supervisor_4.sql' as link;
select 
     '/c_workspaces/workspace_main_display_4.sql'             as link,
    'Retour espaces de travail'                               as title;
select 
    '/c_workspaces/workspace_hub_display_4.sql?workspace_id='||$workspace_id  as link,
    'Retour espace du groupe de travail'                                      as title;
select 
    '/c_workspaces/workchat_message_display_4.sql?topic_id='||$topic_id||'&workspace_id='||$workspace_id  as link,
    'Retour au chat'                                      as title;

SET message_recipient_id = SELECT message_recipient_id FROM forum_messages where message_id = $message_id;

-- Form for adding a new topic and initial message
select 
    'form'  as component, 
    'Actualiser un post de chat'  as title,
    'Valider'                           as validate,
    'Clear'                              as reset,
    '/c_workspaces/workchat_update_0.sql?message_id='||$message_id||'&workspace_id='||$workspace_id  as action;

select 
   'username' as name,
    'Destinataire' as label,
    'text' as type,
    6 AS width,
    TRUE as readonly,
    (SELECT username from users where user_id = $message_recipient_id) as value;

SELECT 
    'Sujet'             as label,
    'topic_name'        AS name,
    'text'              as type, 
    t.topic_name        as value,
    TRUE                as readonly
    FROM forum_topics AS t 
    LEFT JOIN 
    (SELECT message_id, topic_id FROM forum_messages) AS m 
    ON t.topic_id=m.topic_id 
    WHERE m.message_id=$message_id;

SELECT 
    'message_content'  AS name, 
    'Votre message'  as label,
    'textarea'       as type, 
    'Your message' AS placeholder,
    (select message_content from forum_messages where message_id=$message_id) as value,
    'Vous pouvez rédifer en markdown !' as description,
    TRUE as required;
