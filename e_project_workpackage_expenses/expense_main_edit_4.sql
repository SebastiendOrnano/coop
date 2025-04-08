SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;


set workpackage_id= select workpackage_id from project_workpackage_expenses where expense_id=$expense_id;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Superviseur'         as title,
    '/a_panels/panel_supervisor_4.sql' as link;
 select 
    'Retour au projet'            as title,
    '/e_project/project_main_display_4.sql'   as link;   
select 
    'Gestion des dépenses'            as title,
    '/e_project_workpackage_expenses/expense_main_display_4.sql?workpackage_id='||$workpackage_id     as link;

SELECT 
    'form' as component,
    'Actualiser une dépense' as title,
    'Actualiser' as validate,
    'Clear' as reset,
    '/e_project_workpackage_expenses/expense_main_update_0.sql?expense_id='||$expense_id as action;

SELECT
    'expense_name' as name,
    'text' as type,  
    'Nom' as label,
    (select expense_name from project_workpackage_expenses where expense_id = $expense_id) as value,
    12 AS width,
    TRUE as required;

SELECT
    'expense_summary' as name,
    'textarea' as type,
    (select expense_summary from project_workpackage_expenses where expense_id = $expense_id) as value,
    'Description de la dépense' as label;



SELECT 
    'expense_category'                as name,
    'Catégorie'                         as label,
    'select'                           as type,
    3                                  as width,
    TRUE                              as required,
    (select expense_category from project_workpackage_expenses where expense_id = $expense_id) as value,
    'Choisir un type dans la liste'   AS empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="expense_category"
    ORDER BY  i.choice_label ASC;

SELECT 
    'expense_unit'                as name,
    'Unité'                 as label,
    'select'                           as type,
    2                                  as width,
    TRUE                              as required,
    (select expense_unit from project_workpackage_expenses where expense_id = $expense_id) as value,
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
    (select expense_quantity from project_workpackage_expenses where expense_id = $expense_id) as value,
    'Quantité' as label;


SELECT 
    'expense_value'          as name,
    'Prix HT'                  as label,
    'text'                   as type,
    'euros'                    as suffix,
    (select expense_value from project_workpackage_expenses where expense_id = $expense_id) as value,
    'prix  HT'                 as description,
    3                          AS width;

select 
    'provider_id' as name,
    'Fournisseur' as label,
    'select' as type,
    (select provider_id from project_workpackage_expenses where expense_id = $expense_id) as value,
    4 AS width,
    TRUE as searchable,
   'Saisissez quelques lettres que vous cherchez ou choississez dans la liste' as empty_option,
    json_group_array(json_object('label',prm2_sub_name, 'value', prm2_sub_id))  AS options
    FROM prm2_sub
    where prm2_sub_status!='archived'
    ORDER BY prm2_sub_name ASC;

SELECT 
    'expense_status'                as name,
    'Statut'                 as label,
    'select'                           as type,
    3                                  as width,
    TRUE                              as required,
    (select expense_status from project_workpackage_expenses where expense_id = $expense_id) as value,
    'Choisir un type dans la liste'   AS empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="status"
    ORDER BY  i.choice_label ASC;


select 
    'expense_invoice_date' as name,
    'Date de la dépense' as label,
    'date' as type,
    (select expense_invoice_date from project_workpackage_expenses where expense_id = $expense_id) as value,
    4 AS width;
