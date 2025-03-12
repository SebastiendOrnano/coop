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
    'panel_prm2_display' as id,
    'Gestion des partenaires de l''organisation' as title;
select 
    '/d_prm2/prm2_main_form_4.sql'     as link,
    'Création d''une nouvelle organisation'                  as description,
    'user-plus'                                      as icon,
    'yellow'                                         as color;
select 
     '/d_prm2/prm2_archive_display_4.sql'             as link,
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
    prm2_id         AS Id,
   prm2_name        AS Nom,
   prm2_town        AS Ville,
   '[sub](/d_prm2_sub/prm2_sub_main_display_4.sql?prm2_id=' || prm2_id || ')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Edit](/d_prm2/prm2_main_edit_4.sql?prm2_id=' || prm2_id || ')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Delete](/d_prm2/prm2_main_delete_alert_4.sql?prm2_id=' || prm2_id|| ')'    AS View
from prm2
WHERE prm2_name IS NOT NULL AND prm2_status !='archived' 
ORDER BY prm2_id ASC;
