SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

select 
    'alert'     as component,
    'Validation du compte' as title,
    'Le membre &nbsp;  '  || $member_last_name || ' &nbsp; a été créé !
    
[retour à la liste des membres](/b_members/member_main_display_4.sql)' as description_md,
    'alert-triangle'            as icon,
    'green'                as color;



