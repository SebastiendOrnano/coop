SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

select 
    'alert'     as component,
    'check'   as icon,
    'Confirmation de la création d''une filiale ou un départment' as title,
    'L''organisation &nbsp; &nbsp; : &nbsp;**' || (select prm2_sub_name FROM prm2_sub where prm2_sub_id=$prm2_sub_id) || '**&nbsp;&nbsp;filiale ou département de &nbsp;&nbsp; ***' || (select prm2_name FROM prm2 where prm2_id=$prm2_sub_id) ||'***&nbsp;&nbsp; a été créé !  
    [retour à la liste des organisations](/d_prm2/prm2_display_4.sql)' as description_md,
    'green'                as color;



