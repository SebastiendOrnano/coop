
UPDATE info_sections
SET 
section_category=:section_category,
section_number=:section_number,
section_title=:section_title, 
section_content=:section_content, 
section_status=:section_status,
modified_at = CURRENT_TIMESTAMP
WHERE section_id = $section_id

RETURNING 'redirect' AS component, '/a_info/section_main_display_4.sql' AS link;

