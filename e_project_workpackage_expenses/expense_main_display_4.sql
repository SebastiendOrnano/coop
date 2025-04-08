SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

set workpackage_name = select workpackage_name from project_workpackage where workpackage_id = $workpackage_id;
set project_id = select project_id from project_workpackage where workpackage_id = $workpackage_id;


select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Superviseur'         as title,
    '/a_panels/panel_supervisor_4.sql' as link;
 select 
    'Projets'            as title,
    '/e_project/project_main_display_4.sql'     as link;
 select 
    'Hub projet'            as title,
    '/e_project/project_hub_display_4.sql?project_id='||$project_id   as link;
 select 
    'Hub lot de travaux'            as title,
    '/e_project_workpackage/workpackage_hub_display_4.sql?workpackage_id='||$workpackage_id     as link;

    

select 
    'datagrid'              as component,
    'panel_project_display' as id;
select 
    '/e_project_workpackage_expenses/expense_main_form_4.sql?workpackage_id='||$workpackage_id     as link,
    'Création d''une dépense'                  as description,
    'tax-euro'                                      as icon,
    'yellow'                                         as color;
select 
    '/e_project_workpackage_expenses/expense_archive_display_4.sql?workpackage_id='||$workpackage_id             as link,
    'Visualiser les dépenses achivées'           as description,
    'archive'                                     as icon,
    'green'                                              as color;


select 
    'divider' as component,
    'Liste des dépenses du lot de travaux : '||$workpackage_name    as contents,
    'blue' as color;

SELECT 
    'table'               AS component, 
    'Liste des dépenses du lot de travaux : '||$workpackage_name AS title, 
    TRUE                  AS sort, 
    'View'                AS markdown,
    'Inv'                AS markdown, 
    FALSE                 AS search;

SELECT
    e.expense_id              AS Id,
    '['|| e.expense_id||']('||e.expense_invoice_url||')'    AS Inv,
    e.expense_name            AS Nom,
    e.expense_invoice_date            AS Date,
    e.expense_category        as Type,
    e.expense_value           as Price,
    p.prm2_name                as Fournisseur,
'[Edit](/e_project_workpackage_expenses/expense_main_edit_4.sql?expense_id=' 
||e.expense_id|| 
') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Delete](/e_project_workpackage_expenses/expense_main_delete_alert_4.sql?expense_id=' 
||e.expense_id||
')'    AS View
FROM project_workpackage_expenses as e
LEFT JOIN (select prm2_id, prm2_name from prm2) as p
on e.provider_id = p.prm2_id
LEFT JOIN (select workpackage_id, workpackage_name, workpackage_type, project_id from project_workpackage) as w
ON e.workpackage_id=w.workpackage_id
WHERE e.expense_status='active' and w.workpackage_id=$workpackage_id
ORDER BY e.expense_category ASC;

