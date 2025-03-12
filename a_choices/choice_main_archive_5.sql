SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_5.sql') AS properties;

select 
    'datagrid'              as component,
    'panel_choice_display' as id,
    'Gestion des groupements' as title;

select 
    '/a_panels/panel_admin_5.sql'         as link,
    'Retour au tableau de bord superviseur'    as description,
    'corner-down-left-double'                  as icon,
    TRUE                                       as active,
    'white'                                    as color;
select 
    '/a_choices/choice_main_display_5.sql'     as link,
    'Retour liste des choix'                    as description,
    'corner-down-left'                          as icon,
    'yellow'                                    as color;



-- Display list of organizations
SELECT 'table' AS component, 
    'Liste des organisations'   AS title, 
    'View'           AS markdown,
    TRUE             AS sort, 
    TRUE             AS search;

SELECT
    choice_id             AS Id,
    choice_label          AS Label,
    choice_value          AS Value,
    choice_category       AS Categorie,
   '[Edit](/a_choices/choice_main_edit_5.sql?choice_id=' || choice_id || ')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Delete](/a_choices/choice_main_delete_0.sql?choice_id=' || choice_id|| ')'    AS View
FROM choices_items
WHERE choice_label IS NOT NULL AND choice_status !='online' OR choice_status IS NOT NULL
ORDER BY choice_id ASC;
