SET place_id = 
CASE WHEN :space_id IS NULL OR :space_id='' THEN ''
ELSE (select place_id from place_spaces where space_id=:space_id)
END;

SET user_id = (
    SELECT users.user_id AS UserId FROM users
    INNER JOIN sessions ON sessions.user_id = UserId
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET workspace_id=(SELECT workspace_id FROM workmeetings WHERE workmeeting_id=$workmeeting_id);

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN '/c_workspaces/workspace_hub_display_4.sql?workspace_id='||$workspace_id
ELSE '/c_workspaces/workspace_hub_display_3.sql?workspace_id='||$workspace_id
END;

UPDATE workmeetings
SET
	workmeeting_title = :workmeeting_title,
	workmeeting_type =  :workmeeting_type,
	workmeeting_status = :workmeeting_status,
	workmeeting_visio = :workmeeting_visio,
	workmeeting_visio_url = :workmeeting_visio_url,
	workmeeting_visio_code = :workmeeting_visio_code,
	place_id = $place_id,
	space_id = :space_id,
	workmeeting_agenda = :workmeeting_agenda,
	workmeeting_date = :workmeeting_date,
	workmeeting_hour_start = :workmeeting_hour_start,
	workmeeting_hour_end = :workmeeting_hour_end,
	workmeeting_duration =:workmeeting_duration,
    workmeeting_alert = :workmeeting_alert,
    modified_at=CURRENT_TIMESTAMP
WHERE workmeeting_id = $workmeeting_id

RETURNING 'redirect' AS component,
 $redirect_link AS link;


