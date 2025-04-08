SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN  '/e_project_workpackage_expenses/expense_main_display_4.sql?workpackage_id='||$workpackage_id 
ELSE  '/e_project_workpackage_expenses/expense_main_display_3.sql?workpackage_id='||$workpackage_id 
END;

INSERT INTO project_workpackage_expenses
(
	provider_id,
	workpackage_id,
	expense_name,
	expense_status,
	expense_invoice_url,
	expense_unit,
	expense_quantity,
	expense_category,
	expense_summary,
	expense_invoice_date,
	expense_value
	)
VALUES 
(
	:provider_id,
	$workpackage_id,
	:expense_name,
	'active',
	sqlpage.persist_uploaded_file('expense_invoice_url', 'x_docs', 'pdf,docx,jpg,jpeg,png,gif'),
	:expense_unit,
	:expense_quantity,
	:expense_category,
	:expense_summary,
	:expense_invoice_date,
	:expense_value
)

SET expense_id = select MAX(expense_id) from project_workpackage_expenses where expense_name=:expense_name and expense_value=:expense_value and expense_invoice_date=:exepense_invoice_date;
SET expense_value = select expense_value from project_workpckage_expenses where expense_id=$expense_id;


UPDATE project_workpackage
SET
workpackage_cost_actual= workpackage_cost_actual + $expense_value
where workpackage_id=$workpackage_id


RETURNING 'redirect' AS component,
$redirect_link  AS link;


