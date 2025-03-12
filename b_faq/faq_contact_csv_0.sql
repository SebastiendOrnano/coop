select 
    'csv'                               as component,
    'Télécharger la liste des contacts' as title,
    'contact_list.csv'                  as filename,
    'file-download'    as icon,
    'green'            as color,
    ';'                as separator,
    TRUE               as bom;

SELECT  * from faq_contacts;
