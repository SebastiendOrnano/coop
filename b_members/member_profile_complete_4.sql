SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

SET age = (
    SELECT 
        (strftime('%Y', 'now') - strftime('%Y', member_date_birthday)) -
        CASE 
            WHEN (strftime('%m', 'now') < strftime('%m', member_date_birthday)) THEN 1
            WHEN (strftime('%m', 'now') = strftime('%m', member_date_birthday) AND strftime('%d', 'now') < strftime('%d', member_date_birthday)) THEN 1
            ELSE 0
        END
    FROM members WHERE member_id = $member_id);


select 
    'datagrid'              as component;
select 

     '/b_members/member_main_display_4.sql'     as link,
    'Revenir à la liste générale'     as description,
    'user-plus'                         as icon,
     'yellow'                           as color;
select 
 
   '/b_members/member_main_edit_4.sql?member_id='|| $member_id  as link,
    'Edit' as description,
     'file-download'                         as icon,
    'orange'                                  as color;
select 
 
   '/b_members/member_profile_publish_0.sql?member_id='|| $member_id  as link,
    'Publier le profil' as description,
     'file-download'                         as icon,
    'green'                                  as color;

select 
    'html' as component,
    '<div  id="portait_img">' as html;
select 
    '<img  alt=".."  src="'||(SELECT member_picture_url FROM members where member_id = $member_id)|| '" />' as html;
select 
    '</div>' as html;

select 
    'title' as component,
    (SELECT CONCAT (member_first_name, ' ',  member_last_name) FROM members where member_id = $member_id)  as contents,
    '1'    as level,
    TRUE as center;
   
select 
    'text'              as component,
    TRUE as center,
    (SELECT member_punchline FROM members where member_id = $member_id) as contents;

select 
    'form'            as component,
    'Info générales' as title,
    '' as validate;
   
select 
    'member_category' as name,
    'readonly' as type,
    (select member_category  FROM members WHERE member_id = $member_id)  as value,
    1 as width,
    TRUE as readonly,
    'catégorie' as label;

select 
    'member_status' as name,
    'text' as type,
    (select member_status  FROM members WHERE member_id = $member_id)  as value,
      TRUE as readonly,
    1 as width,
    'statut' as label;

select 
    'member_gender' as name,
    'text' as type,
    (select member_gender  FROM members WHERE member_id = $member_id)   as value,
      TRUE as readonly,
    1 as width,
    'genre' as label;

select 
    'member_date_birthday' as name,
    'text' as type,
    $age  as value,
    TRUE as readonly,
    2 as width,
    'age' as label;

select 
    'member_date_since' as name,
    'text' as type,
    (select member_date_since  FROM members WHERE member_id = $member_id)   as value,
    TRUE as readonly,
    3 as width,
    'membre depuis...' as label;

select 
    'member_date_last_ssubscription' as name,
    'text' as type,
    (select member_date_last_subscription  FROM members WHERE member_id = $member_id)   as value,
    TRUE as readonly,
    3 as width,
    'date dernière cotisation' as label;

SELECT
    'member_first_name' as name,
    'text' as type,  
    'Prénom' as label,
      TRUE as readonly,
    6 as width,
    (select member_first_name  FROM members WHERE member_id = $member_id) as value;

SELECT
    'member_last_name' as name,
    'text' as type,  
    'Nom' as label,
      TRUE as readonly,
    6 as width,
    (Select member_last_name FROM members WHERE member_id = $member_id) as value;

SELECT 
    'member_phone' as name,
    'Téléphone' as label,
    'text' as type, 
     TRUE as readonly,
    6 as width,
    (Select member_phone FROM members WHERE member_id = $member_id) as value;

SELECT 
    'member_email' as name,
    'Email' as label,
    'text' as type, 
    6 as width,
      TRUE as readonly,
    (Select member_email FROM members WHERE member_id = $member_id) as value;

SELECT 
    'orga_name' as name,
    'text' as type,
    'Organization' as label,
    4 as width,
      TRUE as readonly,
    (Select orga_name FROM orga LEFT JOIN members ON orga.orga_id = members.orga_id WHERE member_id = $member_id) as value;

SELECT 
    'orga_dept_name' as name,
    'text' as type,
    'Organization' as label,
    4 as width,
      TRUE as readonly,
    (Select orga_dept_name FROM orga_dept LEFT JOIN members ON orga_dept.orga_dept_id = members.orga_dept_id WHERE member_id = $member_id) as value;

SELECT 
    'member_function' as name,
    'text' as type,
    'fonction' as label,
    4 as width,
      TRUE as readonly,
    (Select member_function FROM members WHERE member_id = $member_id) as value;

select 
     'foldable' as component;
select 
   'Résumé' as title,
   'foldablemargin' as class,
  member_CV_short as description_md
 from members  WHERE member_id = $member_id;

select 
     'foldable' as component;
select 
   'CV'as title,
   'foldablemargin' as class,
  member_CV_long as description_md
 from members  WHERE member_id = $member_id;

