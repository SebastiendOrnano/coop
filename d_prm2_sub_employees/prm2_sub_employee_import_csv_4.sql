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
    'Gestion des departements'            as title,
    '/d_prm2_sub/prm2_sub_main_display_4.sql?prm2_id='||$prm2_id  as link;
select 
    'Gestion des employés'            as title,
    '/d_prm2_sub_employees/prm2_sub_employee_main_display_4.sql?prm2_sub_id='||$prm2_sub_id  as link;

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
    'Import en 2 temps' as title,
     TRUE              as important,
    TRUE              as dismissible,
'L''importation des employés se fait en 2 temps : importation des personnes physiques (table prm1) puis rattachement à la table des employées (table prm2_sub-employees). [Voir le processus](/d_prm2_sub_employees/prm2_sub_employee_import_process_4.sql?prm2_sub_id='||$prm2_sub_id||'&prm2_id='||$prm2_id||') !' as description_md,
'yellow' as color;;


select 
    'button' as component;
select 
    '/x_docs/prm2_employee_upload_template.csv' as link,
    'Fichier gabarit'         as title,
    'download'                as icon,
    'person_exemple.csv' as download,
    'green' as color;


select 
    'form'       as component,
    'Import CSV' as title,
    'Charger le fichier'  as validate,
    '/d_prm2_sub_employees/prm2_sub_employee_import_csv_0.sql' as action;
select 
    'prm1_data_input' as name,
    'file'               as type,
    'text/csv'           as accept,
    'Membres'           as label,
    'Respecter le format de la table prm1' as description,
    TRUE                 as required;

