SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

SET prm2_id = select prm2_id from prm2_sub where prm2_sub_id = $prm2_sub_id;

select 
    'alert'                    as component,
    'Suppression des emploées' as title,
    'analyze'                  as icon,
    'teal'                     as color,
    'Vous pouvez soit retirer les personnes sélectionnées dans la liste des employés sans les supprimer de la liste des personnes physiques soit la supprimer complétement !' as description; 

select 
    '/d_prm2_sub_employees/prm2_sub_employee_select_display_4.sql?prm2_sub_id='||$prm2_sub_id||'&prm2_id='||$prm2_id    as link,
    'Retour à la liste' as title,
    'green'    as color;

select 
    '/d_prm2_sub_employees/prm2_sub_employee_select_remove_0.sql?prm2_sub_id='||$prm2_sub_id  as link,
    'Retirer les personnes de la liste des employés de l''entreprise' as title;

select 
    '/d_prm2_sub_employees/prm2_sub_employee_select_delete_alert2_4.sql?prm2_sub_id='||$prm2_sub_id  as link,
    'Supprimer définitivement les personnes' as title,
    'red'                                  as color;



