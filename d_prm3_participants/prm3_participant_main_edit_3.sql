SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion éditeur'         as title,
    '/a_panels/panel_editor_3.sql' as link;
select 
    'Gestion des organisations'            as title,
    '/d_prm2/prm2_main_display_3.sql'  as link;
select 
    'Gestion des participants'            as title,
    '/d_prm3_participants/prm3_participant_main_display_3.sql?prm3_id='||$prm3_id  as link;


select 
    'title'     as component,
    'Groupement'    as contents,
    3           as level;

SELECT 
    'form' as component,
    '' as validate;
select 
    'prm3_id' as name,
    'hidden' as type,
    $prm3_id as value,
    'id' as label;
SELECT
    'prm3_name' as name,
    TRUE as readonly,
    'Nom du groupe' as label,
     6 as width,
    (select prm3_name  FROM prm3 WHERE prm3_id = $prm3_id) as value;

select 
    'title'     as component,
    'Participant'    as contents,
    3           as level;

SELECT 
    'form'      AS component,
    'Actualiser un participant' as validate,
    '/d_prm3_participants/prm3_participant_main_update_0.sql?prm3_participant_id='||$prm3_participant_id||'&prm3_id='||$prm3_id AS action;

select 
   'prm1_id' as name,
    'Personne (non modifiable)' as label,
    'text' as type,
     TRUE as readonly,
    6 AS width,
    (SELECT  i.prm1_last_name || '   ' || i.prm1_first_name
    FROM prm3_participants as p
    LEFT JOIN (SELECT prm1_id, prm1_first_name, prm1_last_name FROM prm1) as i
    ON p.prm1_id = i.prm1_id
    WHERE prm3_participant_id=$prm3_participant_id) as value ;

select 
   'prm2_sub_id' as name,
    'Entreprise (non modifiable)' as label,
    'text' as type,
    TRUE as readonly,
    6 AS width,
    (SELECT  c.prm2_sub_name FROM prm3_participants as p
    LEFT JOIN (SELECT prm2_sub_id, prm2_sub_name FROM prm2_sub) as c
    ON p.prm2_sub_id = c.prm2_sub_id 
    WHERE prm3_participant_id=prm3_participant_id) as value ;

SELECT 
    'prm3_participant_role'            as name,
    'Rôle dans le groupement'    as label,
    'select'                       as type,
    4                              AS width,
    (SELECT prm3_participant_role FROM prm3_participants WHERE prm3_participant_id=$prm3_participant_id) AS value,
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
    'prm3_participant_status'      as name,
    'Statut actif-archive'          as label,
    'select'                       as type,
    4                              AS width,
    (SELECT prm3_participant_status FROM prm3_participants WHERE prm3_participant_id=$prm3_participant_id) AS value,
    'Choisir un statut...'           as empty_option,
    '[
    {"label": "Actif", "value": "active"},
    {"label": "Inactif", "value": "inactive"},
    {"label": "Archive", "value": "archived"}
    ]' as options;