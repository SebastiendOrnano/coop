SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

SET prm2_id = select prm2_id from prm2_sub where prm2_sub_id = $prm2_sub_id;

select 
    'alert'                    as component,
    'Suppression de l''employé de la liste' as title,
    'analyze'                  as icon,
    'teal'                     as color,
    'En supprimer complétement une personne vous supprimer aussi tous les documents liés et si cette personne est personne est membre d''une équipe cela peut aussi bloquer celle-ci. par prudence vous pouvez soit l''archiver soit l''anonymiser' as description; 

select 
    '/d_prm2_sub_employees/prm2_sub_employee_main_display_4.sql?prm2_sub_id='||$prm2_sub_id||'&prm2_id='||$prm2_id    as link,
    'Retour à la liste' as title,
    'green'    as color;

select 
    '/d_prm2_sub_employees/prm2_sub_employee_main_delete_0.sql?employee_id='||$employee_id||'&prm2_sub_id='||$prm2_sub_id  as link,
    'Supprimer définitivement la personne' as title,
    'red'                                  as color;

select 
    '/d_prm2_sub_employees/prm2_sub_employee_main_archive_0.sql?employee_id='||$employee_id||'&prm2_sub_id='||$prm2_sub_id  as link,
    'Archiver la personne'                 as title,
    'blue'                                  as color;

select 
    '/d_prm2_sub_employees/prm2_sub_employee_main_anonym_0.sql?employee_id='||$employee_id||'&prm2_sub_id='||$prm2_sub_id  as link,
    'anonymiser la personne'                as title,
    'green'                                  as color;



