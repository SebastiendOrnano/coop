SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

SET prm2_id = SELECT prm2_id from prm2_sub where prm2_sub_id=$prm2_sub_id;

select 
    'datagrid'              as component,
    'panel_prm2_sub_doc_display' as id,
    'Traitement sur une selection de documents' as title;

select 
    '/a_panels/panel_supervisor_4.sql'         as link,
    'Retour au tableau de bord superviseur'    as description,
    'corner-down-left-double'                  as icon,
    TRUE                                       as active,
    'white'                                    as color;

select 
    '/d_prm2_sub_doc/prm2_sub_doc_main_display_4.sql?prm2_sub_id='||$prm2_sub_id||'&prm2_id='||$prm2_id      as link,
    'Retour à la liste des documents'          as description,
    'corner-down-left'                         as icon,
    'green'                                   as color;

select 
    '/d_prm2_sub_doc/prm2_sub_doc_select_all_0.sql?prm2_sub_id='||$prm2_sub_id      as link,
    'Tout sélectionner'                                      as description,
    'list-check'                                     as icon,
    'red'                                               as color;
    
select 
    '/d_prm2_sub_doc/prm2_sub_doc_select_no_0.sql?prm2_sub_id='||$prm2_sub_id     as link,
    'Annuler toute la sélection'               as description,
    'stack'                                    as icon,
    'red'                                   as color;

select 
    '/d_prm2_sub_doc/prm2_sub_doc_select_edit_4.sql?prm2_sub_id='||$prm2_sub_id     as link,
    'Actualiser des données sur les doc sélectionnés'       as description,
    'refresh'                                  as icon,
    'blue'                                   as color;

select 
    '/d_prm2_sub_doc/prm2_sub_doc_select_delete_0.sql?prm2_sub_id='||$prm2_sub_id     as link,
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
    prm2_sub_doc_id        AS Id,
    '['||prm2_sub_doc_title||']('||prm2_sub_doc_url||')'    AS Titre,
    prm2_sub_doc_status    AS statut,
    prm2_sub_doc_selected  AS selected,
  '[select / unselect](prm2_sub_doc_select_yes_0.sql?prm2_sub_doc_id='||prm2_sub_doc_id||'&prm2_sub_id='||$prm2_sub_id||')'    AS View
FROM prm2_sub_docs
WHERE prm2_sub_id = $prm2_sub_id
ORDER BY created_at DESC;




