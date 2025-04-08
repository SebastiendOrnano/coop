SET redirect_link = (
    SELECT
        CASE
            WHEN EXISTS (
                SELECT 1 
                FROM project_meeting
                WHERE project_meeting_place_id  = $project_meeting_place_id
            ) 
            THEN '/e_project_meeting/project_meeting_place_delete_alert2_4.sql'
            
            ELSE ''
        END
);

SELECT 'redirect' AS component, $redirect_link AS link
WHERE $redirect_link != '' OR $redirect IS NOT NULL;


DELETE FROM project_meeting_places WHERE project_meeting_place_id  = $project_meeting_place_id 
RETURNING
'redirect' AS component,
'/e_project_meeting/project_meeting_place_display_4.sql' AS link;