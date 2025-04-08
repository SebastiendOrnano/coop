SET project_name = select project_name from project where project_id=$project_id;SET project_id = select project_id from project_workpackage where workpackage_id=$workpackage_id;
SET workpackage_name= select workpackage_name FROM project_workpackage where workpackage_id=$workpackage_id;
SET project_name= select project_name FROM project where project_id=$project_id;
SET worksequence_id = select worksequence_id from project_worksequence where workpackage_id=$workpackage_id and worksequence_status='active';


SELECT
    'csv'              as component,
    'Télécharger les heures travaillées sur le projet' as title,
    'heures_travail_projet'    as filename,
    'csv'              as class,
    'file-download'    as icon,
    'yellow'            as color,
    ';'                as separator,
    TRUE               as bom;

SELECT
    s.worksequence_id                        as wks_id,
    s.worksequence_name                      as wks_name,
    w.workpackage_id                         as wkp_id,
    w.workpackage_name                       as wkp_name,
    p.project_id                             as project_id,
    p.project_name                           as project_name,
    s.worksequence_nb_participants           as wks_nb_participants,
    s.worksequence_start_date_scheduled	     as wks_start_date_scheduled,	
	s.worksequence_start_date_actual	     as wks_start_date_actual,
	s.worksequence_start_hour_scheduled	     as wks_start_hour_scheduled,
	s.worksequence_start_hour_actual         as wks_start_hour_actual,
	s.worksequence_end_hour_scheduled        as wks_end_hour_scheduled,
	s.worksequence_end_hour_actual           as wks_end_hour_actual,
	s.worksequence_duration_scheduled	     as wks_duration_scheduled,
	s.worksequence_duration_actual           as wks_duration_actual,
	s.worksequence_completion_percentage	 as wks_completion_percentage,
    (((substr (s.worksequence_end_hour_scheduled,1,2)*60 * s.worksequence_nb_participants) + (substr (s.worksequence_end_hour_scheduled,4,2) * s.worksequence_nb_participants))-(( substr (s.worksequence_start_hour_scheduled,1,2)*60  * s.worksequence_nb_participants)+substr (s.worksequence_start_hour_scheduled,4,2)  * s.worksequence_nb_participants))/60  as wks__scheduled_hours,
    (((substr (s.worksequence_end_hour_actual,1,2)*60 * s.worksequence_nb_participants) + (substr (s.worksequence_end_hour_actual,4,2) * s.worksequence_nb_participants))-(( substr (s.worksequence_start_hour_actual,1,2)*60  * s.worksequence_nb_participants)+substr (s.worksequence_start_hour_actual,4,2)  * s.worksequence_nb_participants))/60  as wks_actual_hours
FROM project_worksequence as s
LEFT JOIN (SELECT workpackage_id, workpackage_name, project_id FROM project_workpackage) as w
ON s.workpackage_id = w.workpackage_id
LEFT JOIN (SELECT project_id, project_name FROM project) as p
ON p.project_id = w.project_id
WHERE 
w.workpackage_id=$workpackage_id AND s.worksequence_status='active';