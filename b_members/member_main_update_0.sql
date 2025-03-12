SET orga_id = SELECT orga_id FROM orga_dept WHERE orga_dept_id = :orga_dept_id;

UPDATE members 
SET

    member_gender = CASE 
    WHEN :member_gender IS NULL OR :member_gender = '' 
    THEN member_gender
    ELSE :member_gender END,

    member_category = CASE 
    WHEN :member_category IS NULL OR :member_category = '' 
    THEN member_category
    ELSE :member_category END,

    member_status = CASE 
    WHEN :member_status IS NULL OR :member_status = '' 
    THEN member_status
    ELSE :member_status END,

    member_publish = CASE 
    WHEN :member_publish IS NULL OR :member_publish = '' 
    THEN member_publish
    ELSE :member_publish END,

    member_date_since = CASE 
    WHEN :member_date_since IS NULL OR :member_date_since = '' 
    THEN member_date_since
    ELSE :member_date_since END,

    member_date_last_subscription = CASE 
    WHEN :member_date_last_subscription IS NULL OR :member_date_last_subscription = '' 
    THEN member_date_last_subscription
    ELSE :member_date_last_subscription END,

    member_function = CASE 
    WHEN :member_function IS NULL OR :member_function = '' 
    THEN member_function
    ELSE :member_function END,

member_first_name=:member_first_name, 
member_last_name=:member_last_name, 
member_email=:member_email, 
member_phone=:member_phone, 
member_date_birthday=:member_date_birthday, 
member_date_since=:member_date_since, 
member_function=:member_function, 
member_punchline=:member_unchline, 
member_cv_short=:member_cv_short, 
member_cv_long=:member_cv_long,
orga_dept_id=:orga_dept_id, 
orga_id=$orga_id,
modified_at = CURRENT_TIMESTAMP
WHERE member_id = $member_id

RETURNING 
'redirect' AS component, 
'/b_members/member_main_display_4.sql' AS link;


