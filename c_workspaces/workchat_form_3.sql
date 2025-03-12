SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

select
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Éditeur'         as title,
    '/a_panels/panel_editor_3.sql' as link;
select 
     '/c_workspaces/workspace_main_display_3.sql'             as link,
    'Retour espaces de travail'           as title;
select 
    '/c_workspaces/workspace_hub_display_3.sql?workspace_id='||$workspace_id  as link,
    'Retour espace du groupe de travail'                                      as title;
select 
    '/c_workspaces/workspace_participants_display_3.sql?workspace_id='||$workspace_id  as link,
    'Retour membres du groupe de travail'                                      as title;


-- Form for adding a new topic and initial message
select 
    'form'  as component, 
    'Lancer une discussion'  as title,
    'Valider'                           as validate,
    'Clear'                              as reset,
    '/c_workspaces/workchat_create_0.sql?workspace_id='||$workspace_id  as action;

select 
   'message_recipient_id' as name,
    'Destinataire' as label,
    'select' as type,
    6 AS width,
    TRUE as searchable,
    TRUE as required,
    (SELECT workspace_participant_id from workspace_participants WHERE workspace_participant_id=$workspace_participant_id) as value,
    'Saisissez quelques lettres du nom que vous cherchez ou choississez dans la liste' as empty_option,
    json_group_array(json_object('label', username || '   (' || user_id|| ')   ' || user_last_name, 'value', user_id)) AS options
    FROM (
    SELECT username, user_first_name, user_last_name, user_id
    FROM users
    ORDER BY user_last_name ASC, user_first_name ASC
    );

SELECT 
    'Sujet'             as label,
    'topic_name'        AS name,
    'text'              as type, 
    'Enter topic title' AS placeholder, 
    TRUE as required;

SELECT 
    'message_content'  AS name, 
    'Votre message'  as label,
    'textarea'       as type, 
    'Your message' AS placeholder,
    'Vous pouvez rédifer en markdown !' as description,
    TRUE as required;
