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
    '/a_choices/choice_category_display_5.sql'         as link,
    'Liste des categories'                             as description,
    'corner-down-left'                                 as icon,
    TRUE                                               as active,
    'green'                                            as color;

-- Display list of organizations
SELECT 'table' AS component, 
    'Liste des ocategories'   AS title, 
    'View'           AS markdown,
    TRUE             AS sort, 
    TRUE             AS search;

SELECT
    choice_category_id               AS Id,
    choice_category_name            AS Nom,
    choice_category_summary         AS Description,
   '[Edit](/a_choices/choice_category_edit_5.sql?choice_category_id=' || choice_category_id || ')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Delete](/a_choices/choice_category_delete_0.sql?choice_category_id=' || choice_category_id|| ')'    AS View
FROM choices_categories
WHERE choice_category_name IS NOT NULL AND choice_category_status !='online' OR choice_category_status IS NOT NULL
ORDER BY choice_category_name  ASC;
