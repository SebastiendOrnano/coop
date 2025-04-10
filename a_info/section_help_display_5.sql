SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_5.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion admin'         as title,
    '/a_panels/panel_admin_5.sql' as link;
 
select 
    'datagrid'              as component,
    'Gestion des sections des manuels utilisateurs et développeurs' as title;

SELECT
    '/a_info/section_help_form_5.sql'             as link,
    'Créer une nouvelle section'                  as description,
    'section'                                     as icon,
    'yellow'                                      as color;
SELECT
    '/a_info/section_help_archive_display_5.sql'  as link,
    'Sections archivées'                          as description,
    'archive'                                     as icon,
    'blue'                                        as color;

/*render the table
SELECT 'table' AS component;
SELECT * FROM todo
WHERE id >= COALESCE($start_id, 0) ORDER BY id LIMIT 5;

-- render the page numbers with links for pagination
SELECT 'steps' as component, true as counter;
SELECT format('?start_id=%s', id) AS link
FROM (SELECT id, ROW_NUMBER() OVER (ORDER BY id) AS table_index FROM todo)
WHERE table_index % 5 = 1;*/



-- Display list of sections
SELECT 'table' AS component, 
    'Liste des sections'   AS title, 
    'View'           AS markdown,
    TRUE    as hover,
   
    TRUE             AS sort, 
    TRUE             AS search;

SELECT       
   section_id                  AS Id,
   section_category            AS Catégorie,
   section_number              AS NoChrono,
   section_status  as Publication,
   section_title               AS Titre,
 
   '[Edit](/a_info/section_help_edit_5.sql?section_id=' || section_id || ')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Delete](/a_info/section_help_delete_5.sql?section_id=' || section_id|| ')'    AS View
FROM info_sections
WHERE section_status !='archived' AND section_category='help-dev'

ORDER BY section_category ASC, cast(section_number as int)  ASC ;
