DELETE FROM process_steps
WHERE process_id = $process_id


DELETE FROM process
WHERE process_id = $process_id
RETURNING
   'redirect' AS component,
   '/a_process/process_main_display_5.sql' as link;