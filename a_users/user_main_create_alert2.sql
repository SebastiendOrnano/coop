SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell.sql') AS properties;


SELECT 'alert' as component,
    'Attention' as title,
    'Le mot de passe de confirmation ne correspond pas à votre première saisie
  [Reprenez votre saisie](/a_users/user_main_form.sql)  ' AS description_md,
    'alert-circle' as icon,
    'red' as color;