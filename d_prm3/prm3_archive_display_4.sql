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
    'Gestion des groupements actifs'           as title,
    '/d_prm3/prm3_main_display_4.sql'    as link;


-- Display list of organizations
SELECT 'table' AS component, 
    'Liste des organisations'   AS title, 
    'View'           AS markdown,
    TRUE             AS sort, 
    TRUE             AS search;

SELECT
    prm3_id           AS Id,
    prm3_name        AS Nom,
    prm3_type         AS Type,
    prm3_category     AS Categorie,
    prm3_formal      AS Formel,
   '[Participants](/d_prm3_participants/participants_main_display_4.sql?prm3_id=' || prm3_id || ')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Edit](/d_prm3/prm3_main_edit_4.sql?prm3_id=' || prm3_id || ')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Delete](/d_prm3/prm3_main_delete_alert_4.sql?prm3_id=' || prm3_id|| ')'    AS View
FROM prm3
WHERE prm3_name IS NOT NULL AND prm3_status ='archived'
ORDER BY prm3_id ASC;
