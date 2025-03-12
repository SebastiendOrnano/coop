SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

SET prm1_name = SELECT CONCAT(prm1_first_name, '   ',prm1_last_name) FROM prm1 WHERE prm1_id =$prm1_id;

-- Supervisor panel to manage members
select 
    'datagrid'              as component,
    'panel_prm1_doc_display' as id,
    'Gestion des documents de : '||$prm1_name as title;

select 
    '/a_panels/panel_editor_3.sql'         as link,
    'Retour au tableau de bord superviseur'    as description,
    'corner-down-left-double'                  as icon,
    TRUE                                       as active,
    'white'                                    as color;

select 
    '/d_prm1/prm1_main_display_3.sql'         as link,
    'Retour à la liste des personnes'         as description,
    'corner-down-left'                         as icon,
    TRUE                                       as active,
    'white'                                    as color; 
select 
    '/d_prm1_doc/prm1_doc_main_form_3.sql?prm1_id='||$prm1_id         as link,
    'Création d''un nouveau document'                                 as description,
    'books'                                                           as icon,
    'yellow'                                                          as color;

select 
    '/d_prm1_doc/prm1_doc_select_display_3.sql?prm1_id='||$prm1_id         as link,
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
    prm1_doc_id        AS Id,
   '['||prm1_doc_title||']('||prm1_doc_url||')'    AS Titre,
   prm1_doc_date_publication     AS Date_Pub,
   prm1_doc_category             AS Categorie,
  '[Edit](/d_prm1_doc/prm1_doc_main_edit_3.sql?prm1_doc_id='||prm1_doc_id||')'    AS View
FROM prm1_doc
WHERE prm1_doc_status != 'archived'
ORDER BY created_at DESC;
