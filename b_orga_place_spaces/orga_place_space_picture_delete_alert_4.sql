SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

SET space_id = (select space_id from place_spaces_pictures where space_picture_id = $space_picture_id) ;

select 
    'alert'                    as component,
    'Suppression d''une image!' as title,
    'analyze'                  as icon,
    'teal'                     as color,
    TRUE                       as dismissible,
    'Cette suppression est irréversible! Par prudence, il vaut mieux choisir le statut ''archivé''  ' as description;

select 
    '/b_orga_place_spaces/orga_place_space_picture_delete_0.sql?space_picture_id='||$space_picture_id      as link,   
    'Suppression'                                                                        as title;

select 
    '/b_orga_place_spaces/orga_place_space_picture_display_4.sql?space_id='||$space_id  as link,
    'Retour à la liste'                                                   as title,
    'secondary'                                                            as color;



