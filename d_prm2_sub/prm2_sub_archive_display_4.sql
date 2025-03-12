SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

-- Link back to the process home page
SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
    CASE WHEN $user_role = 'supervisor' 
    THEN '/d_prm2/prm2_display_4.sql'
    ELSE '/d_prm2/prm2_display_1.sql'
END;

select 
    'button' as component,
    'sm'     as size;
select 
    $redirect_link     as link,
    'orange' as outline,
    'Retour à la liste des organisations'  as title,
    'corner-up-left-double'  as icon;

select 
    'divider' as component,
    'Nom de l''organisation mère'    as contents,
    'blue' as color;

select 
    'form'   as component,
    '' as validate;

SELECT
    'prm2_id' as name,
    TRUE as readonly,
    'Id ' as label,
    1 as width,
   $prm2_id as value;

SELECT
    'prm2_name' as name,
    TRUE as readonly,
    'Nom de l''organisation mère' as label,
    11 as width,
    (select prm2_name  FROM prm2 WHERE prm2_id = $prm2_id) as value;
 


select 
    'divider' as component,
    'Départements ou filiales'    as contents,
    'blue' as color;


SELECT 
    'table'               AS component, 
    'Départements ou filiales' AS title, 
    TRUE                  AS sort, 
    'View'                AS markdown, 
    FALSE                 AS search;

SELECT
    prm2_sub_id            AS Id,
    prm2_sub_name            AS Nom,
    prm2_sub_postal_code    AS CodePostal,
    prm2_sub_town           AS Ville,
   '[Doc](/d_prm2_sub_doc/prm2_sub_doc_display_4.sql?prm2_sub_id=' || prm2_sub_id ||  ') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Employe](/d_prm2_employee/prm2_sub_employee_main_display_4.sql?prm2_sub_id=' || prm2_sub_id ||  ') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Edit](/d_prm2_sub/prm2_sub_edit_4.sql?prm2_sub_id=' || prm2_sub_id ||  ') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Delete](/d_prm2_sub/prm2_sub_delete_0.sql?prm2_sub_id=' || prm2_sub_id ||')'    AS View
FROM prm2_sub
WHERE prm2_id = $prm2_id
ORDER BY created_at ASC;



set prm2_name=(select prm2_name  FROM prm2 WHERE prm2_id = $prm2_id);

select 
    'button' as component,
    'sm'     as size;
select 
    '/d_prm2_sub/prm2_sub_form_4.sql?prm2_id='||$prm2_id     as link,
    'green' as outline,
    TRUE as important,
    'Créer une nouveau département'  as title,
    'copy-plus'  as icon;


