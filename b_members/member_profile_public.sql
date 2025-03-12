SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell.sql') AS properties;

SET age = (
    SELECT 
        (strftime('%Y', 'now') - strftime('%Y', member_date_birthday)) -
        CASE 
            WHEN (strftime('%m', 'now') < strftime('%m', member_date_birthday)) THEN 1
            WHEN (strftime('%m', 'now') = strftime('%m', member_date_birthday) AND strftime('%d', 'now') < strftime('%d', member_date_birthday)) THEN 1
            ELSE 0
        END
    FROM members WHERE member_id = $member_id);

SET compagny = (Select orga_name FROM orga LEFT JOIN members ON orga.orga_id = members.orga_id WHERE member_id = $member_id);
SET dept =    (Select orga_dept_name FROM orga_dept LEFT JOIN members ON orga_dept.orga_dept_id = members.orga_dept_id WHERE member_id = $member_id);
SET since = (Select member_date_since from members WHERE member_id = $member_id);
SET function =(Select member_function from members WHERE member_id = $member_id);

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
    (SELECT member_punchline FROM members where member_id = $member_id) as title;

select 
    'text'              as component,
     (SELECT CONCAT (member_first_name, ' ',  member_last_name, ',  age : ',$age,' ans') FROM members where member_id = $member_id) as contents;

SELECT 
    'text'              as component,
    CONCAT ('Employé de la compagnie :  ', $compagny,'   dans le département :  ',$dept,'  depuis : ', $since, ' au poste de :   ',$function) as contents;


select 
     'foldable' as component;
select 
   'Résumé' as title,
   'foldablemargin' as class,
   TRUE AS expanded,
  member_CV_short as description_md
 from members  WHERE member_id = $member_id;




select
    'button' as component,
    'lg'     as size;
select 
   'javascript:print(height="400px",width="200px")'  as link,
    'azure' as outline,
    'Imprimer'  as title,
    'printer'  as icon;

