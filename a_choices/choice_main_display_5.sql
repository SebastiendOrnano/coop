SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_5.sql') AS properties;

select 
    'datagrid'              as component,
    'panel_choice_display' as id,
    'Gestion des groupements' as title;
select 
    '/a_panels/panel_admin_5.sql'         as link,
    'Retour au tableau de bord admin'    as description,
    'corner-down-left-double'                  as icon,
    TRUE                                       as active,
    'white'                                    as color;
select 
    '/a_choices/choice_category_display_5.sql'         as link,
    'Liste des categories'                             as description,
    'corner-down-left'                                 as icon,
    TRUE                                               as active,
    'green'                                            as color;
select 
    '/a_choices/choice_main_form_5.sql'     as link,
    'Création d''un nouveau choix'                  as description,
    'user-plus'                                      as icon,
    'yellow'                                         as color;
select 
     '/a_choices/choice_main_archive_5.sql'             as link,
    'Visualiser les choix archivés'           as description,
    'archive'                                     as icon,
    'green'                                              as color;


-- Display list of organizations
SELECT 'table' AS component, 
    'Liste des choix'           AS title, 
    'View'                      AS markdown,
    TRUE                        AS sort, 
    TRUE                        AS search;

SELECT
    i.choice_id                  AS Id,
    i.choice_label               AS Label,
    i.choice_value               AS Value,
    c.choice_category_name       AS Categorie,
   '[Edit](/a_choices/choice_main_edit_5.sql?choice_id=' || i.choice_id || ')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Delete](/a_choices/choice_main_delete_0.sql?choice_id=' ||  i.choice_id|| ')'    AS View
FROM choices_items as i
LEFT JOIN (select choice_category_name, choice_category_id from choices_categories) as c
on i.choice_category_id = c.choice_category_id
WHERE i.choice_label IS NOT NULL AND i.choice_status !='archived'
ORDER BY c.choice_category_name  ASC;
