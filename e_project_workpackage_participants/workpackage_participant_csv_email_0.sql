SELECT
    'csv'              as component,
    'Télécharger email-téléphone des participants' as title,
    'email_membres'           as filename,
    'csv'              as class,
    'file-download'    as icon,
    'yellow'            as color,
    ';'                as separator,
    TRUE               as bom;

SELECT
    e.workpackage_participant_id      as ParticipId,
    e.workpackage_participant_role    as ParticipRole,
    e.workpackage_participant_type    as ParticipType,
    t.workpackage_id                  as TeamId,
    t.workpackage_name                as TeamName,
    p.prm1_id                  as PersonId,
    p.prm1_first_name          as PersonFirstName,
    P.prm1_last_name           as PersonName,
    p.prm1_email               as PersonEmail, 
    p.prm1_phone               as PersonPhone,
    c.prm2_sub_name            as CorpoName,
    c.prm2_sub_contact_mail    as CorpoMail,
    c.prm2_sub_contact_phone   as CorpoPhone
FROM project_workpackage_participants as e
LEFT JOIN (SELECT workpackage_id, workpackage_name FROM project_workpackage ) as t
ON e.workpackage_id = t.workpackage_id
LEFT JOIN (SELECT prm1_id, prm1_first_name, prm1_last_name, prm1_email, prm1_phone FROM prm1) as p
ON e.prm1_id = p.prm1_id
LEFT JOIN (SELECT prm2_sub_id, prm2_sub_name, prm2_sub_contact_mail, prm2_sub_contact_phone FROM prm2_sub) as c
ON e.prm2_sub_id = c.prm2_sub_id
WHERE e.workpackage_id = $workpackage_id AND e.workpackage_participant_status= 'active';




