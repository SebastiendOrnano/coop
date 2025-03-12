SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_5.sql') AS properties;

  set topic_id=$topic_id;

select 
    'alert'                    as component,
    'Supprimer une discussion' as title,
    'analyze'                  as icon,
    'teal'                     as color,
    TRUE                       as dismissible,
    'La suppression est irréversible et elle entraîne la suppression de tous les forum_messages liés au sujet initial. Il est préférable d''archivedr la discussion' as description;

select 
    '/c_debug/debug_main_delete_0.sql?topic_id='||$topic_id      as link,
    'alert-circle'       as icon,
    'Je confirme la suppression' as title,
    'red'    as color;

select 
    '/c_debug/debug_main_archive_0.sql?topic_id='||$topic_id      as link,
    'J''archive la discussion' as title,
    'alert-circle'       as icon,
    'green'    as color;

select 
    '/c_debug/debug_main_display_5.sql'       as link,
    'Annulation'                         as title,
    'alert-circle'                       as icon,
    'yellow'                             as color;


  