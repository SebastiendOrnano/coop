SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;



set project_id=select project_id from project_workpackage where workpackage_id=$workpackage_id ;
SET project_name = select project_name FROM project where project_id=$project_id;

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
    ' hub du projet'            as title,
    '/e_project/project_hub_display_4.sql?project_id='||$project_id     as link; 
select 
    'Hub lot de travaux'            as title,
    '/e_project_workpackage/workpackage_hub_display_4.sql?workpackage_id='||$workpackage_id     as link;
 select 
    'Gestion matériaux'            as title,
    '/e_project_workpackage_materials/material_main_display_4.sql?workpackage_id='||$workpackage_id as link;
select 
    'form'   as component,
    '' as validate;
SELECT
    'project_id' as name,
    TRUE as readonly,
    'Id ' as label,
    1 as width,
   $project_id as value;

SELECT
    'project_nme_name' as name,
    TRUE as readonly,
    'Nom de la tranche de travaux de rattachement' as label,
    5 as width,
    (select project_name  from project WHERE project_id = $project_id) as value;
SELECT
    'workpackage_id' as name,
    TRUE as readonly,
    'Id ' as label,
    1 as width,
   $workpackage_id as value;

SELECT
    'workpackage_name' as name,
    TRUE as readonly,
    'Nom de la tranche de travaux de rattachement' as label,
    5 as width,
    (select workpackage_name  from project_workpackage WHERE workpackage_id = $workpackage_id) as value;

SET workpackage_cost_actual = SELECT SUM(expense_value) from project_workpackage_expenses where  workpackage_id=$workpackage_id;

select  'text' as component;
select 'Coût de la tranche de travaux :  '||$workpackage_cost_actual||' euros' as contents_md

select 
    'chart'             as component,
    'pie'               as type,
    'green'             as color,
    'Répartition des coûts réel  du projet par type dépenses' as title,
    TRUE                as labels;

select 
    'type de dépenses'  as series,
    e.expense_category as label,
    SUM(e.expense_value)  as value
FROM project_workpackage_expenses as e
LEFT JOIN (select workpackage_id, workpackage_name, workpackage_type, project_id from project_workpackage) as w
ON e.workpackage_id=w.workpackage_id
LEFT JOIN (select project_id, project_name from project) as p
ON w.project_id=p.project_id
where w.workpackage_id=$workpackage_id and e.expense_category ="tools"
GROUP BY e.expense_category;

select 
   'type de dépenses'  as series,
    e.expense_category as label,
    SUM(e.expense_value)  as value
FROM project_workpackage_expenses as e
LEFT JOIN (select workpackage_id, workpackage_name, workpackage_type, project_id from project_workpackage) as w
ON e.workpackage_id=w.workpackage_id
LEFT JOIN (select project_id, project_name from project) as p
ON w.project_id=p.project_id
where w.workpackage_id=$workpackage_id and e.expense_category ="materials"
GROUP BY e.expense_category;

select 
   'type de dépenses'  as series,
    e.expense_category as label,
    SUM(e.expense_value)  as value
FROM project_workpackage_expenses as e
LEFT JOIN (select workpackage_id, workpackage_name, workpackage_type, project_id from project_workpackage) as w
ON e.workpackage_id=w.workpackage_id
LEFT JOIN (select project_id, project_name from project) as p
ON w.project_id=p.project_id
where w.workpackage_id=$workpackage_id and e.expense_category ="contracts"
GROUP BY e.expense_category;


SET MinDate = select MIN(expense_invoice_date) 
 FROM project_workpackage_expenses as e
LEFT JOIN (select workpackage_id, workpackage_name, workpackage_type, project_id from project_workpackage) as w
ON e.workpackage_id=w.workpackage_id
LEFT JOIN (select project_id, project_name from project) as p
ON w.project_id=p.project_id
where w.workpackage_id=$workpackage_id;

SET MaxDate = select MAX(expense_invoice_date) 
FROM project_workpackage_expenses as e
LEFT JOIN (select workpackage_id, workpackage_name, workpackage_type, project_id from project_workpackage) as w
ON e.workpackage_id=w.workpackage_id
LEFT JOIN (select project_id, project_name from project) as p
ON w.project_id=p.project_id
where w.workpackage_id=$workpackage_id;


select 
    'chart'             as component,
    'bar'               as type,
    'green'             as color,
    'Répartition des coûts par mois' as title,
    TRUE                as labels;

WITH dates(d) AS
(
    SELECT $MinDate

    UNION ALL

    SELECT DATE(d, '+1 MONTH') 
    FROM dates
    where d < $MaxDate
)

SELECT
    strftime('%Y-%m', e.expense_invoice_date) AS label,
    SUM(e.expense_value)                      AS value
FROM project_workpackage_expenses AS e
JOIN dates ON strftime('%Y-%m', e.expense_invoice_date) = strftime('%Y-%m', dates.d)
LEFT JOIN (select workpackage_id, workpackage_name, workpackage_type, project_id from project_workpackage) as w
ON e.workpackage_id=w.workpackage_id
LEFT JOIN (select project_id, project_name from project) as p
ON w.project_id=p.project_id
where w.workpackage_id=$workpackage_id
GROUP BY label
ORDER BY value DESC;
