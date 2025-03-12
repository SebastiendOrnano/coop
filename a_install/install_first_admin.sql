Insert into users
(username,password_hash,user_gender,user_first_name,user_last_name,user_email,user_phone,user_role,user_lang,user_level,user_group,rgpd_validation,user_selected,user_status)
SELECT
(admin1,"$argon2id$v=19$m=19456,t=2,p=1$5IxmNS7NlJuxNNXrU8J0AQ$kod8mYiUSRjQE4uQc2Eqknwe3D49gAkVNvtcJnZq8R8",N,First,Admin,admin1@coopcoop.net,+(33) 7 00 00 00 00,admin,FR,L0,G0,yes,no,active
WHERE NOT EXISTS(SELECT 1 FROM users WHERE user_email = 'admin1@coopcoop.net' AND password_hash = '"$argon2id$v=19$m=19456,t=2,p=1$5IxmNS7NlJuxNNXrU8J0AQ$kod8mYiUSRjQE4uQc2Eqknwe3D49gAkVNvtcJnZq8R8"');