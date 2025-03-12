SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_5.sql') AS properties;

-- selection panel

SELECT 
    'alert'                    as component,
    'teal'                     as color,
     3 as width,
    'Sélectionner d''abord les utilisateur puis appliquer le traitement choisi' as description;

SELECT
    'datagrid'                                                 as component,
    'panel_user_display'                                       as id,
    'Traitements sur une sélection membres de l''organisation' as title;

SELECT 
    '/a_panels/panel_admin_5.sql'        as link,
    'Retour au tableau de bord admin'    as description,
    'corner-down-left-double'            as icon,
    'red'                                as color;

SELECT
    '/a_users/user_main_display_5.sql'        as link,
    'Retour à la liste des utilisateurs'      as description,
    'corner-down-left'                        as icon,
    'blue'                                    as color;

SELECT
    '/a_users/user_select_no_0.sql'                   as link,
    'corner-down-left'                                as icon,
    'yellow'                                          as color,
    'annuler la sélection'                            as description;

SELECT
    '/a_users/user_select_edit_5.sql'                      as link,
    'Actualiser la liste des utilisateurs sélectionnés'    as description,
    'user-plus'                                            as icon,
    'green'                                                as color;

SELECT
    '/a_users/user_select_csv_full_0.sql'                    as link,
    'Télécharger la liste des utilisateurs sélectionnés'     as description,
    'user-plus'                                              as icon,
    'orange'                                                 as color,
    'rechargez la page après l''export des données'         as tooltip;

SELECT
    '/a_users/user_select_csv_email_0.sql'                         as link,
    'Télécharger email-téléphone des utilisateurs sélectionnés'    as description,
    'user-plus'                                                    as icon,
    'green'                                                        as color,
    'rechargez la page après l''export des données'                as tooltip;


-- table de sélection des membres 

SELECT 'table' AS component, 
    'Liste des utilisateurs'   AS title, 
    'View'           AS markdown,
    'download_selection_table' as id,
    TRUE             AS sort, 
    TRUE             AS search;
SELECT  
    username         AS NomUtilisateur,
    user_last_name   AS Nom,
    user_first_name  AS Prénom,
    user_email       AS email,
    user_status      AS status,
    user_selected    as selected,
   '[select / unselect](/a_users/user_select_yes_0.sql?user_id=' || user_id ||')'  AS View
FROM users
WHERE user_last_name IS NOT NULL
ORDER BY created_at DESC;




