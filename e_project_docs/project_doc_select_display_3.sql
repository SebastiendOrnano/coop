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
    'liste des projets'            as title,
    '/e_project/project_main_display_3.sql'     as link;
 select 
    'hub du projet'            as title,
    '/e_project/project_hub_display_3.sql?project_id='||$project_id     as link; 
select 
    'Gestion des docs'            as title,
    '/e_project_docs/project_doc_main_display_3.sql?project_id='||$project_id     as link;


select 
    'datagrid'              as component,
    'panel_project_doc_display' as id,
    'Traitement sur une selection de documents' as title;

select 
    '/e_project_docs/project_doc_select_no_0.sql?project_id='||$project_id     as link,
    'Annuler toute la sélection'               as description,
    'stack'                                    as icon,
    'red'                                   as color;

select 
    '/e_project_docs/project_doc_select_all_0.sql?project_id='||$project_id    as link,
    'Tout sélectionner'                                      as description,
    'list-check'                                     as icon,
    'red'                                               as color;

select 
    '/e_project_docs/project_doc_select_edit_3.sql?project_id='||$project_id     as link,
    'Actualiser des données sur les doc sélectionnés'       as description,
    'refresh'                                  as icon,
    'blue'                                   as color;


-- table de sélection des membres 

SELECT 'table' AS component, 
    'Liste des documents'   AS title,
    'Titre'           AS markdown,
    'View'           AS markdown,
    TRUE             AS sort, 
    TRUE             AS search;

SELECT  
    project_doc_id        AS Id,
    CASE 
    when project_doc_local_cloud='local' THEN '['||project_doc_title||']('||project_doc_url||')' 
    when project_doc_local_cloud='cloud' THEN '['||project_doc_title||']('||project_doc_cloud_url||')' 
    END   AS Titre,
    project_doc_category             AS Categorie,
    CASE 
    when project_doc_local_cloud='local' THEN project_doc_format   
    when project_doc_local_cloud='cloud' THEN project_doc_cloud_format  
    END                                    as Format,
    project_doc_type                       as Type,
    project_doc_local_cloud                as LocalCloud,
    project_doc_selected                   AS selected,
  '[select / unselect](project_doc_select_yes_0.sql?project_doc_id='||project_doc_id||')'    AS View
FROM project_docs
WHERE project_id=$project_id AND project_doc_status != 'archived'
ORDER BY created_at DESC;




