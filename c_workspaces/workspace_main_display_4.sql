SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;


SET user_id = (
    SELECT users.user_id AS UserId FROM users
    INNER JOIN sessions ON sessions.user_id = UserId
    WHERE sessions.session_token = sqlpage.cookie('session_token')
);


select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Superviseur'         as title,
    '/a_panels/panel_supervisor_4.sql' as link;

select 
    'datagrid'                                   as component;
select 
    '/c_workspaces/workspace_main_form_4.sql'    as link,
    'success'                                    as color,
    'Créer un nouvel espace de travail'          as description,
    'users-plus'                                  as icon;
select 
    '/c_workspaces/workspace_main_archive_display_4.sql'    as link,
    'orange'                                           as color,
    'Espaces de travail archivés'                      as description,
    'archive'                                          as icon;

select 
    'divider' as component,
    'Espaces de travail'    as contents,
    'blue' as color;


SELECT 
    'table'               AS component, 
    TRUE                  AS sort, 
    'View'                AS markdown,
    TRUE                  as hover,
--   TRUE                  as striped_rows,
    TRUE                  as small,
    TRUE                 AS search;

SELECT
    s.workspace_id               AS Id,
    s.workspace_title            AS Nom,
    s.workspace_summary          AS Description,
    s.workspace_category         AS Categorie,
    s.workspace_status           AS Statut,
    CASE 
    WHEN (SELECT workspace_participant_id FROM workspace_participants AS g WHERE workspace_participant_id=$user_id AND g.workspace_id= s.workspace_id) IS NULL OR ''
    THEN '' ELSE 'red' END  as _sqlpage_color,
    s.workspace_participants_nb  AS NbParticipants,
CASE
WHEN (SELECT  workspace_participant_id FROM workspace_participants AS g WHERE workspace_participant_id=$user_id AND g.workspace_id=s.workspace_id) IS NULL OR ''
THEN '[Join](/c_workspaces/workspace_main_join_0.sql?workspace_id='||s.workspace_id||') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
[Enter](/c_workspaces/workspace_hub_display_4.sql?workspace_id='||s.workspace_id ||')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
[Edit](/c_workspaces/workspace_main_edit_4.sql?workspace_id='||s.workspace_id
||') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Delete](/c_workspaces/workspace_main_delete_alert_4.sql?workspace_id='||s.workspace_id||
')'
ELSE '[Enter](/c_workspaces/workspace_hub_display_4.sql?workspace_id='||s.workspace_id ||')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
[Quit](/c_workspaces/workspace_main_quit_0.sql?workspace_id='||s.workspace_id ||')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
[Edit](/c_workspaces/workspace_main_edit_4.sql?workspace_id='||s.workspace_id||')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
[Delete](/c_workspaces/workspace_main_delete_alert_4.sql?workspace_id='||s.workspace_id||')' 
END                AS View
FROM workspaces AS s
WHERE s.workspace_status!='archived'
ORDER BY workspace_id ASC;



