SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;


select 
    'alert'                    as component,
    'Supprimer un membre de l''prm2nisation' as title,
    'analyze'                  as icon,
    'teal'                     as color,
    TRUE                       as dismissible,
    'La suppression est irréversible. Si le membre est lié à des enregistrements dans plusieurs tables, il est préférable d''anonymiser son compte' as description;
select 
    '/d_prm1/prm1_main_delete_0.sql?prm1_id='||$prm1_id      as link,
    'alert-circle'       as icon,
    'Je confirme la suppression' as title,
    'red'    as color;
select 
    '/d_prm1/prm1_main_anonym_0.sql?prm1_id='||$prm1_id      as link,
    'Je ne supprime pas le membre mais j''anonymise son compte' as title,
    'alert-circle'       as icon,
    'green'    as color;
select 
    '/d_prm1/prm1_main_display_4.sql'    as link,
    'annulation'                         as title,
    'alert-circle'                        as icon,
    'yellow'                             as color;

    SET anonymous = select sqlpage.hash_password('anonymous');
    set prm1_id=$prm1_id;