SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

select 
    'alert'                    as component,
    'Suppression d''organisation!' as title,
    'analyze'                  as icon,
    'teal'                     as color,
    TRUE                       as dismissible,
    'Cette suppression entrainera la suppression de tous ses départements ou filiale ! Par prudence, il vaut mieux choisir le statut ''archivé''' as description;
select 
    '/d_prm2/prm2_main_delete_0.sql?prm2_id='||$prm2_id        as link,
    'Suppression'                                         as title,
    'alert-circle'                                        as icon,
    'red'                                                 as color;

select 
    '/d_prm2/prm2_main_edit_4.sql?prm2_id='||$prm2_id       as link,
    'changer le statut'                                as title,
    'alert-circle'                                     as icon,
    'green'                                            as color; 

select 
    '/d_prm2/prm2_main_display_4.sql'    as link,
    'Retour à la liste'             as title,
    'arrow_left'                  as icon,
    'orange'                     as color;



