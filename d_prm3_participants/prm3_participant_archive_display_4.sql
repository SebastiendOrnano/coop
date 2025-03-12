SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;


SET prm3_name= select prm3_name from prm3 where prm3_id=$prm3_id;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Superviseur'         as title,
    '/a_panels/panel_supervisor_4.sql' as link;
select 
    'Gestion des groupements'            as title,
     '/d_prm3/prm3_main_display_4.sql' as link;
select 
    'Participants actifs du groupement'            as title,
    '/d_prm3_participants/prm3_participant_main_display_4.sql?prm3_id='||$prm3_id  as link;


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
    p.prm3_participant_id            AS id,
    p.prm3_participant_type          AS type,
    p.prm3_participant_role          AS role,
   '['||i.prm1_first_name||'  '||i.prm1_last_name||'](/d_prm1/prm1_profile_display_4.sql?prm1_id='||i.prm1_id||')'           AS Nom,
   '['|| c.prm2_sub_name ||'](/d_prm2_sub/prm2_sub_main_view_4.sql?prm2_sub_id='||c.prm2_sub_id||')' as Corporate,
    
    '[Edit](/d_prm3_participants/prm3_participant_main_edit_4.sql?prm3_participant_id='||p.prm3_participant_id||'&prm3_id='||$prm3_id||') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Archive](/d_prm3_participants/prm3_participant_main_archive_0.sql?prm3_participant_id='||p.prm3_participant_id||'&prm3_id='||$prm3_id||') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  [Remove](/d_prm3_participants/prm3_participant_main_remove_0.sql?prm3_participant_id='||p.prm3_participant_id||'&prm3_id='||$prm3_id||')'    AS View
FROM prm3_participants as p
LEFT JOIN (SELECT prm1_id, prm1_first_name, prm1_last_name FROM prm1) as i
ON p.prm1_id = i.prm1_id 
LEFT JOIN (SELECT prm2_sub_id, prm2_sub_name FROM prm2_sub) as c
ON p.prm2_sub_id = c.prm2_sub_id 
WHERE 
p.prm3_id = $prm3_id AND p.prm3_participant_status!='active';

