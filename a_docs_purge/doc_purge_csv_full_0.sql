select 
    'csv'                                         as component,
    'Télécharger la liste des fichiers à effacer' as title,
    'doc_purge_full_list.csv'                     as filename,
    'file-download'                               as icon,
    'green'                                       as color,
    ';'                                           as separator;


SELECT  file_url from files_to_erase
WHERE file_url IS NOT NULL OR file_url !='';


