SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_1.sql') AS properties;


SELECT 'alert' as component,
    'Attention' as title,
    'Cet email déjà utilisé. Veuillez en choisir un autre !
    [Reprenez votre saisie](/a_users_update/user_email_form_1.sql)  ' AS description_md,
    'alert-circle' as icon,
    'red' as color;