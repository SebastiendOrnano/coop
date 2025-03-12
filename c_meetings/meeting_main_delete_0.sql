SET event_picture_url= (SELECT event_picture_url FROM events WHERE  event_id = $event_id);
SET event_program_url= (SELECT event_program_url FROM events WHERE  event_id = $event_id);

INSERT INTO files_to_erase
(
    file_url
)
VALUES
(
    $event_picture_url
);

INSERT INTO files_to_erase
(
    file_url
)
VALUES
(
    $event_program_url
);


DELETE FROM events
WHERE event_id  = $event_id;

RETURNING 'redirect' AS component,
 '/c_meetings/meeting_main_display_4.sql' AS link;


