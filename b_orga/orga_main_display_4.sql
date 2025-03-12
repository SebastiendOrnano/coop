SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

select 
    'datagrid'              as component,
    'panel_orga_display' as id,
    'Gestion des partenaires de l''organisation' as title;

select 
    '/a_panels/panel_supervisor_4.sql'         as link,
    'Retour au tableau de bord superviseur'    as description,
    'corner-down-left-double'                  as icon,
    TRUE                                       as active,
    'white'                                    as color;

select 

    '/b_orga/orga_main_form_4.sql'     as link,
    'Création d''une nouvelle organisation'                  as description,
    'user-plus'                                      as icon,
    'yellow'                                         as color;

select 
 
    '/b_orga/orga_archive_display_4.sql'             as link,
    'Visualiser les organisations achivées'           as description,
    'file-download'                                     as icon,
    'green'                                              as color;



-- Display list of organizations
SELECT 'table' AS component, 
    'Liste des organisations'   AS title, 
    'View'           AS markdown,
    TRUE             AS sort, 
    TRUE             AS search;

SELECT
    orga_id         AS Id,
   orga_name        AS Nom,
   orga_town        AS Ville,
   '[Dept](/b_orga_dept/orga_dept_main_display_4.sql?orga_id=' || orga_id || ')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Edit](/b_orga/orga_main_edit_4.sql?orga_id=' || orga_id || ')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Delete](/b_orga/orga_main_delete_alert_4.sql?orga_id=' || orga_id|| ')'    AS View
FROM orga
WHERE orga_name IS NOT NULL AND orga_status !='archived' 
ORDER BY orga_id ASC;
