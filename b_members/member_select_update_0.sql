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

modified_at = CURRENT_TIMESTAMP
WHERE member_selected = 'yes';

UPDATE members 
SET member_selected='no', modified_at = CURRENT_TIMESTAMP
RETURNING 
'redirect' AS component, 
'/b_members/member_select_display_4.sql' AS link;


