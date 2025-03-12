INSERT INTO regex
(
	regex_name,
	regex_value,
	regex_description,
	regex_comment,
	regex_status
)
VALUES 
(
	:regex_name,
	:regex_value,
	:regex_description,
	:regex_comment,
	'active'
)

RETURNING 'redirect' AS component,
'/a_choices/regex_main_display_5.sql' AS link;


