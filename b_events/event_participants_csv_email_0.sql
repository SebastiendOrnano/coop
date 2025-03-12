select 'csv' 
as component, 
'event_participants_full_list.csv' as filename;

SELECT participant_first_name, participant_last_name, participant_contact_email, participant_contact_phone, participant_function FROM event_participants where event_id=$event_id;
