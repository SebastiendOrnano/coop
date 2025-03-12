SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

select 
    'alert'                    as component,
    'Suppression d''un événement!' as title,
    'analyze'                  as icon,
    'teal'                     as color,
    TRUE                       as dismissible,
    'Cette suppression entrainera la suppression de tous ses départements ou filiale ! Par prudence, il vaut mieux choisir le statut ''archivé''' as description;
select 
    '/b_events/event_main_delete_0.sql?event_id='||$event_id       as link,
    'Suppression' as title;
select 
    '/b_events/event_main_display_4.sql'    as link,
    'Retour à la liste' as title,
    'secondary'    as color;



