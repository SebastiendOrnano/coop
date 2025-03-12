SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_5.sql') AS properties;


select 
    'alert'                    as component,
    'Supprimer des utilisateurs de l''organisation' as title,
    'analyze'                  as icon,
    'teal'                     as color,
    TRUE                       as dismissible,
    'La suppression est irréversible. Si les utilisateur sont liés à des enregistrements dans plusieurs tables,  
il est préférable d''anonymiser leurs comptes' as description_md;

select 
    '/b_users/user_select_delete_0.sql'     as link,
    'alert-circle'                              as icon,
    'Je confirme la suppression'                as title,
    'red'                                       as color;

select 
    '/b_users/user_select_anonym_0.sql'                       as link,
    'Je ne supprime pas le membre mais j''anonymise son compte'   as title,
    'alert-circle'                                                as icon,
    'green'                                                       as color;

select 
    '/b_users/user_select_display_5.sql'    as link,
    'annulation'                                as title,
    'alert-circle'                              as icon,
    'yellow'                                    as color;