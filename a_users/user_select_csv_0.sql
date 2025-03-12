copy users
(
user_first_name, 
user_last_name, 
user_email
) 
from 'user_data_input'
with (header true, delimiter ';', quote '"')

WHERE user_selected='yes';