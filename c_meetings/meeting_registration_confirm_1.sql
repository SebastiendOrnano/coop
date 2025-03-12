SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_1.sql') AS properties;

select 
    'alert'                                              as component,
    'Confirmation'                                       as title,
    'Votre inscription a bien été prise en compte !
    
[retour à la liste des événements](/c_meetings/meeting_main_list_1.sql)' as description_md,
    'alert-triangle'                                      as icon,
    'green'                                               as color;



