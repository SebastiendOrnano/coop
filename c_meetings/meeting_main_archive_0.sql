UPDATE events
SET
	event_status='archived',
    modified_at=CURRENT_TIMESTAMP
WHERE event_id=$event_id

RETURNING 'redirect' AS component,
 '/c_meetings/meeting_main_display_4.sql' AS link;


