SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

SET prm2_id = select prm2_id from prm2_sub where prm2_sub_id = $prm2_sub_id;



select 
    'alert'                    as component,
    'Actualisation d''une sélection d''employée' as title,
    'analyze'                  as icon,
    'teal'                     as color,
    'Vous n''avez sélection aucun employé !' as description; 

select 
    '/d_prm2_sub_employees/prm2_sub_employee_select_no_0.sql?prm2_sub_id='||$prm2_sub_id||'&prm2_id='||$prm2_id   as link,
    'Retour à la liste' as title,
    'green'    as color;




