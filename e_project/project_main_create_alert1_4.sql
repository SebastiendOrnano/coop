SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

SELECT 'alert' as component,
    'Attention' as title,
    'Il existe déjà un projet avec ce nom. Choississez un autre nom.  
[Reprenez votre saisie](/e_project/project_main_form_4.sql)' AS description_md,
    'alert-circle' as icon,
    'red' as color;
