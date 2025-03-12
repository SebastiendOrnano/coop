SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Editeur'                      as title,
    'arrow_left_double'                  as icon,
    '/a_panels/panel_editor_3.sql'       as link;
select 
    'Liste des processus'                            as title,
    'arrow_left_double'                              as icon,
    '/a_process/process_editor_display_3.sql'        as link;


select 
    'steps'  as component,
    TRUE     as counter,
    'purple' as color;
select 
    process_step_title           as title,
    process_step_icon            as icon,
    process_step_link            as link,
    process_step_description     as description
    from process_steps where process_id=$process_id
    order by process_step_number asc;