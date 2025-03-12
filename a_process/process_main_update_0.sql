UPDATE process
SET
process_title=:process_title,
process_description= :process_description,
process_category =:process_category,
process_status = 
    CASE 
    WHEN :process_status IS NULL OR :process_status = '' 
    THEN process_status
    ELSE :process_status END,
process_status = 
    CASE 
    WHEN :process_status IS NULL OR :process_status = '' 
    THEN process_status
    ELSE :process_status END,

modified_at=CURRENT_TIMESTAMP

 WHERE process_id=$process_id 
 
RETURNING  'redirect' AS component,
'/a_process/process_main_display_5.sql' AS link;