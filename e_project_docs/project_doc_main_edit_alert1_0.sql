SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link1 =
CASE WHEN $user_role = 'supervisor' 
THEN '4.sql?project_doc_id='||$project_doc_id||'&project_id='||$project_id
ELSE '3.sql?project_doc_id='||$project_doc_id||'&project_id='||$project_id
END;


SET project_doc_local_cloud = SELECT project_doc_local_cloud from project_docs where project_doc_id=$project_doc_id;

SET redirect_link2 = (
    SELECT
    CASE
    when $project_doc_local_cloud='local' THEN 'project_doc_main_edit_'
    when $project_doc_local_cloud='cloud' THEN 'project_doc_cloud_edit_' 
    END  

);

SET redirect_link = CONCAT($redirect_link2,$redirect_link1);

SELECT 'redirect' AS component, 
$redirect_link AS link;