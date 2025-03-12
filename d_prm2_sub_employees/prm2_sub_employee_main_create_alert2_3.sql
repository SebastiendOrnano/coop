SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;


SELECT 'alert' as component,
    'Attention' as title,
    'L''email saisie est déjà utilisé. Vérifier si cette personne n''a pas déjà été créée. Si 2 adhérents partagent le même email, il faut leur demander d''utiliser des emails différents. *(NB : il est parfois possible de créer plusieurs alias sur un même compte mail)
[Reprenez votre saisie](/d_prm2_sub_employees/prm2_sub_employee_main_form2_3.sql?prm2_sub_id='||$prm2_sub_id||')' AS description_md,
    'alert-circle' as icon,
    'red' as color;
