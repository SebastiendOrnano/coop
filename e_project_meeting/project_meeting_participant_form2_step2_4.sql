SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

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
    'Gestion Superviseur'         as title,
    '/a_panels/panel_supervisor_4.sql' as link;
 select 
    'Retour à la liste des projets'            as title,
    '/e_project/project_main_display_4.sql'     as link;   
 select 
    'Retour au hub du projet'            as title,
    '/e_project/project_hub_display_4.sql?project_id='||$project_id     as link;
select 
    'Retour à la liste des réunions'            as title,
    '/e_project_meeting/project_meeting_main_display_4.sql?project_id='||$project_id     as link;


SELECT 
    'form'                                  AS component,
    'Ajouter un invité (personne physique)' as validate,
    'Clear'                                  as reset,
    '/e_project_meeting/project_meeting_participant_attach2_step2_0.sql?project_meeting_id='||$project_meeting_id AS action;

select 
    'employee_id' as name,
    'Nom de l''employé' as label,
    'select' as type,
    8 AS width,
    TRUE as searchable,
    'Saisissez quelques lettres du nom que vous cherchez ou choississez dans la liste' as empty_option,
    json_group_array(json_object('label',p.prm1_first_name||'---'||prm1_last_name, 'value', e.employee_id)) AS options
    FROM prm2_sub_employees as e
    LEFT JOIN (SELECT prm1_id, prm1_first_name, prm1_last_name, prm1_last_name FROM prm1) as p
    on p.prm1_id = e.prm1_id
     LEFT JOIN (SELECT project_meeting_id, prm2_sub_id FROM project_meeting_participants) as m
    on m.prm2_sub_id = e.prm2_sub_id
    WHERE m.project_meeting_id = $project_meeting_id
    ORDER BY p.prm1_last_name ASC;

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
