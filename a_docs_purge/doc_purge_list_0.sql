DELETE from files_to_erase
WHERE file_url IS NOT NULL OR file_url !=''
RETURNING
'redirect' AS component,
'/a_docs_purge/doc_purge_display_5.sql' AS link;
