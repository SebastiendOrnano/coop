
set workpackage_id = SELECT workpackage_id from project_workpackage_expenses where expense_id=$expense_id;

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


SET expense_value_old = select expense_value from project_workpackage_expenses where expense_id=$expense_id;
SET expense_value_new = :expense_value;
SET expense_delta = $expense_value_old - $expense_value_new;


UPDATE project_workpackage_expenses 
SET 
expense_name=:expense_name,
expense_status=:expense_status,
expense_summary=:expense_summary,
expense_category=:expense_category,
expense_invoice_date=:expense_invoice_date,
expense_unit=:expense_unit,
expense_value=:expense_value,
provider_id=:provider_id,
modified_at = CURRENT_TIMESTAMP
WHERE expense_id = $expense_id

RETURNING 'redirect' AS component,
$redirect_link AS link;


