SELECT
    'csv'              as component,
    'Télécharger email-téléphone des membres sélectionnés' as title,
    'email_membres'           as filename,
    'csv'              as class,
    'file-download'    as icon,
    'yellow'            as color,
    ';'                as separator,
    TRUE               as bom;

SELECT prm1_first_name, prm1_last_name, prm1_email, prm1_phone  from prm1
WHERE prm1_status !='archived' AND DATE(prm1_date_last_subscription, '+1 year') < CURRENT_DATE;



