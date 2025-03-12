SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Superviseur'                 as title,
    '/a_panels/panel_supervisor_4.sql'   as link;
select 
    'liste des salles actives'                     as title,
    '/b_orga_places/orga_place_main_display_4.sql' as link;


SELECT
    'divider' as component,
    'black' as color,
    'left' as position,
    'Liste des lieux archivés' as contents;

-- Display list of placenizations
SELECT 'table' AS component, 
    'Liste des salles'   AS title, 
    'View'           AS markdown,
    TRUE             AS sort, 
    TRUE             AS search;

SELECT
    place_id         AS Id,
   place_name        AS Nom,
   place_town        AS Ville,
   '[Space](/b_orga_place_spaces/orga_place_space_main_display_4.sql?place_id=' || place_id || ')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Edit](/b_orga_places/orga_place_main_edit_4.sql?place_id=' || place_id || ')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Delete](/b_orga_places/orga_place_main_delete_alert_4.sql?place_id=' || place_id|| ')'    AS View
FROM place WHERE place_name IS NOT NULL AND place_status='archived'
ORDER BY place_id ASC;
