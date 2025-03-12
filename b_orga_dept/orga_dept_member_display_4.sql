SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

SET orga_id= SELECT orga_id from orga_dept where orga_dept_id=$orga_dept_id;
SET orga_dept_id=$orga_dept_id;

-- Link back to the process home page
SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
    CASE WHEN $user_role = 'supervisor' 
    THEN '/b_orga_dept/orga_dept_main_display_4.sql?orga_id='||$orga_id
    ELSE '/b_orga_dept/orga_dept_main_display_1.sql?orga_id='||$orga_id
END;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Superviseur'         as title,
    '/a_panels/panel_supervisor_4.sql' as link;

select 
    'Gestion des departements'            as title,
     '/b_orga_dept/orga_dept_main_display_4.sql?orga_id='||$orga_id  as link;


select 
    'title'     as component,
    'Structure employeuse'    as contents,
    3           as level;

SELECT 
    'form' as component,
    '' as validate;

select 
    'orga_id' as name,
    'hidden' as type,
    $orga_id as value,
    'id' as label;

select 
    'orga_dept_id' as name,
    'hidden' as type,
    $orga_dept_id as value,
    'id' as label;

SELECT
    'orga_dept_name' as name,
    TRUE as readonly,
    'Nom de la filiale ou du département' as label,
     6 as width,
    (select orga_dept_name  FROM orga_dept WHERE orga_dept_id = $orga_dept_id) as value;

SELECT
    'orga_name' as name,
    'text' as type,
    TRUE as readonly, 
    'Nom de la organisation mère' as label,
    6 as width,
    (select orga_name  FROM orga WHERE orga_id = $orga_id) as value;

select 
    'title'     as component,
    'Liste des employés'    as contents,
    3           as level;

SELECT 
    'table'               AS component, 
    TRUE                  AS sort, 
    'View'                AS markdown, 
    TRUE                AS search;

SELECT
    member_first_name            AS Prénom,
    member_last_name             AS Nom,
    member_function              AS Poste,
   '[View](/b_members/member_dept_profile_complete_4.sql?member_id=' || member_id ||  ') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Edit](/b_members/member_dept_edit_4.sql?member_id=' || member_id ||'&orga_dept_id='||$orga_dept_id||') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Delete](/b_orga_dept/orga_dept_member_alert_4.sql?member_id=' || member_id ||')'    AS View
FROM members
WHERE orga_dept_id = $orga_dept_id
ORDER BY created_at ASC;

select 
    'title'   as component,
    'Ajouter un employé' as contents,
    3         as level;

-- Form for replying to the topic



SELECT 
    'form'      AS component,
    'Ajouter un employé' as validate,
     '/b_orga_dept/orga_dept_member_update_0.sql?member_id='||:member_id AS action;

select 
    'orga_id' as name,
    'hidden' as type,
     $orga_id as value,
    'orga_id' as label;

select 
    'orga_dept_id' as name,
    'hidden' as type,
    $orga_dept_id as value,
    'dept_id' as label;

select 
   'member_id' as name,
    'Nom de l''empoyé' as label,
    'select' as type,
    6 AS width,
    TRUE as searchable,
    'Saisissez quelques lettres du nom que vous cherchez ou choississez dans la liste' as empty_option,
    json_group_array(json_object('label', member_last_name || '   ' || member_first_name, 'value', member_id)) AS options
    FROM (
    SELECT member_last_name, member_first_name, member_id
    FROM members WHERE orga_dept_id is NULL or orga_dept_id=''
    ORDER BY member_last_name ASC, member_first_name ASC
    );