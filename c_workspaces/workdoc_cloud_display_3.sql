SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    '/a_panels/panel_editor_3.sql'         as link,
    'Retour au tableau de bord éditeur'    as title;
SELECT
    '/c_workspaces/workspace_hub_display_3.sql?workspace_id='||$workspace_id  as link,
    'Retour hub du groupe de travail' as title;

select 
    'button' as component,
    'L'     as size;
select 
    '/c_workspaces/workdoc_cloud_form_3.sql?workspace_id='||$workspace_id   as link,
    'green'                              as color,
    TRUE                                 as important,
    'Ajouter un nouveau document en ligne'     as title,
    'cloud-share'                      as icon;

-- Display list of  docs

SELECT 'table' AS component, 
    'Liste des documents'   AS title,
    'Titre'           AS markdown,
    'View'           AS markdown,
    TRUE             AS sort, 
    TRUE             AS search;

SELECT
    workdoc_cloud_id        AS Id,
   '['||workdoc_cloud_title||']('||workdoc_cloud_url||')'    AS Titre,
   workdoc_cloud_category             AS Categorie,
  '[Edit](/c_workspaces/workdoc_cloud_edit_3.sql?workdoc_cloud_id='||workdoc_cloud_id||'&workspace_id='||workspace_id||')'    AS View
FROM workdocs_cloud
WHERE workspace_id=$workspace_id AND workdoc_cloud_status != 'archived'
ORDER BY created_at DESC;
