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
    'Retour aux projects actifs'         as title,
    '/e_projects/project_main_display_4.sql'             as link;


select 
    'divider' as component,
    'Liste des projects archivés'   as contents;

-- Display list of projets
SELECT 'table' AS component, 
    'Liste des projets'   AS title, 
    'View'           AS markdown,
    TRUE             AS sort, 
    TRUE             AS search;

SELECT
    project_id               AS Id,
    project_name            AS Nom,
    project_category        AS Categorie,
   '[Prog](/b_project_schedules/project_sub_main_display_4.sql?project_id=' || project_id || ')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Edit](/e_projects/project_main_edit_4.sql?project_id=' || project_id || ')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Delete](/e_projects/project_main_delete_alert_4.sql?project_id=' || project_id|| ')'    AS View
FROM projects
WHERE project_name IS NOT NULL AND project_status ='archived'
ORDER BY project_id ASC;
