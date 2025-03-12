SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

-- selection panel

select 
    'datagrid'              as component,
    'panel_orga_doc_display' as id,
    'Traitement sur une selection de documents' as title;

select 
    '/a_panels/panel_supervisor_4.sql'         as link,
    'Retour au tableau de bord superviseur'    as description,
    'corner-down-left-double'                  as icon,
    TRUE                                       as active,
    'white'                                    as color;

select 
    '/b_orga_doc/orga_doc_main_display_4.sql'       as link,
    'Retour à la liste des documents'          as description,
    'corner-down-left'                         as icon,
    'green'                                   as color;


select 
    '/b_orga_doc/orga_doc_select_no_0.sql'     as link,
    'Annuler toute la sélection'               as description,
    'stack'                                    as icon,
    'red'                                   as color;

select 
    '/b_orga_doc/orga_doc_select_edit_4.sql'     as link,
    'Actualiser des données sur les doc sélectionnés'       as description,
    'refresh'                                  as icon,
    'blue'                                   as color;

select 
    '/b_orga_doc/orga_doc_select_delete_0.sql'     as link,
    'Supprimer les doc sélectionnés'       as description,
    'books'                                    as icon,
    'yellow'                                   as color;



-- table de sélection des membres 

SELECT 
    'table'                 AS component, 
    'Liste des documents'   AS title, 
    'View'                  AS markdown,
    'Titre'                  AS markdown,
    'download_selection_table' as id,
    TRUE                   AS sort, 
    TRUE                   AS search;

SELECT  
    orga_doc_id        AS Id,
    '['||orga_doc_title||']('||orga_doc_url||')'    AS Titre,
    orga_doc_edition    AS Edition,
    orga_doc_publication   AS Publication,
    orga_doc_selected  AS selected,
  '[select / unselect](orga_doc_select_yes_0.sql?orga_doc_id=' || orga_doc_id ||')'    AS View
FROM orga_docs
WHERE orga_doc_publication!='archived'
ORDER BY created_at DESC;




