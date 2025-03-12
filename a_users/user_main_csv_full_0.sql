
select 
    'csv'              as component,
    'Télécharger la liste des utilisateurs' as title,
    'utilisateurs'           as filename,
    'file-download'    as icon,
    'green'            as color,
    ';'                as separator,
    TRUE               as bom;

SELECT 
username, 
user_gender, 
user_first_name, 
user_last_name,
user_phone,
user_email,
user_lang, 
user_status,
user_group, 
user_level, 
created_at, 
modified_at
from users 
where username IS NOT NULL;



