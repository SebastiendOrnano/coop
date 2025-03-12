SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

-- select 'redirect' as component, '/failure' as link where sqlpage.uploaded_file_path('file') is null;

SET picture = (
    SELECT 
        CASE 
            WHEN (member_picture_url IS NULL OR member_picture_url='') AND member_gender='M' THEN '/x_pictures_persons/silhouette_homme.png'
            WHEN (member_picture_url IS NULL OR member_picture_url='') AND member_gender='F' THEN '/x_pictures_persons/silouette_femme.png'
            WHEN (member_picture_url IS NULL OR member_picture_url='') AND member_gender='unknown' THEN '/x_pictures_persons/silhouette_iel.png'
            WHEN (member_picture_url IS NULL OR member_picture_url='') AND member_gender='' THEN '/x_pictures_persons/silhouette_iel.png'
            ELSE member_picture_url
        END 
    FROM members 
    WHERE member_id = $member_id
);

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

SELECT
    'carousel'              as component,
  3             as width,
    TRUE                    as center,
    'member_change_picture' as id;
SELECT
   320              as height,
    $picture                as image;
    

select
 'form' as component, 
 'insérer ou changer la photo  de : '|| (select member_first_name ||'   '|| member_last_name  FROM members WHERE member_id = $member_id) as title ,
 'insérer l''image' as validate,
 'clear' as reset, 
 '/b_members/member_picture_upload_0.sql?member_id=' ||$member_id as action;

select 
    'hidden' as type, 
    'member_picture_title' as name,
    'portrait    de   ' ||(SELECT CONCAT ( member_first_name,'   ',member_last_name)  FROM members WHERE member_id = $member_id) as value,
    'Nom actuel de la photo' as label,
    true as required;

select 
    'file' as type, 
    'member_picture_url' as name,
    'Photo à insérer' as label,
    TRUE as required,
    'image/*' as accept;

