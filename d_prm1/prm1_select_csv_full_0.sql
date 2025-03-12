select 
    'csv'              as component,
    'Télécharger la liste des membres' as title,
    'utilisateurs'           as filename,
    'file-download'    as icon,
    'green'            as color,
    ';'                as separator,
    TRUE               as bom;


SELECT  * from prm1
where prm1_selected='yes' ;


UPDATE prm1 
SET prm1_selected='no', modified_at = CURRENT_TIMESTAMP
WHERE prm1_selected = 'yes';



