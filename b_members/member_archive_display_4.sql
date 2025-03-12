SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Superviseur'         as title,
 '/a_panels/panel_supervisor_4.sql' as link;
select 
    'Gestion des membres'            as title,
    '/b_members/member_main_display_4.sql' as link;

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
    '/b_members/member_archive_no_0.sql'       as link,
    'corner-down-left'                                 as icon,
    'yellow'                                          as color,
    'annuler la sélection'                            as description;

SELECT
    '/b_members/member_archive_active_0.sql'       as link,
    'corner-down-left'                                 as icon,
    'yellow'                                          as color,
    'changer le statut -> active'                            as description;

SELECT
    '/b_members/member_archive_inactive_0.sql'       as link,
    'corner-down-left'                                 as icon,
    'yellow'                                          as color,
    'changer le statut -> non-active'                 as description;






-- table de sélection des membres 

SELECT 'table' AS component, 
    'Liste des utilisateur'      AS title, 
    'View'                       AS markdown,
      'download_archived_table'   as id,
    'Img'                        as markdown,
    TRUE                       AS sort, 
    TRUE                   AS search;

SELECT  
    CONCAT ('![view picture](',member_picture_url,')' ) AS Img,
    member_id as Id,
    member_last_name     AS Nom,
    member_first_name  AS Prénom,
    member_status as statut,
    member_selected as selected,
  '[select / unselect](/b_members/member_archive_yes_0.sql?member_id=' || member_id ||')'    AS View
FROM members
WHERE member_last_name IS NOT NULL AND member_status ='archived' 
ORDER BY created_at DESC;




