

copy prm2_sub_employees
(
prm2_id,	
prm2_sub_id,	
prm1_id,		
employee_title,	
employee_function,	
employee_category,	
employee_status,	
employee_since
) 
from 'prm1_data_input'
with (header true, delimiter ',', quote '"');

select 
    'alert'   as component,
    'Success' as title,
    'L''import semble s''etre bien passé. [revenir à la liste des membres](/d_prm2_sub_employees/prm2_sub_employee_main_display_4.sql)' as description_md,
    'check'   as icon,
    'green'   as color;