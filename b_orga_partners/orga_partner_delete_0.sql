SET orga_partner_logo_url= (SELECT orga_partner_logo_url  FROM orga_partners WHERE  orga partner_id = $orga_partner_id);

INSERT INTO files_to_erase
(
    file_url
)
VALUES
(
    $orga_partner_logo_url
);

DELETE FROM orga_partners
WHERE orga_partner_id = $orga_partner_id
RETURNING
   'redirect' AS component,
   '/b_orga_partners/orga_partner_display_4.sql' as link;