SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell.sql') AS properties;

select 
    'alert'     as component,
    'Validation du compte' as title,
    'Votre compte ne sera validé qu''une fois que l''administrateur vous aura ouvert des droits d''accès. Prière de patienter pendant 24 ou 48 heures. En cas de problème envoyer votre question via le [formulaire de contact](a_faq/faq_form.sql)' as description_md,
    'alert-triangle'            as icon,
    'red'                as color;

