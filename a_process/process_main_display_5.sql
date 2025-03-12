SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_5.sql') AS properties;

select 
    'datagrid'               as component,
    'process_step_display'   as id;

select 
    '/a_panels/panel_admin_5.sql'               as link,
    'Retour au tableau de bord admin'          as description,
    'corner-down-left-double'                  as icon,
    TRUE                                       as active,
    'white'                                    as color;

select 
    '/a_process/process_main_form_5.sql'    as link,
    'Créer un  processus'                                       as description,
    'automation'                                                as icon,
    'green'                                                     as color;

select 
    'title'     as component,
    'PROCESSUS'    as contents,
    3           as level;

-- Display list of process
SELECT 
    'table'     AS component, 
    'Process'   AS title, 
    'View'      AS markdown, 
    TRUE        AS sort, 
    TRUE        AS search;

SELECT       -- NOTE: the dots join values from the Topics and Messages tables
    process_id         AS ID,
    process_title      AS Process,
    process_category   AS 'Categorie',
    created_at         AS 'Créé le',
    '[Edit](/a_process/process_main_edit_5.sql?process_id=' || process_id ||  ')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [View](/a_process/process_view_5.sql?process_id=' || process_id ||  ')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Steps](/a_process/process_step_display_5.sql?process_id=' || process_id ||  ') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Delete](/a_process/process_main_delete_alert_5.sql?process_id=' || process_id ||')'    AS View
FROM process
ORDER BY created_at DESC;