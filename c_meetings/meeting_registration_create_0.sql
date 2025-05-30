INSERT INTO event_participants 
(
event_id,
participant_gender, 
participant_first_name, 
participant_last_name,
participant_contact_phone, 
participant_contact_email, 
participant_age,
participant_postal_code,
participant_rgpd_validation
)
VALUES
(
$event_id,
:participant_gender, 
:participant_first_name, 
:participant_last_name,
:participant_contact_phone, 
:participant_contact_email, 
:participant_age,
:participant_postal_code,
'yes'
);

UPDATE events
SET
event_participants_nb = event_participants_nb +1,
modified_at = CURRENT_TIMESTAMP
WHERE event_id=$event_id
 
RETURNING  'redirect' AS component,
'/c_meetings/meeting_registration_confirm_1.sql' AS link;