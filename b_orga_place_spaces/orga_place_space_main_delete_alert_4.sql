SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

SET place_id = (select place_id from place_spaces where space_id = $space_id) ;


select 
    'alert'                    as component,
    'Suppression d''une salle!' as title,
    'analyze'                  as icon,
    'teal'                     as color,
    TRUE                       as dismissible,
    'Cette suppression entrainera la suppression de tous ses élements liés ! Par prudence, il vaut mieux choisir le statut ''archivé''' as description;
select 
'/b_orga_place_spaces/orga_place_space_main_delete_0.sql?space_id='||$space_id       as link,
    'Suppression' as title;
select 
'/b_orga_place_spaces/orga_place_space_main_display_4.sql?place_id='||$place_id    as link,
    'Retour à la liste' as title,
    'secondary'    as color;



