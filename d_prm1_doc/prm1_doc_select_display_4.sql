SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

-- selection panel

select 
    'datagrid'              as component,
    'panel_prm1_doc_display' as id,
    'Traitement sur une selection de documents' as title;

select 
    '/a_panels/panel_supervisor_4.sql'         as link,
    'Retour au tableau de bord superviseur'    as description,
    'corner-down-left-double'                  as icon,
    TRUE                                       as active,
    'white'                                    as color;
select 
    '/d_prm1_doc/prm1_doc_main_display_4.sql?prm1_id='||$prm1_id       as link,
    'Retour à la liste des documents'          as description,
    'corner-down-left'                         as icon,
    'green'                                   as color;

select 
    '/d_prm1_doc/prm1_doc_select_no_0.sql?prm1_id='||$prm1_id     as link,
    'Annuler toute la sélection'               as description,
    'stack'                                    as icon,
    'red'                                   as color;
    
select 
    '/d_prm1_doc/prm1_doc_select_all_0.sql?prm1_id='||$prm1_id     as link,
    'Tout sélectionner'                                      as description,
    'list-check'                                     as icon,
    'red'                                               as color;

select 
    '/d_prm1_doc/prm1_doc_select_edit_4.sql?prm1_id='||$prm1_id     as link,
    'Actualiser des données sur les doc sélectionnés'       as description,
    'refresh'                                  as icon,
    'blue'                                   as color;

select 
    '/d_prm1_doc/prm1_doc_select_delete_0.sql?prm1_id='||$prm1_id    as link,
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
    prm1_doc_id                                     AS Id,
    '['||prm1_doc_title||']('||prm1_doc_url||')'    AS Titre,
    prm1_doc_status                                 AS Statut,
    prm1_doc_selected  AS selected,
  '[select / unselect](prm1_doc_select_yes_0.sql?prm1_doc_id=' || prm1_doc_id ||'&prm1_id='||$prm1_id||')'    AS View
FROM prm1_doc
ORDER BY created_at DESC;




