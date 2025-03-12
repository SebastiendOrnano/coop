SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

SET prm3_name= select prm3_name from prm3 where prm3_id=$prm3_id;

select 
    'datagrid'              as component,
    'panel_prm3_doc_display' as id,
    'Gestion des documents archivés de : '||$prm3_name as title;

select 
    '/a_panels/panel_supervisor_4.sql'         as link,
    'Retour au tableau de bord superviseur'    as description,
    'corner-down-left-double'                  as icon,
    TRUE                                       as active,
    'white'                                    as color;

select 
    '/d_prm3_doc/prm3_doc_main_display_4.sql?prm3_id='||$prm3_id         as link,
    'Retour liste des documents actifs'                                    as description,
    'corner-down-left'                                                              as icon,
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
WHERE prm3_doc_status != 'online'
ORDER BY created_at DESC;
