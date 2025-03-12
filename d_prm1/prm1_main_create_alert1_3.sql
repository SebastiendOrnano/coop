SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

SELECT 'alert' as component,
    'Attention' as title,
    'Le couple prénom /nom de famille saisie est déjà utilisé.  
    Vérifier si cette personne n''a pas déjà été créé. S''il s''agit d''un homonyme, utilisez 2 prénoms dans le champ prénom
[Reprenez votre saisie](/d_prm1/prm1_main_form_3.sql)' AS description_md,
    'alert-circle' as icon,
    'red' as color;
