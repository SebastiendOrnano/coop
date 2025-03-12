SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;


select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Superviseur'         as title,
    '/a_panels/panel_supervisor_4.sql' as link;
select 
    'Gestion des departements'            as title,
    '/d_prm2_sub/prm2_sub_main_display_4.sql?prm2_id='||$prm2_id  as link;
select 
    'Gestion des employés'            as title,
    '/d_prm2_sub_employees/prm2_sub_employee_main_display_4.sql?prm2_sub_id='||$prm2_sub_id  as link;


select 
    'title'     as component,
    'Structure employeuse'    as contents,
    3           as level;

SELECT 
    'form' as component,
    '' as validate;

select 
    'prm2_id' as name,
    'hidden' as type,
    $prm2_id as value,
    'id' as label;

select 
    'prm2_sub_id' as name,
    'hidden' as type,
    $prm2_sub_id as value,
    'id' as label;

SELECT
    'prm2_sub_name' as name,
    TRUE as readonly,
    'Nom de la filiale ou du département' as label,
     6 as width,
    (select prm2_sub_name  FROM prm2_sub WHERE prm2_sub_id = $prm2_sub_id) as value;

SELECT
    'prm2_name' as name,
    'text' as type,
    TRUE as readonly, 
    'Nom de la organisation mère' as label,
    6 as width,
    (select prm2_name  from prm2 WHERE prm2_id = $prm2_id) as value;

select 
    'title'     as component,
    'Liste des employés'    as contents,
    3           as level;

SELECT 
    'table'               AS component, 
    TRUE                  AS sort, 
    'View'                AS markdown, 
    TRUE                AS search;

SELECT
    e.employee_id                   AS id,
    p.prm1_first_name                 AS Prénom,
    P.prm1_last_name                 AS Nom,
    e.employee_function              AS Poste,
    e.employee_category              AS Categorie,
   '[View](/d_prm2_sub_employees/prm2_sub_employee_profile_display_4.sql?prm1_id='||e.prm1_id||'&prm2_sub_id='||$prm2_sub_id||')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Edit](/d_prm2_sub_employees/prm2_sub_employee_main_edit_4.sql?employee_id='||e.employee_id||'&prm2_sub_id='||$prm2_sub_id||') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Delete](/d_prm2_sub_employees/prm2_sub_employee_main_delete_alert1_4.sql?employee_id=' || e.employee_id ||'&prm2_sub_id='||$prm2_sub_id||')'    AS View
FROM prm1 as p
LEFT JOIN (SELECT employee_id, employee_function, employee_category, employee_status, prm2_sub_id, prm1_id FROM prm2_sub_employees) as e
ON p.prm1_id = e.prm1_id
WHERE e.prm2_sub_id = $prm2_sub_id AND e.employee_status !='active'
ORDER BY created_at ASC;