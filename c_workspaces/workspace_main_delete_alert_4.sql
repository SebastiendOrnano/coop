SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

select 
    'alert'                    as component,
    'Supprimer un espace de travail' as title,
    'analyze'                  as icon,
    'teal'                     as color,
    TRUE                       as dismissible,
    'La suppression est irréversible et entrainera la suppression de tous éléments liés : documents, réunions... !  
Il est préférable de passer le statut de l''espace de travail à "archivé"' as description_md;

select 
    '/c_workspaces/workspace_main_delete_0.sql?workspace_id='||$workspace_id      as link,
    'alert-circle'       as icon,
    'Je confirme la suppression' as title,
    'red'    as color;

select 
    '/c_workspaces/workspace_main_close_0.sql?workspace_id='||$workspace_id     as link,
    'Je ne supprime pas le membre mais j''archive l''espace de travail' as title,
    'alert-circle'       as icon,
    'green'    as color;

select 
    '/c_workspaces/workspace_main_display_4.sql'     as link,
    'annulation'                         as title,
    'alert-circle'                        as icon,
    'red'                             as color;
