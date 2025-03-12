
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
'help-dev',
:section_status,
:section_number,
:section_lang,
:section_title, 
:section_content
)

RETURNING  'redirect' AS component,
'/a_info/section_help_display_5.sql' as link;


