SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;


select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Superviseur'         as title,
    '/a_panels/panel_supervisor_4.sql' as link;


-- Supervisor panel to manage members
select 
    'datagrid'              as component,
    'panel_member_main_display' as id,
    'Gestion des membres de l''organisation' as title;

select 

    '/b_members/member_main_form_4.sql'                   as link,
    'Création d''un nouveau membre'                  as description,
    'user-plus'                                      as icon,
    'yellow'                                         as color;

select 
 
    '/b_members/member_select_display_4.sql'             as link,
    'Actualiser les données d''une sélection'           as description,
    'file-download'                                     as icon,
    'green'                                              as color;

select 
 
    '/b_members/member_archive_display_4.sql'             as link,
    'Visualiser les membres achivés'                       as description,
    'file-download'                                     as icon,
    'green'                                              as color;

select 
    '/b_members/member_import_csv_4.sql'                    as link,
    'Importation à partir d''un fichier csv'                as description,
    'user-plus'                                             as icon,
    'yellow'                                                 as color;

select 
    '/b_members/member_csv_full_0.sql'                   as link,
    'Téléchargement de la liste de tous les membres'     as description,
    'file-download'                                      as icon,
    'green'                                              as color;

select  
   '/b_members/member_csv_email_0.sql'                     as link,
    'Téléchargement email des membres'                     as description,
    'file-download'                                         as icon,
    'blue'                                                  as color;

select 
    '/b_members/member_csv_subscription_0.sql'              as link,
    'Téléchargement des membres en retard de cotisation'    as description,
    'file-download'                                         as icon,
    'yellow'                                                  as color;
  


-- Display list of  active members



/* 
if you want to paginate the table of members you have to uncomment the following button 
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
    'Liste des utilisateur'   AS title, 
    'View'           AS markdown,
    'Img'  as markdown,
    TRUE             AS sort, 
    TRUE             AS search;

SELECT       
   --'![view picture]('||$picture||')'    AS Img,
   '![view picture]('||member_picture_url||')' AS Img,
   member_last_name     AS Nom,
   member_first_name  AS Prénom,
   member_category     AS Categorie,
   member_function as fonction,
   member_status as statut,
   member_publish as publié,
  '[Edit](/b_members/member_main_edit_4.sql?member_id=' || member_id || ')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Preview](/b_members/member_profile_complete_4.sql?member_id=' || member_id || ')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Delete](/b_members/member_main_delete_alert1_4.sql?member_id=' || member_id|| ')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Pict](/b_members/member_picture_form_4.sql?member_id=' || member_id|| ')'    AS View
FROM members
WHERE member_last_name IS NOT NULL AND member_status !='archived'
ORDER BY member_last_name asc
-- LIMIT IFNULL($page, 20) OFFSET IFNULL($offset, 0)
;

