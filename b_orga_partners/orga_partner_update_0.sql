SET orga_id = SELECT orga_id FROM orga_dept WHERE orga_dept_id = :orga_dept_id;
SET orga_partner_logo_url = sqlpage.persist_uploaded_file('orga_partner_logo_url', 'x_logos', 'jpg,jpeg,png');
SET orga_partner_logo_url_old= SELECT orga_partner_logo_url FROM orga_partners WHERE orga_id=$orga_id;
SET orga_partner_logo_url_old_to_erase = CASE WHEN $orga_partner_logo_url IS NOT NULL OR $orga_partner_logo_url !='' THEN $orga_partner_logo_url_old ELSE '' END;
INSERT INTO files_to_erase (file_url) VALUES ($orga_partner_logo_url_old_to_erase);

UPDATE  orga_partners
SET 
orga_partner_name=:orga_partner_name, 
orga_partner_acronym=:orga_partner_acronym,
orga_partner_punchline=:orga_partner_punchline,
orga_partner_scope=:orga_partner_scope,
orga_partner_type=:orga_partner_type,
orga_partner_category=:orga_partner_category,
orga_partner_status=:orga_partner_status,
orga_partner_date_since=:orga_partner_date_since, 
orga_partner_logo_url= 
CASE  
WHEN $orga_partner_logo_url IS NULL OR $orga_partner_logo_url ='' THEN orga_partner_logo_url
ELSE  $orga_partner_logo_url
END,
orga_partner_logo_title=:orga_partner_logo_title,
orga_partner_link=:orga_partner_link,
orga_partner_summary=:orga_partner_summary, 
orga_dept_id=:orga_dept_id,
orga_id=$orga_id
    
WHERE orga_partner_id=$orga_partner_id
RETURNING  'redirect' AS component,
'/b_orga_partners/orga_partner_display_4.sql' AS link;


