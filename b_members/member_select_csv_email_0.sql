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
member_first_name, 
member_last_name, 
member_email,
member_phone  
 
FROM members
WHERE member_selected='yes' ;



