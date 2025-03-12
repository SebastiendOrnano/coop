SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

/*SELECT 'debug' AS component,
    '404.sql' AS serving_file,
    sqlpage.path() AS request_path;*/



select 
    'alert'                    as component,
    '404 !' as title,
    'analyze'                  as icon,
    'teal'                     as color,
    'Le fichier que vous recherchez n''existe pas. Vérifier le chemin ou le nom du fichier !' as description;
select 
    'Retour à la page index' AS title,
    'home' AS icon,
    '/' AS link;


