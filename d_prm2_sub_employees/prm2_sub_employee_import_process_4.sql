SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Superviseur'         as title,
    '/a_panels/panel_supervisor_4.sql' as link;
select 
    'Gestion des departements'            as title,
    '/d_prm2_sub/prm2_sub_main_display_4.sql?prm2_id='||$prm2_id  as link;
select 
    'Gestion des employés'            as title,
    '/d_prm2_sub_employees/prm2_sub_employee_main_display_4.sql?prm2_sub_id='||$prm2_sub_id  as link;

select 
    'datagrid'              as component,
    'panel_member_main_display' as id,
    'Gestion des membres de l''organisation' as title;
select 
    '/d_prm2_sub_employees/prm2_sub_employee_import_csv_4.sql?prm2_sub_id='||$prm2_sub_id as link,
    'Importation à partir d''un fichier csv'                as description,
    'user-plus'                                             as icon,
    'yellow'                                                as color;


select 
    'steps'  as component,
    TRUE     as counter,
    'purple' as color;
select 
    process_step_title           as title,
    process_step_icon            as icon,
    process_step_link            as link,
    process_step_description     as description
    from process_steps where process_id='5'
    order by process_step_number asc;