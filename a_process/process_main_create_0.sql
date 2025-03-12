INSERT INTO process 
(
process_title,
process_description, 
process_category,
process_status,
process_status
)

SELECT 
:process_title,
:process_description, 
:process_category,
:process_status,
:process_status

WHERE :process_title IS NOT NULL
 
 RETURNING  'redirect' AS component,
'/a_process/process_step_display_5.sql?process_id=' ||process_id AS link;