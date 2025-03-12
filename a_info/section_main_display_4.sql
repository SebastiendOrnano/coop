SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;



select 
    'button' as component,
    'sm'     as size;
select 
    '/a_info/section_main_form_4.sql'     as link,
    'orange' as outline,
    'Créer une nouvelle section'  as title,
    'user-plus'  as icon;


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
 
   '[Edit](/a_info/section_main_edit_4.sql?section_id=' || section_id || ')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Delete](/a_info/section_main_delete_4.sql?section_id=' || section_id|| ')'    AS View
FROM info_sections
WHERE section_status !='archived' AND section_category!='help-dev'

ORDER BY section_category ASC, cast(section_number as int)  ASC ;
