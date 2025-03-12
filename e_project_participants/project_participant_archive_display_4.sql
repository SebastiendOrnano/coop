SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;


SET project_name= select project_name FROM projects where project_id=$project_id;

select 
    'datagrid'              as component,
    'panel_project_doc_display' as id,
    'Gestion des partcipants du groupe : '||$project_name as title;
select 
    '/a_panels/panel_supervisor_4.sql'         as link,
    'Retour au tableau de bord superviseur'    as description,
    'corner-down-left-double'                  as icon,
    'blue'                                    as color;

select 
    '/e_project_participants/project_participant_main_display_4.sql?project_id='||$project_id as link,
    'Retour aux particiants actifs'                       as description,
    'corner-down-left'                                         as icon,
    'green'                                                 as color;



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
    p.project_participant_id            AS id,
    p.project_participant_type          AS type,
    p.project_participant_role          AS role,
   '['||i.prm1_first_name||'  '||i.prm1_last_name||'](/d_prm1/prm1_profile_display_4.sql?prm1_id='||i.prm1_id||')'           AS Nom,
   '['|| c.prm2_sub_name ||'](/d_prm2_sub/prm2_sub_main_view_4.sql?prm2_sub_id='||c.prm2_sub_id||')' as Corporate,
    
    '[Edit](/e_project_participants/project_participant_main_edit_4.sql?project_participant_id='||p.project_participant_id||'&project_id='||$project_id||') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Archive](/e_project_participants/project_participant_main_archive_0.sql?project_participant_id='||p.project_participant_id||'&project_id='||$project_id||') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  [Remove](/e_project_participants/project_participant_main_remove_0.sql?project_participant_id='||p.project_participant_id||'&project_id='||$project_id||')'    AS View
FROM project_participants as p
LEFT JOIN (SELECT prm1_id, prm1_first_name, prm1_last_name FROM prm1) as i
ON p.prm1_id = i.prm1_id 
LEFT JOIN (SELECT prm2_sub_id, prm2_sub_name FROM prm2_sub) as c
ON p.prm2_sub_id = c.prm2_sub_id 
WHERE 
p.project_id = $project_id AND p.project_participant_status!='active';

