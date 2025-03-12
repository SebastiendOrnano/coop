SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell.sql') AS properties;


SELECT
    'text'                  AS component;

SELECT
'# Restez informé avec des flux RSS
Pour rester toujours informé de nos activités, copier les liens ci-dessous dans votre lecteur RSS open source (version desktop : [raven reader](https://ravenreader.app/), [Fluent Reader](https://github.com/yang991178/fluent-reader/releases/) ou version android : [Feeder](https://play.google.com/store/apps/details?id=com.nononsenseapps.feeder.play&hl=fr&gl=US) ) ou dans la rubrique Blogs & news de votre client de messagerie ([thunderbird](https://support.mozilla.org/fr/kb/comment-s-abonner-aux-flux-de-nouvelles-et-blogs),...)' AS contents_md;


SELECT
    'table'                 AS component, 
    'Description'           AS markdown,
    'Bientôt en ligne !'     as empty_description,
    TRUE                     AS sort;

SELECT
    rss_title                     AS Titre,
    rss_feed                      AS Feed,
    rss_description               AS Description

FROM rss
WHERE rss_status = 'active' AND rss_category = 'public'
ORDER BY created_at DESC;

