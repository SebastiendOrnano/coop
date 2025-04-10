
INSERT INTO info_sections 
(
section_category,
section_status,  
section_number,
section_lang,
section_title, 
section_content
)
values 
( 
:section_category,
:section_status,
:section_number,
:section_lang,
:section_title, 
:section_content
)

RETURNING  'redirect' AS component,
'/a_info/section_main_display_5.sql' as link;


