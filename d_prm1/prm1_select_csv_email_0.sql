SELECT
    'csv'              as component,
    'Télécharger email-téléphone des membres sélectionnés' as title,
    'utilisateurs'           as filename,
    'csv'              as class,
    'file-download'    as icon,
    'yellow'            as color,
    ';'                as separator,
    TRUE               as bom;

SELECT 
prm1_first_name, 
prm1_last_name, 
prm1_email,
prm1_phone  
 
FROM prm1
WHERE prm1_selected='yes' ;



