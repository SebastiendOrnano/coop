SET orga_id = (select orga_id from orga_dept where orga_dept_id=$orga_dept_id);
SET orga_dept_logo_url = sqlpage.persist_uploaded_file('orga_dept_logo_url', 'x_logos', 'jpg,jpeg,png');
SET orga_dept_logo_old_url= SELECT orga_dept_logo_url FROM orga_dept WHERE orga_dept_id = $orga_dept_id;
SET orga_dept_logo_old_to_erase = CASE WHEN $orga_dept_logo_url IS NOT NULL OR $orga_dept_logo_url !='' THEN $orga_dept_logo_old_url ELSE '' END;
INSERT INTO files_to_erase (file_url) VALUES ($orga_dept_logo_old_to_erase);


UPDATE orga_dept
SET 
orga_dept_name=:orga_dept_name,
orga_dept_acronym=:orga_dept_acronym,
orga_dept_punchline=:orga_dept_punchline,
orga_dept_summary=:orga_dept_summary,
orga_dept_logo_url=
CASE  
WHEN $orga_dept_logo_url IS NULL OR $orga_dept_logo_url ='' THEN orga_dept_logo_url
ELSE $orga_dept_logo_url
END,
orga_dept_adress=:orga_dept_adress,
orga_dept_postal_code=:orga_dept_postal_code, 
orga_dept_town=:orga_dept_town,
orga_dept_country=:orga_dept_country,
orga_dept_contact_phone=:orga_dept_contact_phone,
orga_dept_contact_mail=:orga_dept_contact_mail,
orga_dept_latitude=:orga_dept_latitude, 
orga_dept_longitude=:orga_dept_longitude,
orga_dept_status=:orga_dept_status,
orga_dept_legal_status = 
    CASE 
    WHEN :orga_dept_legal_status IS NULL OR :orga_dept_legal_status = '' 
    THEN orga_dept_legal_status
    ELSE :orga_dept_legal_status END,
orga_dept_no_siret=:orga_dept_no_siret,
orga_dept_no_siren=:orga_dept_no_siren,
orga_dept_no_rna=:orga_dept_no_rna,
orga_dept_code_naf_ape=:orga_dept_code_naf_ape,
orga_dept_date_creation=:orga_dept_date_creation,
orga_dept_number_employees=:orga_dept_number_employees,
modified_at = CURRENT_TIMESTAMP
WHERE orga_dept_id = $orga_dept_id

RETURNING 'redirect' AS component,
 '/b_orga_dept/orga_dept_main_display_4.sql?orga_id='||$orga_id AS link;


