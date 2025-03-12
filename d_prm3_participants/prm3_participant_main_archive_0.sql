SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN     '/d_prm3_participants/prm3_participant_main_display_4.sql?prm3_id='||$prm3_id
ELSE     '/d_prm3_participants/prm3_participant_main_display_3.sql?prm3_id='||$prm3_id
END;


UPDATE prm3_participants 
SET
prm3_participant_status='archived',
modified_at=CURRENT_TIMESTAMP
WHERE prm3_participant_id=$prm3_participant_id;

select 
    'redirect'      as component,
    $redirect_link  as link;