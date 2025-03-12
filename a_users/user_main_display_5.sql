SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_5.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Admin'         as title,
    '/a_panels/panel_admin_5.sql' as link;

select 
    'button'                              as component;
select 
    '/a_users/user_new_display_5.sql'     as link,
    'user-plus'                           as icon,
    'red'                                 as color,
    'Comptes en attente'                  as title;
select 
    '/a_users/user_archive_display_5.sql' as link,
    'archive'                             as icon,
    'blue'                                as color,
    'Comptes archivés/bloqués'            as title;
select 
    '/a_users/user_select_display_5.sql'  as link,
    'users-group'                         as icon,
    'green'                               as color,
    'Edition par lots'                    as title;
select 
    'user_main_csv_full_0.sql'            as link,
    'users-group'                         as icon,
    'yellow'                              as color,
    'Télécharger la liste'                as title;

select 
    'divider'              as component,
    'Liste des utilisateurs actifs' as contents,
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
WHERE user_id IS NOT NULL  AND user_status = 'active' AND user_role != '' AND user_role IS NOT NULL

ORDER BY created_at DESC;