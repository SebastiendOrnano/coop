SET prm2_logo_url = sqlpage.persist_uploaded_file('prm2_logo_url', 'x_logos', 'jpg,jpeg,png');

SET prm2_logo_old_url= SELECT prm2_logo_url FROM prm2 WHERE prm2_id = $prm2_id;
SET prm2_logo_old_to_erase = CASE WHEN $prm2_logo_url IS NOT NULL OR $prm2_logo_url !='' THEN $prm2_logo_old_url ELSE '' END;
INSERT INTO files_to_erase (file_url) VALUES ($prm2_logo_old_to_erase);


SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN  '/d_prm2/prm2_main_display_4.sql'
ELSE  '/d_prm2/prm2_main_display_3.sql'
END;

UPDATE prm2
SET
prm2_status = 
    CASE 
    WHEN :prm2_status IS NULL OR :prm2_status = '' 
    THEN prm2_status
    ELSE :prm2_status END,
prm2_name=:prm2_name,
prm2_acronym=:prm2_acronym,
prm2_punchline=:prm2_punchline,
prm2_summary=:prm2_summary,
prm2_logo_url=
CASE  
WHEN $prm2_logo_url IS NULL OR $prm2_logo_url ='' THEN prm2_logo_url
ELSE $prm2_logo_url
END,
prm2_summary=:prm2_summary,
prm2_adress=:prm2_adress,
prm2_postal_code=:prm2_postal_code, 
prm2_town=:prm2_town,
prm2_country=:prm2_country,
prm2_contact_phone=:prm2_contact_phone,
prm2_contact_mail=:prm2_contact_mail,
prm2_latitude=:prm2_latitude, 
prm2_longitude=:prm2_longitude,
prm2_legal_status = 
    CASE 
    WHEN :prm2_legal_status IS NULL OR :prm2_legal_status = '' 
    THEN prm2_legal_status
    ELSE :prm2_legal_status END,
prm2_no_siret=:prm2_no_siret,
prm2_no_siren=:prm2_no_siren,
prm2_no_rna=:prm2_no_rna,
prm2_code_naf_ape=:prm2_code_naf_ape,
prm2_date_creation=:prm2_date_creation,
prm2_number_employees=:prm2_number_employees,
modified_at = CURRENT_TIMESTAMP
WHERE prm2_id=$prm2_id

RETURNING 'redirect' AS component,
$redirect_link AS link;