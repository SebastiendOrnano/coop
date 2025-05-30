SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

SET workpackage_name= select workpackage_name FROM project_workpackage where workpackage_id=$workpackage_id;
SET project_id = select project_id from project_workpackage where workpackage_id=$workpackage_id;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Superviseur'         as title,
    '/a_panels/panel_supervisor_4.sql' as link;
 select 
    'Retour à la liste des projets'            as title,
    '/e_project/project_main_display_4.sql'     as link;
 select 
    'Retour au hub du projet'            as title,
    '/e_project/project_hub_display_4.sql?project_id='||$project_id     as link; 
select 
    'Retour à la gestion des lots de travaux'    as title,
    '/e_project_workpackage/workpackage_hub_display_4.sql?workpackage_id='||$workpackage_id||'&project_id='||$project_id       as link;
select 
    'Partcipants actifs'    as title,
    '/e_project_workpackage_participants/workpackage_participant_main_display_4.sql?workpackage_id='||$workpackage_id as link;


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
    p.workpackage_participant_id            AS id,
    p.workpackage_participant_type          AS type,
    p.workpackage_participant_role          AS role,
   '['||i.prm1_first_name||'  '||i.prm1_last_name||'](/d_prm1/prm1_profile_display_4.sql?prm1_id='||i.prm1_id||')'           AS Nom,
   '['|| c.prm2_sub_name ||'](/d_prm2_sub/prm2_sub_main_view_4.sql?prm2_sub_id='||c.prm2_sub_id||')' as Corporate,
    
    '[Edit](/e_project_workpackage_participants/workpackage_participant_main_edit_4.sql?workpackage_participant_id='||p.workpackage_participant_id||'&workpackage_id='||$workpackage_id||') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Archive](/e_project_workpackage_participants/workpackage_participant_main_archive_0.sql?workpackage_participant_id='||p.workpackage_participant_id||'&workpackage_id='||$workpackage_id||') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  [Remove](/e_project_workpackage_participants/workpackage_participant_main_remove_0.sql?workpackage_participant_id='||p.workpackage_participant_id||'&workpackage_id='||$workpackage_id||')'    AS View
FROM project_workpackage_participants as p
LEFT JOIN (SELECT prm1_id, prm1_first_name, prm1_last_name FROM prm1) as i
ON p.prm1_id = i.prm1_id 
LEFT JOIN (SELECT prm2_sub_id, prm2_sub_name FROM prm2_sub) as c
ON p.prm2_sub_id = c.prm2_sub_id 
WHERE 
p.workpackage_id = $workpackage_id AND p.workpackage_participant_status!='active';

