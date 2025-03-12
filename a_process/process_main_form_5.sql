SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_5.sql') AS properties;

select 
    'alert'                     as component,
    'Attention'                   as title,
    TRUE as important,
    'La saisie se fait en 2 étapes. Lors de la première étape vous pouvez saisir le process puis dans un second temps les étapes du process' as description,
    'alert-triangle'            as icon,
    TRUE                       as dismissible,
    'yellow'                    as color;

SELECT 
    'form' as component,
    'Créer un process / étape 1' as title,
    'Créer' as validate,
   'Clear' as reset,
    '/a_process/process_main_create_0.sql' as action;

SELECT
    'process_title' as name,
    'text' as type,  
    'Nom du process' as label;

SELECT
    'process_category'       as name,
    'select'                   as type,  
    'Categorie du process'   as label,
    TRUE                     as required,
    4                       AS width,
    TRUE                     as searchable,
     'selectionnez une catégorie dans la liste' as empty_option,
   '[{"label": "Editor", "value": "editor"}, {"label": "Supervisor", "value":"supervisor"}, {"label": "Admin", "value":"admin"}]' as options;

SELECT
    'process_status'       as name,
    'select'                   as type,  
    'Categorie du process'   as label,
    TRUE                     as required,
    4                        AS width,
    TRUE                     as searchable,
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
    'Description du process' as label;

