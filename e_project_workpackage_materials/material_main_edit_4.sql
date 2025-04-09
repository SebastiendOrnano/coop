SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

set workpackage_id= select workpackage_id from project_workpackage_materials where material_id=$material_id;
set workpackage_name = select workpackage_name from project_workpackage where workpackage_id = $workpackage_id;
set project_id=select project_id from project_workpackage where workpackage_id=$workpackage_id ;
set product_id=select product_id from project_workpackage_materials where material_id=$material_id;


select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Superviseur'         as title,
    '/a_panels/panel_supervisor_4.sql' as link;
select 
    'Retour à la liste des projets'            as title,
    '/e_project/project_main_display_4.sql'     as link;
select 
    'Hub projet'            as title,
    '/e_project/project_hub_display_4.sql?project_id='||$project_id       as link;
select 
    'Hub lot de travaux'            as title,
    '/e_project_workpackage/workpackage_hub_display_4.sql?workpackage_id='||$workpackage_id     as link;
select 
    'Matériaux'            as title,
    '/e_project_workpackage_materials/material_main_display_4.sql?workpackage_id='||$workpackage_id as link;


SELECT 
    'form' as component,
    'Données ienes' as title,
    '' as validate;

SELECT
    'product_name' as name,
    'text' as type,  
    'Nom' as label,
    6 AS width,
    (select product_name from project_products where product_id=$product_id) as value;

SELECT
    'product_ienes_url' as name,
    'text' as type,  
    'Lien ienes' as label,
    6 AS width,
    (select product_ienes_url from project_products where product_id=$product_id) as value;


SELECT
    'product_functional_unit' as name,
    'textarea' as type,  
    'Unité fonctionnelle' as label,
    9 AS width,
    (select product_functional_unit from project_products where product_id=$product_id) as value;

SELECT
    'product_unit' as name,
    'text' as type,  
    'Unité' as label,
    3 AS width,
    (select product_unit from project_products where product_id=$product_id) as value;
SELECT
    'product_climate_change_indicator' as name,
    'text' as type,  
    'Indicateur chgt climatique' as label,
    6 AS width,
    (select product_climate_change_indicator from project_products where product_id=$product_id) as value;


SELECT 
    'form' as component,
    'Calcul du bilan carbone' as title,
    'Actualiser le calcul bilan carbone' as validate,
    'Clear' as reset,
    '/e_project_workpackage_materials/material_main_update_0.sql?material_id='||$material_id  as action;

SELECT
    'material_status'  as name,
    'select'           as type,
    2                  as width,
    (select material_status from project_workpackage_materials where material_id=$material_id) as value,
    'Choisir un statut dans la liste...'    as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="status"
    ORDER BY  i.choice_label ASC;

SELECT
    'material_summary'       as name,
    'textarea'               as type,
    (select material_summary from project_workpackage_materials where material_id=$material_id) as value,
    'Détail du calcul'       as label;

SELECT
    'material_unit' as name,
    'select'             as type,
    2                  as width,
    'Unité'         as label,
    (select material_unit from project_workpackage_materials where material_id=$material_id) as value,
    'Choisir dans la liste'   AS empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="material_unit"
    ORDER BY  i.choice_label ASC;

SELECT
    'material_quantity' as name,
    'text'             as type,
    2                  as width,
    (select material_quantity from project_workpackage_materials where material_id=$material_id) as value,
    'Quantité'         as label;

SELECT
    'material_volume1' as name,
    'text'             as type,
    'l'                as suffix,
    2                  as width,
    (select material_volume1 from project_workpackage_materials where material_id=$material_id) as value,
    'Volume 1 (liquides)'         as label;

SELECT
    'material_volume2' as name,
    'text'            as type,
    'm3'              as suffix,
    2                 as width,
    (select material_volume2 from project_workpackage_materials where material_id=$material_id) as value,
    'Volume 2 (solides)'        as label;

SELECT
    'material_area' as name,
    'text'            as type,
    'm2'              as suffix,
    2                as width,
    (select material_area from project_workpackage_materials where material_id=$material_id) as value,
    'Superficie'        as label;

SELECT
    'material_thickness' as name,
    'text'            as type,
    'm'              as suffix,
    2                as width,
    (select material_thickness from project_workpackage_materials where material_id=$material_id) as value,
    'Épaisseur'        as label;

SELECT
    'material_length' as name,
    'text'            as type,
    'ml'              as suffix,
    2                 as width,
     (select material_length from project_workpackage_materials where material_id=$material_id) as value,
    'longueur'        as label;

SELECT
    'material_weigth' as name,
    'text'            as type,
    'kg'              as suffix,
    2                 as width,
     (select material_weigth from project_workpackage_materials where material_id=$material_id) as value,
    'poids'        as label;

SELECT
    'material_equiv_fonctional_units' as name,
    'text'            as type,
    6                 as width,
     (select material_equiv_fonctional_units from project_workpackage_materials where material_id=$material_id) as value,
    'Nb equiv d''unités fonctionnelles'        as label;

SELECT
    'product_climate_change_indicator' as name,
    'hidden' as type,
    (select product_climate_change_indicator  from project_products where product_id=$product_id) as value;

SELECT
    'product_ienes_url' as name,
    'hidden' as type,
    (select product_ienes_url from project_products where product_id=$product_id) as value;
SELECT
    'product_id' as name,
    'hidden' as type,
    (select product_id  from project_products where product_id=$product_id) as value;