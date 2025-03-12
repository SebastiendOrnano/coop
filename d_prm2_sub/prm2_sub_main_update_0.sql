SET prm2_id = (select prm2_id FROM prm2_sub where prm2_sub_id=$prm2_sub_id);
SET prm2_sub_logo_url = sqlpage.persist_uploaded_file('prm2_sub_logo_url', 'x_logos', 'jpg,jpeg,png');
SET prm2_sub_logo_old_url= SELECT prm2_sub_logo_url FROM prm2_sub WHERE prm2_sub_id = $prm2_sub_id;
SET prm2_sub_logo_old_to_erase = CASE WHEN $prm2_sub_logo_url IS NOT NULL OR $prm2_sub_logo_url !='' THEN $prm2_sub_logo_old_url ELSE '' END;
INSERT INTO files_to_erase (file_url) VALUES ($prm2_sub_logo_old_to_erase);

SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN  '/d_prm2_sub/prm2_sub_main_display_4.sql?prm2_id='||$prm2_id
ELSE  '/d_prm2_sub/prm2_sub_main_display_3.sql?prm2_id='||$prm2_id
END;

UPDATE prm2_sub
SET 
prm2_sub_name=:prm2_sub_name,
prm2_sub_acronym=:prm2_sub_acronym,
prm2_sub_punchline=:prm2_sub_punchline,
prm2_sub_summary=:prm2_sub_summary,
prm2_sub_logo_url=
CASE  
WHEN $prm2_sub_logo_url IS NULL OR $prm2_sub_logo_url ='' THEN prm2_sub_logo_url
ELSE $prm2_sub_logo_url
END,
prm2_sub_adress=:prm2_sub_adress,
prm2_sub_postal_code=:prm2_sub_postal_code, 
prm2_sub_town=:prm2_sub_town,
prm2_sub_country=:prm2_sub_country,
prm2_sub_contact_phone=:prm2_sub_contact_phone,
prm2_sub_contact_mail=:prm2_sub_contact_mail,
prm2_sub_latitude=:prm2_sub_latitude, 
prm2_sub_longitude=:prm2_sub_longitude,
prm2_sub_status=:prm2_sub_status,
prm2_sub_legal_status = 
    CASE 
    WHEN :prm2_sub_legal_status IS NULL OR :prm2_sub_legal_status = '' 
    THEN prm2_sub_legal_status
    ELSE :prm2_sub_legal_status END,
prm2_sub_no_siret=:prm2_sub_no_siret,
prm2_sub_no_siren=:prm2_sub_no_siren,
prm2_sub_no_rna=:prm2_sub_no_rna,
prm2_sub_code_naf_ape=:prm2_sub_code_naf_ape,
prm2_sub_date_creation=:prm2_sub_date_creation,
prm2_sub_nb_employees=:prm2_sub_nb_employees,
modified_at = CURRENT_TIMESTAMP
WHERE prm2_sub_id = $prm2_sub_id

RETURNING 'redirect' AS component,
$redirect_link AS link;


