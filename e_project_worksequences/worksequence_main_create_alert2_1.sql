SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_1.sql') AS properties;

SELECT 'alert' as component,
    'Attention' as title,
    'heure  de fin < heure de début ! [Reprenez votre saisie](/e_project_worksequences/worksequence_main_edit'||$suffix_role||'?worksequence_id='||$worksequence_id||')' AS description_md,
    'alert-circle' as icon,
    'red' as color;