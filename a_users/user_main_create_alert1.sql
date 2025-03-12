SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell.sql') AS properties;


SELECT 'alert' as component,
    'Attention' as title,
    'Ce nom d''utilisateur ou l''email est déjà utilisé. Veuillez en choisir un autre !
    [Reprenez votre saisie](/a_users/user_main_form.sql)  ' AS description_md,
    'alert-circle' as icon,
    'red' as color;