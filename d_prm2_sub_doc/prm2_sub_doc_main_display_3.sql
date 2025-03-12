SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

set prm2_sub_name = (select UPPER(prm2_sub_name) from prm2_sub where prm2_sub_id=$prm2_sub_id);
set prm2_id = (select prm2_id from prm2_sub where prm2_sub_id=$prm2_sub_id);

-- Supervisor panel to manage members
select 
    'datagrid'              as component,
    'panel_prm2_sub_doc_display' as id,
    'Gestion des documents de l''organisation :  '|| $prm2_sub_name as title;

select 
    '/a_panels/panel_editor_3.sql'         as link,
    'Retour au tableau de bord editeur'    as description,
    'corner-down-left-double'                  as icon,
    TRUE                                       as active,
    'white'                                    as color;

select 
    '/d_prm2_sub/prm2_sub_main_display_3.sql?prm2_id='||$prm2_id         as link,
    'Retour gestion de l''organisation'        as description,
    'corner-down-left'                  as icon,
    TRUE                                       as active,
    'blue'                                    as color;

select 
    '/d_prm2_sub_doc/prm2_sub_doc_main_form_3.sql?prm2_sub_id='||$prm2_sub_id          as link,
    'Création d''un nouveau document'          as description,
    'books'                                    as icon,
    'yellow'                                   as color;

select 
    '/d_prm2_sub_doc/prm2_sub_doc_select_display_3.sql?prm2_sub_id='||$prm2_sub_id         as link,
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
    prm2_sub_doc_id        AS Id,
   '['||prm2_sub_doc_title||']('||prm2_sub_doc_url||')'    AS Titre,
   prm2_sub_doc_date_publication     AS Date_Pub,
   prm2_sub_doc_date_period          AS Period,
   prm2_sub_doc_category             AS Categorie,
   prm2_sub_doc_status              as Statut,
  '[Edit](/d_prm2_sub_doc/prm2_sub_doc_main_edit_3.sql?prm2_sub_doc_id='||prm2_sub_doc_id||'&prm2_sub_id='||$prm2_sub_id||')'    AS View
FROM prm2_sub_docs
WHERE prm2_sub_id=$prm2_sub_id AND prm2_sub_doc_status != 'archived'
ORDER BY created_at DESC;
