SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

select 
    'alert'                    as component,
    'Suppression de l''employé de la liste' as title,
    'analyze'                  as icon,
    'teal'                     as color,
    'Cette suppression n''entrainera pas la suppression de l''employé mais seulement celle de sa présence dans la liste des employés !' as description;

SET orga_dept_id=(select orga_dept_id from members where member_id=$member_id);

select 
    '/b_orga_dept/orga_dept_member_main_display_4.sql?orga_dept_id='||$orga_dept_id    as link,
    'Retour à la liste' as title,
    'secondary'    as color;

select 
    '/b_orga_dept/orga_dept_member_delete_0.sql?member_id='||$member_id  as link,
    'Retirer l''employé de la liste' as title;



