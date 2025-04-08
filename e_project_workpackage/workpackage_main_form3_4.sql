SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion superviseur'         as title,
    '/a_panels/panel_supervisor_4.sql' as link;
 select 
    'Projets'            as title,
    '/e_project/project_main_display_4.sql'     as link; 
select 
    'Hub projet'            as title,
    '/e_project/project_hub_display_4.sql?project_id='||$project_id     as link;
    

SELECT 
    'form' as component,
    '' as validate;
SELECT
    'workpackage_id' as name,
    'text' as type,  
    'id ' as label,
    2 AS width,
     (select workpackage_id from project_workpackage where workpackage_id=:workpackage_id) as value;
SELECT
    'workpackage_name' as name,
    'text' as type,  
    'Nom du workpackage précédent' as label,
    10 AS width,
     (select workpackage_name from project_workpackage where workpackage_id=:workpackage_id) as value;


SET workpackage_parent_id = select workpackage_id from project_workpackage where workpackage_id=:workpackage_id;
SET workpackage_parent_date_start_scheduled = select DATE(workpackage_date_start_scheduled) from project_workpackage where workpackage_id=:workpackage_id;
SET workpackage_parent_duration_scheduled = select workpackage_duration_scheduled from project_workpackage where workpackage_id=:workpackage_id;
SET workpackage_child_date_start_scheduled = DATE($workpackage_parent_date_start_scheduled,'+'||$workpackage_parent_duration_scheduled||' days');

SELECT 
    'form' as component,
    'Créer un workpackage' as title,
    'Créer' as validate,
    'Clear' as reset,
    '/e_project_workpackage/workpackage_main_create2_0.sql?project_id='||$project_id as action;

SELECT
    'workpackage_parent_id' as name,
    'hidden' as type,  
    'Nom' as label,
    $workpackage_parent_id as value,
    12 AS width,
    TRUE as required;

SELECT
    'workpackage_name' as name,
    'text' as type,  
    'Nom' as label,
    12 AS width,
    TRUE as required;
    
SELECT
    'workpackage_summary' as name,
    'textarea' as type,
    'Présentation du workpackage' as label;

SELECT
    'workpackage_todo' as name,
    'textarea' as type,
    'Travaux à faire...' as description,
    'Travaux à faire' as label;

SELECT 
    'workpackage_date_start_scheduled' as name,
    'hidden'                      as type,
    true                        as required,
    $workpackage_child_date_start_scheduled as value;

SELECT 
    'workpackage_duration_scheduled' as name,
    'durée'              as label,
    'number'                      as type,
    'jours'                    as suffix,
    true                        as required,
    'durée en jours'  as description,
    4                          AS width;
