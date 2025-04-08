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
    'Projets'            as title,
    '/e_project/project_main_display_3.sql'    as link; 
select 
    'Hub projet'            as title,
    '/e_project/project_hub_display_3.sql?project_id='||$project_id     as link;

    
SELECT 
    'form' as component,
    'Choisir le workpackage parent' as title,
    'Créer' as validate,
    'Clear' as reset,
    '/e_project_workpackage/workpackage_main_form3_4.sql?project_id='||$project_id as action;

select 
   'workpackage_id' as name,
    'Choisir le workpackage parent' as label,
    'select' as type,
    8 AS width,
    TRUE as searchable,
    'Choississez dans la liste' as empty_option,
    json_group_array(json_object('label',workpackage_name, 'value', workpackage_id)) AS options
    FROM (
    SELECT workpackage_name, workpackage_id
    FROM project_workpackage where project_id=$project_id
    ORDER BY workpackage_id ASC
    );
