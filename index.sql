SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell.sql') AS properties;

select 
    'hero'                 as component,
    'CO-OP'                as title,
    'coop_hero'            as id,
    'Un site web réalisé avec sqlpage      [Pour en savoir plus](/b_about/orga_hero.sql?info_category="hero"&section_number=1)  
    A website built with sqlpage      [Learn more](/b_about/orga_hero.sql?info_category="hero"&section_number=2)' as description_md,
    'home_page' as id,
    '/x_icons/logo_coop_240px.png' as image;
select 

    'Une démo ' as title,
    'Un site web qui utilise la plupart des composants de sqlpage   
    [Pour en savoir plus](/b_about/orga_hero.sql?info_category="hero"&section_number=3)  
    A website using most of the components of sqlpage
    [Learn more](/b_about/orga_hero.sql?info_category="hero"&section_number=4)' as description_md,
    'world-www'  as icon,
    'red'  as color;

select 
    'Un gabarit' as title,
    'Un gabarit pour  servir de base au développement d''un projet autour d''une base de données   
    [Pour en savoir plus](/b_about/orga_hero.sql?info_category="hero"&section_number=5)  
    A template to facilitate the setup of a databased project 
    [Learn more](/b_about/orga_hero.sql?info_category="hero"&section_number=6)' as description_md,
    'steam'       as icon,
    'green'     as color;
