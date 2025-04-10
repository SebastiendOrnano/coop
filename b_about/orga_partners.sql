SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell.sql') AS properties;

select 
    'title'                           as component,
    'Les partenaires du projet Co-op' as contents,
    TRUE                              as center;

select 
    'datagrid'              as component,
    'gold'                  as id,
    'Partner GOLD'          as title;
select 
     orga_partner_name                as title,
     orga_partner_link                as link,
     orga_partner_punchline           as footer,
     orga_partner_logo_url            as image_url
    FROM orga_partners
WHERE orga_partner_status = 'active' AND orga_partner_type='partner' AND orga_partner_category='gold';


select 
    'datagrid'              as component,
    'silver'                  as id,
    'Partner SILVER'          as title;
select 
    orga_partner_name                as title,
    orga_partner_link                as link,
    orga_partner_punchline           as footer,
    orga_partner_logo_url            as image_url
    FROM orga_partners
WHERE orga_partner_status = 'active' AND orga_partner_type='partner' AND orga_partner_category='silver';


select 
    'datagrid'              as component,
    'bronze'                  as id,
    'Partner BRONZE'          as title;
select 
    orga_partner_name                as title,
    orga_partner_link                as link,
    orga_partner_punchline           as footer,
    orga_partner_logo_url            as image_url
    FROM orga_partners
WHERE orga_partner_status = 'active' AND orga_partner_type='partner' AND orga_partner_category='bronze';


