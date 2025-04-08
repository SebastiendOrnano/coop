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
    i.prm3_id                            as prm2_id,
    i.prm3_name                          as nom,
    p.worksequence_id                        as wks_id,
    s.worksequence_name                      as wks_name,
    w.workpackage_name                       as wkp_name,
    s.worksequence_start_date_scheduled	     as wks_start_date_scheduled,	
	s.worksequence_start_date_actual	     as wks_start_date_actual,
	s.worksequence_start_hour_scheduled	     as wks_start_hour_scheduled,
	s.worksequence_start_hour_actual         as wks_start_hour_actual,
	s.worksequence_end_hour_scheduled        as wks_end_hour_scheduled,
	s.worksequence_end_hour_actual           as wks_end_hour_actual,
	s.worksequence_duration_scheduled	     as wks_duration_scheduled,
    (((substr (s.worksequence_end_hour_scheduled,1,2)*60) + (substr (s.worksequence_end_hour_scheduled,4,2)))-(( substr (s.worksequence_start_hour_scheduled,1,2)*60 )+substr (s.worksequence_start_hour_scheduled,4,2) ))/60  as wks__scheduled_hours,
    (((substr (s.worksequence_end_hour_actual,1,2)*60) + (substr (s.worksequence_end_hour_actual,4,2)))-(( substr (s.worksequence_start_hour_actual,1,2)*60 )+substr (s.worksequence_start_hour_actual,4,2) ))/60  as wks_actual_hours
FROM prm3 as i
LEFT JOIN (SELECT worksequence_id, prm3_id FROM project_worksequence_participants) as p
on p.prm3_id=i.prm3_id
LEFT JOIN (SELECT worksequence_id, worksequence_name, workpackage_id, worksequence_start_date_scheduled, worksequence_start_date_actual, worksequence_start_hour_scheduled, worksequence_start_hour_actual, worksequence_end_hour_scheduled, worksequence_end_hour_actual, worksequence_duration_scheduled, worksequence_status  FROM project_worksequence) as s
ON p.worksequence_id = s.worksequence_id
LEFT JOIN (SELECT workpackage_id, workpackage_name, project_id FROM project_workpackage) as w
ON s.workpackage_id = w.workpackage_id
LEFT JOIN (SELECT project_id, project_name FROM project) as p
ON p.project_id = w.project_id
WHERE i.prm3_id=:prm3_id AND w.workpackage_id = $workpackage_id  AND s.worksequence_status='active' ;