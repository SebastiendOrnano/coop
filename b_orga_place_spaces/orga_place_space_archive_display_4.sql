SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

select 
    'datagrid'              as component,
    'panel_space_archive_display' as id,
    'Gestion des salles archivées' as title;

select 
    '/a_panels/panel_supervisor_4.sql'         as link,
    'Retour au tableau de bord superviseur'    as description,
    'corner-down-left-double'                  as icon,
    TRUE                                       as active,
    'white'                                    as color;

select 

    '/b_orga_place_spaces/orga_place_space_main_display_4.sql'     as link,
    'Retour à la liste des salles'                  as description,
    'user-plus'                                      as icon,
    'yellow'                                         as color;

select 
 
    '/b_orga_place_spaces/orga_place_space_archive_display_4.sql'             as link,
    'Visualiser les salles s achivées'           as description,
    'file-download'                                     as icon,
    'green'                                              as color;



-- Display list of placenizations
SELECT 'table' AS component, 
    'Liste des salles'   AS title, 
    'View'           AS markdown,
    TRUE             AS sort, 
    TRUE             AS search;

SELECT
    space_id         AS Id,
   space_name        AS Nom,
   space_town        AS Ville,
   '[Space](/b_orga_place_spaces/orga_place_space_main_display_4.sql?space_id=' || space_id || ')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Edit](/b_orga_place_spaces/orga_place_space_edit_4.sql?space_id=' || space_id || ')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Delete](/b_orga_place_spaces/orga_place_space_delete_alert_4.sql?space_id=' || space_id|| ')'    AS View
FROM place_spaces WHERE space_name IS NOT NULL AND space_status=archived
ORDER BY space_id ASC;
