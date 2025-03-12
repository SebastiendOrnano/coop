SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_5.sql') AS properties;

select 
    'datagrid'               as component,
    'process_step_display'   as id;

select 
    '/a_panels/panel_admin_5.sql'               as link,
    'Retour au tableau de bord admin'          as description,
    'corner-down-left-double'                  as icon,
    TRUE                                       as active,
    'white'                                    as color;

select 
    '/a_process/process_main_display_5.sql'                   as link,
    'Retour à la liste des processus'                         as description,
    'corner-down-left'                                        as icon,
    'yellow'                                                  as color;

select 
     '/a_process/process_step_form_5.sql?process_id='||$process_id    as link,
    'Ajouter une étape au processus'                                  as description,
    'file-download'                                                   as icon,
    'green'                                                            as color;

select 
     '/a_process/process_view_5.sql?process_id='||$process_id    as link,
    'Visualiser le processus'                                    as description,
    'file-download'                                              as icon,
    'green'                                                      as color;



-- Display steps for the selected process

SELECT
    'form' as component,
    '' as validate;

SELECT 
    'Process de rattachement'   as label,
    'text'                     as type,
    (SELECT process_title   FROM process where process_id=$process_id) as value; 
 
select 
    'title'     as component,
    'Étapes'    as contents,
    3           as level;

SELECT 
    'table'               AS component, 
    'Étapes du processus' AS title, 
    TRUE                  AS sort, 
    'View'                AS markdown, 
    FALSE                 AS search;

SELECT
    process_step_number            AS N°,
    process_step_title             AS Step,
    process_step_description       AS Description,
   '[Edit](/a_process/process_step_edit_5.sql?process_step_id=' || process_step_id ||  ') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Delete](/a_process/process_step_delete_0.sql?process_step_id=' || process_step_id ||')'    AS View
FROM process_steps
WHERE process_id = $process_id
ORDER BY created_at ASC;





