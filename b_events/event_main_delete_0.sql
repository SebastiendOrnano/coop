INSERT INTO files_to_erase (file_url) SELECT event_program_url FROM events WHERE event_id=$event_id;
INSERT INTO files_to_erase (file_url) SELECT event_picture_url FROM events WHERE event_id=$event_id;

DELETE FROM events
WHERE event_id  = $event_id

RETURNING
'redirect' AS component,
'/b_events/event_main_display_4.sql' AS link;