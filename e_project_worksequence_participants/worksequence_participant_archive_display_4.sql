SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;


SET worksequence_name= select worksequence_name FROM project_worksequences where worksequence_id=$worksequence_id;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Superviseur'         as title,
    '/a_panels/panel_supervisor_4.sql' as link;
select 
    'Gestion des séquences'            as title,
     '/b_prm2_sub/worksequence_main_display_4.sql?prm2_id='||$prm2_id  as link;
select 
    'Participants actifs'            as title,
    '/e_project_worksequence_participants/worksequence_participant_main_display_4.sql?worksequence_id='||$worksequence_id  as link;


select 
    'title'     as component,
    'Liste des participants archivés'    as contents,
    3           as level;

SELECT 
    'table'               AS component, 
    TRUE                  AS sort, 
    'View'                AS markdown,
    'Nom'                AS markdown,
    'Corporate'              AS markdown,            
    TRUE                  AS search;

SELECT
    p.worksequence_participant_id            AS id,
    p.worksequence_participant_type          AS type,
    p.worksequence_participant_role          AS role,
   '['||i.prm1_first_name||'  '||i.prm1_last_name||'](/d_prm1/prm1_profile_display_4.sql?prm1_id='||i.prm1_id||')'           AS Nom,
   '['|| c.prm2_sub_name ||'](/d_prm2_sub/prm2_sub_main_view_4.sql?prm2_sub_id='||c.prm2_sub_id||')' as Corporate,
    
    '[Edit](/e_project_worksequence_participants/worksequence_participant_main_edit_4.sql?worksequence_participant_id='||p.worksequence_participant_id||'&worksequence_id='||$worksequence_id||') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Archive](/e_project_worksequence_participants/worksequence_participant_main_archive_0.sql?worksequence_participant_id='||p.worksequence_participant_id||'&worksequence_id='||$worksequence_id||') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  [Remove](/e_project_worksequence_participants/worksequence_participant_main_remove_0.sql?worksequence_participant_id='||p.worksequence_participant_id||'&worksequence_id='||$worksequence_id||')'    AS View
FROM project_participants_worksequence as p
LEFT JOIN (SELECT prm1_id, prm1_first_name, prm1_last_name FROM prm1) as i
ON p.prm1_id = i.prm1_id 
LEFT JOIN (SELECT prm2_sub_id, prm2_sub_name FROM prm2_sub) as c
ON p.prm2_sub_id = c.prm2_sub_id 
WHERE 
p.worksequence_id = $worksequence_id AND p.worksequence_participant_status!='active';

