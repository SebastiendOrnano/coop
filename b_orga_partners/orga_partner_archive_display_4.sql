SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Superviseur'         as title,
    '/a_panels/panel_supervisor_4.sql' as link;
select 
    'Gestion des partenaires'            as title,
    '/b_orga_partners/orga_partner_display_4.sql' as link;

-- Supervisor panel to manage orga_partners
-- Display list of  aarchived partners



/* 
if you want to paginate the table of orga_partners you have to uncomment the following button 
AND the final line
LIMIT IFNULL($page, 20) OFFSET IFNULL($offset, 0)
at the end of the table component

but if you paginate, the search on a name will be only in the page of screen !
*/

/* 
SELECT 
    'button' as component,
    TRUE AS center;

SELECT 
    '|<' as title, 
    '?offset=0&page=' || IFNULL($page, 20) as link,
    cast(IFNULL($offset, 0) as integer) <= 0 as disabled;

SELECT '<<' as title, 
    '?offset=' || (IFNULL($offset, 0) - IFNULL($page, 20)) || '&page=' || IFNULL($page, 20) as link,
    cast(IFNULL($offset, 0) as integer) <= 0 as disabled;

SELECT '>>' as title, 
  '?offset=' || (IFNULL($offset, 0) + IFNULL($page, 20)) || '&page=' || IFNULL($page, 20) as link; */


SELECT
    'divider' as component,
    'black' as color,
    'left' as position,
    'Liste des partenaires archivés' as contents;

SELECT 'table' AS component, 
    'Liste des utilisateur'   AS title, 
    'View'           AS markdown,
    'Img'  as markdown,
    TRUE             AS sort, 
    TRUE             AS search;

SELECT       
   --'![view picture]('||$picture||')'    AS Img,
   '![view picture]('||orga_partner_logo_url||')' AS Img,
   orga_partner_name     AS Nom,
   orga_partner_acronym  AS Sigle,
    orga_partner_type    AS Type,
   orga_partner_category     AS Categorie,
   orga_partner_status as statut,
  '[Edit](/b_orga_partners/orga_partner_edit_4.sql?orga_partner_id=' || orga_partner_id || ')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Delete](/b_orga_partners/orga_partner_delete_0.sql?orga_partner_id=' || orga_partner_id|| ')'    AS View
FROM orga_partners
WHERE orga_partner_name IS NOT NULL AND orga_partner_status ='archived'
ORDER BY orga_partner_type asc
-- LIMIT IFNULL($page, 20) OFFSET IFNULL($offset, 0)
;

