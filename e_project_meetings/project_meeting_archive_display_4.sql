SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

SET user_id = (
    SELECT users.user_id AS userID FROM users
    INNER JOIN sessions ON userID = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET project_id=(SELECT project_id FROM project_meetings where project_meeting_id=$project_meeting_id);

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
    '/e_projects/project_main_display_3.sql'     as link;   
 select 
    'Retour au hub du projet'            as title,
    '/e_projects/project_hub_display_3.sql?project_id='||$project_id     as link;
select 
    'Retour à la liste des réunions'            as title,
    '/e_project_meetings/project_meeting_main_display_3.sql?project_id='||$project_id     as link;


SET participant_name = SELECT
    CASE
    WHEN p.project_meeting_participant_type='orga_member'
    THEN u.user_first_name||'--'||u.user_last_name
    WHEN p.project_meeting_participant_type='person' OR 'employee'
    THEN m.prm1_first_name||'--'||m.prm1_last_name
    END                                           AS value
FROM project_meeting_participants AS p
LEFT JOIN (SELECT user_id, user_first_name, user_last_name, user_email FROM users ) AS u
ON p.user_id = u.user_id
LEFT JOIN (SELECT prm1_id, prm1_first_name, prm1_last_name, prm1_email FROM prm1 ) AS m
ON p.prm1_id = m.prm1_id
WHERE p.project_meeting_participant_id=$project_meeting_participant_id;


SELECT 
    'form'                                  AS component,
    'Changer le rôle d''un participant'      as validate,
    'Clear'                                  as reset,
    '/e_project_meetings/project_meeting_participant_update_0.sql?project_meeting_participant_id='||$project_meeting_participant_id AS action;

select 
   'prm1_name' as name,
    'Nom du participant' as label,
    'text' as type,
    8 AS width,
    TRUE as readonly,
   $participant_name as value;

select 
   'project_meeting_participant_role' as name,
    'Rôle du participant' as label,
    'select' as type,
    4 AS width,
    'Choisir un role dans la liste...'    as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="meeting_participant_role"
    ORDER BY  i.choice_label ASC;
