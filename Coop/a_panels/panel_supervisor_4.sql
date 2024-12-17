SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;


select 
    'datagrid'                                      as component,
    'Panneau d''administration superviseur'         as title,
    'supervisor_panel'                               as id,
    'gestion des membres de l''organisation, ....'  as description_md;

select 
    'Gestion de la faq'                             as title,
    'Suivi des demandes'                            as description,
    'vector'                                        as icon,
    'blue'                                          as color,
    '/b_faq/faq_display_4.sql'                      as link;

select 
    'Gestion des membres'                            as title,
    '/b_members/member_main_display_4.sql'           as link,
    'Création, suivi des membres de l''organisation' as description,
    'list-details'                                   as icon,
     'green'                                         as color;

select 
    'Gestion des organisations'                              as title,
    '/b_orga/orga_display_4.sql'                    as link,
    'Création, suivi des organisations'             as description,
    'list-details'                                  as icon,
    'red'                                           as color;

select 
    'Gestion doc'                                   as title,
    '/b_orga_doc/orga_doc_main_display_4.sql'       as link,
    'Gestion des documents institutionnels'         as description,
    'list-details'                                  as icon,
    'yellow'                                           as color;

select 
    'Gestion des partenaires'                                   as title,
    '/b_orga_partners/orga_partner_display_4.sql'       as link,
    'Gestion des partenaires institutionnels'         as description,
    'list-details'                                  as icon,
    'orange'                                           as color;

select 
    'Gestion des lieux'                                   as title,
    '/b_place/place_main_display_4.sql'       as link,
    'Gestion des lieux'         as description,
    'list-details'                                  as icon,
    'red'                                           as color;

select 
    'Gestion des événenements'                                   as title,
    '/b_events/event_main_display_4.sql'       as link,
    'Gestion des evenements'         as description,
    'list-details'                                  as icon,
    'blue'                                           as color;

