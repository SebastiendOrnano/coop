
UPDATE info_sections
SET 
section_category=:section_category,
section_number=:section_number,
section_title=:section_title, 
section_content=:section_content, 
section_publication_status=:section_publication_status,
modified_at = CURRENT_TIMESTAMP
WHERE section_id = $section_id

RETURNING 'redirect' AS component, '/a_info/section_display_5.sql' AS link;

