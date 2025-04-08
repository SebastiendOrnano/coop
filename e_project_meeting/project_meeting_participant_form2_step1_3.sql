SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

SET user_id = (
    SELECT users.user_id AS userID FROM users
    INNER JOIN sessions ON userID = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET project_id=(SELECT project_id FROM project_meeting where project_meeting_id=$project_meeting_id);

SET coordinator = 
CASE
WHEN (SELECT user_id FROM project_meeting_participants WHERE project_meeting_participant_role='coordinator' AND project_meeting_id=$project_meeting_id)= $user_id 
THEN 'coordinator'
ELSE ''
END;

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
    'Retour à la liste des réunions'            as title,
    '/e_project_meeting/project_meeting_main_display_3.sql?project_id='||$project_id     as link;


SELECT 
    'form'                                  AS component,
    'Ajouter un invité (personne physique)' as validate,
    'Clear'                                  as reset,
    '/e_project_meeting/project_meeting_participant_attach2_step1_0.sql?project_meeting_id='||$project_meeting_id AS action;

select 
   'prm2_sub_id' as name,
    'Choisir l''entreprise employeur' as label,
    'select' as type,
    8 AS width,
    TRUE as searchable,
    'Saisissez quelques lettres du nom que vous cherchez ou choississez dans la liste' as empty_option,
    json_group_array(json_object('label',prm2_sub_name, 'value', prm2_sub_id)) AS options
    FROM (
    SELECT prm2_sub_name, prm2_sub_id
    FROM prm2_sub 
    ORDER BY prm2_sub_name ASC
    );
