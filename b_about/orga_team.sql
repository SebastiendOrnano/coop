SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell.sql') AS properties;

select 
    'datagrid'              as component,
    'Co-op Team'         as title,
    'Composition de l''équipe du projet Co-op  
*Cliquez sur le portrait pour en savoir plus*' as description_md;
select 
    CONCAT (member_first_name,'  ',member_last_name)                                      as title,
    CONCAT ('/b_members/member_profile_public.sql?member_id=',member_id)                  as link,
    member_function                                                                       as footer,
    ( SELECT 
        CASE 
            WHEN (member_picture_url IS NULL OR member_picture_url='') AND member_gender='M' THEN '/x_pictures_persons/silhouette_homme.png'
            WHEN (member_picture_url IS NULL OR member_picture_url='') AND member_gender='F' THEN '/x_pictures_persons/silouette_femme.png'
            WHEN (member_picture_url IS NULL OR member_picture_url='') AND member_gender='unknown' THEN '/x_pictures_persons/silhouette_iel.png'
            WHEN (member_picture_url IS NULL OR member_picture_url='') AND member_gender='' THEN '/x_pictures_persons/silhouette_iel.png'
            ELSE member_picture_url
        END 
    )   as image_url
    FROM members where member_category="team" AND member_status='active' ;




