SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;


SET prm2_id= SELECT prm2_id FROM prm2_sub where prm2_sub_id=$prm2_sub_id;

select 
    'datagrid'              as component,
    'panel_prm2_sub_doc_display' as id,
    'Gestion des documents de l''organisation' as title;

select 
    '/a_panels/panel_supervisor_4.sql'         as link,
    'Retour au tableau de bord superviseur'    as description,
    'corner-down-left-double'                  as icon,
    TRUE                                       as active,
    'white'                                    as color;

select 

   '/d_prm2_sub/prm2_sub_main_display_4.sql?prm2_id='||$prm2_id   as link,
    'Retour à la liste des départements de l''organisation'                  as description,
    'user-plus'                                      as icon,
    'yellow'                                         as color;

select 
 
    '/d_prm2_sub_doc/prm2_sub_doc_sub_form_4.sql?prm2_sub_id='||$prm2_sub_id             as link,
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
    'prm2_id' as name,
    'hidden' as type,
    $prm2_id as value,
    'id' as label;

select 
    'prm2_sub_id' as name,
    'hidden' as type,
    $prm2_sub_id as value,
    'id' as label;

SELECT
    'prm2_sub_name' as name,
    'text' as type,  
    'Nom de la filiale ou du département' as label,
     6 as width,
    (select prm2_sub_name  FROM prm2_sub WHERE prm2_sub_id = $prm2_sub_id) as value;

SELECT
    'prm2_name' as name,
    'text' as type,  
    'Nom de la organisation mère' as label,
    6 as width,
    (select o.prm2_name  FROM prm2_sub AS d
    LEFT  JOIN prm2 AS o
    ON o.prm2_id = d.prm2_id    
    WHERE d.prm2_sub_id = $prm2_sub_id) as value;


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
    '['||prm2_sub_doc_title||']('||prm2_sub_doc_url||')'    AS File,
   prm2_sub_doc_date_publication  AS Date_Pub,
   prm2_sub_doc_date_period       AS Period,
   prm2_sub_doc_category          AS Categorie,
   prm2_sub_doc_edition           as Edition,
   prm2_sub_doc_publication       as Publication,
  '[Edit](/d_prm2_sub_doc/prm2_sub_doc_main_edit_4.sql?prm2_sub_doc_id='||prm2_sub_doc_id ||')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Delete](/d_prm2_sub_doc/prm2_sub_doc_main_delete_alert1_4.sql?prm2_sub_doc_id=' || prm2_sub_doc_id|| ')'    AS View
FROM prm2_sub_doc
WHERE prm2_sub_id = $prm2_sub_id
ORDER BY created_at DESC;


select 
    'title'   as component,
    'Rattacher un document existant au département' as contents,
    3         as level;

-- Form for replying to the topic

SELECT 
    'form'      AS component,
    'Ajouter un document' as validate,
     '/d_prm2_sub/prm2_sub_doc_update_0.sql?prm2_sub_id='||$prm2_sub_id AS action;

select 
    'prm2_id' as name,
    'hidden' as type,
     $prm2_id as value,
    'prm2_id' as label;

select 
    'prm2_sub_id' as name,
    'hidden' as type,
    $prm2_sub_id as value,
    'sub_id' as label;

select 
    'prm2_sub_doc_id' as name,
    'Titre du document' as label,
    'select' as type,
    1      as value,
    TRUE as searchable,
   'Choississez dans la liste. Si la liste est vide, c''est que tous les documents sont déjà rattachés à un département' as description,
    json_group_array(json_object('label', prm2_sub_doc_title || '   ' || prm2_sub_doc_date_publication, 'value', prm2_sub_doc_id)) AS options
    FROM (
    SELECT prm2_sub_doc_title, prm2_sub_doc_date_publication, prm2_sub_doc_id
    FROM prm2_sub_doc WHERE prm2_sub_id is NULL or prm2_sub_id=''
    ORDER BY prm2_sub_doc_title ASC, prm2_sub_doc_date_publication ASC
    );