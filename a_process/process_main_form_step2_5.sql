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
    '/a_process/process_main_form_step2_0.sql' as action;

SELECT
    'process_section_title' as name,
    'text' as type,  
    'Nom de l''étape' as label,
    6 AS width;

select 
   'process_name' as name,
    'Nom du process' as label,
    'select' as type,
    6 AS width,
    1      as value,
    'select an option in the dropdown list' as description,
    json_group_array(json_object('label', process_name,'value', process_id)) as options FROM process;

select 
   'process_section_number' as name,
    'Numéro de l''étape' as label,
   'text' as type,  
    6 AS width;

select 
   'process_section_description' as name,
    'Description de l''étape' as label,
   'text' as type,  
    6 AS width;

select 
   'process_section_icon' as name,
    'Icone de l''étape' as label,
   'text' as type,  
    6 AS width;

select 
   'process_section_link' as name,
    'Lien de l''étape' as label,
   'text' as type,  
    6 AS width;
