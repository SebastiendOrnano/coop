SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_5.sql') AS properties;

SET process_id= SELECT process_id from process_steps where process_step_id=$process_step_id;

select 
    'button' as component,
    'sm'     as size;
select 
    CONCAT('/a_process/process_steps_edit_5.sql?process_id=',$process_id)   as link,
    'orange' as outline,
    'Voir le process'  as title,
    'user-plus'  as icon;




-- Form for replying to the step
SELECT 'form'      AS component,
 'multipart/form-data' AS enctype,
 'Actualiser une étape' as validate,
 '/a_process/process_step_update_0.sql?process_step_id='||$process_step_id AS action;


SELECT 
'process_step_number'        AS name, 
'number'                     AS type, 
'N° d''ordre de l''étape'    as label,
2                            as width,
(select process_step_number  FROM process_steps WHERE process_step_id = $process_step_id) as value,
TRUE                         as required;

SELECT 
'process_step_icon'      AS name, 
'text'                   AS type, 
2                        as width,
(select process_step_icon  FROM process_steps WHERE process_step_id = $process_step_id) as value,
'icon'                   as label;

SELECT 
'process_step_title'           AS name, 
'text'                         AS type, 
'Nom de l''étape'              as label,
8                       as width,
(select process_step_title  FROM process_steps WHERE process_step_id = $process_step_id) as value,
TRUE                           as required;

SELECT 
'process_step_link'           AS name, 
'text'                        AS type,
(select process_step_link  FROM process_steps WHERE process_step_id = $process_step_id) as value,
'link'                        as label;

SELECT 
'process_step_description'           AS name, 
'text'                               AS type,
(select process_step_description  FROM process_steps WHERE process_step_id = $process_step_id) as value,
'description'                        as label;




