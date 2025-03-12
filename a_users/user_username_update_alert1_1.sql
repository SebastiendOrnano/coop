SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_1.sql') AS properties;


SELECT 'alert' as component,
    'Attention' as title,
    'Le nom d''ulisateur que vous avez saisi est déjà utilisé, veuillez en choisir un autre
    [Reprenez votre saisie](/a_users/user_username_form_1.sql)  ' AS description_md,
    'alert-circle' as icon,
    'red' as color;