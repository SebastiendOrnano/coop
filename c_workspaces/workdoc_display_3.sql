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
    '/c_workspaces/workdoc_form_3.sql?workspace_id='||$workspace_id   as link,
    'green'                              as color,
    TRUE                                 as important,
    'Ajouter un nouveau document'     as title,
    'book-upload'                      as icon;

-- Display list of  docs

SELECT 'table' AS component, 
    'Liste des documents'   AS title,
    'Titre'           AS markdown,
    'View'           AS markdown,
    TRUE             AS sort, 
    TRUE             AS search;

SELECT
    workdoc_id        AS Id,
   '['||workdoc_title||']('||workdoc_url||')'    AS Titre,
    workdoc_version             AS Version,
    modified_at                 AS Last_modif,
   workdoc_category             AS Categorie,
  '[Edit](/c_workspaces/workdoc_edit_3.sql?workdoc_id='||workdoc_id||'&workspace_id='||workspace_id||')'    AS View
FROM workdocs
WHERE workspace_id=$workspace_id AND workdoc_status != 'archived'
ORDER BY created_at DESC;
