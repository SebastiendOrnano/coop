SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_5.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Admin'            as title,
    '/a_panels/panel_admin_5.sql' as link;
 select 
    'Retour Gestion des utilisateur actifs'         as title,
    '/a_users/user_main_display_5.sql'              as link;

select 
    'divider'              as component,
    'Liste des utilisateurs en attente' as contents,
    'left'                 as position,
    'black'                as color;


-- Display list of users
SELECT 'table' AS component, 
    'Liste des utilisateur'   AS title, 
    'View'                    AS markdown,
    TRUE                      AS sort, 
    TRUE                      AS search;

SELECT       
    user_id        AS Id,
    username       AS Nom,
    user_status    AS Statut,
    user_role      AS Droits,
    user_group     AS Groupe,
    user_level     AS Data,
    user_email     AS Email,
   '[Rights](/a_users/user_main_edit_5.sql?user_id=' || users.user_id || ')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Delete](user_main_delete_alert1_5.sql?user_id=' || users.user_id || ')'    AS View
FROM users
WHERE user_status IS NULL OR user_status = '' OR user_role = '' OR user_role IS NULL

ORDER BY created_at DESC;