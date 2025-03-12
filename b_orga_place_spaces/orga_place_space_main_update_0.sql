SET place_id = (select place_id from place_spaces where space_id=$space_id);

UPDATE place_spaces 
SET 
space_name=:space_name,
space_level=:space_level,
space_status=:space_status,
space_summary=:space_summary,
space_access=:space_access,
space_type = :space_type,
space_accessibility=:space_accessibility,
space_capacity_seats=:space_capacity_seats,
space_capacity_standup=:space_capacity_standup,
modified_at = CURRENT_TIMESTAMP
WHERE space_id = $space_id

RETURNING 'redirect' AS component,
 '/b_orga_place_spaces/orga_place_space_main_display_4.sql?place_id='||$place_id AS link;


