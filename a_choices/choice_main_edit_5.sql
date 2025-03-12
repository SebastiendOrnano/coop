SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_5.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion admin'         as title,
    '/a_panels/panel_admin_5.sql' as link;
select 
    'Gestion des choix'            as title,
    '/a_choices/choice_main_display_5.sql'      as link;


SELECT 
    'form' as component,
    'Actualiser un choix' as title,
    'Actualiser' as validate,
    '/a_choices/choice_main_update_0.sql?choice_id='||$choice_id as action;

SELECT
    'choice_label' as name,
    'text' as type,  
    'Nom' as label,
    3 AS width,
    (select choice_label from choices_items where choice_id=$choice_id) as value,
    TRUE as required;

SELECT 
    'choice_value'            as name,
    'text' as type,  
    'Valeur' as label,
    3 AS width,
    (select choice_value from choices_items where choice_id=$choice_id) as value,
    TRUE as required;

select 
    'choice_category_id'                    as name,
    'Catégorie'                             as label,
    'select'                                as type,
    (select choice_category_id from choices_items where choice_id=$choice_id) as value,
    4                                       AS width,
    TRUE                                    as required,
'Choisir une categorie dans la liste...'    as  empty_option,
json_group_array(json_object(
    'label', choice_category_name,
    'value', choice_category_id
)) as options
from choices_categories;

 SELECT 
    'choice_status'            as name,
    'Statut'                 as label,
    'select'                 as type,
    3 AS width,
    TRUE                     as required,
    (select choice_status  FROM choices_items WHERE choice_id = $choice_id) as value,
    'Choisir un statut dans la liste...' as  empty_option,
    '[{"label": "En ligne", "value": "active"},
    {"label": "En attente", "value": "inactive"},
    {"label": "Archivé", "value": "archived"}
    ]'  as options;




















