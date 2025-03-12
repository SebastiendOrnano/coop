SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

select 
    'alert'     as component,
    'check'   as icon,
    'Confirmation de la création d''une filiale ou un départment' as title,
    'L''organisation &nbsp; &nbsp; : &nbsp;**' || (select orga_dept_name from orga_dept where orga_dept_id=$orga_dept_id) || '**&nbsp;&nbsp;filiale ou département de &nbsp;&nbsp; ***' || (select orga_name from orga where orga_id=$orga_dept_id) ||'***&nbsp;&nbsp; a été créé !  
    [retour à la liste des organisations](/b_orga/orga_display_4.sql)' as description_md,
    'green'                as color;



