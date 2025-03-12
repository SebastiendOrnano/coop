
SET process_id= SELECT process_id from process_steps where process_step_id=$process_step_id;

UPDATE  process_steps
SET 
process_step_title=:process_step_title, 
process_step_number=:process_step_number, 
process_step_description=:process_step_description, 
process_step_icon=:process_step_icon, 
process_step_link=:process_step_link, 
modified_at = CURRENT_TIMESTAMP
WHERE process_step_id=$process_step_id
 
RETURNING  'redirect' AS component,
'/a_process/process_step_display_5.sql?process_id='||$process_id  AS link;