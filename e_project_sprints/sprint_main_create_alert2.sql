SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;


SELECT 'alert' as component,
    'Attention' as title,
    'La date de fin réelle est antérieure à la date de début réelle
    [Reprenez votre saisie](/e_project_sprints/sprint_main_edit_4.sql?sprint_id='||$sprint_id||')' AS description_md,
    'alert-circle' as icon,
    'red' as color;