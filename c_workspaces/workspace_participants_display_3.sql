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
    'Retour à l''espace de travail'            as title,
     '/c_workspaces/workspace_hub_display_3.sql?workspace_id='||$workspace_id  as link;

SET user_id = (
    SELECT users.user_id AS userID FROM users
    INNER JOIN sessions ON userID = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET user_role =
CASE
WHEN (SELECT workspace_participant_role FROM workspace_participants WHERE  workspace_participant_id=$user_id AND workspace_id=$workspace_id) = 'coordinator'
THEN 'coordinator' 
ELSE '' END ;

SELECT 
    'table'               AS component, 
    TRUE                  AS sort, 
    'View'                AS markdown, 
    'Role'           AS  markdown;

SELECT
    CASE 
    WHEN workspace_participant_role = 'coordinator' THEN 'coordinator'
    WHEN (workspace_participant_role  != 'coordinator' OR workspace_participant_role ='' OR workspace_participant_role IS NULL) AND $user_role = 'coordinator'
    THEN  '[Set as coordo](/c_workspaces/workspace_participants_update_0.sql?workspace_participant_id='||workspace_participant_id||'&workspace_id='||workspace_id||')'
    ELSE 'Participant'
    END                                                                        as Role,
    workspace_participant_id                                                   AS Id,
    (SELECT user_first_name FROM users where user_id=workspace_participant_id) AS Prenom,
    (SELECT user_last_name  FROM users where user_id=workspace_participant_id) AS Nom, 
    CASE 
    WHEN workspace_participant_id = $user_id THEN ''
    ELSE    '[Chat](/c_workspaces/workchat_form_3.sql?workspace_participant_id='||workspace_participant_id||'&workspace_id='||workspace_id||')' END AS View
FROM workspace_participants
WHERE workspace_id = $workspace_id
ORDER BY created_at ASC;


