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
    '/b_orga/orga_main_display_4.sql'      as link;

select 
    'divider' as component,
    'Nom de l''organisation mère'    as contents,
    'blue' as color;

select 
    'form'   as component,
    '' as validate;

SELECT
    'orga_id' as name,
    TRUE as readonly,
    'Id ' as label,
    1 as width,
   $orga_id as value;

SELECT
    'orga_name' as name,
    TRUE as readonly,
    'Nom de l''organisation mère' as label,
    11 as width,
    (select orga_name  FROM orga WHERE orga_id = $orga_id) as value;
 
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
    orga_dept_id            AS Id,
    orga_dept_rank          AS Rank,
    orga_dept_name            AS Nom,
    orga_dept_postal_code    AS CodePostal,
    orga_dept_town           AS Ville,
'[Doc](/b_orga_dept/orga_dept_doc_display_4.sql?orga_dept_id=' 
||orga_dept_id||
') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Employe](/b_orga_dept/orga_dept_member_display_4.sql?orga_dept_id=' 
||orga_dept_id||
  ') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Edit](/b_orga_dept/orga_dept_main_edit_4.sql?orga_dept_id=' 
||orga_dept_id|| 
') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Delete](/b_orga_dept/orga_dept_main_delete_alert_4.sql?orga_dept_id=' 
||orga_dept_id||
')'    AS View
FROM orga_dept
WHERE orga_id = $orga_id
ORDER BY orga_dept_id ASC;



set orga_name=(select orga_name  FROM orga WHERE orga_id = $orga_id);

select 
    'button' as component,
    'sm'     as size;
select 
    '/b_orga_dept/orga_dept_main_form_4.sql?orga_id='||$orga_id     as link,
    'green' as outline,
    TRUE as important,
    'Créer une nouveau département'  as title,
    'copy-plus'  as icon;


