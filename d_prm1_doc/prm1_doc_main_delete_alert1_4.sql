SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

set prm1_doc_id=$prm1_doc_id;

select 
    'alert'                    as component,
    'Supprimer un document l''prm1nisation' as title,
    'analyze'                  as icon,
    'teal'                     as color,
    TRUE                       as dismissible,
    'La suppression est irréversible!' as description;
select 
    '/d_prm1_doc/prm1_doc_main_delete_0.sql?prm1_doc_id='||$prm1_doc_id      as link,
    'alert-circle'       as icon,
    'Je confirme la suppression' as title,
    'red'    as color;

select 
    '/d_prm1_doc/prm1_doc_main_display_4.sql'    as link,
    'annulation'                         as title,
    'alert-circle'                        as icon,
    'yellow'                             as color;
