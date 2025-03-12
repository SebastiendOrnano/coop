SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

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

SET project_meeting_title = select project_meeting_title FROM project_meetings where project_meeting_id=$project_meeting_id;

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
    '/e_projects/project_main_display_4.sql'     as link;   
select 
    'Retour au hub du projet'            as title,
    '/e_projects/project_hub_display_4.sql?project_id='||$project_id     as link;
select 
    'Retour à la liste des réunions'            as title,
    '/e_project_meetings/project_meeting_main_display_4.sql?project_id='||$project_id     as link;

select 
    'datagrid'              as component,
    'panel_project_meeting_place_display' as id,
    'Liste des partcipants de la la réunion : '||$project_meeting_title as title;

select 
    '/e_project_meetings/project_meeting_main_join_0.sql?project_meeting_id='||$project_meeting_id       as link,
    'S''inscrire'                                     as description,
    'copy-plus'                                       as icon,
    'green'                                           as color;

select 
    '/e_project_meetings/project_meeting_main_quit_0.sql?project_meeting_id='||$project_meeting_id       as link,
    'Se désinscrire'                             as description,
    'copy-plus'                                  as icon,
    'red'                                        as color;

select 
    '/e_project_meetings/project_meeting_participant_form1_4.sql?project_meeting_id='||$project_meeting_id       as link,
   'Inscrire une personne physique (PRM1)'       as description,
    'copy-plus'                                  as icon,
    'green'                                      as color;

select 
    '/e_project_meetings/project_meeting_participant_form2_step1_4.sql?project_meeting_id='||$project_meeting_id       as link,
   'Inscrire un employé '    as description,
    'copy-plus'                                                 as icon,
    'red'                                                       as color;


-- Display list of organizations
SELECT 'table' AS component, 
    'Liste des participants'   AS title, 
    'View'           AS markdown;

SELECT
    p.project_meeting_participant_id                    AS Id,
    p.project_meeting_participant_role                    AS Role,
    p.project_meeting_participant_type                    AS Type,
    CASE 
    WHEN p.project_meeting_participant_type='orga_member'
    THEN u.user_first_name
    WHEN p.project_meeting_participant_type='person'
    THEN m.prm1_first_name
    WHEN p.project_meeting_participant_type='employee'
    THEN m.prm1_first_name
    END                                            AS Prénom,
    CASE 
    WHEN p.project_meeting_participant_type='orga_member'
    THEN u.user_last_name
    WHEN p.project_meeting_participant_type='person'
    THEN m.prm1_last_name
    WHEN p.project_meeting_participant_type='employee'
    THEN m.prm1_last_name
    END                                    AS Nom,
    CASE 
    WHEN p.project_meeting_participant_type='employee'
    THEN s.prm2_sub_name
    ELSE ''
    END                                    AS Compagny,
    CASE 
    WHEN p.project_meeting_participant_type='orga_member'
    THEN u.user_email
    WHEN p.project_meeting_participant_type='person'
    THEN m.prm1_email
    WHEN p.project_meeting_participant_type='employee'
    THEN m.prm1_email
    END                                    AS Mail,
    '[remove](/e_project_meetings/project_meeting_participant_remove_0.sql?project_meeting_participant_id='||p.project_meeting_participant_id||')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[change role](/e_project_meetings/project_meeting_participant_edit_4.sql?project_meeting_participant_id='||p.project_meeting_participant_id||')'  as view
FROM project_meeting_participants AS p
LEFT JOIN (SELECT user_id, user_first_name, user_last_name, user_email FROM users ) AS u
ON p.user_id = u.user_id
LEFT JOIN (SELECT prm1_id, prm1_first_name, prm1_last_name, prm1_email FROM prm1 ) AS m
ON p.prm1_id = m.prm1_id
LEFT JOIN (SELECT employee_id, prm2_sub_id, prm1_id FROM prm2_sub_employees) as e
on p.employee_id = e.employee_id
LEFT JOIN (SELECT prm2_sub_id, prm2_sub_name FROM prm2_sub) as s
on p.prm2_sub_id = s.prm2_sub_id
WHERE p.project_meeting_id=$project_meeting_id
ORDER BY created_at ASC;
