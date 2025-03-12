SELECT
    'csv'              as component,
    'Télécharger temps de travail par participant' as title,
    'workhour_participant'           as filename,
    'csv'                            as class,
    'file-download'                  as icon,
    'yellow'                         as color,
    ';'                              as separator,
    TRUE                             as bom;

SELECT
    p.worksequence_participant_id             as participant_id,
    i.prm1_first_name                         as prenom,
    i.prm1_last_name                          AS Nom,
    c.prm2_sub_name                           as Corporate,
    d.prm3_name                               as Team,
    s.worksequence_id                        as wks_id,
    s.worksequence_name                      as wks_name,
    s.workpackage_id                         as wkp_id,
    w.workpackage_name                       as wkp_name,
    s.worksequence_start_date_scheduled	     as wks_start_date_scheduled,	
	s.worksequence_start_date_actual	     as wks_start_date_actual,
	s.worksequence_start_hour_scheduled	     as wks_start_hour_scheduled,
	s.worksequence_start_hour_actual         as  wks_start_hour_actual,
	s.worksequence_end_hour_scheduled        as wks_end_hour_scheduled,
	s.worksequence_end_hour_actual           as wks_end_hour_actual,
	s.worksequence_duration_scheduled	     as wks_duration_scheduled,
	s.worksequence_duration_actual           as wks_duration_actual,
	s.worksequence_completion_percentage	 as wks_completion_percentage,
    (((substr (s.worksequence_end_hour_scheduled,1,2)*60) + (substr (s.worksequence_end_hour_scheduled,4,2)))-(( substr (s.worksequence_start_hour_scheduled,1,2)*60)+substr (s.worksequence_start_hour_scheduled,4,2)))/60  as wks_scheduled_hours,
    (((substr (s.worksequence_end_hour_actual,1,2)*60) + (substr (s.worksequence_end_hour_actual,4,2)))-(( substr (s.worksequence_start_hour_actual,1,2)*60)+substr (s.worksequence_start_hour_actual,4,2)))/60  as wks_actual_hours
FROM project_participants_worksequence as p

LEFT JOIN (SELECT 
worksequence_id, 
worksequence_name, 
workpackage_id, 
worksequence_start_date_scheduled, 
worksequence_start_date_actual,
worksequence_start_hour_scheduled,
worksequence_start_hour_actual,
worksequence_end_hour_scheduled,
worksequence_end_hour_actual,
worksequence_duration_scheduled,
worksequence_duration_actual,
worksequence_completion_percentage, 
worksequence_status
FROM project_worksequences) as s
ON s.worksequence_id = p.worksequence_id

LEFT JOIN (SELECT prm1_id, prm1_first_name, prm1_last_name FROM prm1) as i
ON p.prm1_id = i.prm1_id

LEFT JOIN (SELECT prm2_sub_id, prm2_sub_name FROM prm2_sub) as c
ON p.prm2_sub_id = c.prm2_sub_id

LEFT JOIN (SELECT prm3_id, prm3_name FROM prm3) as d
ON p.prm3_id = d.prm3_id 

LEFT JOIN (SELECT employee_id, prm1_id FROM prm2_sub_employees) as e
ON p.employee_id = e.employee_id 

LEFT JOIN (SELECT prm1_id, prm1_first_name, prm1_last_name FROM prm1) as z
ON e.prm1_id = z.prm1_id 

LEFT JOIN (SELECT workpackage_id, workpackage_name, project_id FROM project_workpackages) as w
ON s.workpackage_id = w.workpackage_id

LEFT JOIN (SELECT project_id, project_name FROM projects) as p
ON p.project_id = w.project_id

WHERE p.project_id = $project_id  AND s.worksequence_status='active';
