SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell.sql') AS properties;

select 
    'title'                           as component,
    'Nous retrouver sur les réseaux sociaux' as contents,
    TRUE                              as center;

select 
    'datagrid'              as component,
    'social_network'                  as id;
select 
     orga_partner_link                as link,
     orga_partner_logo_url            as image_url
    FROM orga_partners
WHERE orga_partner_status = 'yes' AND orga_partner_type='social_network';