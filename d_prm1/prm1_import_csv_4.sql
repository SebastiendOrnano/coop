SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Superviseur'         as title,
 '/a_panels/panel_supervisor_4.sql' as link;
select 
    'Gestion des personnes'            as title,
    '/d_prm1/prm1_main_display_4.sql' as link;

select 
    'alert'     as component,
    'Formattage du fichier source' as title,
     TRUE              as important,
    TRUE              as dismissible,
'L''importation de données en masse ne fonctionnera que si le fichier contenant les données à importer est correctement formaté.  
Il doit ếtre au format cvs avec une délimitation des champs par des points virgules ";" et "" comme séparateur de chaîne de caractère.   
Lors de l''enregistrement sous dans excel ou calc, pensez à afficher les paramètres du filtre.' as description_md,
'red' as color;

select 
    'alert'     as component,
    'Conflit sur les valeurs uniques' as title,
     TRUE              as important,
    TRUE              as dismissible,
'L''importation peut aussi échouer si l''on tente de réimporter une donnée qui doit rester unique dans une table. Dans le cas de la table des membres, l''email ne doit pas déjà être présent dans la table.' as description_md,
'orange' as color;


select 
    'button' as component;
select 
    '/x_docs/prm1_upload_template.csv' as link,
    'Fichier gabarit'         as title,
    'download'                as icon,
    'person_exemple.csv' as download,
    'green' as color;


select 
    'form'       as component,
    'Import CSV' as title,
    'Charger le fichier'  as validate,
    '/d_prm1/prm1_import_csv_0.sql' as action;
select 
    'prm1_data_input' as name,
    'file'               as type,
    'text/csv'           as accept,
    'Membres'           as label,
    'Respecter le format de la table prm1' as description,
    TRUE                 as required;

