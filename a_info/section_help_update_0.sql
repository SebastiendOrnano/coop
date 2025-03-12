
UPDATE info_sections
SET 
section_category='help-dev',
section_number=:section_number,
section_title=:section_title, 
section_content=:section_content, 
section_status=:section_status,
modified_at = CURRENT_TIMESTAMP
WHERE section_id = $section_id

RETURNING 'redirect' AS component, '/a_info/section_help_display_5.sql' AS link;

