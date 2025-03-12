copy prm1
(
prm1_gender,
prm1_first_name,
prm1_last_name,
prm1_phone,
prm1_email,
prm1_category,
prm1_function,
prm1_date_birthday,
prm1_cv_short,
prm1_cv_long,
prm1_selected,
prm1_status
) 
from 'prm1_data_input'
with (header true, delimiter ',', quote '"');


select 
    'alert'   as component,
    'Success' as title,
    'L''import semble s''etre bien passé. [revenir à la liste des membres](/d_prm1/prm1_main_display_4.sql)' as description_md,
    'check'   as icon,
    'green'   as color;