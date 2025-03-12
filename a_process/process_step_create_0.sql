
SET process_id=$process_id;


INSERT INTO process_steps 
(
    process_step_title,
process_id, 
process_step_number, 
process_step_description, 
process_step_icon, 
process_step_link
)
   
SELECT 
:process_step_title,
$process_id,
:process_step_number, 
:process_step_description, 
:process_step_icon,
:process_step_link
WHERE :process_step_title IS NOT NULL
 
RETURNING  'redirect' AS component,
'/a_process/process_step_display_5.sql?process_id='||$process_id  AS link;