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
    'List des processus'                      as title,
    'arrow_left'                  as icon,
    '/a_process/process_main_display_5.sql'        as link;


SELECT 
    'form' as component,
    'Actualiser un process' as title,
    'Actualiser' as validate,
   'Clear' as reset,
    '/a_process/process_main_update_0.sql?process_id='||$process_id as action;

SELECT
    'process_title' as name,
    'text' as type,  
    'Nom du process' as label,
    (SELECT process_title FROM process WHERE process_id=$process_id) as value;

SELECT
    'process_category'       as name,
    'select'                   as type,  
    'Categorie du process'   as label,
    TRUE                     as required,
    (SELECT process_category FROM process WHERE process_id=$process_id) as value,
    4                       AS width, 
    'selectionnez une catégorie dans la liste' as empty_option,
   '[{"label": "Editor", "value": "editor"}, {"label": "Supervisor", "value":"supervisor"}, {"label": "Admin", "value":"admin"}]' as options;

SELECT
    'process_status'       as name,
    'select'                   as type,  
    'Categorie du process'   as label,
    TRUE                     as required,
    4                       AS width,
    (SELECT process_status FROM process WHERE process_id=$process_id) as value,
    'Choisir un statut...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="status"
    ORDER BY  i.choice_label ASC;
    
SELECT
    'process_description' as name,
    'text' as type, 
    (SELECT process_description FROM process WHERE process_id=$process_id) as value,
    'Description du process' as label;

