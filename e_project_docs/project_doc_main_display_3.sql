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
    'Retour à la liste des projets'            as title,
    '/e_projects/project_main_display_3.sql'     as link;
 select 
    'Retour au hub du projet'            as title,
    '/e_projects/project_hub_display_3.sql?project_id='||$project_id     as link; 

select 
    'datagrid'              as component,
    'panel_project_doc_display' as id,
    'Gestion des documents de l''organisation :  '|| $project_doc_name as title;
select 
    '/e_project_docs/project_doc_main_form_3.sql?project_id='||$project_id          as link,
    'Création d''un nouveau document local'          as description,
    'books'                                    as icon,
    'yellow'                                   as color;
select 
    '/e_project_docs/project_doc_cloud_form_3.sql?project_id='||$project_id          as link,
    'Création d''un nouveau document en ligne'          as description,
    'cloud-network'                                    as icon,
    'red'                                   as color;
select 
    '/e_project_docs/project_doc_select_display_3.sql?project_id='||$project_id         as link,
    'Actualiser une série de documents'                  as description,
    'refresh'                                              as icon,
    'green'                                             as color;
   

-- Display list of  docs

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
    END                              as Format,
    project_doc_type               as Type,
    project_doc_local_cloud                as LocalCloud,
    '[Edit]'||
    CASE 
    when project_doc_local_cloud = 'cloud' 
    then '(/e_project_docs/project_doc_cloud_edit_3.sql'
    else '(/e_project_docs/project_doc_main_edit_3.sql'
    END
    ||'?project_doc_id='||project_doc_id||'&project_id='||$project_id||')'    AS View
FROM project_docs
WHERE project_id=$project_id AND project_doc_status != 'archived'
ORDER BY created_at DESC;