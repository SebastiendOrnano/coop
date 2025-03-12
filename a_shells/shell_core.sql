SET orga_footer = 
(SELECT CONCAT(orga_dept_name,' / SIRET: ',orga_dept_no_siret,' / Tél.: ',orga_dept_contact_phone,' / Mail: ',orga_dept_contact_mail)
FROM orga_dept WHERE orga_dept_id = '1');

SET orga_dept_name = (select orga_dept_name from orga_dept WHERE orga_dept_id = '1');

SET logo = (select orga_dept_logo_url from orga_dept WHERE orga_dept_id = '1');

SELECT
    'shell'                            as component,
    $orga_dept_name                    as title,
    $logo                              as image,
    '/'                                as link,
    '/a_css/local.css'                 as css,
    'Un site basé sur sqlpage'         as description,
    JSON('{"title":"About","submenu":[
    {"link":"/b_about/orga_about.sql","title":"à propos","icon":"home-question"},
    {"link":"/b_about/orga_govern.sql","title":"Gouvernance","icon":"user-shield"},
    {"link":"/b_about/orga_team.sql","title":"coop_team","icon":"users-group"},
    {"link":"/b_about/orga_map.sql","title":"Où nous trouver ?","icon":"map"},
    {"link":"/b_about/orga_doc.sql","title":"Doc et rapports","icon":"book-download"},
    {"link":"/b_about/orga_partners.sql","title":"Nos partenaires","icon":"topology-full"},
    {"link":"/b_about/orga_networks.sql","title":"Réseaux sociaux","icon":"network"},
    {"link":"/b_about/orga_rss.sql","title":"RSS","icon":"rss"}
    ]}')  AS menu_item,
    '{"link":"/b_events/event_main_list.sql","title":"Agenda"}' as menu_item,
    '{"link":"/b_news/news_public_display.sql","title":"Actus"}' as menu_item,
    JSON('{"title":"Project","submenu":[
    {"link":"/e_projects/project_public_display.sql","title":"Projet","icon":"presentation"}
    ]}') as menu_item,
    CASE WHEN $user_role IS NULL THEN  
    '{"link":"/b_faq/faq_main_form.sql","title":"contact","icon":"info-square-rounded"}' END AS menu_item,
    CASE WHEN $user_role IS NULL OR $user_role IS NOT NULL THEN  
    '{"link":"/b_faq/faq_public_display.sql","title":"FAQ","icon":"help-octagon"}' END AS menu_item,
    CASE WHEN $user_role IS NOT NULL THEN  JSON('{"title":"CO-OP","submenu":[
    {"link":"/b_faq/faq_main_form_1.sql","title":"contact","icon":"info-square-rounded"},
    {"link":"/b_faq/faq_private_display_1.sql","title":"FAQ","icon":"help-octagon"},
    {"link":"/b_news/news_private_display_1.sql","title":"Actus","icon":"news"},
    {"link":"/c_meetings/meeting_main_list_1.sql","title":"Agenda","icon":"calendar"},
    {"link":"/c_forum/forum_main_display_1.sql","title":"forum","icon":"arrows-random"},
    {"link":"/c_debug/debug_main_display_1.sql","title":"debug","icon":"bug"},
    {"link":"/c_chat/chat_main_display_1.sql","title":"chat","icon":"messages"}
    ]}') END AS menu_item,
    CASE WHEN $user_role = 'editor' THEN '{"link":"/a_panels/panel_editor_3.sql","title":"Editor"}' END as menu_item,
    CASE WHEN $user_role = 'supervisor' THEN '{"link":"/a_panels/panel_supervisor_4.sql","title":"Supervisor"}' END as menu_item,
    CASE WHEN $user_role = 'admin' THEN '{"link":"/a_panels/panel_admin_5.sql","title":"Admin"}' END as menu_item,
    CASE WHEN $user_role IS NULL THEN  JSON('{"title":"Connect","submenu":[
    {"link":"/a_sessions/session_main_form.sql","title":"Login","icon":"plug-connected"},
    {"link":"/a_users/user_main_form.sql","title":"Sign up","icon":"user-plus"}
    ]}') END as menu_item,
    CASE WHEN $user_role IS NOT NULL THEN JSON('{"title":"Connect","submenu":[
    {"link":"/a_panels/panel_user_1.sql","title":"Mon profil","icon":"user-scan"},
    {"link":"/a_sessions/session_main_logout.sql","title":"Se déconnecter","icon":"logout"}
    ]}') END as menu_item,
    
    'boxed'                  as layout,
    'fr-FR'                  as language,
    'Poppins'                as font,
    'https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@11/build/highlight.min.js' as javascript,
    'https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@11/build/languages/sql.min.js' as javascript,
    'https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@11/build/languages/handlebars.min.js' as javascript,
    'https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@11/build/languages/json.min.js' as javascript,
    'https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js' as javascript,
    '/highlightjs-launch.js'    as javascript,
    '/highlightjs-tabler-theme.css' as css,

    '[Mentions légales](/b_about/orga_legal.sql)&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;[site propulsé par SQLPage](https://sql.datapage.app)&nbsp; &nbsp; &nbsp; &nbsp;[template COOP](https://github.com/SebastiendOrnano/coop) &nbsp; &nbsp; &nbsp; &nbsp;[CGU](/b_about/orga_CGU.sql)   &nbsp; &nbsp; &nbsp; &nbsp;[CGV](/b_about/orga_CGV.sql)

'||$orga_footer as footer;


  