SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;


select 
    'alert'                    as component,
    'Suppression d''une sprint!' as title,
    'analyze'                  as icon,
    'teal'                     as color,
    TRUE                       as dismissible,
    'Cette suppression entrainera la suppression de tous ses élements liés ! Par prudence, il vaut mieux choisir le statut ''archivé''' as description;
select 
'/e_project_products/product_main_delete_0.sql?product_id='||$product_id       as link,
    'Suppression' as title;
select 
'/e_project_products/product_main_display_4.sql'   as link,
    'Retour à la liste' as title,
    'secondary'    as color;



