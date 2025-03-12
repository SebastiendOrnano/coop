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

INSERT INTO prm2
(
	prm2_name,
	prm2_acronym,
	prm2_logo_url,
	prm2_punchline,
	prm2_summary,
	prm2_adress,
	prm2_postal_code,
	prm2_town,
	prm2_country,
	prm2_contact_phone,
	prm2_contact_mail,
	prm2_latitude,
	prm2_longitude,
	prm2_status,
	prm2_legal_status,
	prm2_no_siren,
	prm2_no_siret,
	prm2_no_rna,
	prm2_no_tva_intracom,
	prm2_code_naf_ape,
	prm2_date_creation,
	prm2_number_employees
)
VALUES 
(
	:prm2_name,
	:prm2_acronym,
	:prm2_logo_url,
	:prm2_punchline,
	:prm2_summary,
	:prm2_adress,
	:prm2_postal_code,
	:prm2_town,
	:prm2_country,
	:prm2_contact_phone,
	:prm2_contact_mail,
	:prm2_latitude,
	:prm2_longitude,
	:prm2_status,
	:prm2_legal_status,
	:prm2_no_siren,
	:prm2_no_siret,
	:prm2_no_rna,
	:prm2_no_tva_intracom,
	:prm2_code_naf_ape,
	:prm2_date_creation,
	:prm2_number_employees
)

SET prm2_id = (SELECT MAX(prm2_id) FROM prm2 WHERE prm2_name = :prm2_name);



INSERT INTO prm2_sub
(
	prm2_id,
	prm2_sub_name,
	prm2_sub_acronym,
	prm2_sub_logo_url,
	prm2_sub_punchline,
	prm2_sub_summary,
	prm2_sub_adress,
	prm2_sub_postal_code,
	prm2_sub_town,
	prm2_sub_country,
	prm2_sub_contact_phone,
	prm2_sub_contact_mail,
	prm2_sub_latitude,
	prm2_sub_longitude,
	prm2_sub_rank,
	prm2_sub_status,
	prm2_sub_legal_status,
	prm2_sub_no_siren,
	prm2_sub_no_siret,
	prm2_sub_no_rna,
	prm2_sub_no_tva_intracom,
	prm2_sub_code_naf_ape,
	prm2_sub_date_creation,
	prm2_sub_number_employees
)
VALUES 
(
	$prm2_id,
	:prm2_name,
	:prm2_acronym,
	:prm2_logo_url,
	:prm2_punchline,
	:prm2_summary,
	:prm2_adress,
	:prm2_postal_code,
	:prm2_town,
	:prm2_country,
	:prm2_contact_phone,
	:prm2_contact_mail,
	:prm2_latitude,
	:prm2_longitude,
	'main',
	'active',
	:prm2_legal_status,
	:prm2_no_siren,
	:prm2_no_siret,
	:prm2_no_rna,
	:prm2_no_tva_intracom,
	:prm2_code_naf_ape,
	:prm2_date_creation,
	:prm2_number_employees
)

RETURNING 'redirect' AS component,
$redirect_link AS link;


