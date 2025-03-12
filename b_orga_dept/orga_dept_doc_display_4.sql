SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;


SET orga_id= SELECT orga_id from orga_dept where orga_dept_id=$orga_dept_id;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Superviseur'         as title,
    '/a_panels/panel_supervisor_4.sql' as link;
select 
    'Gestion des membres'            as title,
    '/b_members/member_main_display_4.sql' as link;
select 
   '/b_orga_dept/orga_dept_main_display_4.sql?orga_id='||$orga_id   as link,
    'Retour à la liste des départements de l''organisation'                  as title;



select 
    'datagrid'              as component,
    'panel_orga_dept_doc_display' as id,
    'Gestion des documents de l''organisation' as title;

select 
 
    '/b_orga_doc/orga_doc_dept_form_4.sql?orga_dept_id='||$orga_dept_id             as link,
    'Créer un nouveau document'           as description,
    'file-download'                                     as icon,
    'green'                                              as color;

select 
    'title'     as component,
    'Département '    as contents,
    3           as level;

SELECT 
    'form' as component,
    '' as validate;

select 
    'orga_id' as name,
    'hidden' as type,
    $orga_id as value,
    'id' as label;

select 
    'orga_dept_id' as name,
    'hidden' as type,
    $orga_dept_id as value,
    'id' as label;

SELECT
    'orga_dept_name' as name,
    'text' as type,  
    'Nom de la filiale ou du département' as label,
     6 as width,
    (select orga_dept_name  FROM orga_dept WHERE orga_dept_id = $orga_dept_id) as value;

SELECT
    'orga_name' as name,
    'text' as type,  
    'Nom de la organisation mère' as label,
    6 as width,
    (select o.orga_name  FROM orga_dept AS d
    LEFT JOIN orga AS o
    ON o.orga_id = d.orga_id    
    WHERE d.orga_dept_id = $orga_dept_id) as value;


select 
    'title'     as component,
    'Liste des documents'    as contents,
    3           as level;

SELECT 
    'table'               AS component, 
    TRUE                  AS sort, 
    'View'                AS markdown,
    'File'                AS markdown, 
    TRUE                  AS search;

SELECT
    '['||orga_doc_title||']('||orga_doc_url||')'    AS File,
   orga_doc_date_publication  AS Date_Pub,
   orga_doc_date_period       AS Period,
   orga_doc_category          AS Categorie,
   orga_doc_edition           as Edition,
   orga_doc_publication       as Publication,
  '[Edit](/b_orga_doc/orga_doc_main_edit_4.sql?orga_doc_id=' || orga_doc_id || ')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Delete](/b_orga_doc/orga_doc_main_delete_alert1_4.sql?orga_doc_id=' || orga_doc_id|| ')'    AS View
FROM orga_docs
WHERE orga_dept_id = $orga_dept_id
ORDER BY created_at DESC;


select 
    'title'   as component,
    'Rattacher un document existant au département' as contents,
    3         as level;

-- Form for replying to the topic

SELECT 
    'form'      AS component,
    'Ajouter un document' as validate,
     '/b_orga_dept/orga_dept_doc_update_0.sql?orga_dept_id='||$orga_dept_id AS action;

select 
    'orga_id' as name,
    'hidden' as type,
     $orga_id as value,
    'orga_id' as label;

select 
    'orga_dept_id' as name,
    'hidden' as type,
    $orga_dept_id as value,
    'dept_id' as label;

select 
    'orga_doc_id' as name,
    'Titre du document' as label,
    'select' as type,
    1      as value,
    TRUE as searchable,
   'Choississez dans la liste. Si la liste est vide, c''est que tous les documents sont déjà rattachés à un département' as description,
    json_group_array(json_object('label', orga_doc_title || '   ' || orga_doc_date_publication, 'value', orga_doc_id)) AS options
    FROM (
    SELECT orga_doc_title, orga_doc_date_publication, orga_doc_id
    FROM orga_docs WHERE orga_dept_id is NULL or orga_dept_id=''
    ORDER BY orga_doc_title ASC, orga_doc_date_publication ASC
    );