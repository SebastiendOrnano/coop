SET place_id = (select place_id from place_spaces where space_id=:space_id);

SET event_program_url = sqlpage.persist_uploaded_file('event_program_url', 'x_pictures_events', 'pdf,jpg,jpeg,png');
SET event_program_old_url= SELECT event_program_url FROM events WHERE event_id=$event_id;
SET event_program_old_to_erase = CASE WHEN $event_program_url IS NOT NULL OR $event_program_old_url !='' THEN $event_program_old_url ELSE '' END;
INSERT INTO files_to_erase (file_url) VALUES ($event_program_old_to_erase);

SET event_picture_url = sqlpage.persist_uploaded_file('event_picture_url', 'x_pictures_events', 'pdf,jpg,jpeg,png');
SET event_picture_old_url= SELECT event_picture_url FROM events WHERE event_id=$event_id;
SET event_picture_old_to_erase = CASE WHEN $event_picture_url IS NOT NULL OR $event_picture_old_url !='' THEN $event_picture_old_url ELSE '' END;
INSERT INTO files_to_erase (file_url) VALUES ($event_picture_old_to_erase);

UPDATE events
SET
	event_name=:event_name,
	event_public_private=:event_public_private,
	event_status=:event_status,
	event_type=:event_type,
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
    WHEN $event_program_url IS NULL OR $event_program_url ='' THEN event_program_url
    ELSE $event_program_url
    END,
	event_picture_url=
    CASE  
    WHEN $event_picture_url IS NULL OR $event_picture_url ='' THEN event_picture_url
    ELSE $event_picture_url
    END,
	event_summary=:event_summary,
	event_date=:event_date,
	event_start_hour=:event_start_hour,
	event_end_hour=:event_end_hour,
	event_duration=:event_duration,
	event_audience_target=:event_audience_target,
	event_participants_nb_max=:event_participants_nb_max,
	event_registration=:event_registration,
	event_entrance_fee=:event_entrance_fee
WHERE event_id=$event_id

RETURNING 'redirect' AS component,
 '/b_events/event_main_display_4.sql' AS link;


