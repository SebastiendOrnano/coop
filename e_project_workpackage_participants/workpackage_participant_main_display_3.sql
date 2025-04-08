SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;


SET workpackage_name= select workpackage_name FROM project_workpackage where workpackage_id=$workpackage_id;
set project_id = select project_id from project_workpackage where  workpackage_id=$workpackage_id;


select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion éditeur'         as title,
    '/a_panels/panel_editor_3.sql' as link;
 select 
    'Retour à la liste des projets'            as title,
    '/e_project/project_main_display_3.sql'     as link;
 select 
    'Retour au hub du projet'            as title,
    '/e_project/project_hub_display_3.sql?project_id='||$project_id     as link; 
select 
    'Retour à la gestion des lots de travaux'    as title,
    '/e_project_workpackage/workpackage_hub_display_3.sql?&project_id='||$project_id       as link;





select 
    'datagrid'              as component,
    'panel_project_doc_display' as id,
    'Gestion des partcipants du projet : '||$workpackage_name as title;
select 
    '/e_project_workpackage_participants/workpackage_participant_main_form1_3.sql?workpackage_id='||$workpackage_id             as link,
    'Ajout d''un nouveau participant (prm1) '                  as description,
    'user-plus'                                      as icon,
    'green'                                         as color;
select 
    '/e_project_workpackage_participants/workpackage_participant_main_form2_3.sql?workpackage_id='||$workpackage_id             as link,
    'Ajout d''un nouveau participant (prm2_sub)'                  as description,
    'user-plus'                                      as icon,
    'orange'                                         as color;
select 
    '/e_project_workpackage_participants/workpackage_participant_main_form3_step1_3.sql?workpackage_id='||$workpackage_id             as link,
    'Ajout  d''un nouvel participant (prm2_sub_employees)'                  as description,
    'user-plus'                                      as icon,
    'red'                                         as color;
select 
    '/e_project_workpackage_participants/workpackage_participant_main_form4_3.sql?workpackage_id='||$workpackage_id             as link,
    'Ajout d''un groupe (prm3)'                   as description,
    'user-plus'                                   as icon,
    'blue'                                        as color;

select  
    '/e_project_workpackage_participants/workpackage_participant_csv_email_0.sql?workpackage_id='||$workpackage_id as link,
    'Téléchargement coordonnées des participants'           as description,
    'file-download'                                         as icon,
    'blue'                                                  as color;

select 
    'title'     as component,
    'Liste des participants actifs'    as contents,
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
   '['||i.prm1_first_name||'  '||i.prm1_last_name||'](/d_prm1/prm1_profile_display_3.sql?prm1_id='||i.prm1_id||')'           AS Nom,
   '['|| c.prm2_sub_name ||'](/d_prm2_sub/prm2_sub_main_view_3.sql?prm2_sub_id='||c.prm2_sub_id||')' as Corporate,
    
    '[Edit](/e_project_workpackage_participants/workpackage_participant_main_edit_3.sql?workpackage_participant_id='||p.workpackage_participant_id||'&workpackage_id='||$workpackage_id||') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Archive](/e_project_workpackage_participants/workpackage_participant_main_archive_0.sql?workpackage_participant_id='||p.workpackage_participant_id||'&workpackage_id='||$workpackage_id||') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  [Remove](/e_project_workpackage_participants/workpackage_participant_main_remove_0.sql?workpackage_participant_id='||p.workpackage_participant_id||'&workpackage_id='||$workpackage_id||')'    AS View
FROM project_workpackage_participants as p
LEFT JOIN (SELECT prm1_id, prm1_first_name, prm1_last_name FROM prm1) as i
ON p.prm1_id = i.prm1_id 
LEFT JOIN (SELECT prm2_sub_id, prm2_sub_name FROM prm2_sub) as c
ON p.prm2_sub_id = c.prm2_sub_id 
WHERE 
p.workpackage_id = $workpackage_id AND p.workpackage_participant_status='active';

