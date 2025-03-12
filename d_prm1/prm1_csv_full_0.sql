select 
    'csv'                             as component,
    'Télécharger la liste des membres' as title,
    'prm1_full_list.csv'              as filename,
    'file-download'    as icon,
    'green'            as color,
    ';'                as separator,
    TRUE               as bom;


SELECT  * from prm1;


