/* bloc de vérif sur le couple Prénom/Nom de famille et sur le caractère unique de l'email*/

SET orga_id = SELECT orga_id FROM orga_dept WHERE orga_dept_id = :orga_dept_id;

INSERT INTO orga_partners 
(
orga_partner_name, 
orga_partner_acronym,
orga_partner_punchline,
orga_partner_scope,
orga_partner_type,
orga_partner_category,
orga_partner_status, 
orga_partner_date_since, 
orga_partner_logo_url, 
orga_partner_logo_title,
orga_partner_link,
orga_partner_summary, 
orga_dept_id,
orga_id
)
    
SELECT 
:orga_partner_name, 
:orga_partner_acronym,
:orga_partner_punchline,
:orga_partner_scope,
:orga_partner_type,
:orga_partner_category,
:orga_partner_status, 
:orga_partner_date_since, 
sqlpage.persist_uploaded_file('orga_partner_logo_url', 'x_logos', 'jpg,jpeg,png'), 
:orga_partner_logo_title,
:orga_partner_link,
:orga_partner_summary, 
:orga_dept_id,
$orga_id
    
WHERE :orga_partner_name IS NOT NULL
 
RETURNING  'redirect' AS component,
'/b_orga_partners/orga_partner_display_4.sql' AS link;


