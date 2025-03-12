SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

SET age = (
    SELECT 
        (strftime('%Y', 'now') - strftime('%Y', prm1_date_birthday)) -
        CASE 
            WHEN (strftime('%m', 'now') < strftime('%m', prm1_date_birthday)) THEN 1
            WHEN (strftime('%m', 'now') = strftime('%m', prm1_date_birthday) AND strftime('%d', 'now') < strftime('%d', prm1_date_birthday)) THEN 1
            ELSE 0
        END
    FROM prm1 WHERE prm1_id = $prm1_id);

select 
    'datagrid'              as component;
select 

     '/d_prm1/prm1_main_display_3.sql'     as link,
    'Revenir à la liste générale'     as description,
    'user-plus'                         as icon,
     'yellow'                           as color;
select 
 
   '/d_prm1/prm1_main_edit_3.sql?prm1_id='|| $prm1_id  as link,
    'Edit' as description,
     'file-download'                         as icon,
    'orange'                                  as color;

select 
    'title' as component,
    (SELECT CONCAT (prm1_first_name, ' ',  prm1_last_name) FROM prm1 where prm1_id = $prm1_id)  as contents,
    '1'    as level,
    TRUE as center;
   
select 
    'form'            as component,
    'Info générales' as title,
    '' as validate;
   
select 
    'prm1_category' as name,
    'readonly' as type,
    (select prm1_category  FROM prm1 WHERE prm1_id = $prm1_id)  as value,
    1 as width,
    TRUE as readonly,
    'catégorie' as label;

select 
    'prm1_status' as name,
    'text' as type,
    (select prm1_status  FROM prm1 WHERE prm1_id = $prm1_id)  as value,
      TRUE as readonly,
    1 as width,
    'statut' as label;

select 
    'prm1_gender' as name,
    'text' as type,
    (select prm1_gender  FROM prm1 WHERE prm1_id = $prm1_id)   as value,
      TRUE as readonly,
    1 as width,
    'genre' as label;

select 
    'prm1_date_birthday' as name,
    'text' as type,
    $age  as value,
    TRUE as readonly,
    2 as width,
    'age' as label;

SELECT
    'prm1_first_name' as name,
    'text' as type,  
    'Prénom' as label,
      TRUE as readonly,
    6 as width,
    (select prm1_first_name  FROM prm1 WHERE prm1_id = $prm1_id) as value;

SELECT
    'prm1_last_name' as name,
    'text' as type,  
    'Nom' as label,
      TRUE as readonly,
    6 as width,
    (Select prm1_last_name FROM prm1 WHERE prm1_id = $prm1_id) as value;

SELECT 
    'prm1_phone' as name,
    'Téléphone' as label,
    'text' as type, 
     TRUE as readonly,
    6 as width,
    (Select prm1_phone FROM prm1 WHERE prm1_id = $prm1_id) as value;

SELECT 
    'prm1_email' as name,
    'Email' as label,
    'text' as type, 
    6 as width,
      TRUE as readonly,
    (Select prm1_email FROM prm1 WHERE prm1_id = $prm1_id) as value;

SELECT 
    'prm1_function' as name,
    'text' as type,
    'fonction' as label,
    4 as width,
      TRUE as readonly,
    (Select prm1_function FROM prm1 WHERE prm1_id = $prm1_id) as value;

select 
     'foldable' as component;
select 
   'Résumé' as title,
   'foldablemargin' as class,
  prm1_CV_short as description_md
 from prm1  WHERE prm1_id = $prm1_id;

select 
     'foldable' as component;
select 
   'CV'as title,
   'foldablemargin' as class,
  prm1_CV_long as description_md
 from prm1  WHERE prm1_id = $prm1_id;

