copy prm1
(
prm1_first_name, 
prm1_last_name, 
prm1_email
) 
from 'prm1_data_input'
with (header true, delimiter ';', quote '"')

WHERE prm1_selected='yes';