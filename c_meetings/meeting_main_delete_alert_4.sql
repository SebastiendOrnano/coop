SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

select 
    'alert'                    as component,
    'Supprimer un événement'   as title,
    'analyze'                  as icon,
    'red'                      as color,
    TRUE                       as dismissible,
    'La suppression est irréversible et entrainera la suppression de tous éléments liés : documents... !  
Il est préférable de passer le statut de l''espace de travail à "archivé"' as description_md;

select 
    '/c_meetings/meeting_main_delete_0.sql?event_id='||$event_id      as link,
    'alert-circle'                                                        as icon,
    'Je confirme la suppression'                                          as title,
    'red'                                                                 as color;

select 
    '/c_meetings/meeting_main_archive_0.sql?event_id='||$event_id    as link,
    'Je ne supprime pas le meeting mais je l''archive'                   as title,
    'alert-circle'                                                       as icon,
    'green'                                                             as color;

select 
    '/c_meetings/meeting_main_display_4.sql'    as link,
    'annulation'                                as title,
    'alert-circle'                              as icon,
    'red'                                       as color;
