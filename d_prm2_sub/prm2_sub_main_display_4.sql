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
    'Gestion des organisations'            as title,
    '/d_prm2/prm2_main_display_4.sql'      as link;

select 
    'divider' as component,
    'Nom de l''organisation mère'    as contents,
    'blue' as color;

select 
    'form'   as component,
    '' as validate;

SELECT
    'prm2_id' as name,
    TRUE as readonly,
    'Id ' as label,
    1 as width,
   $prm2_id as value;

SELECT
    'prm2_name' as name,
    TRUE as readonly,
    'Nom de l''organisation mère' as label,
    11 as width,
    (select prm2_name  FROM prm2 WHERE prm2_id = $prm2_id) as value;
 
select 
    'divider' as component,
    'Départements ou filiales'    as contents,
    'blue' as color;



SELECT 
    'table'               AS component, 
    'Départements ou filiales' AS title, 
    TRUE                  AS sort, 
    'View'                AS markdown, 
    FALSE                 AS search;

SELECT
    prm2_sub_id            AS Id,
    prm2_sub_name            AS Nom,
    prm2_sub_postal_code    AS CodePostal,
    prm2_sub_town           AS Ville,
'[View](/d_prm2_sub/prm2_sub_main_view_4.sql?prm2_sub_id=' 
||prm2_sub_id||
') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
[Doc](/d_prm2_sub_doc/prm2_sub_doc_main_display_4.sql?prm2_sub_id=' 
||prm2_sub_id||
') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Employees](/d_prm2_sub_employees/prm2_sub_employee_main_display_4.sql?prm2_sub_id=' 
||prm2_sub_id||
  ') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Edit](/d_prm2_sub/prm2_sub_main_edit_4.sql?prm2_sub_id=' 
||prm2_sub_id||
') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Delete](/d_prm2_sub/prm2_sub_main_delete_alert_4.sql?prm2_sub_id=' 
||prm2_sub_id||')'    AS View
FROM prm2_sub
WHERE prm2_id = $prm2_id
ORDER BY prm2_sub_id ASC;



set prm2_name=(select prm2_name  FROM prm2 WHERE prm2_id = $prm2_id);

select 
    'button' as component,
    'sm'     as size;
select 
    '/d_prm2_sub/prm2_sub_main_form_4.sql?prm2_id='||$prm2_id     as link,
    'green' as outline,
    TRUE as important,
    'Créer une nouveau département'  as title,
    'copy-plus'  as icon;


