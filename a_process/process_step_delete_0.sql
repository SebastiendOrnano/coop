SET process_id= SELECT process_id FROM process_steps WHERE process_step_id=$process_step_id;

DELETE FROM process_steps
WHERE process_step_id = $process_step_id
RETURNING
   'redirect' AS component,
   '/a_process/process_step_display_5.sql?process_id='||$process_id as link;