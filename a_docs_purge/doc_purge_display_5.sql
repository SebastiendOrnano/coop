SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_5.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Admin'                as title,
    '/a_panels/panel_admin_5.sql' as link;

select 
    'button'              as component,
    'Télécharger la liste des utilisateur' as title;
SELECT 
    '/a_docs_purge/doc_purge_csv_full_0.sql' as link,
    'green' as color,
    'Télécharger la liste des fichiers à effacer' as title;
SELECT 
    '/a_docs_purge/doc_purge_list_0.sql' as link,
    'red' as color,
    'Vider la liste des fichiers à effacer' as title;   
SELECT 
    '/a_process/process_view_5.sql?process_id=4' as link,
    'yellow' as color,
    'Processus pour effacer les fichiers' as title; 

SELECT 
    'list'                           AS component, 
    'Liste des fichiers à effacer'   AS title, 
    TRUE                             AS sort, 
    TRUE                             AS search;

SELECT       
    file_url        AS description_md,
    file_url        AS link
FROM files_to_erase
WHERE file_url IS NOT NULL 

ORDER BY created_at DESC;