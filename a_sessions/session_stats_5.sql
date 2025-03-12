SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_5.sql') AS properties;

SELECT 
    'breadcrumb' as component;
SELECT 
    'Home' as title,
    '/'    as link;
SELECT 
    'Gestion Admin'         as title,
    '/a_panels/panel_admin_5.sql' as link;

SELECT 
    'csv'              as component,
    'Télécharger la liste des sessions' as title,
    'log_sessions'           as filename,
    'file-download'    as icon,
    'green'            as color,
    ';'                as separator,
    TRUE               as bom;

SELECT 
    username, user_id, created_at, logout_at, session_duration
FROM sessions
WHERE session_duration IS NOT NULL OR session_duration='' ;


SELECT 
    'chart'             as component,
    'Nb de sessions connectées par jour durant le mois dernier' as title,
    'bar'              as type,
    'indigo'            as color,
    5                   as marker,
    TRUE                as time;
SELECT
      DATE(created_at)                    as x,
      COUNT(session_token)                as y
FROM sessions
WHERE DATE(created_at) > DATE('now','-1 month') AND  session_duration IS NOT NULL OR session_duration='' 
GROUP BY STRFTIME('%d', created_at);

SELECT 
    'chart'             as component,
    'Nb de sessions connectées par mois durant l''an dernier' as title,
    'bar'              as type,
    'indigo'            as color,
    5                   as marker,
    TRUE                as time;
SELECT
      DATE(created_at)                    as x,
      COUNT(session_token)                as y
FROM sessions
WHERE DATE(created_at) > DATE('now','-1 year') AND  session_duration IS NOT NULL OR session_duration='' 
GROUP BY STRFTIME('%m', created_at);

select 
    'alert'                     as component,
    'Warning'                   as title,
    'Les stats suivantes sur la durée des sessions connectées ne prennent en compte que les sessions qui ont été correctement refermées (logout). Une analyse plus poussée suppose l''emploi d''un script.' as description,
    'alert-triangle'            as icon,
    'yellow'                    as color;


SELECT 
    'chart'             as component,
    'Durée moyenne des sessions connectées  par jour durant le mois dernier  en secondes' as title,
    'bar'              as type,
    'indigo'            as color,
    5                   as marker,
    TRUE                as time;
SELECT
      DATE(created_at)                    as x,
      ROUND(AVG(session_duration) )       as y
FROM sessions
WHERE DATE(created_at) > DATE('now','-1 month') AND  session_duration IS NOT NULL OR session_duration='' 
GROUP BY STRFTIME('%d', created_at);

SELECT
    'chart'             as component,
    'Durée max des sessions connectées  par jour durant le mois dernier en secondes' as title,
    'area'              as type,
    'green'             as color,
    5                   as marker,
    TRUE                as time;
SELECT 
      DATE(created_at)             as x,
      MAX(session_duration)        as y
FROM sessions
WHERE DATE(created_at) > DATE('now','-1 month') AND  session_duration IS NOT NULL OR session_duration='' 
GROUP BY STRFTIME('%d', created_at);

SELECT 
    'chart'             as component,
    'Durée moyenne des sessions connectées  par mois durant l''année  en secondes' as title,
    'area'              as type,
    'indigo'            as color,
    5                   as marker,
    TRUE                as time;
SELECT
      DATE(created_at)                    as x,
      ROUND(AVG(session_duration) )       as y
FROM sessions
WHERE DATE(created_at) > DATE('now','-1 year') AND  session_duration IS NOT NULL OR session_duration='' 
GROUP BY STRFTIME('%m', created_at);
