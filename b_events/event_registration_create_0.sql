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
:participant_rgpd_validation
) 
WHERE :participant_last_name IS NOT NULL;


UPDATE events
SET
event_participants_nb = event_participants_nb +1,
modified_at = CURRENT_TIMESTAMP
WHERE event_id=$event_id
 
RETURNING  'redirect' AS component,
'/b_events/event_registration_confirm.sql' AS link;