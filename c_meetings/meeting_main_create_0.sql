SET place_id = (select place_id from place_spaces where space_id=:space_id);

SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN  '/c_meetings/meeting_main_display_4.sql'
ELSE  '/c_meetings/meeting_main_display_3.sql'
END;

INSERT INTO events
(
	event_name,
	event_public_private,
	event_type,
	event_status,
	event_visio,
	event_visio_url,
	event_visio_code,
	place_id,
	space_id,
	event_program_url,
	event_summary,
	event_date,
	event_start_hour,
	event_end_hour,
	event_duration,
	event_audience_target,
	event_participants_nb_max,
	event_registration
)
VALUES 
(
	:event_name,
	:event_public_private,
	:event_type,
	:event_status,
	:event_visio,
	:event_visio_url,
	:event_visio_code,
	$place_id,
	:space_id,
	sqlpage.persist_uploaded_file('event_program_url', 'x_docs', 'pdf,jpg,jpeg,png'),
	:event_summary,
	:event_date,
	:event_start_hour,
	:event_end_hour,
	:event_duration,
	:event_audience_target,
	:event_participants_nb_max,
    :event_registration
)

RETURNING 'redirect' AS component,
$redirect_link AS link;


