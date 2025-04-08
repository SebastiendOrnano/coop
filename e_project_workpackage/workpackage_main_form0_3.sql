SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion editeur'         as title,
    '/a_panels/panel_editor_3.sql' as link;
 select 
    'Projets'            as title,
    '/e_project/project_main_display_3.sql'    as link; 
 select 
    'Retour au projet'            as title,
    '/e_project/project_hub_display_3.sql?project_id='||$project_id     as link; 


SELECT 
    'form' as component,
    'Créer un workpackage' as title,
    'Créer' as validate,
    'Clear' as reset,
    '/e_project_workpackage/workpackage_main_selector_0.sql?project_id='||$project_id as action;
select 
    'workpackage'              as name,
    'radio'                  as type,
    'independant'                   as value,
    'Non lié à un autre workpackage' as description,
    'workpackage indépendant'                   as label;
select 
    'workpackage' as name,
    'radio'     as type,
    'linked'       as value,
    'Il débutera à la fin du workpackage précédent' as description,
    'workpackage lié au workpackage précédent'       as label;
