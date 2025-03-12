SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_5.sql') AS properties;

select 
    'alert'                    as component,
    'Vider le log des sessions' as title,
    'analyze'                  as icon,
    'teal'                     as color,
    TRUE                       as dismissible,
    'La suppression est irréversible. Il ne sera plus possible d''effectuer des statistiques !' as description;
select 
    '/a_sessions/session_purge_0.sql'      as link,
    'alert-circle'                         as icon,
    'Je confirme la suppression'           as title,
    'red'                                  as color;
select 
    '/a_panels/panel_admin_5.sql'    as link,
    'annulation'                         as title,
    'alert-circle'                        as icon,
    'yellow'                             as color;
