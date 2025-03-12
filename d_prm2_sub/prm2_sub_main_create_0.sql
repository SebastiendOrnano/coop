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

INSERT INTO prm2_sub 
(   
	prm2_sub_name,
    prm2_id,
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
	prm2_sub_no_rna,
	prm2_sub_no_siren,
	prm2_sub_no_siret,
	prm2_sub_no_tva_intracom,
	prm2_sub_code_naf_ape,
	prm2_sub_date_creation,
	prm2_sub_number_employees,
	prm2_sub_selected
)
VALUES 
(   :prm2_sub_name,
    $prm2_id,
	:prm2_sub_acronym,
	:prm2_sub_logo_url,
	:prm2_sub_punchline,
	:prm2_sub_summary,
	:prm2_sub_adress,
	:prm2_sub_postal_code,
	:prm2_sub_town,
	:prm2_sub_country,
	:prm2_sub_contact_phone,
	:prm2_sub_contact_mail,
	:prm2_sub_latitude,
	:prm2_sub_longitude,
	'dept',
	'active',
	:prm2_sub_legal_status,
	:prm2_sub_no_rna,
	:prm2_sub_no_siren,
	:prm2_sub_no_siret,
	:prm2_sub_no_tva_intracom,
	:prm2_sub_code_naf_ape,
	:prm2_sub_date_creation,
	:prm2_sub_number_employees,
	:prm2_sub_selected
)
RETURNING 'redirect' AS component,
$redirect_link  AS link;


