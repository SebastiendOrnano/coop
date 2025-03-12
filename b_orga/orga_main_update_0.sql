SET orga_logo_url = sqlpage.persist_uploaded_file('orga_logo_url', 'x_logos', 'jpg,jpeg,png');

SET orga_logo_old_url= SELECT orga_logo_url FROM orga WHERE orga_id = $orga_id;
SET orga_logo_old_to_erase = CASE WHEN $orga_logo_url IS NOT NULL OR $orga_logo_url !='' THEN $orga_logo_old_url ELSE '' END;
INSERT INTO files_to_erase (file_url) VALUES ($orga_logo_old_to_erase);

UPDATE orga
SET
orga_status = 
    CASE 
    WHEN :orga_status IS NULL OR :orga_status = '' 
    THEN orga_status
    ELSE :orga_status END,
orga_name=:orga_name,
orga_acronym=:orga_acronym,
orga_punchline=:orga_punchline,
orga_summary=:orga_summary,
orga_logo_url=
CASE  
WHEN $orga_logo_url IS NULL OR $orga_logo_url ='' THEN orga_logo_url
ELSE $orga_logo_url
END,
orga_adress=:orga_adress,
orga_postal_code=:orga_postal_code, 
orga_town=:orga_town,
orga_country=:orga_country,
orga_contact_phone=:orga_contact_phone,
orga_contact_mail=:orga_contact_mail,
orga_latitude=:orga_latitude, 
orga_longitude=:orga_longitude,
orga_legal_status = 
    CASE 
    WHEN :orga_legal_status IS NULL OR :orga_legal_status = '' 
    THEN orga_legal_status
    ELSE :orga_legal_status END,
orga_no_siret=:orga_no_siret,
orga_no_siren=:orga_no_siren,
orga_no_rna=:orga_no_rna,
orga_code_naf_ape=:orga_code_naf_ape,
orga_date_creation=:orga_date_creation,
orga_number_employees=:orga_number_employees,
modified_at = CURRENT_TIMESTAMP
WHERE orga_id=$orga_id

RETURNING 'redirect' AS component,
'/b_orga/orga_main_display_4.sql' AS link;