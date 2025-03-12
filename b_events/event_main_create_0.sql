SET place_id = (select place_id from place_spaces where space_id=:space_id);

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
	event_picture_url,
	event_summary,
	event_date,
	event_start_hour,
	event_end_hour,
	event_duration,
	event_audience_target,
	event_participants_nb_max,
	event_registration,
	event_entrance_fee
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
	sqlpage.persist_uploaded_file('event_program_url', 'x_pictures_events', 'pdf,jpg,jpeg,png'),
	sqlpage.persist_uploaded_file('event_picture_url', 'x_pictures_events', 'pdf,jpg,jpeg,png'),
	:event_summary,
	:event_date,
	:event_start_hour,
	:event_end_hour,
	:event_duration,
	:event_audience_target,
	:event_participants_nb_max,
	CASE 
    WHEN :event_registration IS NULL OR :event_registration = '' 
    THEN 'no'
    ELSE :event_registration END,
	CASE 
    WHEN :event_entrance_fee IS NULL OR :event_entrance_fee = '' 
    THEN 'no'
    ELSE :event_entrance_fee END
)

RETURNING 'redirect' AS component,
 '/b_events/event_main_display_4.sql' AS link;


