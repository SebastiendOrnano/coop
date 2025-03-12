-- vérif si le nom d'utilisateur n'est pas déjà utilisé 
-- vérif si l'email' existe déjà

SET redirect_link = (
    SELECT
        CASE
            WHEN EXISTS (
                SELECT 1 
                FROM members
                WHERE CONCAT (member_first_name,member_last_name) = CONCAT (:member_first_name,:member_last_name)
            ) 
            THEN '/b_members/member_main_create_alert1_4.sql'
            WHEN 
            EXISTS (
                SELECT 1 
                FROM members
                WHERE member_email= :member_email) 
            THEN '/b_members/member_main_create_alert2_4.sql'
            ELSE ''
        END
);

SELECT 'redirect' AS component, $redirect_link AS link
WHERE $redirect_link != '' OR $redirect IS NOT NULL;


INSERT INTO members 
(
member_gender, 
member_first_name, 
member_last_name, 
member_email, 
member_date_birthday, 
member_date_since, 
member_date_last_subscription, 
member_phone, 
member_category, 
member_function,
member_status,
member_publish,
member_picture_url, 
member_picture_title, 
member_punchline, 
member_cv_short, 
member_cv_long,
orga_dept_id,
orga_id
)
    
SELECT 
:member_gender, 
:member_first_name, 
:member_last_name, 
:member_email, 
:member_date_birthday, 
:member_date_since,
:member_date_last_subscription,
:member_phone,
:member_category,
:member_function,
:member_status,
:member_publish, 
sqlpage.persist_uploaded_file('member_picture_url', 'x_pictures_persons', 'jpg,jpeg,png,gif'),
:member_picture_title, 
:member_punchline, 
:member_cv_short, 
:member_cv_long,
:orga_dept_id,
$orga_id
    
WHERE :member_email IS NOT NULL
 
RETURNING  'redirect' AS component,
'/b_orga_dept/orga_dept_member_main_display_4.sql?orga_dept_id='||$orga_dept_id AS link;


