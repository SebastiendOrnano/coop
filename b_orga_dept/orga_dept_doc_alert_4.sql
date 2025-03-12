SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

select 
    'alert'                    as component,
    'Suppression d''un document de la liste' as title,
    'analyze'                  as icon,
    'teal'                     as color,
    'Cette suppression n''entrainera pas la suppression du document mais seulement celle de sa présence dans la liste des documents !' as description;



select 
    '/b_orga_doc/orga_dept_doc_display_4.sql?orga_dept_id='||$orga_dept_id    as link,
    'Retour à la liste des docs' as title,
    'secondary'    as color;

    select 
    '/b_orga_doc/orga_dept_doc_delete_0.sql?orga_doc_id='||$orga_doc_id  as link,
    'Retirer le document de la liste' as title;



