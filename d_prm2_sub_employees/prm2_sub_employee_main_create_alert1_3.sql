SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

SET redirect_link = '/d_prm2_sub_employees/prm2_sub_employee_main_form2_3.sql?prm2_sub_id='||$prm2_sub_id;

SELECT 'alert' as component,
    'Attention' as title,
    'Le couple prénom /nom de famille saisie est déjà utilisé.  
    Vérifier si la personne n''a pas déjà été créée. S''il s''agit d''un homonyme, utilisez 2 prénoms dans le champ prénom
[Reprenez votre saisie]('||$redirect_link||')' AS description_md,
    'alert-circle' as icon,
    'red' as color;
