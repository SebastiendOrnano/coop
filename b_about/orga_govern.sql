SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell.sql') AS properties;




select 
    'title'   as component,
    'L''équipe de gouvernance du projet' as contents,

    TRUE      as center;


select 
    'carousel'     as component,
    3   as width,
    TRUE           as center,
    'dot' as indicators,
    TRUE           as controls;
  
select 
    (
    SELECT 
        CASE 
            WHEN member_picture_url IS NULL OR  member_picture_url='' THEN '/x_pictures_persons/silhouette_homme.png'
            ELSE member_picture_url
        END 
 ) as image,
 '['||member_first_name||'&nbsp; '||member_last_name ||'](/b_members/member_profile_public.sql?member_id='||member_id||')    
'||member_function as description_md,
   '  ' as title,
    320                       as height
 
FROM members where member_category='govern' AND member_status='active' ;