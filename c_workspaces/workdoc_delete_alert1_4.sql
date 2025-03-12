SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

select 
    'alert'                    as component,
    'Supprimer un document du groupe de travail' as title,
    'analyze'                  as icon,
    'teal'                     as color,
    'La suppression est irréversible!' as description;
select 
    '/c_workspaces/workdoc_delete_0.sql?workdoc_id='||$workdoc_id||'&workspace_id='||$workspace_id      as link,
    'alert-circle'                as icon,
    'Je confirme la suppression'  as title,
    'red'                         as color;
select 
    '/c_workspaces/workdoc_display_4.sql?workspace_id='||$workspace_id   as link,
    'annulation'                         as title,
    'alert-circle'                        as icon,
    'yellow'                             as color;
