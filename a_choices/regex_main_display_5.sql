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
    '/a_choices/regex_main_form_5.sql'     as link,
    'Création d''une nouvelle règle'                  as description,
    'user-plus'                                      as icon,
    'yellow'                                         as color;


-- Display list of organizations
SELECT 'table' AS component, 
    'Liste des règle'           AS title, 
    'View'                      AS markdown,
    TRUE                        AS sort, 
    TRUE                        AS search;

SELECT
    regex_id                  AS Id,
   regex_name                 AS Label,
    regex_value              AS Value,
        regex_description              AS Description,
   '[Edit](/a_choices/regex_main_edit_5.sql?regex_id=' || regex_id || ')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Delete](/a_choices/regex_main_delete_0.sql?regex_id=' ||  regex_id|| ')'    AS View
FROM regex
WHERE regex_name IS NOT NULL
ORDER BY regex_name  ASC;
