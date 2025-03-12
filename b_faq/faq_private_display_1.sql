SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell.sql') AS properties;

select 
    'title'   as component,
    'FAQ' as contents,
    TRUE      as center;

select 
    'foldable' as component,
    'faq_list_id'    as id;
select 
    'faq_content_class'                       as class,
    question                                  as title,
    '**Categorie** :  *'||question_category||'*

    
**Question** :  *'||question_content||'*

**Réponse** :  '||answer                 as description_md
from faq_questions where answer IS NOT NULL AND faq_yes_no='yes' AND question_public_private='private' AND question_status !='archived'; 