copy members
(
orga_id,
orga_dept_id,
member_gender,
member_first_name,
member_last_name,
member_phone,
member_email,
member_category,
member_function,
member_date_birthday,
member_date_since,
member_date_last_subscription,
member_punchline,
member_cv_short,
member_cv_long,
member_picture_title,
member_selected,
member_publish,
member_status
) 
from 'member_data_input'
with (header true, delimiter ',', quote '"');


select 
    'alert'   as component,
    'Success' as title,
    'L''import semble s''etre bien passé. [revenir à la liste des membres](/b_members/member_main_display_4.sql)' as description_md,
    'check'   as icon,
    'green'   as color;