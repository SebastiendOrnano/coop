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
    i.prm2_sub_id                            as prm2_id,
    i.prm2_sub_name                          as nom,
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
FROM prm2_sub as i
LEFT JOIN (SELECT worksequence_id, prm2_sub_id FROM project_participants_worksequence) as p
on p.prm2_sub_id=i.prm2_sub_id
LEFT JOIN (SELECT worksequence_id, worksequence_name, workpackage_id, worksequence_start_date_scheduled, worksequence_start_date_actual, worksequence_start_hour_scheduled, worksequence_start_hour_actual, worksequence_end_hour_scheduled, worksequence_end_hour_actual, worksequence_duration_scheduled, worksequence_status  FROM project_worksequences) as s
ON p.worksequence_id = s.worksequence_id
LEFT JOIN (SELECT workpackage_id, workpackage_name, project_id FROM project_workpackages) as w
ON s.workpackage_id = w.workpackage_id
LEFT JOIN (SELECT project_id, project_name FROM projects) as p
ON p.project_id = w.project_id
WHERE i.prm2_sub_id=:prm2_sub_id AND p.project_id = $project_id AND s.worksequence_status='active' ;