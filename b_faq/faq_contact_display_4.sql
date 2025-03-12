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
    'Gestion FAQ'                             as title,
    '/b_faq/faq_main_display_4.sql'                  as link;

select 
    'datagrid'              as component,
    'faq_contact_display' as id,
    'Gestion de la FAQ' as title;

select 
    '/b_faq/faq_contact_csv_0.sql'                  as link,
    'Télécharger la liste des contacts'             as description,
    'download'                                      as icon,
    'green'                                         as color;

SELECT 'table' AS component, 
    'FAQ questions'   AS title, 
    'View'           AS markdown, 
    TRUE             AS sort, 
    TRUE             AS search;

SELECT      
    c.contact_id               AS ID,
    q.question                 AS Question,
    DATE(q.created_at)         AS Date,
    c.contact_first_name       AS CPrénom,
    c.contact_last_name        AS Nom,
    c.contact_email            AS Email,
    '[Anomym](/b_faq/faq_contact_anonym_0.sql?contact_id=' || c.contact_id || ')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Delete](faq_contact_delete_0.sql?contact_id=' || c.contact_id ||')'    AS View
FROM faq_contacts AS c
LEFT JOIN (
    SELECT contact_id, question, created_at FROM faq_questions) AS q
    ON c.contact_id = q.contact_id
WHERE  c.contact_status !='archived'
ORDER BY q.created_at DESC;