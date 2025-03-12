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
    'panel_member_main_display' as id,
    'Traitements sur une sélection membres de l''organisation' as title;

SELECT
     '/b_members/member_select_all_0.sql'               as link,
    'Tout sélectionner'                                      as description,
    'list-check'                                     as icon,
    'red'                                               as color;

SELECT
    '/b_members/member_select_no_0.sql'               as link,
    'corner-down-left'                                as icon,
    'yellow'                                          as color,
    'annuler la sélection'                            as description;

SELECT
    '/b_members/member_select_edit_4.sql'             as link,
    'Actualiser la liste des membres sélectionnés'    as description,
    'user-plus'                                       as icon,
    'green'                                           as color;

SELECT
    '/b_members/member_select_csv_full_0.sql'           as link,
    'Télécharger la liste des membres sélectionnés'     as description,
    'user-plus'                                         as icon,
    'orange'                                            as color,
    'rechargez la page après l''export des données'     as tooltip;

SELECT
    '/b_members/member_select_csv_email_0.sql'                as link,
    'Télécharger email-téléphone des membres sélectionnés'    as description,
    'user-plus'                                               as icon,
    'green'                                                   as color,
    'rechargez la page après l''export des données'           as tooltip;






-- table de sélection des membres 

SELECT 'table' AS component, 
    'Liste des utilisateur'   AS title, 
    'View'           AS markdown,
    'download_selection_table' as id,
    'Img'  as markdown,
    TRUE             AS sort, 
    TRUE             AS search;

SELECT  
    CONCAT ('![view picture](',member_picture_url,')' ) AS Img,
    member_last_name     AS Nom,
    member_first_name  AS Prénom,
    member_selected as selected,
  '[select / unselect](/b_members/member_select_yes_0.sql?member_id=' || member_id ||')'    AS View
FROM members
WHERE member_last_name IS NOT NULL AND member_status !='archived' 
ORDER BY created_at DESC;




