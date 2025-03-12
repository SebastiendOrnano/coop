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
    'datagrid'              as component,
    'faq_main_display' as id,
    'Gestion de la FAQ' as title;

select 
    '/b_faq/faq_contact_display_4.sql'               as link,
    'Suivi des contacts           '                  as description,
    'user-plus'                                      as icon,
    'yellow'                                         as color;

select 
    '/b_faq/faq_public_display.sql'             as link,
    'Visualiser la FAQ publique'                   as description,
    'help-hexagon'                                 as icon,
    'green'                                        as color;

select 
    '/b_faq/faq_private_display_1.sql'             as link,
    'Visualiser la FAQ publique'                   as description,
    'help-hexagon'                                 as icon,
    'red'                                          as color;

SELECT 'table' AS component, 
    'FAQ questions'   AS title, 
    'View'           AS markdown, 
    TRUE             AS sort, 
    TRUE             AS search;

SELECT      
    q.question_id              AS ID,
    q.question                 AS Question,
    q.answer_yes_no            AS Answer,
    q.question_status          AS Statut,
    q.question_category        AS Categorie,
    q.question_public_private  AS PublicPrivate,
    q.faq_yes_no               AS FAQ,
    DATE(q.created_at)         AS Date,
    c.contact_last_name        AS Contact,
    '[Edit](/b_faq/faq_main_edit_4.sql?question_id=' || question_id || ')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Delete](/b_faq/faq_main_delete_0.sql?question_id=' || question_id || ')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Close](/b_faq/faq_main_close_0.sql?question_id=' || question_id || ')'    AS View
FROM faq_questions AS q
LEFT JOIN (
    SELECT contact_id, contact_last_name FROM faq_contacts) AS c
    ON q.contact_id = c.contact_id
WHERE  q.question_status !='archived'
ORDER BY q.created_at DESC;