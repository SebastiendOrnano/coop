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


UPDATE events
SET
	event_name=:event_name,
	event_public_private=
	CASE
	WHEN :event_public_private IS NULL OR :event_public_private='' THEN event_public_private
	ELSE :event_public_private
	END,
	event_status=
	CASE
	WHEN :event_status IS NULL OR :event_status='' THEN event_status
	ELSE :event_status
	END,
	event_type=
	CASE
	WHEN :event_type IS NULL OR :event_type='' THEN event_type
	ELSE :event_type
	END,
	event_visio=
	CASE
	WHEN :event_visio IS NULL OR :event_visio='' AND  event_visio IS NULL OR event_visio='' THEN 'no'
	WHEN :event_visio IS NULL OR :event_visio='' AND  event_visio !='' THEN event_visio
	ELSE :event_visio
	END,
	event_visio_url=:event_visio_url,
	event_visio_code=:event_visio_code,
	place_id=$place_id,
	space_id=:space_id,
    event_program_url= 
    CASE
    WHEN sqlpage.persist_uploaded_file('event_program_url', 'x_docs', 'pdf,jpg,jpeg,png') IS NULL AND (event_program_url != '' OR event_program_url IS NOT NULL) THEN event_program_url
    WHEN sqlpage.persist_uploaded_file('event_program_url', 'x_docs', 'pdf,jpg,jpeg,png') IS NULL AND (event_program_url = '' OR event_program_url IS  NULL) THEN ''
    ELSE sqlpage.persist_uploaded_file('event_program_url', 'x_docs', 'pdf,jpg,jpeg,png')  
    END,
		event_summary=:event_summary,
	event_date=:event_date,
	event_start_hour=:event_start_hour,
	event_end_hour=:event_end_hour,
	event_duration=:event_duration,
	event_audience_target=:event_audience_target,
	event_participants_nb_max=:event_participants_nb_max,
	event_registration=	CASE
	WHEN :event_registration IS NULL OR :event_registration='' THEN event_registration
	ELSE :event_registration
	END
WHERE event_id=$event_id

RETURNING 'redirect' AS component,
$redirect_link AS link;


