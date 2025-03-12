SET redirect_link1 = 
(
    SELECT
    CASE
    WHEN
    (SELECT employee_selected FROM prm2_sub_employees WHERE  employee_selected='yes') IS NULL OR  (SELECT employee_selected FROM prm2_sub_employees WHERE  employee_selected='yes') =''
    THEN '/d_prm2_sub_employees/prm2_sub_employee_select_alert1_4.sql?prm2_sub_id='||$prm2_sub_id||'&prm2_id='||$prm2_id
    ELSE ''
    END
);

SELECT 'redirect' AS component, $redirect_link1 AS link
WHERE $redirect_link1 != '' OR $redirect1 IS NOT NULL;

SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

SET prm2_id = select prm2_id from prm2_sub where prm2_sub_id = $prm2_sub_id;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion editeur'         as title,
 '/a_panels/panel_editor_3.sql' as link;
select 
    'Gestion des personnes physiques'            as title,
    '/d_prm2_sub_employees/prm2_sub_employee_select_display_3.sql?prm2_sub_id='||$prm2_sub_id||'&prm2_id='||$prm2_id  as link;

SELECT 
    'form' as component,
    'Actualiser le profil d''une sélection d''employés ' as title,
    'Actualiser' as validate,
   'Clear' as reset,
    '/d_prm2_sub_employees/prm2_sub_employee_select_update_0.sql?prm2_sub_id='||$prm2_sub_id as action;

select 
    'employee_title'        as name,
    'text'                  as type,
    3                      AS width,
    (select employee_title FROM prm2_sub_employees WHERE prm1_id = $prm1_id)  as value,
    'titre (dans l''entreprise)'                as label;

 SELECT 
    'employee_function'        as name,
    'Rôle (dans l''entreprise)'                     as label,
    'select'                   as type,
    3                          AS width,
    (select employee_function FROM prm2_sub_employees WHERE prm1_id = $prm1_id)  as value,
    'Choisir un rôle...'       as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="employee_function"
    ORDER BY  i.choice_label ASC;


SELECT 
    'employee_category'        as name,
    'Categorie (dans l''entreprise)'                as label,
    'select'                   as type,
    3                          AS width,
    (select employee_category FROM prm2_sub_employees WHERE prm1_id = $prm1_id)  as value,
    'Choisir une categorie...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="employee_category"
    ORDER BY  i.choice_label ASC;

select 
    'employee_since' as name,
    'date'                as type,
    3                     as width,
    (select employee_since FROM prm2_sub_employees WHERE prm1_id = $prm1_id)  as value,
    'Employé depuis : (dans l''entreprise)'    as label;

SELECT 
    'employee_status'       as name,
    'Actif-Inactif (dans l''entreprise)'         as label,
    'select'                as type,
    3                       AS width,
    (select employee_status FROM prm2_sub_employees WHERE prm1_id = $prm1_id)  as value,
    'Choisir un statut...'  as empty_option,
    '[{"label": "En activité", "value": "active"},
    {"label": "Non en activité", "value": "inactive"},
    {"label": "Archivé", "value": "archived"}
    ]' as options;



