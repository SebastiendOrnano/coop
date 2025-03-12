SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

select 
    'alert'                    as component,
    'Suppression d''un document de la liste' as title,
    'analyze'                  as icon,
    'teal'                     as color,
    'Cette suppression n''entrainera pas la suppression du document mais seulement celle de sa présence dans la liste des documents !' as description;



select 
    '/d_prm2_sub_doc/prm2_sub_doc_display_4.sql?prm2_sub_id='||$prm2_sub_id    as link,
    'Retour à la liste des docs' as title,
    'secondary'    as color;

    select 
    '/d_prm2_sub_doc/prm2_sub_doc_delete_0.sql?prm2_sub_doc_id='||$prm2_sub_doc_id  as link,
    'Retirer le document de la liste' as title;



