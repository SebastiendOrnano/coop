SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;


-- Supervisor panel to manage members
select 
    'datagrid'              as component,
    'panel_orga_doc_display' as id,
    'Gestion des documents de l''organisation' as title;

select 
    '/a_panels/panel_supervisor_4.sql'         as link,
    'Retour au tableau de bord superviseur'    as description,
    'corner-down-left-double'                  as icon,
    TRUE                                       as active,
    'white'                                    as color;

select 
    '/b_orga_doc/orga_doc_main_form_4.sql'          as link,
    'Création d''un nouveau document'          as description,
    'books'                                    as icon,
    'yellow'                                   as color;

select 
    '/b_orga_doc/orga_doc_select_display_4.sql'          as link,
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
    orga_doc_id        AS Id,
   '['||orga_doc_title||']('||orga_doc_url||')'    AS Titre,
   orga_doc_date_publication     AS Date_Pub,
   orga_doc_date_period          AS Period,
   orga_doc_category             AS Categorie,
   orga_doc_edition              as Edition,
   orga_doc_publication          AS Pubication,
  '[Edit](/b_orga_doc/orga_doc_main_edit_4.sql?orga_doc_id=' || orga_doc_id || ')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Delete](/b_orga_doc/orga_doc_main_delete_alert1_4.sql?orga_doc_id='||orga_doc_id||')'    AS View
FROM orga_docs
WHERE orga_doc_publication != 'archived'
ORDER BY created_at DESC;
