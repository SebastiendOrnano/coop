SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

select 
    'alert'                    as component,
    'Suppression d''un membre du groupe' as title,
    'analyze'                  as icon,
    'teal'                     as color,
    'Cette suppression n''entrainera pas la suppression de l''utilisateur mais seulement celle de sa présence dans la liste des membres !' as description;

select 
    '/c_workspaces/workspace_participants_delete_0.sql?workspace_participant_id='||$workspace_participant_id||'&workspace_id='||$workspace_id  as link,
    'Retirer le membre du groupe'          as title,
    'red'                                  as color;

select 
    '/c_workspaces/workspace_participants_display_4.sql?workspace_id='||$workspace_id    as link,
    'Retour à la liste' as title,
    'green'    as color;

