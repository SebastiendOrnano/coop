SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

set project_id = select project_id from project_workpackage where workpackage_id=$workpackage_id;

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
    '/e_project/project_main_display_3.sql'   as link;
 select 
    'Hub projet'            as title,
    '/e_project/project_hub_display_3.sql?project_id='||$project_id   as link;
 select 
    'Hub lot de travaaux'            as title,
    '/e_project_workpackage/workpackage_hub_display_3.sql?workpackage_id='||$workpackage_id   as link;    
select 
    'Gestion des dépenses'            as title,
    '/e_project_workpackage_expenses/expense_main_display_3.sql?workpackage_id='||$workpackage_id     as link;

SELECT 
    'form' as component,
    'Energistrer une dépense' as title,
    'Créer' as validate,
    'Clear' as reset,
    '/e_project_workpackage_expenses/expense_main_create_0.sql?workpackage_id='||$workpackage_id   as action;


SELECT 
    'expense_category'                as name,
    'Catégorie'                 as label,
    'select'                           as type,
    3                                  as width,
    TRUE                              as required,
    'Choisir un type dans la liste'   AS empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="expense_category"
    ORDER BY  i.choice_label ASC;

SELECT
    'expense_name' as name,
    'text' as type,  
    'Nom' as label,
    9 AS width,
    TRUE as required;

SELECT
    'expense_summary' as name,
    'textarea' as type,
    'Détail de l''achat (description matériau / contenu prestation)' as label;

SELECT 
    'expense_unit'                as name,
    'Unité'                 as label,
    'select'                           as type,
    2                                  as width,
    'Choisir l''unité dans la liste'   AS empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="expense_unit"
    ORDER BY  i.choice_label ASC;

SELECT
    'expense_quantity' as name,
    'text' as type,
    2                              as width,
    'Quantité' as label;

SELECT 
    'expense_invoice_date'      as name,
    'Date facture'              as label,
    'date'                       as type,
    2                            AS width,
   (select regex_value from regex where regex_name='date')         as pattern,
   (select regex_description from regex where regex_name='date')   as description;

SELECT
    'expense_invoice_url'  as name,
    'file'                 as type,
    5                     AS width,
    'Scan facture'          as label;

SELECT
    'expense_invoice_ref'  as name,
    'text'                 as type,
    2                     AS width,
    'Réf facture'          as label;

SELECT 
    'expense_value'            as name,
    'Prix HT'                  as label,
     TRUE                      as required,
    'text'                     as type,
    'euros'                    as suffix,
    'prix  HT'                 as description,
    2                          AS width;

SELECT 
    'expense_taxt_rate'           as name,
    '% taxe'                      as label,
    'select'                      as type,
    '%'                           as suffix,
    'taux taxe applicable'        as description,
    1                             AS width,
    'Choisir le taux dans la liste'   AS empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="tax_rate"
    ORDER BY  i.choice_label ASC;

SELECT 
    'expense_material_origin'           as name,
    'Origine'                      as label,
    'select'                      as type,
    '%'                           as suffix,
    'si matriaux origin'        as description,
    3                             AS width,
    'Choisir le taux dans la liste'   AS empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="material_origin"
    ORDER BY  i.choice_label ASC;

select 
    'provider_id' as name,
    'Fournisseur' as label,
    'select' as type,
    4 AS width,
    TRUE as searchable,
   'Saisissez quelques lettres que vous cherchez ou choississez dans la liste' as empty_option,
    json_group_array(json_object('label',prm2_sub_name, 'value', prm2_sub_id))  AS options
    FROM prm2_sub
    where prm2_sub_status!='archived'
    ORDER BY prm2_sub_name ASC;

SELECT 
    'expense_saving'                         as name,
    'Économie réalisée'                      as label,
    'text'                                   as type,
    'euros'                                  as suffix,
    'Économie réalisée (si réemploi ou don)' as description,
    2                                        AS width;
