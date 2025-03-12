SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

SET prm2_id = (select prm2_id FROM prm2_sub  where prm2_sub_id=$prm2_sub_id);

select 
    'alert'                    as component,
    'Supprimer un département de l''organisation' as title,
    'analyze'                  as icon,
    'teal'                     as color,
    TRUE                       as dismissible,
    'La suppression est irréversible et entrainera la suppression de tous les employés et documents liés au département !  
Il est préférable de passer le statut du département à "archive"' as description_md;

select 
    '/d_prm2_sub/prm2_sub_main_delete_0.sql?prm2_sub_id='||$prm2_sub_id      as link,
    'alert-circle'       as icon,
    'Je confirme la suppression' as title,
    'red'    as color;

select 
    '/d_prm2_sub/prm2_sub_main_edit_4.sql?prm2_sub_id='||$prm2_sub_id     as link,
    'Je ne supprime pas le membre mais je change le statut' as title,
    'alert-circle'       as icon,
    'green'    as color;

select 
    '/d_prm2_sub/prm2_sub_main_display_4.sql?prm2_id='||$prm2_id     as link,
    'annulation'                         as title,
    'alert-circle'                        as icon,
    'red'                             as color;
