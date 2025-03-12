SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

-- selection panel

SELECT 
    'alert'                    as component,
    'teal'                     as color,
     3 as width,
    'Sélectionner d''abord les membres puis appliquer le traitement choisi' as description;

SELECT
    'datagrid'              as component,
    'panel_archive_display' as id,
    'Visualiser les membres archivés pour les désarchiver' as title;

SELECT 
    '/a_panels/panel_supervisor_4.sql'         as link,
    'Retour au tableau de bord superviseur'    as description,
    'corner-down-left-double'                  as icon,
    'red'                                    as color;

SELECT
    '/d_prm1/prm1_main_display_4.sql'         as link,
    'Retour à la liste des personnes'          as description,
    'corner-down-left'                       as icon,
    'blue'                                  as color;

SELECT
    '/d_prm1/prm1_archive_no_0.sql'       as link,
    'cancel'                                 as icon,
    'yellow'                                          as color,
    'annuler la sélection'                            as description;

SELECT
    '/d_prm1/prm1_archive_active_0.sql'       as link,
    'caret-up-down'                                 as icon,
    'blue'                                          as color,
    'changer le statut -> active'                            as description;

SELECT
    '/d_prm1/prm1_archive_inactive_0.sql'       as link,
    'caret-up-down'                                 as icon,
    'green'                                         as color,
    'changer le statut -> non-active'                 as description;






-- table de sélection des membres 

SELECT 'table' AS component, 
    'Liste des utilisateur'      AS title, 
    'View'                       AS markdown,
      'download_archived_table'   as id,
    TRUE                       AS sort, 
    TRUE                   AS search;

SELECT  
    prm1_id as Id,
    prm1_last_name     AS Nom,
    prm1_first_name  AS Prénom,
    prm1_status as statut,
    prm1_selected as selected,
  '[select / unselect](/d_prm1/prm1_archive_yes_0.sql?prm1_id=' || prm1_id ||')'    AS View
FROM prm1
WHERE prm1_last_name IS NOT NULL AND prm1_status !='active' 
ORDER BY created_at DESC;




