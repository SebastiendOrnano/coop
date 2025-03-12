SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

SELECT 'alert' as component,
    'Attention' as title,
    'Le couple prénom /nom de famille saisie est déjà utilisé.  
    Vérifier si la personne n''a pas déjà été créée. S''il s''agit d''un homonyme, utilisez 2 prénoms dans le champ prénom
[Reprenez votre saisie](/d_prm2_sub_employees/prm2_sub_employee_main_form2_4.sql?prm2_sub_id='||$prm2_sub_id||')' AS description_md,
    'alert-circle' as icon,
    'red' as color;
