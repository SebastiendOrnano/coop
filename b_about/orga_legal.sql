SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell.sql') AS properties;

select 
    'title'   as component,
    'Mentions légales' as contents,
    TRUE      as center;

SELECT

'text' as component;

SELECT

'Ce site est soumis au régime juridique français. À ce titre, il est un service de communication au public en ligne édité à titre non professionnel au sens de l’article 6, Ⅲ, 2° de la loi 2004‑575 du 21 juin 2004. ' as contents_md;



select 
     'foldable' as component;
select 
   section_title as title,
   'foldablemargin' as class,
   section_content  as description_md
 from info_sections where section_category="legal" AND section_status='active' ORDER BY section_number ASC;
