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
    'Retour au projet'            as title,
    '/e_projects/project_hub_display_4.sql?project_id='||$project_id     as link; 
select 
    'Gestion des sprints'            as title,
    '/e_project_sprints/sprint_main_display_4.sql?project_id='||$project_id     as link;

SELECT 
    'form' as component,
    'Créer un sprint' as title,
    'Créer' as validate,
    'Clear' as reset,
    '/e_project_sprints/sprint_main_selector_0.sql?project_id='||$project_id as action;
select 
    'sprint'              as name,
    'radio'                  as type,
    'independant'                   as value,
    'Non lié à un autre sprint' as description,
    'Sprint indépendant'                   as label;
select 
    'sprint' as name,
    'radio'     as type,
    'linked'       as value,
    'Il débutera à la fin du sprint précédent' as description,
    'Sprint lié au sprint précédent'       as label;
