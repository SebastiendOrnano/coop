SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;


select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion éditeur'         as title,
    '/a_panels/panel_editor_3.sql' as link;
 select 
    'Retour à la liste des projets'            as title,
    '/e_projects/project_main_display_3.sql'     as link;   



select 
    'datagrid'              as component,
    'panel_project_meeting_place_display' as id,
    'Gestion des lieux de réunion' as title;

select 
    '/e_project_meetings/project_meeting_place_form_3.sql'      as link,
    'Création d''un nouveau lieu'                    as description,
    'building-community'                             as icon,
    'yellow'                                         as color;


-- Display list of project_meetings
SELECT 'table' AS component, 
    'Liste des salles'   AS title, 
    'View'           AS markdown,
    TRUE             AS sort, 
    TRUE             AS search;

SELECT
   project_meeting_place_id         AS Id,
   project_meeting_place_name        AS Nom,
   project_meeting_place_town        AS Ville,
   '[Edit](/e_project_meetings/project_meeting_place_edit_4.sql?project_meeting_place_id=' || project_meeting_place_id || ')'    AS View
FROM project_meeting_places WHERE project_meeting_place_name IS NOT NULL AND project_meeting_place_status !='archived'
ORDER BY project_meeting_place_id ASC;
