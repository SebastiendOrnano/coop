SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;




select 
    'alert'                    as component,
    'Supprimer un document l''organisation' as title,
    'analyze'                  as icon,
    'teal'                     as color,
    TRUE                       as dismissible,
    'La suppression est irréversible!' as description;
select 
    '/d_prm2_sub_doc/prm2_sub_doc_main_delete_0.sql?prm2_sub_doc_id='||$prm2_sub_doc_id||'&prm2_sub_id='||$prm2_sub_id     as link,
    'alert-circle'       as icon,
    'Je confirme la suppression' as title,
    'red'    as color;

select 
    '/d_prm2_sub_doc/prm2_sub_doc_main_display_4.sql?prm2_sub_id='||$prm2_sub_id    as link,
    'annulation'                         as title,
    'alert-circle'                        as icon,
    'yellow'                             as color;
