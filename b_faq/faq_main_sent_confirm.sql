SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell.sql') AS properties;


select
    'alert'                    as component,
    'Votre message a été envoyé!' as title,
    'analyze'                  as icon,
    'teal'                     as color,
    TRUE                       as dismissible,
    'Merci pour votre contribution' as description;

select 
    '/'    as link,
    'Retour au site' as title,
    'secondary'    as color;

