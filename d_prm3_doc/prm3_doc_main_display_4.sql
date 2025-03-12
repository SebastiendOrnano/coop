SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

SET prm3_name= select prm3_name from prm3 where prm3_id=$prm3_id;

select 
    'datagrid'              as component,
    'panel_prm3_doc_display' as id,
    'Gestion des documents de : '||$prm3_name as title;

select 
    '/a_panels/panel_supervisor_4.sql'         as link,
    'Retour au tableau de bord superviseur'    as description,
    'corner-down-left-double'                  as icon,
    TRUE                                       as active,
    'white'                                    as color;

select 
    '/d_prm3/prm3_main_display_4.sql'         as link,
    'Retour à la liste des groupes'         as description,
    'corner-down-left'                         as icon,
    TRUE                                       as active,
    'white'                                    as color; 
select 
    '/d_prm3_doc/prm3_doc_main_form_4.sql?prm3_id='||$prm3_id         as link,
    'Création d''un nouveau document'                                 as description,
    'books'                                                           as icon,
    'yellow'                                                          as color;

select 
    '/d_prm3_doc/prm3_doc_archive_display_4.sql?prm3_id='||$prm3_id         as link,
    'Documents archivés'                                                   as description,
    'archive'                                                              as icon,
    'green'                                                                as color;

select 
    '/d_prm3_doc/prm3_doc_select_display_4.sql?prm3_id='||$prm3_id         as link,
    'Actualiser une série de documents'                                    as description,
    'refresh'                                                              as icon,
    'green'                                                                as color;

    

-- Display list of  docs

SELECT 'table' AS component, 
    'Liste des documents'   AS title,
    'Titre'           AS markdown,
    'View'           AS markdown,
    TRUE             AS sort, 
    TRUE             AS search;

SELECT
    prm3_doc_id                                    AS Id,
   '['||prm3_doc_title||']('||prm3_doc_url||')'    AS Titre,
    prm3_doc_date_publication                      AS Date_Pub,
    prm3_doc_type                                  AS Type,
    prm3_doc_category                              AS Categorie,
   '[Edit](/d_prm3_doc/prm3_doc_main_edit_4.sql?prm3_doc_id='||prm3_doc_id||')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Delete](/d_prm3_doc/prm3_doc_main_delete_alert1_4.sql?prm3_doc_id='||prm3_doc_id||')'    AS View
FROM prm3_docs
WHERE prm3_doc_status != 'archived'
ORDER BY created_at DESC;
