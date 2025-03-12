SET redirect_link1 =
(
    SELECT
        CASE
            WHEN  :sprint='independant'
            THEN '/e_project_sprints/sprint_main_form1_4.sql?project_id='||$project_id
            ELSE '/e_project_sprints/sprint_main_form2_4.sql?project_id='||$project_id
        END
);

SELECT 
	'redirect' AS component, 
	$redirect_link1 AS link
	WHERE $redirect_link1 != '' OR $redirect1 IS NOT NULL;
