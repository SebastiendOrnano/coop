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
    'Retour à la liste des projets'            as title,
    '/e_project/project_main_display_4.sql'     as link;
 select 
    'Retour au hub du projet'            as title,
    '/e_project/project_hub_display_4.sql?project_id='||$project_id     as link;   

select 
    'divider' as component,
    'Nom du projet de rattachement'    as contents,
    'blue' as color;


select 
    'chart'             as component,
    'pie'               as type,
    'green'             as color,
    'Répartition des coûts réel  du projet' as title,
    TRUE                as labels;
select 
    w.workpackage_type as label,
    SUM(e.expense_value)  as value
FROM project_workpackage_expenses as e
LEFT JOIN (select workpackage_id, workpackage_name, workpackage_type, project_id from project_workpackage) as w
ON e.workpackage_id=w.workpackage_id
LEFT JOIN (select project_id, project_name from project) as p
ON w.project_id=p.project_id
where p.project_id=$project_id
GROUP BY e. workpackage_id;






