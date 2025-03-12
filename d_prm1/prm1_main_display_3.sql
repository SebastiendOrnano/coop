SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;


-- Supervisor panel to manage prm1
select 
    'datagrid'              as component,
    'panel_prm1_display' as id,
    'PMR : gestion des personnes physiques' as title;

select 
    '/a_panels/panel_editor_3.sql'         as link,
    'Retour au tableau de bord éditeur'    as description,
    'corner-down-left-double'                  as icon,
    TRUE                                       as active,
    'white'                                    as color;

select 
    '/d_prm1/prm1_main_form_3.sql'                   as link,
    'Création d''une nouvelle personne'                  as description,
    'user-plus'                                      as icon,
    'yellow'                                         as color;

select 
     '/d_prm1/prm1_select_display_3.sql'             as link,
    'Actualiser les données d''une sélection'           as description,
    'edit'                                     as icon,
    'green'                                              as color;


select 
    '/d_prm1/prm1_import_csv_4.sql'                    as link,
    'Importation à partir d''un fichier csv'                as description,
    'upload'                                             as icon,
    'yellow'                                                 as color;

select 
    '/d_prm1/prm1_csv_full_0.sql'                   as link,
    'Téléchargement de la liste de tous les personnes'     as description,
    'file-download'                                      as icon,
    'green'                                              as color;

select  
   '/d_prm1/prm1_csv_email_0.sql'                     as link,
    'Téléchargement email des personnes'                     as description,
    'file-download'                                         as icon,
    'blue'                                                  as color;

-- Display list of  active prm1



/* 
if you want to paginate the table of prm1 you have to uncomment the following button 
AND the final line
LIMIT IFNULL($page, 20) OFFSET IFNULL($offset, 0)
at the end of the table component

but if you paginate, the search on a name will be only in the page of screen !
*/

/* 
SELECT 
    'button' as component,
    TRUE AS center;

SELECT 
    '|<' as title, 
    '?offset=0&page=' || IFNULL($page, 20) as link,
    cast(IFNULL($offset, 0) as integer) <= 0 as disabled;

SELECT '<<' as title, 
    '?offset=' || (IFNULL($offset, 0) - IFNULL($page, 20)) || '&page=' || IFNULL($page, 20) as link,
    cast(IFNULL($offset, 0) as integer) <= 0 as disabled;

SELECT '>>' as title, 
  '?offset=' || (IFNULL($offset, 0) + IFNULL($page, 20)) || '&page=' || IFNULL($page, 20) as link; */

SELECT 'table' AS component, 
    'Liste des personnes'   AS title, 
    'View'           AS markdown,
    'Img'  as markdown,
    TRUE             AS sort, 
    TRUE             AS search;

SELECT       
   prm1_last_name     AS Nom,
   prm1_first_name    AS Prénom,
   prm1_category      AS Categorie,
   prm1_status        as statut,
  '[View](/d_prm1/prm1_profile_display_3.sql?prm1_id='||prm1_id|| ')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Doc](/d_prm1_doc/prm1_doc_main_display_3.sql?prm1_id=' || prm1_id || ')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Edit](/d_prm1/prm1_main_edit_3.sql?prm1_id=' || prm1_id ||')'   AS View
FROM prm1
WHERE prm1_last_name IS NOT NULL AND prm1_status ='active'
ORDER BY prm1_last_name asc
-- LIMIT IFNULL($page, 20) OFFSET IFNULL($offset, 0)
;

