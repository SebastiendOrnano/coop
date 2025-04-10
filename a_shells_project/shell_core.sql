set orga_dept_name = "MyProject"


SELECT
    'shell'                            as component,
    $orga_dept_name                    as title,
    $logo                              as image,
    '/'                                as link,
    '/a_css/local.css'                 as css,
    'Un site basé sur sqlpage'         as description,
    JSON('{"title":"About","submenu":[
    {"link":"/b_about/orga_about.sql","title":"à propos","icon":"home-question"}
    ]}')  AS menu_item,
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

    '[Mentions légales](/b_about/orga_legal.sql)&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;[site propulsé par SQLPage](https://sql.datapage.app)&nbsp; &nbsp; &nbsp; &nbsp;[template COOP](https://github.com/SebastiendOrnano/coop) &nbsp; &nbsp; &nbsp; &nbsp;[CGU](/b_about/orga_CGU.sql)   &nbsp; &nbsp; &nbsp; &nbsp;[CGV](/b_about/orga_CGV.sql)';


  