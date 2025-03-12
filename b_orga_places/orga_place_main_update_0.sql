UPDATE place SET 
place_name=:place_name,
place_status=:place_status,
place_summary=:place_summary,
place_adress=:place_adress,
place_postal_code=:place_postal_code, 
place_town=:place_town,
place_country=:place_country,
place_contact_phone=:place_contact_phone,
place_contact_mail=:place_contact_mail,
place_latitude=:place_latitude, 
place_longitude=:place_longitude,
place_type = :place_type,
place_accessibility=:place_accessibility,
place_capacity_seats=:place_capacity_seats,
place_capacity_standup=:place_capacity_standup,
modified_at = CURRENT_TIMESTAMP
WHERE place_id = $place_id;

UPDATE  place_spaces SET 
space_name=:place_name,
space_type=:place_type,
space_accessibility=:place_accessibility,
space_capacity_seats=:place_capacity_seats,
space_capacity_standup=:place_type
WHERE place_id = $place_id

RETURNING 'redirect' AS component,
 '/b_orga_places/orga_place_main_display_4.sql' AS link;


