SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;


set workpackage_id = select workpackage_id from project_workpackage_waste where waste_id=$waste_id;
set waste_category_id = select waste_category_id from project_workpackage_waste where waste_id=$waste_id;
set product_category_parent_id  = select product_category_parent_id  from project_products_categories where product_category_id = $waste_category_id;


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
    '/e_project/project_main_display_3.sql'     as link;
 select 
    'Hub du projet'            as title,
    '/e_project/project_hub_display_3.sql?project_id='||$project_id     as link; 
select 
    'Hub lot de travaux'    as title,
    '/e_project_workpackage/workpackage_hub_display_3.sql?workpackage_id='||$workpackage_id as link;
select 
    'Déchets'            as title,
    '/e_project_workpackage_waste/waste_main_display_3.sql?workpackage_id='||$workpackage_id    as link;


SELECT 
    'form' as component,
    'Actualiser un déchet' as title,
    'Actualiser' as validate,
    'Clear' as reset,
    '/e_project_workpackage_waste/waste_main_update_0.sql?waste_id='||$waste_id  as action;

SELECT 
    'waste_status'                      as name,
    'Statut'                            as label,
    'select'                            as type,
    3                                   as width,
    (select waste_status from project_workpackage_waste where waste_id=$waste_id ) as value,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="status"
    ORDER BY  i.choice_label ASC;

SELECT 
    'waste_category_id'                as name,
    'Catégorie'                        as label,
    'select'                           as type,
    3                                  as width,
    (select product_category_id from project_products_categories where product_category_id=$waste_category_id ) as value,
    'Choisir un type dans la liste'   AS empty_option,
    json_group_array(json_object('label',product_category_name, 'value', product_category_id))  AS options
    FROM project_products_categories where product_category_parent_id  =$product_category_parent_id;

SELECT
    'waste_name' as name,
    'text' as type,  
    'Nom' as label,
     (select waste_name from project_workpackage_waste where waste_id=$waste_id ) as value,
    9 AS width,
    TRUE as required;

SELECT
    'waste_summary' as name,
    'textarea' as type,
     (select waste_summary from project_workpackage_waste where waste_id=$waste_id) as value,
    'Détail du déchet' as label;

SELECT
    'waste_ienes_url' as name,
    'text' as type,  
     (select waste_ienes_url from project_workpackage_waste where waste_id=$waste_id) as value,
    'URL Fiche base IENES' as label,
    9 AS width;

SELECT 
    'waste_functional_unit'                as name,
    'Unité fonctionnelle'                 as label,
    'select'                           as type,
     (select waste_functional_unit from project_workpackage_waste where waste_id=$waste_id ) as value,
    3                                  as width,
    'Choisir l''unité dans la liste'   AS empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="material_unit"
    ORDER BY  i.choice_label ASC;

SELECT 
    'waste_unit'                             as name,
    'Unité'                                  as label,
    'select'                                   as type,
     (select waste_unit from project_workpackage_waste where waste_id=$waste_id) as value,
        3                                       AS width,
    'Choisir dans la liste'   AS empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="material_unit"
    ORDER BY  i.choice_label ASC;


SELECT
    'waste_quantity' as name,
    'text' as type,
     (select waste_quantity from project_workpackage_waste where waste_id=$waste_id) as value,
   3                                 as width,
    'Quantité' as label;


SELECT 
    'waste_value'            as name,
    'Valeur'                  as label,
     TRUE                      as required,
    'text'                     as type,
     (select waste_value from project_workpackage_waste where waste_id=$waste_id ) as value,
    'euros'                    as suffix,
    'Valeur estimée par unité'                 as description,
    6                          AS width;

SELECT 
    'waste_destination'           as name,
    'Destination'                      as label,
    'select'                      as type,
     (select waste_destination from project_workpackage_waste where waste_id=$waste_id) as value,
    '%'                           as suffix,
    'utilisation future du déchet'        as description,
    3                             AS width,
    'Choisir le taux dans la liste'   AS empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="material_origin"
    ORDER BY  i.choice_label ASC;

select 
    'recipiend_id' as name,
    'Destinataire' as label,
     (select recipiend_id from project_workpackage_waste where waste_id=$waste_id) as value,
    'select' as type,
    4 AS width,
    TRUE as searchable,
   'Saisissez quelques lettres que vous cherchez ou choississez dans la liste' as empty_option,
    json_group_array(json_object('label',prm2_sub_name, 'value', prm2_sub_id))  AS options
    FROM prm2_sub
    where prm2_sub_status!='archived'
    ORDER BY prm2_sub_name ASC;


