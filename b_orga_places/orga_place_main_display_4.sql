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
    'datagrid'              as component,
    'panel_place_display' as id;

select 

    '/b_orga_places/orga_place_main_form_4.sql'      as link,
    'Création d''un nouveau lieu'                    as description,
    'building-community'                             as icon,
    'yellow'                                         as color;

select 
    '/b_orga_places/orga_place_archive_display_4.sql'  as link,
    'Visualiser les lieux achivés'                     as description,
    'archive'                                          as icon,
    'green'                                            as color;

SELECT
    'divider' as component,
    'black' as color,
    'left' as position,
    'Liste des lieux' as contents;



-- Display list of places
SELECT 'table' AS component, 
    'Liste des salles'   AS title, 
    'View'           AS markdown,
    TRUE             AS sort, 
    TRUE             AS search;

SELECT
   place_id         AS Id,
   place_name        AS Nom,
   place_town        AS Ville,
   '[Spaces](/b_orga_place_spaces/orga_place_space_main_display_4.sql?place_id=' || place_id || ')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Edit](/b_orga_places/orga_place_main_edit_4.sql?place_id=' || place_id || ')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Delete](/b_orga_places/orga_place_main_delete_alert_4.sql?place_id=' || place_id|| ')'    AS View
FROM place WHERE place_name IS NOT NULL AND place_status !='archived'
ORDER BY place_id ASC;
