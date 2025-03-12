copy members
(
member_first_name, 
member_last_name, 
member_email
) 
from 'member_data_input'
with (header true, delimiter ';', quote '"')

WHERE member_selected='yes';