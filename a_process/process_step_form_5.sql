SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_5.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Admin'                      as title,
    'arrow_left_double'                  as icon,
    '/a_panels/panel_admin_5.sql'        as link;
select 
    'Liste des processus'                      as title,
    'arrow_left_double'                  as icon,
    '/a_process/process_main_display_5.sql'        as link;
select 
    'Retour au processus'                      as title,
    'arrow_left'                  as icon,
    '/a_process/process_main_display_5.sql?process_id='||$process_id     as link;


select 
    'title'   as component,
    'Nouvelle étape' as contents,
    3         as level;

-- Form for replying to the topic
SELECT 'form'      AS component,
'Créer une nouvelle étape' as validate,
'Clear'                    as reset,
'/a_process/process_step_create_0.sql?process_id='||$process_id AS action;


SELECT 
'process_step_number'        AS name, 
'number'                     AS type, 
'N° d''ordre de l''étape'    as label,
2                            as width,
TRUE                         as required;

SELECT 
'process_step_icon'      AS name, 
'text'                   AS type, 
2                        as width,
'icon'                   as label;

SELECT 
'process_step_title'           AS name, 
'text'                         AS type, 
'Nom de l''étape'              as label,
TRUE                           as required;

SELECT 
'process_step_link'           AS name, 
'text'                        AS type, 
'link'                        as label;

SELECT 
'process_step_description'           AS name, 
'text'                               AS type, 
'description'                        as label;
