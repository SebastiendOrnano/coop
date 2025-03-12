SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Superviseur'         as title,
    '/a_panels/panel_supervisor_4.sql' as link;
select 
    'Gestion des organisations'            as title,
    '/d_prm2/prm2_main_display_4.sql'  as link;
select 
    'Gestion des participants'            as title,
    '/e_project_workpackage_participants/workpackage_participant_main_display_4.sql?workpackage_id='||$workpackage_id  as link;


select 
    'title'     as component,
    'Groupement'    as contents,
    3           as level;

SELECT 
    'form' as component,
    '' as validate;
select 
    'workpackage_id' as name,
    'hidden' as type,
    $workpackage_id as value,
    'id' as label;
SELECT
    'workpackage_name' as name,
    TRUE as readonly,
    'Nom du groupe' as label,
     6 as width,
    (select workpackage_name  FROM project_workpackages WHERE workpackage_id = $workpackage_id) as value;

select 
    'title'     as component,
    'Participant'    as contents,
    3           as level;

SELECT 
    'form'      AS component,
    'Actualiser un participant' as validate,
    '/e_project_workpackage_participants/workpackage_participant_main_update_0.sql?workpackage_participant_id='||$workpackage_participant_id||'&workpackage_id='||$workpackage_id AS action;

select 
   'prm1_id' as name,
    'Personne (non modifiable)' as label,
    'text' as type,
     TRUE as readonly,
    6 AS width,
    (SELECT  i.prm1_last_name || '   ' || i.prm1_first_name
    FROM project_participants_workpackage as p
    LEFT JOIN (SELECT prm1_id, prm1_first_name, prm1_last_name FROM prm1) as i
    ON p.prm1_id = i.prm1_id
    WHERE workpackage_participant_id=$workpackage_participant_id) as value ;

select 
   'prm2_sub_id' as name,
    'Entreprise (non modifiable)' as label,
    'text' as type,
    TRUE as readonly,
    6 AS width,
    (SELECT  c.prm2_sub_name FROM project_participants_workpackage as p
    LEFT JOIN (SELECT prm2_sub_id, prm2_sub_name FROM prm2_sub) as c
    ON p.prm2_sub_id = c.prm2_sub_id 
    WHERE workpackage_participant_id=workpackage_participant_id) as value ;

SELECT 
    'workpackage_participant_role'            as name,
    'Rôle dans le groupement'    as label,
    'select'                       as type,
    4                              AS width,
    (SELECT workpackage_participant_role FROM project_participants_workpackage WHERE workpackage_participant_id=$workpackage_participant_id) AS value,
    'Choisir un rôle...'           as empty_option,
    '[
    {"label": "Pilote", "value": "pilot"},
    {"label": "Coordinateur", "value": "coordinator"},
    {"label": "Encadrant technique", "value": "technical"},
    {"label": "formateur", "value": "coach"},
    {"label": "Représentant legal", "value": "legal"},
    {"label": "Responsable finance", "value": "finance"},
    {"label": "Responsable commercial", "value": "commercial"},
    {"label": "Autre", "value": "N"}
    ]' as options;

SELECT 
    'workpackage_participant_status'      as name,
    'Statut actif-archive'          as label,
    'select'                       as type,
    4                              AS width,
    (SELECT workpackage_participant_status FROM project_participants_workpackage WHERE workpackage_participant_id=$workpackage_participant_id) AS value,
    'Choisir un statut...'           as empty_option,
    '[
    {"label": "Actif", "value": "active"},
    {"label": "Inactif", "value": "inactive"},
    {"label": "Archive", "value": "archived"}
    ]' as options;