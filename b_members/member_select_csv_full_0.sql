select 
    'csv'              as component,
    'Télécharger la liste des membres' as title,
    'utilisateurs'           as filename,
    'file-download'    as icon,
    'green'            as color,
    ';'                as separator,
    TRUE               as bom;


SELECT  * from members
where member_selected='yes' ;


UPDATE members 
SET member_selected='no', modified_at = CURRENT_TIMESTAMP
WHERE member_selected = 'yes';



