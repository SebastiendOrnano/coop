SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Superviseur'                      as title,
    'arrow_left_double'                  as icon,
    '/a_panels/panel_supervisor_4.sql'        as link;


select 
    'title'        as component,
    'PROCESSUS'    as contents,
    3              as level;

SELECT 
    'list'      AS component;

SELECT 
    process_title                                                   AS title,
    '/a_process/process_view_4.sql?process_id='||process_id          AS link
FROM process
where process_category="supervisor" and process_status='active'
ORDER BY created_at DESC;