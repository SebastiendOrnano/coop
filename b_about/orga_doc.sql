SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell.sql') AS properties;

select 
    'title'   as component,
    'Les document du projet Co-op' as contents,
    TRUE      as center;

select 
    'divider'              as component,
    'Rapports d''activité' as contents,
    'left'                 as position,
    'black'                as color;

SELECT
    'table'          AS component, 
    'File'           AS markdown,
    'View'           AS markdown,
    'Bientôt en ligne !' as empty_description,
    TRUE             AS sort;

SELECT       
   '['||orga_doc_title||']('||orga_doc_url||')'    AS File,
   orga_doc_date_publication     AS Date_Pub,
   orga_doc_date_period          AS Periode
FROM orga_docs
WHERE orga_doc_publication = 'active' AND orga_doc_category = 'annual_report'
ORDER BY created_at DESC;

select 
    'divider'              as component,
    'Bilans'               as contents,
    'left'                 as position,
    'black'                  as color;

SELECT 
    'table'          AS component, 
    'File'           AS markdown,
    'View'           AS markdown,
    'Bientôt en ligne !' as empty_description,
    TRUE             AS sort;

SELECT       
   '['||orga_doc_title||']('||orga_doc_url||')'    AS File,
   orga_doc_date_publication     AS Date_Pub,
   orga_doc_date_period          AS Periode
FROM orga_docs
WHERE orga_doc_publication = 'active' AND  orga_doc_category ='annual_results'
ORDER BY created_at DESC;

select 
    'divider'              as component,
    'Autres documents'    as contents,
    'left'                 as position,
    'black'                 as color;

SELECT 'table' AS component, 
    'Autres documents'   AS title,
    'File'           AS markdown,
    'View'           AS markdown,
    'Bientôt en ligne !' as empty_description,
    TRUE             AS sort;

SELECT       
   '['||orga_doc_title||']('||orga_doc_url||')'    AS File,
   orga_doc_date_publication     AS Date_Pub,
   orga_doc_date_period          AS Periode
FROM orga_docs
WHERE orga_doc_publication = 'active' AND  orga_doc_category ='unknown'
ORDER BY created_at DESC;