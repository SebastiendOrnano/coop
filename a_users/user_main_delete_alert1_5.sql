SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_5.sql') AS properties;


select 
    'alert'                    as component,
    'Supprimer un utilisateur' as title,
    'analyze'                  as icon,
    'teal'                     as color,
    TRUE                       as dismissible,
    'La suppression est irréversible. Si l''utilisateur est lié à des enregistrements dans plusieurs tables, il est préférable d''anonymiser son compte' as description;

select 
    '/a_users/user_main_delete_0.sql?user_id='||$user_id      as link,
    'alert-circle'       as icon,
    'Je confirme la suppression' as title,
    'red'    as color;

select 
    '/a_users/user_main_delete_anonym_0.sql?user_id='||$user_id      as link,
    'Je ne supprime pas l''utilisateur mais j''anonymise son compte' as title,
    'alert-circle'                                                   as icon,
    'green'                                                          as color;
    
select 
    '/a_users/user_main_display_5.sql'    as link,
    'annulation. retour à la liste'      as title,
    'alert-circle'                        as icon,
    'yellow'                             as color;

