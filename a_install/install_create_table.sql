BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "members" (
	"member_id"	INTEGER,
	"orga_id"	INTEGER,
	"orga_dept_id"	INTEGER,
	"member_gender"	TEXT DEFAULT 'N',
	"member_first_name"	TEXT,
	"member_last_name"	TEXT NOT NULL,
	"member_phone"	TEXT,
	"member_email"	TEXT,
	"member_category"	TEXT,
	"member_function"	TEXT,
	"member_date_birthday"	INTEGER,
	"member_date_since"	INTEGER,
	"member_date_last_subscription"	INTEGER,
	"member_punchline"	TEXT,
	"member_cv_short"	TEXT,
	"member_cv_long"	TEXT,
	"member_picture_title"	TEXT,
	"member_picture_url"	TEXT,
	"member_selected"	TEXT DEFAULT 'no',
	"member_publish"	TEXT,
	"member_status"	TEXT,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("member_id")
);
CREATE TABLE IF NOT EXISTS "orga" (
	"orga_id"	INTEGER,
	"orga_name"	TEXT NOT NULL,
	"orga_acronym"	TEXT,
	"orga_logo_url"	TEXT,
	"orga_punchline"	TEXT,
	"orga_summary"	TEXT,
	"orga_adress"	TEXT,
	"orga_postal_code"	INTEGER,
	"orga_town"	TEXT,
	"orga_country"	TEXT DEFAULT 'France',
	"orga_latitude"	INTEGER,
	"orga_longitude"	INTEGER,
	"orga_contact_phone"	TEXT,
	"orga_contact_mail"	TEXT,
	"orga_status"	TEXT,
	"orga_legal_status"	TEXT,
	"orga_no_rna"	TEXT,
	"orga_no_siren"	INTEGER,
	"orga_no_siret"	INTEGER,
	"orga_no_tva_intracom"	INTEGER,
	"orga_code_naf_ape"	TEXT,
	"orga_date_creation"	INTEGER,
	"orga_number_employees"	INTEGER,
	"orga_selected"	INTEGER DEFAULT 'no',
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("orga_id")
);
CREATE TABLE IF NOT EXISTS "place" (
	"place_id"	INTEGER,
	"place_name"	TEXT NOT NULL,
	"place_status"	TEXT,
	"place_summary"	TEXT,
	"place_adress"	TEXT,
	"place_postal_code"	INTEGER,
	"place_town"	TEXT,
	"place_country"	TEXT,
	"place_latitude"	INTEGER,
	"place_longitude"	INTEGER,
	"place_contact_phone"	INTEGER,
	"place_contact_mail"	TEXT,
	"place_type"	TEXT,
	"place_accessibility"	TEXT,
	"place_capacity_seats"	INTEGER,
	"place_capacity_standup"	INTEGER,
	"place_selected"	TEXT,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("place_id")
);
CREATE TABLE IF NOT EXISTS "process_steps" (
	"process_step_id"	INTEGER,
	"process_id"	INTEGER NOT NULL,
	"process_step_number"	TEXT,
	"process_step_author"	TEXT,
	"process_step_title"	TEXT,
	"process_step_icon"	TEXT,
	"process_step_link"	TEXT,
	"process_step_description"	TEXT,
	"process_step_selected"	TEXT,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY("process_id") REFERENCES "process"("process_id"),
	PRIMARY KEY("process_step_id")
);
CREATE TABLE IF NOT EXISTS "place_spaces" (
	"space_id"	INTEGER,
	"place_id"	INTEGER NOT NULL,
	"space_name"	TEXT NOT NULL,
	"space_level"	TEXT,
	"space_summary"	TEXT,
	"space_access"	TEXT,
	"space_type"	TEXT,
	"space_accessibility"	TEXT,
	"space_capacity_seats"	INTEGER,
	"space_capacity_standup"	INTEGER,
	"space_status"	TEXT,
	"space_selected"	TEXT,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("space_id"),
	FOREIGN KEY("place_id") REFERENCES "place"("place_id")
);
CREATE TABLE IF NOT EXISTS "event_participants" (
	"participant_id"	INTEGER,
	"event_id"	INTEGER,
	"participant_first_name"	TEXT,
	"participant_last_name"	TEXT NOT NULL,
	"participant_gender"	TEXT DEFAULT 'N',
	"participant_age"	INTEGER,
	"participant_contact_phone"	INTEGER,
	"participant_contact_email"	TEXT,
	"participant_postal_code"	INTEGER,
	"participant_function"	TEXT,
	"participant_category"	TEXT,
	"participant_status"	TEXT,
	"participant_rgpd_validation"	TEXT,
	"participant_selected"	TEXT,
	"participant_validation"	TEXT,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("participant_id"),
	FOREIGN KEY("event_id") REFERENCES "events"("event_id")
);
CREATE TABLE IF NOT EXISTS "process" (
	"process_id"	INTEGER,
	"process_title"	TEXT,
	"process_description"	TEXT,
	"process_category"	TEXT,
	"process_status"	TEXT,
	"process_publication_status"	TEXT,
	"process_selected"	TEXT,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("process_id")
);
CREATE TABLE IF NOT EXISTS "forum_messages" (
	"message_id"	INTEGER,
	"topic_id"	INTEGER,
	"message_recipient_id"	INTEGER,
	"message_author_id"	INTEGER,
	"message_content"	TEXT,
	"message_status"	TEXT,
	"message_rank"	TEXT DEFAULT 'post',
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("message_id" AUTOINCREMENT),
	FOREIGN KEY("topic_id") REFERENCES "forum_topics"("topic_id")
);
CREATE TABLE IF NOT EXISTS "rss" (
	"rss_id"	INTEGER,
	"rss_title"	TEXT,
	"rss_feed"	TEXT,
	"rss_link"	TEXT,
	"rss_description"	TEXT,
	"rss_status"	TEXT,
	"rss_category"	TEXT,
	"rss_item_title"	TEXT,
	"rss_item_link"	TEXT,
	"rss_item_description"	TEXT,
	"rss_item_table"	TEXT,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("rss_id")
);
CREATE TABLE IF NOT EXISTS "faq_contacts" (
	"contact_id"	INTEGER,
	"contact_gender"	TEXT DEFAULT 'N',
	"contact_first_name"	TEXT,
	"contact_last_name"	TEXT,
	"contact_email"	TEXT,
	"contact_rgpd"	TEXT,
	"contact_status"	TEXT DEFAULT 'online',
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("contact_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "events" (
	"event_id"	INTEGER,
	"event_name"	TEXT NOT NULL,
	"event_type"	TEXT,
	"event_status"	TEXT,
	"event_visio"	TEXT DEFAULT 'no',
	"event_visio_url"	TEXT,
	"event_visio_code"	TEXT,
	"place_id"	TEXT,
	"space_id"	INTEGER,
	"event_summary"	TEXT,
	"event_program_url"	TEXT,
	"event_picture_url"	TEXT,
	"event_date"	INTEGER,
	"event_start_hour"	INTEGER,
	"event_end_hour"	INTEGER,
	"event_duration"	INTEGER,
	"event_public_private"	TEXT DEFAULT 'public',
	"event_audience_target"	TEXT,
	"event_registration"	TEXT DEFAULT 'no',
	"event_participants_nb"	INTEGER DEFAULT '0',
	"event_participants_nb_max"	INTEGER DEFAULT '0',
	"event_entrance_fee"	INTEGER DEFAULT '0',
	"event_selected"	TEXT DEFAULT 'no',
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY("space_id") REFERENCES "place_spaces"("space_id"),
	PRIMARY KEY("event_id"),
	FOREIGN KEY("place_id") REFERENCES "place"("place_id")
);
CREATE TABLE IF NOT EXISTS "forum_topics" (
	"topic_id"	INTEGER,
	"topic_author_id"	INTEGER,
	"workspace_id"	INTEGER,
	"topic_name"	TEXT,
	"topic_category"	TEXT,
	"debug_target"	TEXT,
	"forum_type"	TEXT,
	"number_messages"	INTEGER DEFAULT '0',
	"forum_group"	TEXT DEFAULT 'G0',
	"topic_status"	TEXT,
	"topic_selected"	TEXT DEFAULT 'no',
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("topic_id")
);
CREATE TABLE IF NOT EXISTS "workspaces" (
	"workspace_id"	INTEGER,
	"workspace_coordinator_id"	INTEGER,
	"workspace_title"	TEXT,
	"workspace_summary"	TEXT,
	"workspace_category"	TEXT,
	"workspace_status"	TEXT,
	"workspace_participants_nb"	INTEGER DEFAULT '0',
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("workspace_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "sessions" (
	"username"	TEXT,
	"user_id"	INTEGER,
	"session_token"	TEXT,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"logout_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"session_duration"	INTEGER
);
CREATE TABLE IF NOT EXISTS "news" (
	"news_id"	INTEGER,
	"news_title"	TEXT,
	"news_content"	TEXT,
	"news_date"	INTEGER,
	"news_img_url"	TEXT,
	"news_category"	TEXT,
	"news_public_private"	TEXT,
	"news_status"	TEXT DEFAULT 'draft',
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("news_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "workdocs" (
	"workdoc_id"	INTEGER,
	"workspace_id"	INTEGER,
	"message_id"	INTEGER,
	"workdoc_url"	TEXT,
	"workdoc_title"	TEXT,
	"workdoc_summary"	TEXT,
	"workdoc_author"	TEXT,
	"workdoc_category"	TEXT,
	"workdoc_format"	TEXT,
	"workdoc_status"	TEXT,
	"workdoc_version"	INTEGER DEFAULT '0',
	"workdoc_type"	TEXT,
	"workdoc_lang"	TEXT,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("workdoc_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "files_to_erase" (
	"file_url"	TEXT,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS "orga_partners" (
	"orga_partner_id"	INTEGER,
	"orga_id"	INTEGER,
	"orga_dept_id"	INTEGER,
	"orga_partner_name"	TEXT,
	"orga_partner_acronym"	TEXT,
	"orga_partner_scope"	TEXT,
	"orga_partner_link"	TEXT,
	"orga_partner_logo_url"	TEXT,
	"orga_partner_logo_title"	TEXT,
	"orga_partner_type"	TEXT,
	"orga_partner_category"	TEXT,
	"orga_partner_date_since"	TEXT,
	"orga_partner_status"	TEXT,
	"orga_partner_punchline"	TEXT,
	"orga_partner_summary"	TEXT,
	"orga_partner_selected"	TEXT,
	"created_at"	TEXT,
	"modified_at"	TEXT,
	PRIMARY KEY("orga_partner_id"),
	FOREIGN KEY("orga_dept_id") REFERENCES "orga_dept"("orga_dept_id"),
	FOREIGN KEY("orga_id") REFERENCES "orga"("orga_id")
);
CREATE TABLE IF NOT EXISTS "users" (
	"user_id"	INTEGER,
	"username"	TEXT UNIQUE,
	"password_hash"	TEXT,
	"user_gender"	TEXT DEFAULT 'N',
	"user_first_name"	TEXT,
	"user_last_name"	TEXT,
	"user_email"	TEXT,
	"user_phone"	TEXT,
	"user_short_cv"	TEXT,
	"user_role"	TEXT,
	"user_lang"	TEXT DEFAULT 'FR',
	"user_level"	TEXT DEFAULT 'L0',
	"user_group"	TEXT DEFAULT 'G0',
	"rgpd_validation"	TEXT,
	"user_selected"	INTEGER DEFAULT 'no',
	"user_status"	TEXT,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("user_id")
);
CREATE TABLE IF NOT EXISTS "prm2" (
	"prm2_id"	INTEGER,
	"prm2_name"	TEXT NOT NULL,
	"prm2_acronym"	TEXT,
	"prm2_logo_url"	TEXT,
	"prm2_punchline"	TEXT,
	"prm2_summary"	TEXT,
	"prm2_adress"	TEXT,
	"prm2_postal_code"	INTEGER,
	"prm2_town"	TEXT,
	"prm2_country"	TEXT DEFAULT 'France',
	"prm2_latitude"	INTEGER,
	"prm2_longitude"	INTEGER,
	"prm2_contact_phone"	TEXT,
	"prm2_contact_mail"	TEXT,
	"prm2_status"	TEXT,
	"prm2_legal_status"	TEXT,
	"prm2_no_rna"	TEXT,
	"prm2_no_siren"	INTEGER,
	"prm2_no_siret"	INTEGER,
	"prm2_no_tva_intracom"	INTEGER,
	"prm2_code_naf_ape"	TEXT,
	"prm2_date_creation"	INTEGER,
	"prm2_number_employees"	INTEGER,
	"prm2_selected"	INTEGER DEFAULT 'no',
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("prm2_id")
);
CREATE TABLE IF NOT EXISTS "prm1" (
	"prm1_id"	INTEGER,
	"prm1_gender"	TEXT DEFAULT 'N',
	"prm1_first_name"	TEXT,
	"prm1_last_name"	TEXT NOT NULL,
	"prm1_phone"	TEXT,
	"prm1_email"	TEXT,
	"prm1_category"	TEXT,
	"prm1_function"	TEXT,
	"prm1_date_birthday"	INTEGER,
	"prm1_cv_short"	TEXT,
	"prm1_cv_long"	TEXT,
	"prm1_selected"	TEXT DEFAULT 'no',
	"prm1_status"	TEXT,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("prm1_id")
);
CREATE TABLE IF NOT EXISTS "prm1_doc" (
	"prm1_doc_id"	INTEGER,
	"prm1_id"	INTEGER,
	"prm1_doc_title"	TEXT,
	"prm1_doc_author"	TEXT,
	"prm1_doc_url"	TEXT,
	"prm1_doc_summary"	TEXT,
	"prm1_doc_keywords"	TEXT,
	"prm1_doc_date_publication"	TEXT,
	"prm1_doc_date_period"	INTEGER,
	"prm1_doc_lang"	TEXT,
	"prm1_doc_format"	TEXT,
	"prm1_doc_category"	TEXT,
	"prm1_doc_type"	TEXT,
	"prm1_doc_selected"	TEXT DEFAULT 'no',
	"prm1_doc_status"	TEXT,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("prm1_doc_id"),
	FOREIGN KEY("prm1_id") REFERENCES "prm1"("prm1_id")
);
CREATE TABLE IF NOT EXISTS "orga_dept" (
	"orga_dept_id"	INTEGER,
	"orga_dept_name"	TEXT NOT NULL,
	"orga_id"	INTEGER,
	"orga_dept_acronym"	TEXT,
	"orga_dept_logo_url"	TEXT,
	"orga_dept_punchline"	TEXT,
	"orga_dept_summary"	TEXT,
	"orga_dept_adress"	TEXT,
	"orga_dept_postal_code"	INTEGER,
	"orga_dept_town"	TEXT,
	"orga_dept_country"	TEXT,
	"orga_dept_latitude"	INTEGER,
	"orga_dept_longitude"	INTEGER,
	"orga_dept_contact_phone"	TEXT,
	"orga_dept_contact_mail"	TEXT,
	"orga_dept_date_creation"	INTEGER,
	"orga_dept_rank"	TEXT,
	"orga_dept_status"	TEXT,
	"orga_dept_legal_status"	TEXT,
	"orga_dept_number_employees"	INTEGER,
	"orga_dept_no_rna"	TEXT,
	"orga_dept_no_siren"	INTEGER,
	"orga_dept_no_siret"	INTEGER,
	"orga_dept_code_naf_ape"	TEXT,
	"orga_dept_no_tva_intracom"	INTEGER,
	"orga_dept_selected"	TEXT DEFAULT 'no',
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("orga_dept_id"),
	FOREIGN KEY("orga_id") REFERENCES "orga"("orga_id")
);
CREATE TABLE IF NOT EXISTS "prm3_participants" (
	"prm3_participant_id"	INTEGER NOT NULL,
	"prm3_id"	INTEGER,
	"prm1_id"	INTEGER,
	"prm2_sub_id"	INTEGER,
	"employee_id"	INTEGER,
	"prm3_participant_role"	TEXT DEFAULT 'participant',
	"prm3_participant_type"	TEXT,
	"prm3_participant_status"	TEXT,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("prm3_participant_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "prm3" (
	"prm3_id"	INTEGER NOT NULL,
	"prm3_name"	TEXT,
	"prm3_summary"	TEXT,
	"prm3_category"	TEXT,
	"prm3_status"	TEXT,
	"prm3_selected"	TEXT DEFAULT 'non',
	"prm3_formal"	TEXT,
	"prm3_nb_participants"	INTEGER,
	"prm3_type"	TEXT,
	"prm3_date_creation"	INTEGER,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT 'CURRENT_TIMETSTAMP',
	PRIMARY KEY("prm3_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "choices_categories" (
	"choice_category_id"	INTEGER,
	"choice_category_name"	TEXT,
	"choice_category_status"	TEXT,
	"choice_category_summary"	TEXT,
	"created_at"	TEXT DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("choice_category_id")
);
CREATE TABLE IF NOT EXISTS "regex" (
	"regex_id"	INTEGER,
	"regex_name"	TEXT,
	"regex_value"	TEXT,
	"regex_description"	TEXT,
	"regex_comment"	TEXT,
	"regex_status"	TEXT,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("regex_id")
);
CREATE TABLE IF NOT EXISTS "workmeeting_participants" (
	"workmeeting_participant_id"	INTEGER,
	"workmeeting_id"	INTEGER,
	"workspace_id"	INTEGER,
	"user_id"	INTEGER,
	"workmeeting_participant_role"	TEXT,
	"workmeeting_participant_status"	TEXT,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("workmeeting_participant_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "workdocs_cloud" (
	"workdoc_cloud_id"	INTEGER,
	"workspace_id"	INTEGER,
	"message_id"	INTEGER,
	"workdoc_cloud_url"	TEXT,
	"workdoc_cloud_title"	TEXT,
	"workdoc_cloud_summary"	TEXT,
	"workdoc_cloud_author"	TEXT,
	"workdoc_cloud_category"	TEXT,
	"workdoc_cloud_format"	TEXT,
	"workdoc_cloud_status"	TEXT,
	"workdoc_cloud_type"	TEXT,
	"workdoc_cloud_lang"	TEXT,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("workdoc_cloud_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "project_building_rooms_pictures" (
	"room_picture_id"	INTEGER,
	"building_id"	INTEGER,
	"project_id"	INTEGER,
	"room_id"	INTEGER,
	"room_picture_url"	TEXT,
	"room_picture_title"	TEXT,
	"room_picture_summary"	TEXT,
	"room_picture_format"	TEXT,
	"room_picture_status"	TEXT,
	"room_picture_selected"	TEXT DEFAULT 'no',
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("room_picture_id")
);
CREATE TABLE IF NOT EXISTS "project_building_rooms" (
	"room_id"	INTEGER,
	"building_id"	INTEGER NOT NULL,
	"room_name"	TEXT NOT NULL,
	"room_level"	TEXT,
	"room_type"	TEXT,
	"room_summary"	TEXT,
	"room_todo"	TEXT,
	"room_access"	TEXT,
	"room_accessibility"	TEXT,
	"room_capacity_seats"	INTEGER,
	"room_capacity_standup"	INTEGER,
	"room_status"	TEXT,
	"room_selected"	TEXT,
	"room_width"	INTEGER,
	"room_length"	INTEGER,
	"room_height"	INTEGER,
	"room_wall_material"	TEXT,
	"room_floor_material"	TEXT,
	"room_quality_level"	INTEGER,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("room_id"),
	FOREIGN KEY("building_id") REFERENCES "project_buildings"("building_id")
);
CREATE TABLE IF NOT EXISTS "info_sections" (
	"section_id"	INTEGER,
	"section_title"	TEXT,
	"section_content"	TEXT,
	"section_category"	TEXT,
	"section_lang"	TEXT,
	"section_number"	INTEGER,
	"section_status"	TEXT,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("section_id")
);
CREATE TABLE IF NOT EXISTS "project_forum_topics" (
	"project_forum_topic_id"	INTEGER,
	"project_id"	INTEGER,
	"project_forum_topic_author_id"	INTEGER,
	"project_forum_topic_name"	TEXT,
	"project_forum_topic_category"	TEXT,
	"debug_target"	TEXT,
	"forum_type"	TEXT,
	"number_messages"	INTEGER DEFAULT '0',
	"forum_group"	TEXT DEFAULT 'G0',
	"project_forum_topic_status"	TEXT,
	"project_forum_topic_selected"	TEXT DEFAULT 'no',
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("project_forum_topic_id")
);
CREATE TABLE IF NOT EXISTS "project_meeting_places" (
	"project_meeting_place_id"	INTEGER,
	"project_meeting_place_name"	TEXT NOT NULL,
	"project_meeting_place_status"	TEXT,
	"project_meeting_place_summary"	TEXT,
	"project_meeting_place_adress"	TEXT,
	"project_meeting_place_postal_code"	INTEGER,
	"project_meeting_place_town"	TEXT,
	"project_meeting_place_country"	TEXT,
	"project_meeting_place_latitude"	INTEGER,
	"project_meeting_place_longitude"	INTEGER,
	"project_meeting_place_contact_phone"	INTEGER,
	"project_meeting_place_contact_mail"	TEXT,
	"project_meeting_place_type"	TEXT,
	"project_meeting_place_accessibility"	TEXT,
	"project_meeting_place_capacity_seats"	INTEGER,
	"project_meeting_place_capacity_standup"	INTEGER,
	"project_meeting_place_selected"	TEXT,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("project_meeting_place_id")
);
CREATE TABLE IF NOT EXISTS "project_worksequences" (
	"worksequence_id"	INTEGER,
	"workpackage_id"	INTEGER,
	"room_id"	INTEGER,
	"worksequence_name"	TEXT,
	"worksequence_summary"	TEXT,
	"worksequence_todo"	TEXT,
	"worksequence_type"	TEXT,
	"worksequence_nb_participants"	INTEGER,
	"worksequence_start_date_scheduled"	INTEGER,
	"worksequence_start_date_actual"	INTEGER,
	"worksequence_start_hour_scheduled"	INTEGER,
	"worksequence_start_hour_actual"	INTEGER,
	"worksequence_end_hour_scheduled"	INTEGER,
	"worksequence_end_hour_actual"	INTEGER,
	"worksequence_duration_scheduled"	INTEGER,
	"worksequence_duration_actual"	INTEGER,
	"worksequence_completion_percentage"	INTEGER,
	"worksequence_status"	INTEGER,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("worksequence_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "project_docs" (
	"project_doc_id"	INTEGER,
	"project_id"	INTEGER,
	"project_doc_title"	TEXT,
	"project_doc_author"	TEXT,
	"project_doc_url"	TEXT,
	"project_doc_cloud_url"	TEXT,
	"project_doc_summary"	TEXT,
	"project_doc_keywords"	TEXT,
	"project_doc_date_publication"	TEXT,
	"project_doc_date_period"	INTEGER,
	"project_doc_lang"	TEXT,
	"project_doc_format"	TEXT,
	"project_doc_category"	TEXT,
	"project_doc_type"	TEXT,
	"project_doc_local_cloud"	TEXT,
	"project_doc_cloud_format"	TEXT,
	"project_doc_selected"	TEXT DEFAULT 'no',
	"project_doc_status"	TEXT,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("project_doc_id")
);
CREATE TABLE IF NOT EXISTS "project_meeting_participants" (
	"project_meeting_participant_id"	INTEGER,
	"project_meeting_id"	INTEGER,
	"user_id"	INTEGER,
	"prm1_id"	INTEGER,
	"prm2_sub_id"	INTEGER,
	"employee_id"	INTEGER,
	"project_meeting_participant_role"	INTEGER,
	"project_meeting_participant_type"	TEXT,
	"project_meeting_participant_status"	TEXT,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("project_meeting_participant_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "projects" (
	"project_id"	INTEGER,
	"project_name"	TEXT,
	"project_summary"	TEXT,
	"project_date_creation"	INTEGER,
	"project_category"	TEXT,
	"project_nb_participants"	INTEGER,
	"project_status"	TEXT,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("project_id")
);
CREATE TABLE IF NOT EXISTS "choices_items" (
	"choice_id"	INTEGER,
	"choice_label"	INTEGER,
	"choice_value"	TEXT,
	"choice_category_id"	INTEGER,
	"choice_status"	TEXT,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("choice_id"),
	FOREIGN KEY("choice_category_id") REFERENCES "choices_categories"("choice_category_id")
);
CREATE TABLE IF NOT EXISTS "prm2_sub" (
	"prm2_sub_id"	INTEGER,
	"prm2_sub_name"	TEXT NOT NULL,
	"prm2_id"	INTEGER,
	"prm2_sub_acronym"	TEXT,
	"prm2_sub_logo_url"	TEXT,
	"prm2_sub_punchline"	TEXT,
	"prm2_sub_summary"	TEXT,
	"prm2_sub_adress"	TEXT,
	"prm2_sub_postal_code"	INTEGER,
	"prm2_sub_town"	TEXT,
	"prm2_sub_country"	TEXT,
	"prm2_sub_latitude"	INTEGER,
	"prm2_sub_longitude"	INTEGER,
	"prm2_sub_contact_phone"	TEXT,
	"prm2_sub_contact_mail"	TEXT,
	"prm2_sub_date_creation"	INTEGER,
	"prm2_sub_rank"	TEXT,
	"prm2_sub_status"	TEXT,
	"prm2_sub_legal_status"	TEXT,
	"prm2_sub_nb_employees"	INTEGER,
	"prm2_sub_no_rna"	TEXT,
	"prm2_sub_no_siren"	INTEGER,
	"prm2_sub_no_siret"	INTEGER,
	"prm2_sub_code_naf_ape"	TEXT,
	"prm2_sub_no_tva_intracom"	INTEGER,
	"prm2_sub_selected"	TEXT DEFAULT 'no',
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("prm2_sub_id"),
	FOREIGN KEY("prm2_id") REFERENCES "prm2"("prm2_id")
);
CREATE TABLE IF NOT EXISTS "prm2_sub_employees" (
	"employee_id"	INTEGER,
	"prm1_id"	INTEGER,
	"prm2_sub_id"	INTEGER,
	"employee_title"	TEXT,
	"employee_function"	TEXT DEFAULT 'employee',
	"employee_category"	TEXT,
	"employee_status"	TEXT DEFAULT 'active',
	"employee_selected"	TEXT DEFAULT 'no',
	"employee_since"	INTEGER,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY("prm2_sub_id") REFERENCES "prm2_sub"("prm2_sub_id"),
	PRIMARY KEY("employee_id")
);
CREATE TABLE IF NOT EXISTS "prm3_docs" (
	"prm3_doc_id"	INTEGER NOT NULL,
	"prm3_id"	INTEGER,
	"prm3_doc_title"	TEXT NOT NULL,
	"prm3_doc_url"	TEXT,
	"prm3_doc_summary"	TEXT,
	"prm3_doc_keywords"	TEXT,
	"prm3_doc_status"	TEXT,
	"prm3_doc_category"	TEXT,
	"prm3_doc_format"	NUMERIC,
	"prm3_doc_selected"	TEXT DEFAULT 'no',
	"prm3_doc_date_publication"	INTEGER,
	"prm3_doc_type"	TEXT,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT 'CURRENT_TIMESTAMP',
	FOREIGN KEY("prm3_id") REFERENCES "prm3"("prm3_id"),
	PRIMARY KEY("prm3_doc_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "project_forum_messages" (
	"project_forum_message_id"	INTEGER,
	"project_forum_topic_id"	INTEGER,
	"project_forum_message_recipient_id"	INTEGER,
	"project_forum_message_author_id"	INTEGER,
	"project_forum_message_content"	TEXT,
	"project_forum_message_status"	TEXT,
	"project_forum_message_rank"	TEXT DEFAULT 'post',
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("project_forum_message_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "project_participants_workpackage" (
	"workpackage_participant_id"	INTEGER NOT NULL,
	"workpackage_id"	INTEGER,
	"prm1_id"	INTEGER,
	"prm2_sub_id"	INTEGER,
	"employee_id"	INTEGER,
	"prm3_id"	INTEGER,
	"workpackage_participant_role"	TEXT DEFAULT 'participant',
	"workpackage_participant_type"	TEXT,
	"workpackage_participant_status"	TEXT,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("workpackage_participant_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "project_participants_worksequence" (
	"worksequence_participant_id"	INTEGER NOT NULL,
	"worksequence_id"	INTEGER,
	"prm1_id"	INTEGER,
	"prm2_sub_id"	INTEGER,
	"employee_id"	INTEGER,
	"prm3_id"	INTEGER,
	"worksequence_participant_role"	TEXT DEFAULT 'participant',
	"worksequence_participant_type"	TEXT,
	"worksequence_participant_status"	TEXT,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("worksequence_participant_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "project_participants" (
	"project_participant_id"	INTEGER NOT NULL,
	"project_id"	INTEGER,
	"prm1_id"	INTEGER,
	"prm2_sub_id"	INTEGER,
	"employee_id"	INTEGER,
	"prm3_id"	INTEGER,
	"project_participant_role"	TEXT DEFAULT 'participant',
	"project_participant_type"	TEXT,
	"project_participant_status"	TEXT,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("project_participant_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "project_meetings" (
	"project_meeting_id"	INTEGER,
	"project_meeting_place_id"	INTEGER,
	"project_id"	INTEGER,
	"project_meeting_title"	TEXT,
	"project_meeting_agenda"	TEXT,
	"project_meeting_visio"	TEXT DEFAULT 'no',
	"project_meeting_visio_url"	TEXT,
	"project_meeting_visio_code"	TEXT,
	"project_meeting_date"	INTEGER,
	"project_meeting_hour_start"	INTEGER,
	"project_meeting_hour_end"	INTEGER,
	"project_meeting_duration"	INTEGER,
	"project_meeting_type"	TEXT,
	"project_meeting_participants_nb"	INTEGER DEFAULT 0,
	"project_meeting_alert"	TEXT DEFAULT 'alert_end',
	"project_meeting_status"	TEXT,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("project_meeting_id" AUTOINCREMENT),
	FOREIGN KEY("project_id") REFERENCES "projects"("project_id")
);
CREATE TABLE IF NOT EXISTS "workmeetings" (
	"workmeeting_id"	INTEGER,
	"workspace_id"	INTEGER,
	"workmeeting_title"	TEXT,
	"workmeeting_agenda"	TEXT,
	"workmeeting_visio"	TEXT DEFAULT 'no',
	"workmeeting_visio_url"	TEXT,
	"workmeeting_visio_code"	TEXT,
	"workmeeting_date"	INTEGER,
	"workmeeting_hour_start"	INTEGER,
	"workmeeting_hour_end"	INTEGER,
	"workmeeting_duration"	INTEGER,
	"workmeeting_type"	TEXT,
	"place_id"	INTEGER,
	"space_id"	INTEGER,
	"workmeeting_participants_nb"	INTEGER,
	"workmeeting_alert"	TEXT DEFAULT 'alert_end',
	"workmeeting_status"	TEXT,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("workmeeting_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "workspace_participants" (
	"workspace_participant_id"	INTEGER,
	"workspace_id"	INTEGER,
	"user_id"	INTEGER,
	"workspace_participant_role"	TEXT,
	"workspace_partcipant_status"	TEXT,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS "faq_questions" (
	"question_id"	INTEGER,
	"contact_id"	INTEGER,
	"question"	TEXT,
	"question_content"	TEXT,
	"answer"	TEXT,
	"answer_yes_no"	TEXT DEFAULT 'no',
	"faq_yes_no"	TEXT DEFAULT 'no',
	"question_public_private"	TEXT,
	"question_category"	INTEGER,
	"question_status"	TEXT DEFAULT 'online',
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("question_id" AUTOINCREMENT),
	FOREIGN KEY("contact_id") REFERENCES "faq_contacts"("contact_id")
);
CREATE TABLE IF NOT EXISTS "place_spaces_pictures" (
	"space_picture_id"	INTEGER,
	"place_id"	INTEGER,
	"space_id"	INTEGER,
	"space_picture_url"	TEXT,
	"space_picture_title"	TEXT,
	"space_picture_summary"	TEXT,
	"space_picture_format"	TEXT,
	"space_picture_status"	TEXT,
	"space_picture_selected"	TEXT DEFAULT 'no',
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY("space_id") REFERENCES "place_spaces"("space_id"),
	PRIMARY KEY("space_picture_id")
);
CREATE TABLE IF NOT EXISTS "prm2_sub_docs" (
	"prm2_sub_doc_id"	INTEGER,
	"prm2_id"	INTEGER,
	"prm2_sub_id"	INTEGER,
	"prm2_sub_doc_title"	TEXT,
	"prm2_sub_doc_author"	TEXT,
	"prm2_sub_doc_url"	TEXT,
	"prm2_sub_doc_summary"	TEXT,
	"prm2_sub_doc_keywords"	TEXT,
	"prm2_sub_doc_date_publication"	TEXT,
	"prm2_sub_doc_date_period"	INTEGER,
	"prm2_sub_doc_lang"	TEXT,
	"prm2_sub_doc_format"	TEXT,
	"prm2_sub_doc_category"	TEXT,
	"prm2_sub_doc_type"	TEXT,
	"prm2_sub_doc_selected"	TEXT DEFAULT 'no',
	"prm2_sub_doc_status"	TEXT,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY("prm2_sub_id") REFERENCES "prm2_sub"("prm2_sub_id"),
	PRIMARY KEY("prm2_sub_doc_id")
);
CREATE TABLE IF NOT EXISTS "orga_docs" (
	"orga_doc_id"	INTEGER,
	"orga_id"	INTEGER,
	"orga_dept_id"	INTEGER,
	"orga_doc_title"	TEXT,
	"orga_doc_author"	TEXT,
	"orga_doc_url"	TEXT,
	"orga_doc_summary"	TEXT,
	"orga_doc_keywords"	TEXT,
	"orga_doc_date_publication"	TEXT,
	"orga_doc_date_period"	INTEGER,
	"orga_doc_lang"	TEXT,
	"orga_doc_format"	TEXT,
	"orga_doc_number_page"	TEXT,
	"orga_doc_category"	TEXT,
	"orga_doc_type"	TEXT,
	"orga_doc_edition"	TEXT DEFAULT 'draft',
	"orga_doc_publication"	TEXT DEFAULT 'no',
	"orga_doc_selected"	TEXT DEFAULT 'no',
	"orga_doc_status"	TEXT,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("orga_doc_id"),
	FOREIGN KEY("orga_dept_id") REFERENCES "orga_dept"("orga_dept_id")
);
CREATE TABLE IF NOT EXISTS "project_buildings" (
	"building_id"	INTEGER,
	"project_id"	INTEGER,
	"building_name"	TEXT,
	"building_status"	TEXT,
	"building_summary"	TEXT,
	"building_adress"	TEXT,
	"building_postal_code"	INTEGER,
	"building_town"	TEXT,
	"building_country"	TEXT,
	"building_latitude"	INTEGER,
	"building_longitude"	INTEGER,
	"building_contact_phone"	INTEGER,
	"building_contact_mail"	TEXT,
	"building_type"	TEXT,
	"building_accessibility"	TEXT,
	"building_capacity_seats"	INTEGER,
	"building_capacity_standup"	INTEGER,
	"building_selected"	TEXT,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY("project_id") REFERENCES "projects"("project_id"),
	PRIMARY KEY("building_id")
);
CREATE TABLE IF NOT EXISTS "project_workpackages" (
	"workpackage_id"	INTEGER,
	"workpackage_parent_id"	INTEGER,
	"project_id"	INTEGER,
	"workpackage_name"	TEXT,
	"workpackage_summary"	TEXT,
	"workpackage_todo"	TEXT,
	"workpackage_type"	TEXT,
	"workpackage_cost_estimated"	INTEGER,
	"workpackage_cost_actual"	INTEGER,
	"workpackage_nb_participants"	INTEGER,
	"workpackage_status"	INTEGER,
	"workpackage_date_start_scheduled"	INTEGER,
	"workpackage_date_start_actual"	INTEGER,
	"workpackage_date_end_scheduled"	INTEGER,
	"workpackage_date_end_actual"	INTEGER,
	"workpackage_duration_scheduled"	INTEGER,
	"workpackage_duration_actual"	INTEGER,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("workpackage_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "project_sprints" (
	"sprint_id"	INTEGER,
	"sprint_parent_id"	INTEGER,
	"project_id"	INTEGER,
	"sprint_name"	TEXT,
	"sprint_summary"	TEXT,
	"sprint_todo"	TEXT,
	"sprint_date_start_scheduled"	INTEGER,
	"sprint_date_start_actual"	INTEGER,
	"sprint_date_end_scheduled"	INTEGER,
	"sprint_date_end_actual"	INTEGER,
	"sprint_duration_scheduled"	INTEGER,
	"sprint_duration_actual"	INTEGER,
	"sprint_completion_percentage"	INTEGER,
	"sprint_status"	INTEGER,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("sprint_id" AUTOINCREMENT),
	FOREIGN KEY("sprint_parent_id") REFERENCES "project_sprints"("sprint_id") ON DELETE CASCADE
);
INSERT INTO "members" ("member_id","orga_id","orga_dept_id","member_gender","member_first_name","member_last_name","member_phone","member_email","member_category","member_function","member_date_birthday","member_date_since","member_date_last_subscription","member_punchline","member_cv_short","member_cv_long","member_picture_title","member_picture_url","member_selected","member_publish","member_status","created_at","modified_at") VALUES (10,3,19,'M','Franceco','Durante','000000','bNm67z5a@nowhere.com','govern','présidente','1684-03-31','',NULL,NULL,'Francesco Durante (parfois appelé en français François Durante), né le 31 mars 16841 à Frattamaggiore (Campanie) et mort le 30 septembre 17551 à Naples, est un compositeur italien de musique baroque.','','portrait    de   Franceco   Durante','/x_pictures_events/2025-03-03_14h59m32s_YhkBhuGk.png','no','yes','active','2024-10-29 17:14:11','2024-12-19 11:11:53');
INSERT INTO "members" ("member_id","orga_id","orga_dept_id","member_gender","member_first_name","member_last_name","member_phone","member_email","member_category","member_function","member_date_birthday","member_date_since","member_date_last_subscription","member_punchline","member_cv_short","member_cv_long","member_picture_title","member_picture_url","member_selected","member_publish","member_status","created_at","modified_at") VALUES (11,3,19,'M','Tomaso Giovanni ','Albinoni','000000','bNm67z5a@nowhere.com','govern','chargée de mission','1671-07-08','','2023-11-13',NULL,'Tomaso Giovanni Albinoni, né le 8 juin 16711 à Venise et mort le 17 janvier 1751 également à Venise2, est un violoniste et compositeur vénitien de musique baroque. Il est souvent considéré comme un compositeur majeur du baroque italien. Il est surtout connu pour ses concertos, parmi lesquels ses œuvres pour un ou deux hautbois ainsi que celles pour violon. Contrairement à bon nombre de ses contemporains, Albinoni décide de ne pas se placer au service d''un protecteur ou d''une institution en particulier, mais de mener sa carrière en toute indépendance.','','portrait    de   Tomaso Giovanni    Albinoni','/x_pictures_events/2025-03-03_14h59m00s_tx2e8VUu.jpg','no','yes','active','2024-10-30 12:46:32','2024-12-19 11:05:24');
INSERT INTO "members" ("member_id","orga_id","orga_dept_id","member_gender","member_first_name","member_last_name","member_phone","member_email","member_category","member_function","member_date_birthday","member_date_since","member_date_last_subscription","member_punchline","member_cv_short","member_cv_long","member_picture_title","member_picture_url","member_selected","member_publish","member_status","created_at","modified_at") VALUES (13,3,19,'N','Giovanni Bononcini','Bononcini','000000','bNm67z5a@nowhere.com','team','commercial','1670-07-18','','',NULL,'Giovanni Battista Bononcini (né à Modène le 18 juillet 16701 et mort à Vienne (Autriche) le 9 juillet 17471) est un violoncelliste et compositeur italien de musique baroque.','***Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam.***','portrait    de   Giovanni Bononcini    Bononcini','/x_pictures_persons/2024-12-19_09h41m39s_dnQsNSAz.jpg','no','yes','active','2024-11-04 09:53:18','2024-12-19 11:07:40');
INSERT INTO "members" ("member_id","orga_id","orga_dept_id","member_gender","member_first_name","member_last_name","member_phone","member_email","member_category","member_function","member_date_birthday","member_date_since","member_date_last_subscription","member_punchline","member_cv_short","member_cv_long","member_picture_title","member_picture_url","member_selected","member_publish","member_status","created_at","modified_at") VALUES (14,2,2,'F','Giacomo Antonio ','Perti ','000000','bNm67z5a@nowhere.com','govern','communication','1661-06-06','',NULL,NULL,'Giacomo Antonio Perti (Bologne, 6 juin 1661 - Bologne, 10 avril 1756) est un compositeur italien ainsi qu''un maître de chapelle (maestro di cappella) actif principalement dans la ville de Bologne durant l''époque baroque.','','portrait    de   Giacomo Antonio    Perti ','/x_pictures_persons/2024-12-19_09h07m06s_Phr1aaZB.jpg','no','yes','active','2024-11-07 10:38:03','2024-12-19 11:13:20');
INSERT INTO "members" ("member_id","orga_id","orga_dept_id","member_gender","member_first_name","member_last_name","member_phone","member_email","member_category","member_function","member_date_birthday","member_date_since","member_date_last_subscription","member_punchline","member_cv_short","member_cv_long","member_picture_title","member_picture_url","member_selected","member_publish","member_status","created_at","modified_at") VALUES (17,2,2,'M','Domenico','Scarlatti','000000','bNm67z5a@nowhere.com','team','membre du CA','1685-10-26','','',NULL,'Domenico Scarlatti, ou Giuseppe Domenico Scarlatti, né le 26 octobre 1685 à Naples et mort le 23 juillet 1757 à Madrid, est un compositeur baroque et claveciniste virtuose italien.

Né la même année que Georg Friedrich Haendel et Jean-Sébastien Bach, Domenico Scarlatti passe la première partie de sa vie dans le sillage et l''ombre de son père, Alessandro, musicien très renommé et principal promoteur de l''opéra napolitain. Claveciniste virtuose, compositeur d''opéras, musicien de cour ou d''église, Domenico ne parvient cependant pas à se fixer durablement et à faire carrière dans l''un des centres musicaux d''Italie où le mènent ses pérégrinations : Naples, Rome, Florence, Venise…

Quelques années avant la mort de son père, il s''installe au Portugal au service de Marie-Barbara de Bragance, princesse royale, fille aînée du roi Jean V de Portugal. En 1729, elle épouse l''héritier de la couronne d''Espagne, le futur Ferdinand VI. Maître de clavecin privé de la maison de Marie-Barbara, il la suit de Lisbonne à Séville, Aranjuez et Madrid, où il termine sa vie.

Il a composé 555 sonates pour clavecin d''une originalité exceptionnelle et pour la plupart inédites de son vivant. Par ce corpus, il est l''un des compositeurs majeurs de l''époque baroque et un des principaux pour le clavecin. Ses œuvres occupent une place clé dans le développement du langage et de la technique de la musique pour clavier.','','portrait    de   Domenico    Scarlatti','/x_pictures_persons/2024-12-19_09h08m42s_j4TfdhKn.jpg','no','yes','active','2024-11-08 09:34:56','2024-12-19 14:31:47');
INSERT INTO "members" ("member_id","orga_id","orga_dept_id","member_gender","member_first_name","member_last_name","member_phone","member_email","member_category","member_function","member_date_birthday","member_date_since","member_date_last_subscription","member_punchline","member_cv_short","member_cv_long","member_picture_title","member_picture_url","member_selected","member_publish","member_status","created_at","modified_at") VALUES (18,2,2,'M','Antonio ','Caldara','000000','bNm67z5a@nowhere.com','team','Chargé de mission','1660-01-01','',NULL,NULL,'Antonio Caldara (Venise, 1670 – Vienne, 28 décembre 1736) est un chanteur, violoncelliste et compositeur italien de musique baroque de la fin du XVIIe siècle et du début du XVIIIe siècle.

Considéré au XVIIIe siècle comme le plus grand compositeur italien1, Caldara influence directement, de son vivant, Jean-Sébastien Bach, Heinichen et Telemann et, à travers son élève Georg von Reutter, Joseph Haydn et la formation du classicisme viennois2.','***sqsqsq***

 ***sqsqsq***

***sqsqsq***','portrait    de   Antonio    Caldara','/x_pictures_persons/2024-12-19_09h09m23s_aPNSxFqr.jpg','no','yes','active','2024-11-08 09:42:37','2024-12-19 14:38:36');
INSERT INTO "members" ("member_id","orga_id","orga_dept_id","member_gender","member_first_name","member_last_name","member_phone","member_email","member_category","member_function","member_date_birthday","member_date_since","member_date_last_subscription","member_punchline","member_cv_short","member_cv_long","member_picture_title","member_picture_url","member_selected","member_publish","member_status","created_at","modified_at") VALUES (20,1,1,'M','Antonio Alessandro ','Boncompagno Stradella1','000000','bNm67z5a@nowhere.com','govern','directeur','1643-07-03','',NULL,NULL,'Antonio Alessandro Boncompagno Stradella1, né le 3 juillet 1643 à Bologne1, et mort à Gênes le 25 février 1682, est un compositeur italien du XVIIe siècle..','','portrait    de   Antonio Alessandro    Boncompagno Stradella1','/x_pictures_persons/2024-12-19_09h10m09s_GPDDDRIw.jpg','no','yes','active','2024-11-11 10:58:08','2025-03-06 10:05:08');
INSERT INTO "members" ("member_id","orga_id","orga_dept_id","member_gender","member_first_name","member_last_name","member_phone","member_email","member_category","member_function","member_date_birthday","member_date_since","member_date_last_subscription","member_punchline","member_cv_short","member_cv_long","member_picture_title","member_picture_url","member_selected","member_publish","member_status","created_at","modified_at") VALUES (21,1,1,'M','Alessandro','Scarlatti','000000','bNm67z5a@nowhere.com','govern','directeur','1660-05-02','',NULL,NULL,'Alessandro Scarlatti (Palerme, 2 mai 1660 – Naples, 24 octobre 1725) est l''un des principaux compositeurs de musique baroque.

Surnommé par ses contemporains « l’Orphée italien », il partage sa carrière entre Naples et Rome, où il reçoit sa formation . Une part importante de sa production est destinée à ces lieux. Il est souvent considéré comme le fondateur de l''école napolitaine d''opéra, il en est au moins le plus illustre et plus fécond représentant : son apport, son originalité et son rayonnement, son influence sérieuse et durable, sont essentiels, tant en Italie qu''en Europe.

Particulièrement connu pour ses opéras (115 titres), il mène à terme la tradition dramatique italienne, commencée par la Camerata Bardi, puis illustrée par Monteverdi au début du XVIIe siècle et Cesti, Cavalli, Carissimi, Legrenzi ou encore Stradella, donnant la forme définitive de l’aria da capo, diffusée ainsi dans toute l''Europe. Il inaugure l''ouverture à l''italienne en trois mouvements, ancêtre lointain de la symphonie. Tous ces modèles deviennent des références pour le théâtre musical de son temps. Éclectique, Scarlatti touche en outre à tous les autres genres pratiqués à son époque, de la sonate au concerto, le motet, la messe, l''oratorio et la cantate de chambre, dont il est un maître incontesté, avec plus de 620 titres attribués avec certitude. Il peut être considéré comme un précurseur direct de Mozart.

Alessandro est le père de Domenico Scarlatti et le frère de Francesco Scarlatti.','','portrait    de   Alessandro   Scarlatti','/x_pictures_persons/2024-12-19_09h11m01s_vb7jz1Ar.jpg','no','yes','active','2024-11-11 11:01:41','2024-12-19 09:10:41');
INSERT INTO "members" ("member_id","orga_id","orga_dept_id","member_gender","member_first_name","member_last_name","member_phone","member_email","member_category","member_function","member_date_birthday","member_date_since","member_date_last_subscription","member_punchline","member_cv_short","member_cv_long","member_picture_title","member_picture_url","member_selected","member_publish","member_status","created_at","modified_at") VALUES (22,1,1,'F','Giuseppe Torelli','Torelli','000000','bNm67z5a@nowhere.com','team','directeur','1658-04-22','',NULL,NULL,'Giuseppe Torelli né le 22 avril 1658 à Vérone et mort le 8 février 1709 à Bologne, est un violoniste et un compositeur italien de musique baroque. Il est le frère du peintre Felice Torelli.','','portrait    de   Giuseppe Torelli   Torelli','/x_pictures_persons/2024-12-19_09h11m48s_QOntXJ8H.png','no','yes','active','2024-11-11 11:03:00','2024-12-19 09:11:29');
INSERT INTO "members" ("member_id","orga_id","orga_dept_id","member_gender","member_first_name","member_last_name","member_phone","member_email","member_category","member_function","member_date_birthday","member_date_since","member_date_last_subscription","member_punchline","member_cv_short","member_cv_long","member_picture_title","member_picture_url","member_selected","member_publish","member_status","created_at","modified_at") VALUES (23,1,1,'M','Arcangelo Corelli','Corelli','000000','bNm67z5a@nowhere.com','govern','directeur','1653-02-17','',NULL,NULL,'Arcangelo Corelli, né le 17 février 1653 à Fusignano et mort le 8 janvier 1713 à Rome, est un violoniste et compositeur italien.

Auteur d’une œuvre somme toute modeste et bien que n’ayant cultivé que trois genres instrumentaux – sonate, sonate en trio et concerto – Corelli est néanmoins considéré comme l''un des compositeurs majeurs de la période baroque. Il exerça une influence durant sa vie, mais également longtemps après, grâce à l''édition de ses opus chez de nombreux éditeurs à travers toute l''Europe.','','portrait    de   Arcangelo Corelli   Corelli','/x_pictures_persons/2024-12-19_09h12m38s_J1wGg7Ol.jpg','no','yes','active','2024-11-11 13:49:05','2024-12-19 09:12:16');
INSERT INTO "members" ("member_id","orga_id","orga_dept_id","member_gender","member_first_name","member_last_name","member_phone","member_email","member_category","member_function","member_date_birthday","member_date_since","member_date_last_subscription","member_punchline","member_cv_short","member_cv_long","member_picture_title","member_picture_url","member_selected","member_publish","member_status","created_at","modified_at") VALUES (24,1,1,'F','Isabella Leonarda','Leonarda','000000','bNm67z5a@nowhere.com','team','Controleur de gestion','1620-09-06','',NULL,NULL,'Isabella Leonarda, née le 6 septembre 1620 à Novare (Piémont) et morte le 25 février 1704 dans la même ville, est une religieuse et compositrice italienne du XVIIe siècle.','','portrait    de   Isabella Leonarda   Leonarda','/x_pictures_persons/2024-12-19_09h13m27s_qudJgi7U.jpg','no','yes','active','2024-11-11 13:54:15','2024-12-19 09:13:08');
INSERT INTO "members" ("member_id","orga_id","orga_dept_id","member_gender","member_first_name","member_last_name","member_phone","member_email","member_category","member_function","member_date_birthday","member_date_since","member_date_last_subscription","member_punchline","member_cv_short","member_cv_long","member_picture_title","member_picture_url","member_selected","member_publish","member_status","created_at","modified_at") VALUES (25,1,1,'M','Francesco Cavalli','Cavalli','000000','bNm67z5a@nowhere.com','team','Comptable','1602-02-14','','',NULL,'Francesco Cavalli, de son vrai nom Pier Francesco Caletti-Bruni, né le 14 février 1602 à Crema, dans la province de Crémone, en Lombardie, et mort le 14 janvier 1676 à Venise, est un compositeur et organiste italien. Il avait pris pour pseudonyme le nom d''un noble vénitien qui était son mécène.','','portrait    de   Francesco Cavalli   Cavalli','/x_pictures_persons/2024-12-19_09h14m39s_GgGOqprM.png','no','yes','active','2024-11-11 14:20:51','2024-12-19 09:14:11');
INSERT INTO "members" ("member_id","orga_id","orga_dept_id","member_gender","member_first_name","member_last_name","member_phone","member_email","member_category","member_function","member_date_birthday","member_date_since","member_date_last_subscription","member_punchline","member_cv_short","member_cv_long","member_picture_title","member_picture_url","member_selected","member_publish","member_status","created_at","modified_at") VALUES (29,1,1,'M','Giovanni Legrenzi','Legrenzi','000000','bNm67z5a@nowhere.com','govern','membre du CA','1626-08-12','',NULL,NULL,'Giovanni Legrenzi est un compositeur italien baptisé le 12 août 1626 à Clusone, non loin de Bergame, et mort à Venise le 27 mai 1690. C''est un jalon important de l''école instrumentale vénitienne entre les Gabrieli et Vivaldi — Venise était alors un des plus prestigieux foyers musicaux d''Italie.','','portrait    de   Giovanni Legrenzi   Legrenzi','/x_pictures_persons/2024-12-19_09h15m26s_3XR5AYFE.jpg','no','yes','active','2024-11-12 16:51:52','2024-12-19 09:15:07');
INSERT INTO "members" ("member_id","orga_id","orga_dept_id","member_gender","member_first_name","member_last_name","member_phone","member_email","member_category","member_function","member_date_birthday","member_date_since","member_date_last_subscription","member_punchline","member_cv_short","member_cv_long","member_picture_title","member_picture_url","member_selected","member_publish","member_status","created_at","modified_at") VALUES (32,1,1,'F','Francesca','Caccini','000000','bNm67z5a@nowhere.com','govern','membre du CA','1587-09-18','','',NULL,'Francesca Caccini, née le 18 septembre 1587 à Florence et morte après 1645, est une compositrice italienne du début du XVIIe siècle, fille du chanteur et compositeur Giulio Caccini. Cantatrice, claveciniste, luthiste, guitariste, elle fut probablement la première femme ayant composé des opéras (forme théâtrale entièrement chantée, créée vers l''an 1600, à Florence).','','portrait    de   Francesca   Caccini','/x_pictures_persons/2024-12-19_09h16m23s_kHuJHSwm.jpg','no','yes','active','2024-11-12 17:05:35','2024-12-19 09:16:01');
INSERT INTO "members" ("member_id","orga_id","orga_dept_id","member_gender","member_first_name","member_last_name","member_phone","member_email","member_category","member_function","member_date_birthday","member_date_since","member_date_last_subscription","member_punchline","member_cv_short","member_cv_long","member_picture_title","member_picture_url","member_selected","member_publish","member_status","created_at","modified_at") VALUES (33,1,1,'M','Stefano ','Landi','000000','bNm67z5a@nowhere.com','team','Président','1587-02-26','',NULL,NULL,'Stefano Landi, baptisé à Rome le 26 février 1587 et mort dans la même ville le 28 octobre 1639, est un compositeur baroque italien du XVIIe siècle. Au service, à Padoue puis à Rome, des grandes familles italiennes telles que les Borghese et les Barberini, le compositeur et chanteur écrit de nombreuses arias et notamment deux opéras. Chargé de la responsabilité de plusieurs chapelles et de l''écriture de la musique pour des événements festifs de la noblesse, il poursuit également un cheminement vers la prêtrise.','','portrait    de   Stefano    Landi','/x_pictures_persons/2024-12-19_09h17m12s_subm39BR.jpg','no','yes','active','2024-11-12 17:06:50','2024-12-19 09:16:54');
INSERT INTO "members" ("member_id","orga_id","orga_dept_id","member_gender","member_first_name","member_last_name","member_phone","member_email","member_category","member_function","member_date_birthday","member_date_since","member_date_last_subscription","member_punchline","member_cv_short","member_cv_long","member_picture_title","member_picture_url","member_selected","member_publish","member_status","created_at","modified_at") VALUES (34,1,1,'M','Girolamo Frescobaldi','Frescobaldi','000000','bNm67z5a@nowhere.com','team','compositeur','','','',NULL,'Girolamo Frescobaldi, né à Ferrare (Italie) le 13 septembre 1583 et mort à Rome, le 1er mars 1643, est un compositeur, claveciniste et organiste italien. ','','portrait    de   Girolamo Frescobaldi   Frescobaldi','/x_pictures_persons/2024-12-19_09h19m36s_6UhvL9ES.jpg','no','yes','active','2024-12-18 16:33:14','2024-12-19 09:53:12');
INSERT INTO "members" ("member_id","orga_id","orga_dept_id","member_gender","member_first_name","member_last_name","member_phone","member_email","member_category","member_function","member_date_birthday","member_date_since","member_date_last_subscription","member_punchline","member_cv_short","member_cv_long","member_picture_title","member_picture_url","member_selected","member_publish","member_status","created_at","modified_at") VALUES (35,1,1,'M','John','Doe','000000','john.doe@nowhere.com','govern','','','','',NULL,'','','','/x_pictures_persons/silhouette_homme.png','no',NULL,'archived','2024-12-18 17:32:49','2025-03-06 10:30:19');
INSERT INTO "members" ("member_id","orga_id","orga_dept_id","member_gender","member_first_name","member_last_name","member_phone","member_email","member_category","member_function","member_date_birthday","member_date_since","member_date_last_subscription","member_punchline","member_cv_short","member_cv_long","member_picture_title","member_picture_url","member_selected","member_publish","member_status","created_at","modified_at") VALUES (36,1,1,'M','Claudio ','Monteverdi','','sdsdds@sddssd.fr','team','chef de choeur','','','',NULL,'Claudio Monteverdi (baptisé le 15 janvier 1567 à Crémone1 et mort le 29 novembre 1643 à Venise), est un compositeur italien.

Ses œuvres, essentiellement vocales, se situent à la charnière de la Renaissance et du baroque. Au cours de sa longue vie, il a produit des pièces appartenant aussi bien au style ancien qu''au nouveau et a apporté d’importants changements au style de son époque. Il est considéré comme l''un des créateurs de l''opéra et, avec L''Orfeo, comme l''auteur du premier chef-d''œuvre du genre. Il est également le dernier grand représentant de l''école italienne du madrigal, auquel il a consacré neuf Livres, ainsi que l''auteur d''une œuvre de musique religieuse polyphonique (messes, vêpres, motets…). ','','portrait    de   Claudio    Monteverdi','/x_pictures_persons/2024-12-19_09h26m25s_wv2dxs0b.jpg','no','yes','active','2024-12-19 09:21:19','2024-12-19 09:54:02');
INSERT INTO "members" ("member_id","orga_id","orga_dept_id","member_gender","member_first_name","member_last_name","member_phone","member_email","member_category","member_function","member_date_birthday","member_date_since","member_date_last_subscription","member_punchline","member_cv_short","member_cv_long","member_picture_title","member_picture_url","member_selected","member_publish","member_status","created_at","modified_at") VALUES (37,1,1,'M','François ','Couperin','','dssdsdds@sqsq.fr','govern','chargé mission','','','',NULL,'François Couperin, né le 10 novembre 1668 à Paris et mort le 11 septembre 1733 dans la même ville, est un important compositeur, organiste et claveciniste français de la période baroque1. Il est surnommé « Couperin le Grand » pour le distinguer d''autres membres de cette famille qui compte de nombreux musiciens. ','','portrait    de   François    Couperin','/x_pictures_persons/2024-12-19_09h41m57s_RjpzrQWT.jpg','no','yes','active','2024-12-19 09:28:41','2024-12-19 09:52:30');
INSERT INTO "members" ("member_id","orga_id","orga_dept_id","member_gender","member_first_name","member_last_name","member_phone","member_email","member_category","member_function","member_date_birthday","member_date_since","member_date_last_subscription","member_punchline","member_cv_short","member_cv_long","member_picture_title","member_picture_url","member_selected","member_publish","member_status","created_at","modified_at") VALUES (38,1,1,'M','Tarquinio','Merula','','ddsds@dds.nb','govern','compositeur','','','',NULL,'','','','/x_pictures_persons/2024-12-19_09h35m06s_tjNODbjK.jpg','no',NULL,'active','2024-12-19 09:35:06','2024-12-19 09:53:44');
INSERT INTO "members" ("member_id","orga_id","orga_dept_id","member_gender","member_first_name","member_last_name","member_phone","member_email","member_category","member_function","member_date_birthday","member_date_since","member_date_last_subscription","member_punchline","member_cv_short","member_cv_long","member_picture_title","member_picture_url","member_selected","member_publish","member_status","created_at","modified_at") VALUES (39,1,1,'M','Marin','Marais','','dssdsdsqsqds@sqsq.fr','team','interprète','','','',NULL,'Marin Marais, né le 31 mai 1656 et mort le 15 août 1728 à Paris, est un gambiste et compositeur français de la période baroque. ','','portrait    de   Marin   Marais','/x_pictures_events/2025-03-03_14h59m49s_6HlgU345.jpg','no','yes','active','2024-12-19 09:45:12','2024-12-19 09:53:28');
INSERT INTO "members" ("member_id","orga_id","orga_dept_id","member_gender","member_first_name","member_last_name","member_phone","member_email","member_category","member_function","member_date_birthday","member_date_since","member_date_last_subscription","member_punchline","member_cv_short","member_cv_long","member_picture_title","member_picture_url","member_selected","member_publish","member_status","created_at","modified_at") VALUES (40,1,1,'M','Jean-Sébastien Bach','Bach','','ssqsq@sqqs.nb','team','kapel meister','','','',NULL,'Jean-Sébastien Bach (en allemand : Johann Sebastian Bach) est un compositeur et musicien allemand né le 21 mars 1685 (31 mars dans le calendrier grégorien) à Eisenach dans le duché de Saxe-Eisenach et mort le 28 juillet 1750 à Leipzig. ','','portrait    de   Jean-Sébastien Bach   Bach','/x_pictures_events/2025-03-03_14h58m40s_8WnK5o4C.jpg','no','yes','active','2024-12-19 09:51:07','2025-03-06 10:26:28');
INSERT INTO "orga" ("orga_id","orga_name","orga_acronym","orga_logo_url","orga_punchline","orga_summary","orga_adress","orga_postal_code","orga_town","orga_country","orga_latitude","orga_longitude","orga_contact_phone","orga_contact_mail","orga_status","orga_legal_status","orga_no_rna","orga_no_siren","orga_no_siret","orga_no_tva_intracom","orga_code_naf_ape","orga_date_creation","orga_number_employees","orga_selected","modified_at","created_at") VALUES (1,'COOP','COOP','/x_logos/2025-01-28_13h51m36s_Sh50zh0K.png','','','5 avenue des Champs Élysées',75000,'Paris','France','ezeze','ezez','','','active',NULL,'','','',NULL,'','','','no','2025-01-28 13:51:36','2024-11-07 13:50:40');
INSERT INTO "orga" ("orga_id","orga_name","orga_acronym","orga_logo_url","orga_punchline","orga_summary","orga_adress","orga_postal_code","orga_town","orga_country","orga_latitude","orga_longitude","orga_contact_phone","orga_contact_mail","orga_status","orga_legal_status","orga_no_rna","orga_no_siren","orga_no_siret","orga_no_tva_intracom","orga_code_naf_ape","orga_date_creation","orga_number_employees","orga_selected","modified_at","created_at") VALUES (2,'La Compagnie des Indes','','/x_orga_partners_pictures/2024-12-07_15h40m43s_BUyiN3Ca.png','','','','','Pondichéry','India','','','','','active','','','','',NULL,'','','','no','2024-12-19 14:15:05','2024-11-21 15:04:04');
INSERT INTO "orga" ("orga_id","orga_name","orga_acronym","orga_logo_url","orga_punchline","orga_summary","orga_adress","orga_postal_code","orga_town","orga_country","orga_latitude","orga_longitude","orga_contact_phone","orga_contact_mail","orga_status","orga_legal_status","orga_no_rna","orga_no_siren","orga_no_siret","orga_no_tva_intracom","orga_code_naf_ape","orga_date_creation","orga_number_employees","orga_selected","modified_at","created_at") VALUES (3,'La Grande Manufacture','GM','/x_orga_partners_pictures/2024-12-19_10h35m02s_HMiaCRLC.png','on fabrique tout et même le reste','créée en 1922 pour le grand oncle de Marcle, la manufacure..;','22 impasse perdue',75000,'Paris','France',45,-1,'','','active','SCIC','','','','','','2016-05-22','','no','2024-12-19 10:35:02','2024-12-19 09:57:26');
INSERT INTO "place" ("place_id","place_name","place_status","place_summary","place_adress","place_postal_code","place_town","place_country","place_latitude","place_longitude","place_contact_phone","place_contact_mail","place_type","place_accessibility","place_capacity_seats","place_capacity_standup","place_selected","created_at","modified_at") VALUES (1,'Salle des fêtes','active','','500 rue des Hirondelles',40000,'Nowhere','',44.08238,-1.17182,'','','','','','',NULL,'2024-12-11 11:01:37','2025-03-06 10:54:28');
INSERT INTO "place" ("place_id","place_name","place_status","place_summary","place_adress","place_postal_code","place_town","place_country","place_latitude","place_longitude","place_contact_phone","place_contact_mail","place_type","place_accessibility","place_capacity_seats","place_capacity_standup","place_selected","created_at","modified_at") VALUES (2,'Salle du Conseil','active','','Zone Artisanale',40000,'Nowhere','FR','','','','','','','','',NULL,'2024-12-11 14:08:35','2025-03-06 10:54:58');
INSERT INTO "place" ("place_id","place_name","place_status","place_summary","place_adress","place_postal_code","place_town","place_country","place_latitude","place_longitude","place_contact_phone","place_contact_mail","place_type","place_accessibility","place_capacity_seats","place_capacity_standup","place_selected","created_at","modified_at") VALUES (3,'Gymnase','active','','45 rue des fleurs',40000,'NowhereCity','France',44.09005,-1.31312,'','','N','yes','','',NULL,'2024-12-11 14:08:48','2025-03-06 11:01:04');
INSERT INTO "process_steps" ("process_step_id","process_id","process_step_number","process_step_author","process_step_title","process_step_icon","process_step_link","process_step_description","process_step_selected","modified_at","created_at") VALUES (1,3,'1',NULL,'Rédaction','','/b_news/news_main_form_3.sql','Rédaction de l''article',NULL,'2025-01-03 14:49:42','2024-12-20 11:13:31');
INSERT INTO "process_steps" ("process_step_id","process_id","process_step_number","process_step_author","process_step_title","process_step_icon","process_step_link","process_step_description","process_step_selected","modified_at","created_at") VALUES (2,3,'2',NULL,'Information Superviseur','','/c_chat/chat_main_display_1.sql','Informer le superviseur qu''un article est en attente de validation',NULL,'2025-01-03 15:39:54','2024-12-20 11:16:32');
INSERT INTO "process_steps" ("process_step_id","process_id","process_step_number","process_step_author","process_step_title","process_step_icon","process_step_link","process_step_description","process_step_selected","modified_at","created_at") VALUES (3,3,'3',NULL,'Validation  par le superviseur','','/b_news/news_main_edit_4.sql','Validation par le superviseur',NULL,'2025-01-03 15:40:43','2024-12-20 11:18:52');
INSERT INTO "process_steps" ("process_step_id","process_id","process_step_number","process_step_author","process_step_title","process_step_icon","process_step_link","process_step_description","process_step_selected","modified_at","created_at") VALUES (4,3,'4',NULL,'Publication','','/b_news/news_private_display_1.sql','Mise en ligne de l''article',NULL,'2025-01-03 14:51:05','2025-01-03 14:51:05');
INSERT INTO "process_steps" ("process_step_id","process_id","process_step_number","process_step_author","process_step_title","process_step_icon","process_step_link","process_step_description","process_step_selected","modified_at","created_at") VALUES (5,4,'1',NULL,'Download csv file','','','Téléchager le fichier CSV contenant l''url des fichiers à effacer : doc_purge_full_list.csv ',NULL,'2025-01-21 14:04:38','2025-01-21 14:02:03');
INSERT INTO "process_steps" ("process_step_id","process_id","process_step_number","process_step_author","process_step_title","process_step_icon","process_step_link","process_step_description","process_step_selected","modified_at","created_at") VALUES (6,4,'2',NULL,'Delet Colonne name','','','Pour supprimer l''en tête de la colonne file_url : sed ''1d'' doc_purge_full_list.csv > doc_purge_full_list_headless.csv',NULL,'2025-01-21 14:04:28','2025-01-21 14:04:28');
INSERT INTO "process_steps" ("process_step_id","process_id","process_step_number","process_step_author","process_step_title","process_step_icon","process_step_link","process_step_description","process_step_selected","modified_at","created_at") VALUES (7,4,'3',NULL,'Delete files','','','effacer les fichiers en ligne de commande : cat doc_purge_full_list_headless.csv | xargs rm -f',NULL,'2025-01-21 14:08:39','2025-01-21 14:05:35');
INSERT INTO "process_steps" ("process_step_id","process_id","process_step_number","process_step_author","process_step_title","process_step_icon","process_step_link","process_step_description","process_step_selected","modified_at","created_at") VALUES (8,5,'1',NULL,'Import personnes physiques','upload','/d_prm1/prm1_import_csv_4.sql','import des personnes dans la table pmr1',NULL,'2025-02-05 18:13:51','2025-02-05 09:08:38');
INSERT INTO "process_steps" ("process_step_id","process_id","process_step_number","process_step_author","process_step_title","process_step_icon","process_step_link","process_step_description","process_step_selected","modified_at","created_at") VALUES (9,5,'2',NULL,'Récupération des id des personnes créées','download','/d_prm1/prm1_csv_full_0.sql','on récupère les prm1_id à partir du fichier télécharger',NULL,'2025-02-05 18:14:17','2025-02-05 09:09:59');
INSERT INTO "process_steps" ("process_step_id","process_id","process_step_number","process_step_author","process_step_title","process_step_icon","process_step_link","process_step_description","process_step_selected","modified_at","created_at") VALUES (10,5,'3',NULL,'préparation du fichier d''import des employés','table-import','/x_docs/prm2_employee_upload_template2.csv','dans le fichier gabarit on complète les colonnes prm2_id (structure mère), prm2_sub_id(structure employeuse) et les prm1_id(pour le lien avec la table prm1)',NULL,'2025-02-05 18:15:34','2025-02-05 09:12:19');
INSERT INTO "process_steps" ("process_step_id","process_id","process_step_number","process_step_author","process_step_title","process_step_icon","process_step_link","process_step_description","process_step_selected","modified_at","created_at") VALUES (11,5,'4',NULL,'Ajout des employés','upload','/d_prm2_sub_employees/prm2_sub_employee_csv_full_0.sql',' importer les employés dans la table prm2_sub_employees',NULL,'2025-02-05 18:14:46','2025-02-05 09:13:41');
INSERT INTO "process_steps" ("process_step_id","process_id","process_step_number","process_step_author","process_step_title","process_step_icon","process_step_link","process_step_description","process_step_selected","modified_at","created_at") VALUES (12,5,'5',NULL,'contrôle','filter-check','/d_prm2_sub_employees/prm2_sub_employee_main_display_4.sql','On controle la présence des employés dans la liste',NULL,'2025-02-05 18:16:14','2025-02-05 09:14:52');
INSERT INTO "process_steps" ("process_step_id","process_id","process_step_number","process_step_author","process_step_title","process_step_icon","process_step_link","process_step_description","process_step_selected","modified_at","created_at") VALUES (13,5,'0',NULL,'Essai dans la base bac à sable','sandbox','','l''importation doit être d''abord testé dans une base test avant de lancer l''opération dans une base de production',NULL,'2025-02-05 18:17:21','2025-02-05 09:15:57');
INSERT INTO "place_spaces" ("space_id","place_id","space_name","space_level","space_summary","space_access","space_type","space_accessibility","space_capacity_seats","space_capacity_standup","space_status","space_selected","created_at","modified_at") VALUES (5,1,'Salle des fêtes','main',NULL,NULL,'','','','',NULL,NULL,'2024-12-11 11:01:37','2024-12-11 14:26:16');
INSERT INTO "place_spaces" ("space_id","place_id","space_name","space_level","space_summary","space_access","space_type","space_accessibility","space_capacity_seats","space_capacity_standup","space_status","space_selected","created_at","modified_at") VALUES (6,2,'Salle du Conseil','main',NULL,NULL,'','','','',NULL,NULL,'2024-12-11 14:08:35','2024-12-11 14:26:16');
INSERT INTO "place_spaces" ("space_id","place_id","space_name","space_level","space_summary","space_access","space_type","space_accessibility","space_capacity_seats","space_capacity_standup","space_status","space_selected","created_at","modified_at") VALUES (7,3,'Gymnase','main','','','N','yes','','N','active',NULL,'2024-12-11 14:08:48','2025-03-06 10:55:40');
INSERT INTO "place_spaces" ("space_id","place_id","space_name","space_level","space_summary","space_access","space_type","space_accessibility","space_capacity_seats","space_capacity_standup","space_status","space_selected","created_at","modified_at") VALUES (8,1,'Salle de réunion','annex','','prendre l''escalier 1ère porte à droite','','','','','active',NULL,'2024-12-11 16:35:07','2025-03-06 11:02:20');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (1,3,'sqsq','sqs','M',45,'','sqsqsq@sqs.fr',45700,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-14 17:21:13','2024-12-14 17:21:13');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (2,3,'sqsqcxxccx','sqs','M',45,'','sqsqsq@sqs.fr',45700,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-14 17:21:43','2024-12-14 17:21:43');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (3,5,'xcxcx','cxcxcxc','','','','dsdd@sdsd.fr','',NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-14 17:59:35','2024-12-14 17:59:35');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (4,5,'xcxcx','cxcxcxc','','','','dsdd@sdsd.fr','',NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-14 18:03:49','2024-12-14 18:03:49');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (5,5,'ds','sddsds','','','','dsds@ds.fr','',NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-14 18:05:56','2024-12-14 18:05:56');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (6,5,'vcvc','vcv','','','','vcvc@vcvc.fr','',NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-14 18:06:50','2024-12-14 18:06:50');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (7,5,'ds','ds','','','','sqsqsq@sqs.fr','',NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-14 18:08:41','2024-12-14 18:08:41');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (8,5,'sd','sd','','','','sqsqsq@sqs.fr','',NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-14 18:12:22','2024-12-14 18:12:22');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (9,5,'cx','cx','','','','sd@sd.fr','',NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-15 08:41:46','2024-12-15 08:41:46');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (10,5,'SEBASTIEN','ss','','','','sd@sd.fr',40170,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-15 08:44:16','2024-12-15 08:44:16');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (11,5,'SEBASTIEN','ss','','','','sd@sd.fr',40170,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-15 08:44:31','2024-12-15 08:44:31');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (12,5,'SEBASTIEN','ss','','','','sd@sd.fr',40170,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-15 08:45:27','2024-12-15 08:45:27');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (13,5,'s','s','','','','sd@sd.fr','',NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-15 08:47:00','2024-12-15 08:47:00');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (14,5,'SEBASTIEN','s','','','','sd@sd.fr',40170,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-15 08:53:37','2024-12-15 08:53:37');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (15,5,'SEBASTIEN','s','','','','sd@sd.fr',40170,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-15 08:53:56','2024-12-15 08:53:56');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (16,5,'SEBASTIEN','s','','','','sd@sd.fr',40170,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-15 08:55:03','2024-12-15 08:55:03');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (17,5,'SEBASTIEN','s','','','','sd@sd.fr',40170,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-15 08:56:10','2024-12-15 08:56:10');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (18,5,'SEBASTIEN','s','','','','sd@sd.fr',40170,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-15 08:58:09','2024-12-15 08:58:09');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (19,5,'SEBASTIEN','s','','','','sd@sd.fr',40170,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-15 08:58:28','2024-12-15 08:58:28');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (20,5,'SEBASTIEN','s','','','','sd@sd.fr',40170,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-15 08:58:40','2024-12-15 08:58:40');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (21,5,'SEBASTIEN','s','','','','sd@sd.fr',40170,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-15 09:05:11','2024-12-15 09:05:11');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (22,5,'SEBASTIEN','s','','','','sd@sd.fr',40170,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-15 09:05:47','2024-12-15 09:05:47');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (23,5,'SEBASTIEN','s','','','','sd@sd.fr',40170,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-15 09:06:44','2024-12-15 09:06:44');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (24,5,'SEBASTIEN','s','','','','sd@sd.fr',40170,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-15 09:07:30','2024-12-15 09:07:30');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (25,5,'SEBASTIEN','s','','','','sd@sd.fr',40170,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-15 09:07:57','2024-12-15 09:07:57');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (26,5,'SEBASTIEN','s','','','','sd@sd.fr',40170,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-15 09:09:08','2024-12-15 09:09:08');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (27,5,'SEBASTIEN','s','','','','sd@sd.fr',40170,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-15 09:09:31','2024-12-15 09:09:31');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (28,5,'SEBASTIEN','s','','','','sd@sd.fr',40170,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-15 09:10:30','2024-12-15 09:10:30');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (29,5,'SEBASTIEN','s','','','','sd@sd.fr',40170,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-15 09:10:46','2024-12-15 09:10:46');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (30,5,'xw','xw','','','','sd@fddf.fr','',NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-15 16:40:24','2024-12-15 16:40:24');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (31,5,'SEBASTIEN','s','','','','sd@fddf.fr',40170,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-15 16:40:40','2024-12-15 16:40:40');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (32,5,'sd','ds','','','','sd@fddf.fr','',NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-15 16:40:55','2024-12-15 16:40:55');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (33,5,'SEBASTIEN','s','','','','sd@fddf.fr',40170,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-15 16:41:48','2024-12-15 16:41:48');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (34,5,'SEBASTIEN','s','','','','sd@fddf.fr',40170,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-15 16:42:04','2024-12-15 16:42:04');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (35,4,'dsds','ds','M','','','dssd@ds.fr','',NULL,NULL,NULL,'yes',NULL,NULL,'2024-12-17 17:07:45','2024-12-17 17:07:45');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (36,4,'xwxw','xwxw','M','','','xwxw@xwxw.bn','',NULL,NULL,NULL,'yes',NULL,NULL,'2024-12-17 17:24:23','2024-12-17 17:24:23');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (37,4,'xwxw','xwxw','M','','','xwxw@xwxw.bn','',NULL,NULL,NULL,'yes',NULL,NULL,'2024-12-17 17:25:47','2024-12-17 17:25:47');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (38,4,'ds','sdds','','','','dssd@ds.fr','',NULL,NULL,NULL,'yes',NULL,NULL,'2024-12-17 17:26:59','2024-12-17 17:26:59');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (39,4,'ds','sdds','','','','dssd@ds.fr','',NULL,NULL,NULL,'yes',NULL,NULL,'2024-12-17 17:27:35','2024-12-17 17:27:35');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (40,4,'jean','dupont','M',21,'','sqsq@sqs.fr',45000,NULL,NULL,NULL,'yes',NULL,NULL,'2025-01-03 14:16:54','2025-01-03 14:16:54');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (41,4,'ds','dsds','M','','ds','dsds@ds.dsd','',NULL,NULL,NULL,'yes',NULL,NULL,'2025-01-16 14:23:19','2025-01-16 14:23:19');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (42,4,'ds','dsds','M','','ds','dsds@ds.dsd','',NULL,NULL,NULL,'yes',NULL,NULL,'2025-01-16 14:23:31','2025-01-16 14:23:31');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (43,4,'ds','dsds','M','','ds','dsds@ds.dsd','',NULL,NULL,NULL,'yes',NULL,NULL,'2025-01-16 14:32:47','2025-01-16 14:32:47');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (44,4,'ds','dsds','M','','ds','dsds@ds.dsd','',NULL,NULL,NULL,'yes',NULL,NULL,'2025-01-16 14:36:03','2025-01-16 14:36:03');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (45,4,'ds','dsds','M','','ds','dsds@ds.dsd','',NULL,NULL,NULL,'yes',NULL,NULL,'2025-01-16 14:38:37','2025-01-16 14:38:37');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (46,4,'ds','dsds','M','','ds','dsds@ds.dsd','',NULL,NULL,NULL,'yes',NULL,NULL,'2025-01-16 14:39:24','2025-01-16 14:39:24');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (47,4,'ds','dsds','M','','ds','dsds@ds.dsd','',NULL,NULL,NULL,'yes',NULL,NULL,'2025-01-16 14:44:03','2025-01-16 14:44:03');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (48,4,'ds','dsds','M','','ds','dsds@ds.dsd','',NULL,NULL,NULL,'yes',NULL,NULL,'2025-01-16 14:46:52','2025-01-16 14:46:52');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (49,4,'xwx','xwxwx','M','','','xwxw@xwxw.gr','',NULL,NULL,NULL,'yes',NULL,NULL,'2025-01-16 15:10:04','2025-01-16 15:10:04');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (50,4,'xwx','xwxwx','M','','','xwxw@xwxw.gr','',NULL,NULL,NULL,'yes',NULL,NULL,'2025-01-16 15:10:21','2025-01-16 15:10:21');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (51,4,'xwx','xwxwx','M','','','xwxw@xwxw.gr','',NULL,NULL,NULL,'yes',NULL,NULL,'2025-01-16 15:14:03','2025-01-16 15:14:03');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (52,4,'editor3','editor3','N','',0,'editor3@coopcoop.net','',NULL,NULL,NULL,'yes',NULL,NULL,'2025-01-16 15:32:09','2025-01-16 15:32:09');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (53,17,'editor3','editor3','N','',0,'editor3@coopcoop.net','',NULL,NULL,NULL,'yes',NULL,NULL,'2025-01-16 15:38:02','2025-01-16 15:38:02');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (54,4,'editor3','editor3','N','',0,'editor3@coopcoop.net','',NULL,NULL,NULL,'yes',NULL,NULL,'2025-01-16 15:41:56','2025-01-16 15:41:56');
INSERT INTO "event_participants" ("participant_id","event_id","participant_first_name","participant_last_name","participant_gender","participant_age","participant_contact_phone","participant_contact_email","participant_postal_code","participant_function","participant_category","participant_status","participant_rgpd_validation","participant_selected","participant_validation","created_at","modified_at") VALUES (55,16,'editor3','editor3','N','',0,'editor3@coopcoop.net','',NULL,NULL,NULL,'yes',NULL,NULL,'2025-01-16 16:06:15','2025-01-16 16:06:15');
INSERT INTO "process" ("process_id","process_title","process_description","process_category","process_status","process_publication_status","process_selected","created_at","modified_at") VALUES (3,'Rédaction d''un article','Rédaction d''un article','editor','active','online',NULL,'2024-12-20 10:40:16','2025-01-03 14:46:42');
INSERT INTO "process" ("process_id","process_title","process_description","process_category","process_status","process_publication_status","process_selected","created_at","modified_at") VALUES (4,'Purge_docs','Etape pour assurer l''effacement des fichiers inutiles','admin','online',NULL,NULL,'2025-01-21 14:00:48','2025-01-21 14:00:48');
INSERT INTO "process" ("process_id","process_title","process_description","process_category","process_status","process_publication_status","process_selected","created_at","modified_at") VALUES (5,'Import Employees','importation en 2 étapes à partir de 2 tables liées','supervisor','online',NULL,NULL,'2025-02-05 09:07:09','2025-02-05 09:07:09');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (95,1,NULL,17,'ddsds','online','main','2024-12-27 15:02:32','2024-12-27 15:02:32');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (96,1,NULL,17,'ddsds','online','post','2024-12-27 15:02:54','2024-12-27 15:02:54');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (97,1,NULL,3,'ddsds','online','post','2024-12-27 17:24:06','2024-12-27 17:24:06');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (98,1,NULL,3,'ddsds','online','post','2024-12-27 17:24:12','2024-12-27 17:24:12');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (99,2,NULL,3,'sd','online','main','2024-12-27 17:30:41','2024-12-27 17:30:41');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (101,2,NULL,3,'sd','online','post','2024-12-27 17:31:21','2025-01-19 16:29:26');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (102,1,NULL,17,'ddsds','online','post','2024-12-29 09:16:30','2024-12-29 09:16:30');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (103,1,NULL,17,'ddsds','online','post','2024-12-29 09:16:50','2024-12-29 09:16:50');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (104,1,NULL,17,'ddsds','online','post','2024-12-29 09:17:08','2024-12-29 09:17:08');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (105,1,NULL,17,'ddsds','online','post','2024-12-29 09:18:21','2024-12-29 09:18:21');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (106,1,NULL,17,'ddsds','online','post','2024-12-29 09:19:39','2024-12-29 09:19:39');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (107,1,NULL,17,'ddsds','online','post','2024-12-29 17:35:33','2024-12-29 17:35:33');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (108,3,NULL,3,'erer','online','main','2024-12-29 17:37:35','2024-12-29 17:37:35');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (109,4,NULL,3,'sd','online','main','2024-12-29 17:56:23','2024-12-29 17:56:23');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (110,4,NULL,3,'sd','online','main','2024-12-29 17:57:01','2024-12-29 17:57:01');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (111,5,NULL,3,'sd','online','main','2024-12-29 17:57:50','2024-12-29 17:57:50');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (112,3,NULL,3,'xwsqqs','online','post','2024-12-29 17:58:02','2024-12-29 18:13:29');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (119,3,NULL,3,'ssqqs','online','post','2024-12-29 18:18:16','2024-12-29 18:18:16');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (121,9,10,3,'sq','online','main','2024-12-30 10:36:48','2024-12-30 10:36:48');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (123,10,9,3,'<ww<','online','main','2024-12-30 10:39:42','2024-12-30 10:39:42');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (124,11,3,17,'sdsd','online','main','2024-12-30 10:44:17','2024-12-30 10:44:17');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (125,12,19,3,'<w','online','main','2024-12-30 11:01:36','2024-12-30 11:01:36');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (127,12,NULL,3,'bnbvbv','online','post','2024-12-30 12:29:34','2025-01-19 16:29:56');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (128,12,NULL,3,'bn','online','post','2024-12-30 12:30:47','2024-12-30 12:30:47');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (129,13,10,19,'cx','online','main','2025-01-03 09:33:59','2025-01-03 09:33:59');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (130,14,19,3,'n,bb,b,n','online','main','2025-01-07 09:50:09','2025-01-07 09:50:09');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (131,15,19,3,'n,bb,b,n','online','main','2025-01-07 09:52:34','2025-01-07 09:52:34');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (132,16,19,3,'lklkj','online','main','2025-01-07 17:08:14','2025-01-07 17:08:14');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (133,17,19,3,'xwxw','online','main','2025-01-07 17:13:51','2025-01-07 17:13:51');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (134,18,19,3,'xwxw','online','main','2025-01-07 17:14:01','2025-01-07 17:14:01');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (135,19,19,3,'xwxw','online','main','2025-01-07 17:15:59','2025-01-07 17:15:59');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (136,20,19,3,'xwxw','online','main','2025-01-07 17:17:13','2025-01-07 17:17:13');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (137,21,19,3,'xwxw','online','main','2025-01-07 17:18:49','2025-01-07 17:18:49');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (138,22,19,3,'xwxw','online','main','2025-01-07 17:19:44','2025-01-07 17:19:44');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (139,23,19,3,'xwxw','online','main','2025-01-07 17:20:17','2025-01-07 17:20:17');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (140,14,NULL,3,'vbbv','online','post','2025-01-07 17:20:46','2025-01-07 17:20:46');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (141,24,19,3,'bnnb','online','main','2025-01-08 13:58:52','2025-01-08 13:58:52');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (142,15,NULL,3,'vbnvbbv','online','post','2025-01-08 14:06:34','2025-01-08 14:06:34');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (143,25,3,3,'dfdfdf','online','main','2025-01-08 14:07:11','2025-01-08 14:07:11');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (144,26,19,3,'xw','online','main','2025-01-08 14:19:23','2025-01-08 14:19:23');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (145,16,NULL,3,'bnnb','online','post','2025-01-08 14:25:23','2025-01-08 14:25:23');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (146,16,NULL,3,'bnnb','online','post','2025-01-08 14:25:31','2025-01-08 14:25:31');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (147,16,NULL,3,'bnnb','online','post','2025-01-08 14:28:11','2025-01-08 14:28:11');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (148,27,19,3,'bnnbnb','online','main','2025-01-08 14:29:55','2025-01-08 14:29:55');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (149,27,NULL,3,'fdfdfd','online','post','2025-01-08 14:45:02','2025-01-08 14:45:02');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (150,27,NULL,3,'dsds','online','post','2025-01-08 16:16:13','2025-01-08 16:16:13');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (151,27,NULL,3,'vbbv','online','post','2025-01-08 16:17:26','2025-01-08 16:17:26');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (152,27,NULL,3,'hjjh','online','post','2025-01-08 16:18:51','2025-01-08 16:18:51');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (153,27,NULL,3,'n,,nn','online','post','2025-01-08 16:20:47','2025-01-08 16:20:47');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (154,27,NULL,3,'nbnb','online','post','2025-01-08 16:21:54','2025-01-08 16:21:54');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (155,27,NULL,3,'xwxw','online','post','2025-01-08 16:24:10','2025-01-08 16:24:10');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (156,27,NULL,3,'xccx','online','post','2025-01-08 16:25:36','2025-01-08 16:25:36');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (157,27,NULL,3,'xwxw','online','post','2025-01-08 16:28:04','2025-01-08 16:28:04');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (158,27,NULL,3,'w<<w','online','post','2025-01-08 16:28:25','2025-01-08 16:28:25');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (159,16,NULL,3,'w<w<','online','post','2025-01-08 16:28:42','2025-01-08 16:28:42');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (160,28,19,3,'xccx','online','main','2025-01-08 16:31:16','2025-01-08 16:31:16');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (161,29,19,21,'xwxw','online','main','2025-01-10 14:49:50','2025-01-10 14:49:50');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (162,29,NULL,21,'cxc','online','post','2025-01-10 14:50:00','2025-01-10 14:50:00');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (163,30,NULL,21,'dds','online','main','2025-01-13 18:11:28','2025-01-13 18:11:28');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (164,31,NULL,21,'g','online','main','2025-01-13 18:15:08','2025-01-13 18:15:08');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (165,32,NULL,21,'jjkjk','online','main','2025-01-13 18:16:38','2025-01-13 18:16:38');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (166,33,NULL,21,'xwxw','online','main','2025-01-13 18:35:21','2025-01-13 18:35:21');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (167,39,NULL,21,'reere','online','main','2025-01-14 14:39:24','2025-01-14 14:39:24');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (168,40,NULL,21,'reere','online','main','2025-01-14 14:44:07','2025-01-14 14:44:07');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (169,41,NULL,21,'reere','online','main','2025-01-14 14:44:42','2025-01-14 14:44:42');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (170,42,NULL,21,'reere','online','main','2025-01-14 14:45:59','2025-01-14 14:45:59');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (171,43,NULL,21,'reere','online','main','2025-01-14 14:46:10','2025-01-14 14:46:10');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (172,44,NULL,21,'reere','online','main','2025-01-14 14:47:13','2025-01-14 14:47:13');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (173,45,NULL,21,'reere','online','main','2025-01-14 14:47:34','2025-01-14 14:47:34');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (174,46,NULL,21,'reere','online','main','2025-01-14 14:48:45','2025-01-14 14:48:45');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (175,47,NULL,21,'reere','online','main','2025-01-14 14:49:19','2025-01-14 14:49:19');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (176,48,NULL,21,'reere','online','main','2025-01-14 14:50:24','2025-01-14 14:50:24');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (177,49,NULL,21,'reere','online','main','2025-01-14 14:51:46','2025-01-14 14:51:46');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (178,50,NULL,21,'reere','online','main','2025-01-14 14:56:19','2025-01-14 14:56:19');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (179,51,NULL,21,'reere','online','main','2025-01-14 14:56:25','2025-01-14 14:56:25');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (180,52,NULL,21,'reere','online','main','2025-01-14 14:57:19','2025-01-14 14:57:19');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (181,52,NULL,21,'dsdsdsds','online','post','2025-01-14 15:30:27','2025-01-14 15:30:27');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (182,52,NULL,21,'dsdsdsds','online','post','2025-01-14 15:33:45','2025-01-14 15:33:45');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (183,52,NULL,21,'dsdsdsds','online','post','2025-01-14 15:45:31','2025-01-14 15:45:31');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (184,52,NULL,21,'jkjk','online','post','2025-01-14 16:18:19','2025-01-14 16:18:19');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (185,52,NULL,21,'jkjk','online','post','2025-01-14 16:22:34','2025-01-14 16:22:34');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (186,52,NULL,21,'jkjk','online','post','2025-01-14 16:23:14','2025-01-14 16:23:14');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (187,52,NULL,21,'jkjk','online','post','2025-01-14 16:25:08','2025-01-14 16:25:08');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (188,52,NULL,21,'dsds','online','post','2025-01-14 16:49:31','2025-01-14 16:49:31');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (189,52,NULL,21,'dsds','online','post','2025-01-14 16:51:45','2025-01-14 16:51:45');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (190,52,NULL,21,'sqq','online','post','2025-01-14 16:53:07','2025-01-14 16:53:07');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (191,52,NULL,21,'sqq','online','post','2025-01-14 16:54:21','2025-01-14 16:54:21');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (192,52,NULL,21,'sqq','online','post','2025-01-14 16:54:27','2025-01-14 16:54:27');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (193,53,NULL,21,'ezez','online','main','2025-01-14 16:58:17','2025-01-14 16:58:17');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (194,54,NULL,21,'ezez','online','main','2025-01-14 17:00:31','2025-01-14 17:00:31');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (195,55,NULL,21,'ezez','online','main','2025-01-14 17:00:48','2025-01-14 17:00:48');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (196,56,NULL,21,'ds','online','main','2025-01-14 17:02:53','2025-01-14 17:02:53');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (197,57,NULL,21,'ds','online','main','2025-01-14 17:04:40','2025-01-14 17:04:40');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (198,58,NULL,21,'dsds','online','main','2025-01-14 17:09:12','2025-01-14 17:09:12');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (199,58,NULL,21,'sqsq','online','post','2025-01-14 17:21:21','2025-01-14 17:21:21');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (200,58,NULL,21,'xwx','online','post','2025-01-14 17:21:36','2025-01-14 17:21:36');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (201,58,NULL,21,'dsds','online','post','2025-01-14 17:22:18','2025-01-14 17:22:18');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (202,57,NULL,21,'dfdssd','online','post','2025-01-14 17:39:34','2025-01-14 17:39:34');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (203,58,NULL,21,'xwxw','online','post','2025-01-14 17:49:51','2025-01-14 17:49:51');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (204,59,19,21,'hjjhjh','online','main','2025-01-15 14:13:08','2025-01-15 14:13:08');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (205,60,3,21,'jkjkkj','online','main','2025-01-15 14:14:14','2025-01-15 14:14:14');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (206,61,19,21,'sq','online','main','2025-01-15 14:24:33','2025-01-15 14:24:33');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (207,62,19,21,'Qq','online','main','2025-01-15 14:26:12','2025-01-15 14:26:12');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (208,63,NULL,21,'bvbv','online','main','2025-01-15 15:22:52','2025-01-15 15:22:52');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (209,64,19,21,'sqsq','online','main','2025-01-15 15:26:55','2025-01-15 15:26:55');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (210,65,19,21,'bnbn','online','main','2025-01-15 15:29:02','2025-01-15 15:29:02');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (211,66,17,21,'lkjjlk','online','main','2025-01-15 15:31:28','2025-01-15 15:31:28');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (212,67,3,19,'ds','online','main','2025-01-17 09:46:49','2025-01-17 09:46:49');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (213,68,3,19,'ds','online','main','2025-01-17 09:47:44','2025-01-17 09:47:44');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (214,69,3,19,'ds','online','main','2025-01-17 09:49:19','2025-01-17 09:49:19');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (215,70,3,19,'ds','online','main','2025-01-17 09:49:38','2025-01-17 09:49:38');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (216,70,NULL,19,'sqsq','online','post','2025-01-17 09:49:54','2025-01-17 09:51:06');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (217,70,NULL,19,'qQ','online','post','2025-01-17 09:50:50','2025-01-17 09:50:50');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (218,50,NULL,19,'<w<w','online','post','2025-01-17 10:14:37','2025-01-17 10:14:37');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (219,71,NULL,19,'fg','online','main','2025-01-17 10:16:51','2025-01-17 10:16:51');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (220,72,3,19,'vb','online','main','2025-01-17 10:17:28','2025-01-17 10:17:28');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (221,73,NULL,19,'zaaz','online','main','2025-01-17 16:23:34','2025-01-17 16:23:34');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (222,74,NULL,19,'ds','online','main','2025-01-17 16:27:46','2025-01-17 16:27:46');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (223,75,NULL,19,'dssd','online','main','2025-01-17 16:28:10','2025-01-17 16:28:10');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (224,76,17,19,'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffg','online','main','2025-01-18 09:38:55','2025-01-18 09:38:55');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (225,77,21,19,'fgfg','online','main','2025-01-18 09:42:34','2025-01-18 09:42:34');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (226,77,NULL,19,'sqqssqqs','online','post','2025-01-18 09:45:49','2025-01-18 09:46:00');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (227,78,21,19,'xwwx','online','main','2025-01-18 09:58:11','2025-01-18 09:58:11');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (228,76,NULL,19,'cxcxc','online','post','2025-01-18 17:12:50','2025-01-18 17:12:50');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (229,79,21,19,'xwxw','online','main','2025-01-18 17:32:04','2025-01-18 17:32:04');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (230,78,NULL,19,'w<w<','online','post','2025-01-18 17:32:28','2025-01-18 17:32:28');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (231,80,5,19,'xccx','online','main','2025-01-18 17:48:32','2025-01-18 17:48:32');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (232,80,'supervisor',19,'dssd','online','post','2025-01-18 18:07:43','2025-01-18 18:07:43');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (233,80,19,19,'<ww','online','post','2025-01-18 18:08:33','2025-01-18 18:08:33');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (234,2,NULL,17,'sd','online','post','2025-01-19 11:23:27','2025-01-19 11:23:27');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (235,2,NULL,3,'xwxwxw','online','post','2025-01-19 11:53:58','2025-01-19 11:53:58');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (236,4,NULL,3,'qqQ<<','closed','post','2025-01-19 16:32:42','2025-01-22 15:03:00');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (238,10,NULL,3,'w<<ww<','online','post','2025-01-19 16:47:36','2025-01-19 16:52:25');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (239,81,19,3,'kjkj','online','main','2025-01-19 16:54:30','2025-01-19 16:54:30');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (240,82,26,19,'sdsd','online','main','2025-02-18 10:11:57','2025-02-18 10:11:57');
INSERT INTO "forum_messages" ("message_id","topic_id","message_recipient_id","message_author_id","message_content","message_status","message_rank","created_at","modified_at") VALUES (241,NULL,NULL,19,'sqsq','online','main','2025-03-02 10:40:51','2025-03-02 10:40:51');
INSERT INTO "rss" ("rss_id","rss_title","rss_feed","rss_link","rss_description","rss_status","rss_category","rss_item_title","rss_item_link","rss_item_description","rss_item_table","created_at","modified_at") VALUES (1,'USERS new','http://localhost:8080/a_rss_feed/rss_new_users_5.sql','http://localhost:8080/a_users/users_new_display_5.sql','USERS : notification nouveau compte','active','admin','USERS','http://localhost:8080/a_users/users_new_display_5.sql','USERS : notification nouveau compte','users','2024-12-20 14:28:40','2025-01-22 18:46:36');
INSERT INTO "rss" ("rss_id","rss_title","rss_feed","rss_link","rss_description","rss_status","rss_category","rss_item_title","rss_item_link","rss_item_description","rss_item_table","created_at","modified_at") VALUES (2,'FAQ','http://localhost:8080/a_rss_feed/rss_faq_4.sql','  http://localhost:8080/b_faq/faq_main_display_4.sql','Nouvelles questions reçues','active','supervisor','USERS','http://localhost:8080/b_faq/faq_main_display_4.sql','Nouvelles questions reçues','faq_questions','2024-12-20 14:28:46','2025-01-22 18:44:37');
INSERT INTO "rss" ("rss_id","rss_title","rss_feed","rss_link","rss_description","rss_status","rss_category","rss_item_title","rss_item_link","rss_item_description","rss_item_table","created_at","modified_at") VALUES (3,'Agenda','http://localhost:8080/a_rss_feed/rss_agenda.sql','http://localhost:8080/b_events/event_main_list.sql','Prochain événement :','active','public','agenda','http://localhost:8080/b_events/event_main_list.sql','Prochain événement :',NULL,'2024-12-21 13:31:52','2024-12-21 13:59:49');
INSERT INTO "rss" ("rss_id","rss_title","rss_feed","rss_link","rss_description","rss_status","rss_category","rss_item_title","rss_item_link","rss_item_description","rss_item_table","created_at","modified_at") VALUES (4,'BUG REPORT','http://localhost:8080/a_rss_feed/rss_bugreport_5.sql','http://localhost:8080/c_debug/debug_main_display_5.sql','','active','admin','topic_name','http://localhost:8080/c_debug/debug_main_display_5.sql','topic_category','forum_topics','2024-12-29 15:39:42','2025-01-22 18:37:06');
INSERT INTO "rss" ("rss_id","rss_title","rss_feed","rss_link","rss_description","rss_status","rss_category","rss_item_title","rss_item_link","rss_item_description","rss_item_table","created_at","modified_at") VALUES (5,'NEWS private','http://localhost:8080/a_rss_feed/rss_news_1.sql','http://localhost:8080/b_news/news_private_display_1.sql','','active','editor','Actus internes','http://localhost:8080/b_news/news_private_display_1.sql','actus internes','news','2025-01-03 10:37:56','2025-01-22 18:45:42');
INSERT INTO "rss" ("rss_id","rss_title","rss_feed","rss_link","rss_description","rss_status","rss_category","rss_item_title","rss_item_link","rss_item_description","rss_item_table","created_at","modified_at") VALUES (6,'NEWS public','http://localhost:8080/a_rss_feed/rss_news.sql','http://localhost:8080/b_news/news_public_display.sql','Toutes les nouvelles du site CO-OP','active','public','Actus','http://localhost:8080/b_news/news_public_display.sql','Toutes les nouvelles du site CO-OP','news','2025-01-03 14:06:48','2025-01-22 18:45:59');
INSERT INTO "rss" ("rss_id","rss_title","rss_feed","rss_link","rss_description","rss_status","rss_category","rss_item_title","rss_item_link","rss_item_description","rss_item_table","created_at","modified_at") VALUES (7,'FORUM','http://localhost:8080/a_rss_feed/rss_forum_5.sql','http://localhost:8080/c_forum/forum_main_display_5.sql','Nouvelles discussions sur le forum ','active','admin','topic_name ','http://localhost:8080/c_forum/forum_main_display_5.sql','Nouvelles discussions sur le forum ','forum_topics','2025-01-22 18:35:21','2025-01-22 18:36:45');
INSERT INTO "faq_contacts" ("contact_id","contact_gender","contact_first_name","contact_last_name","contact_email","contact_rgpd","contact_status","created_at","modified_at") VALUES (9,'M','jt8GjNrf','tgqxSCSu','0ESJLHmz@nowhere.com','yes','online','2025-01-02 15:08:26','2025-01-02 15:08:26');
INSERT INTO "faq_contacts" ("contact_id","contact_gender","contact_first_name","contact_last_name","contact_email","contact_rgpd","contact_status","created_at","modified_at") VALUES (10,'M','RleR8EWt','NT24bJ8K','thWdjV0N@nowhere.com','yes','archived','2025-01-02 15:08:26','2025-01-02 18:30:35');
INSERT INTO "faq_contacts" ("contact_id","contact_gender","contact_first_name","contact_last_name","contact_email","contact_rgpd","contact_status","created_at","modified_at") VALUES (11,'N','super2','visor2','supervisor@coopcoop.net','yes','online','2025-01-21 14:53:04','2025-01-21 14:53:04');
INSERT INTO "faq_contacts" ("contact_id","contact_gender","contact_first_name","contact_last_name","contact_email","contact_rgpd","contact_status","created_at","modified_at") VALUES (12,'N','super2','visor2','supervisor@coopcoop.net','yes','online','2025-01-21 14:54:52','2025-01-21 14:54:52');
INSERT INTO "faq_contacts" ("contact_id","contact_gender","contact_first_name","contact_last_name","contact_email","contact_rgpd","contact_status","created_at","modified_at") VALUES (13,'N','super2','visor2','supervisor@coopcoop.net','yes','online','2025-01-21 14:55:19','2025-01-21 14:55:19');
INSERT INTO "events" ("event_id","event_name","event_type","event_status","event_visio","event_visio_url","event_visio_code","place_id","space_id","event_summary","event_program_url","event_picture_url","event_date","event_start_hour","event_end_hour","event_duration","event_public_private","event_audience_target","event_registration","event_participants_nb","event_participants_nb_max","event_entrance_fee","event_selected","created_at","modified_at") VALUES (3,'bal trad','ball','active','no',NULL,NULL,'1',5,'','/x_docs/2024-12-12_10h34m30s_dUlx2gpe.png','/x_docs/2024-12-12_17h41m16s_KEZcBgnT.png','2024-12-28','12:34','15:00','1:00','public','','yes',0,25,'',NULL,'2024-12-12 10:34:30','2024-12-12 10:34:30');
INSERT INTO "events" ("event_id","event_name","event_type","event_status","event_visio","event_visio_url","event_visio_code","place_id","space_id","event_summary","event_program_url","event_picture_url","event_date","event_start_hour","event_end_hour","event_duration","event_public_private","event_audience_target","event_registration","event_participants_nb","event_participants_nb_max","event_entrance_fee","event_selected","created_at","modified_at") VALUES (4,'Repas de Noël','ball','active','no','','','3',7,'','/x_docs/2024-12-12_10h34m47s_MiCo49FE.png','','2025-01-17','12:34','15:00','1:00','public','','yes',13,25,'',NULL,'2024-12-12 10:34:47','2025-01-16 15:41:56');
INSERT INTO "events" ("event_id","event_name","event_type","event_status","event_visio","event_visio_url","event_visio_code","place_id","space_id","event_summary","event_program_url","event_picture_url","event_date","event_start_hour","event_end_hour","event_duration","event_public_private","event_audience_target","event_registration","event_participants_nb","event_participants_nb_max","event_entrance_fee","event_selected","created_at","modified_at") VALUES (5,'Réunion de concertation','meeting','active','no',NULL,NULL,'1',8,'Pour fixer les objectifs de l''année','/x_docs/2024-12-14_11h30m14s_T8Go6azx.png','/x_docs/2024-12-14_11h28m00s_1fjWXYbl.png','2024-12-20','12:34','15:00','1:00','public','','yes',5,5,'',NULL,'2024-12-12 10:42:39','2024-12-15 16:42:04');
INSERT INTO "events" ("event_id","event_name","event_type","event_status","event_visio","event_visio_url","event_visio_code","place_id","space_id","event_summary","event_program_url","event_picture_url","event_date","event_start_hour","event_end_hour","event_duration","event_public_private","event_audience_target","event_registration","event_participants_nb","event_participants_nb_max","event_entrance_fee","event_selected","created_at","modified_at") VALUES (6,'repas de noel','diner','active','no',NULL,NULL,'1',8,'','','','2024-12-20','','','','public','','no',0,'','','no','2024-12-16 09:12:37','2024-12-16 09:12:37');
INSERT INTO "events" ("event_id","event_name","event_type","event_status","event_visio","event_visio_url","event_visio_code","place_id","space_id","event_summary","event_program_url","event_picture_url","event_date","event_start_hour","event_end_hour","event_duration","event_public_private","event_audience_target","event_registration","event_participants_nb","event_participants_nb_max","event_entrance_fee","event_selected","created_at","modified_at") VALUES (7,'diner de noel','','active','no','','','2',6,'',NULL,NULL,'2025-12-25','','','','private','','no',0,'','','no','2024-12-16 09:19:25','2024-12-16 09:19:25');
INSERT INTO "events" ("event_id","event_name","event_type","event_status","event_visio","event_visio_url","event_visio_code","place_id","space_id","event_summary","event_program_url","event_picture_url","event_date","event_start_hour","event_end_hour","event_duration","event_public_private","event_audience_target","event_registration","event_participants_nb","event_participants_nb_max","event_entrance_fee","event_selected","created_at","modified_at") VALUES (8,'diner de noel 2','meeting','active','no',NULL,NULL,'1',8,'',NULL,NULL,'2024-12-28','','','','public','','no',0,'','','no','2024-12-16 09:51:53','2024-12-16 09:51:53');
INSERT INTO "events" ("event_id","event_name","event_type","event_status","event_visio","event_visio_url","event_visio_code","place_id","space_id","event_summary","event_program_url","event_picture_url","event_date","event_start_hour","event_end_hour","event_duration","event_public_private","event_audience_target","event_registration","event_participants_nb","event_participants_nb_max","event_entrance_fee","event_selected","created_at","modified_at") VALUES (9,'diner de noel 3','','active','no','','','2',6,'','','','2024-12-29','','','','private','','yes',0,'','','no','2024-12-16 09:53:48','2024-12-16 09:53:48');
INSERT INTO "events" ("event_id","event_name","event_type","event_status","event_visio","event_visio_url","event_visio_code","place_id","space_id","event_summary","event_program_url","event_picture_url","event_date","event_start_hour","event_end_hour","event_duration","event_public_private","event_audience_target","event_registration","event_participants_nb","event_participants_nb_max","event_entrance_fee","event_selected","created_at","modified_at") VALUES (10,'diner de noel 4','','active','no',NULL,NULL,'1',8,'',NULL,NULL,'2024-12-29','','','','public','','no',0,'','','no','2024-12-16 10:42:40','2024-12-16 10:42:40');
INSERT INTO "events" ("event_id","event_name","event_type","event_status","event_visio","event_visio_url","event_visio_code","place_id","space_id","event_summary","event_program_url","event_picture_url","event_date","event_start_hour","event_end_hour","event_duration","event_public_private","event_audience_target","event_registration","event_participants_nb","event_participants_nb_max","event_entrance_fee","event_selected","created_at","modified_at") VALUES (12,'diner de noel 3''','','active','no',NULL,NULL,'2',6,'',NULL,NULL,'2024-12-29','','','','public','','no',0,'','','no','2024-12-16 10:55:20','2024-12-16 10:55:20');
INSERT INTO "events" ("event_id","event_name","event_type","event_status","event_visio","event_visio_url","event_visio_code","place_id","space_id","event_summary","event_program_url","event_picture_url","event_date","event_start_hour","event_end_hour","event_duration","event_public_private","event_audience_target","event_registration","event_participants_nb","event_participants_nb_max","event_entrance_fee","event_selected","created_at","modified_at") VALUES (14,'diner de noel 22','','active','no',NULL,NULL,'3',7,'',NULL,NULL,'2025-12-29','','','','public','','no',0,'','','no','2024-12-16 12:23:15','2024-12-16 12:23:15');
INSERT INTO "events" ("event_id","event_name","event_type","event_status","event_visio","event_visio_url","event_visio_code","place_id","space_id","event_summary","event_program_url","event_picture_url","event_date","event_start_hour","event_end_hour","event_duration","event_public_private","event_audience_target","event_registration","event_participants_nb","event_participants_nb_max","event_entrance_fee","event_selected","created_at","modified_at") VALUES (15,'conférence','conference','active','no','','','2',6,'','','','2024-12-28','15:40','','','public','','yes',0,'',50,'no','2024-12-17 09:42:54','2024-12-17 09:42:54');
INSERT INTO "events" ("event_id","event_name","event_type","event_status","event_visio","event_visio_url","event_visio_code","place_id","space_id","event_summary","event_program_url","event_picture_url","event_date","event_start_hour","event_end_hour","event_duration","event_public_private","event_audience_target","event_registration","event_participants_nb","event_participants_nb_max","event_entrance_fee","event_selected","created_at","modified_at") VALUES (16,'Réunion d''information publique','meeting','active','no','','','1',8,'sdds','',NULL,'2027-12-31','22:00','22:45','01:45','public','','yes',1,'',0,'no','2025-01-16 13:46:02','2025-01-16 17:13:00');
INSERT INTO "events" ("event_id","event_name","event_type","event_status","event_visio","event_visio_url","event_visio_code","place_id","space_id","event_summary","event_program_url","event_picture_url","event_date","event_start_hour","event_end_hour","event_duration","event_public_private","event_audience_target","event_registration","event_participants_nb","event_participants_nb_max","event_entrance_fee","event_selected","created_at","modified_at") VALUES (17,'AG 2025','meeting','active','no','','','1',8,'xwxwgfgf','/x_docs/2025-01-16_15h36m21s_qSaGe8lJ.pdf','','2026-12-31','10:00','','','public','','yes',1,'',0,'no','2025-01-16 15:36:21','2025-01-16 15:38:03');
INSERT INTO "events" ("event_id","event_name","event_type","event_status","event_visio","event_visio_url","event_visio_code","place_id","space_id","event_summary","event_program_url","event_picture_url","event_date","event_start_hour","event_end_hour","event_duration","event_public_private","event_audience_target","event_registration","event_participants_nb","event_participants_nb_max","event_entrance_fee","event_selected","created_at","modified_at") VALUES (18,'CA mars 2023','meeting','active','no','','','2',6,'<w',NULL,NULL,'2025-12-31','19:00','23:00','04:00','public','','no',0,'',0,'no','2025-01-16 17:00:58','2025-01-16 17:00:58');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (1,17,NULL,'test','request','agenda','debug',10,'G0','archived','no','2024-12-27 15:02:32','2025-01-19 09:01:30');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (2,3,NULL,'dsds','request','sdds','debug',4,'G0','online','no','2024-12-27 17:30:41','2025-01-19 11:53:59');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (3,3,NULL,'test','debug','erre','forum',8,'G0','archived','no','2024-12-29 17:37:34','2025-01-19 08:54:16');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (4,3,NULL,'dsds','project',NULL,'forum',1,'G0','online','no','2024-12-29 17:56:23','2025-01-19 16:32:42');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (5,3,NULL,'dsds','project',NULL,'forum',0,'G0','closed','no','2024-12-29 17:57:50','2025-01-19 08:54:27');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (6,3,NULL,'dsds',NULL,NULL,'chat',0,'G0','online','no','2024-12-30 10:25:05','2024-12-30 10:25:05');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (7,3,NULL,'w<<w',NULL,NULL,'chat',0,'G0','online','no','2024-12-30 10:34:46','2024-12-30 10:34:46');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (8,3,NULL,'w<<w',NULL,NULL,'chat',0,'G0','online','no','2024-12-30 10:36:26','2024-12-30 10:36:26');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (9,3,NULL,'qs',NULL,NULL,'chat',1,'G0','online','no','2024-12-30 10:36:48','2024-12-30 10:37:26');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (10,3,NULL,'<w',NULL,NULL,'chat',2,'G0','online','no','2024-12-30 10:39:41','2025-01-19 16:47:36');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (11,17,NULL,'dsds',NULL,NULL,'chat',0,'G0','online','no','2024-12-30 10:44:17','2024-12-30 10:44:17');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (12,3,NULL,'w<',NULL,NULL,'chat',3,'G0','online','no','2024-12-30 11:01:36','2024-12-30 12:30:48');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (13,19,NULL,'xxc',NULL,NULL,'chat',0,'G0','online','no','2025-01-03 09:33:58','2025-01-03 09:33:58');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (14,3,5,'jhjjh',NULL,NULL,'chat_wksp',1,'G0','online','no','2025-01-07 09:50:09','2025-01-07 17:20:46');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (15,3,5,'jhjjh',NULL,NULL,'chat_wksp',1,'G0','online','no','2025-01-07 09:52:34','2025-01-08 14:06:34');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (16,3,5,'kjhk',NULL,NULL,'chat_wksp',4,'G0','online','no','2025-01-07 17:08:14','2025-01-08 16:28:42');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (17,3,5,'xwxw',NULL,NULL,'chat_wksp',0,'G0','online','no','2025-01-07 17:13:50','2025-01-07 17:13:50');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (18,3,5,'xwxw',NULL,NULL,'chat_wksp',0,'G0','online','no','2025-01-07 17:14:01','2025-01-07 17:14:01');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (19,3,5,'xwxw',NULL,NULL,'chat_wksp',0,'G0','online','no','2025-01-07 17:15:59','2025-01-07 17:15:59');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (20,3,5,'xwxw',NULL,NULL,'chat_wksp',0,'G0','online','no','2025-01-07 17:17:12','2025-01-07 17:17:12');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (21,3,5,'xwxw',NULL,NULL,'chat_wksp',0,'G0','online','no','2025-01-07 17:18:49','2025-01-07 17:18:49');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (22,3,5,'xwxw',NULL,NULL,'chat_wksp',0,'G0','online','no','2025-01-07 17:19:43','2025-01-07 17:19:43');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (23,3,5,'xwxw',NULL,NULL,'chat_wksp',0,'G0','online','no','2025-01-07 17:20:17','2025-01-07 17:20:17');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (24,3,5,'n,nb',NULL,NULL,'chat_wksp',0,'G0','online','no','2025-01-08 13:58:51','2025-01-08 13:58:51');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (25,3,7,'fffgf',NULL,NULL,'chat_wksp',0,'G0','online','no','2025-01-08 14:07:11','2025-01-08 14:07:11');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (26,3,5,'xwxw',NULL,NULL,'chat_wksp',0,'G0','online','no','2025-01-08 14:19:22','2025-01-08 14:19:22');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (27,3,5,'nbnb',NULL,NULL,'chat_wksp',10,'G0','online','no','2025-01-08 14:29:55','2025-01-08 16:28:25');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (28,3,5,'cxxc',NULL,NULL,'chat_wksp',0,'G0','online','no','2025-01-08 16:31:16','2025-01-08 16:31:16');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (29,21,6,'xwxw',NULL,NULL,'chat_wksp',1,'G0','online','no','2025-01-10 14:49:50','2025-01-10 14:50:00');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (30,21,NULL,'dsds','general',NULL,'forum_wkps',0,'G0','online','no','2025-01-13 18:11:28','2025-01-13 18:11:28');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (31,21,5,'ghgh','general',NULL,'forum_wkps',0,'G0','online','no','2025-01-13 18:15:08','2025-01-13 18:15:08');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (32,21,5,'hjh','general',NULL,'forum_wkps',0,'G0','online','no','2025-01-13 18:16:38','2025-01-13 18:16:38');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (33,21,5,'xwxw','general',NULL,'forum_wkps',0,'G0','online','no','2025-01-13 18:35:21','2025-01-13 18:35:21');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (34,21,5,'trere','general',NULL,'forum_wkps',0,'G0','archived','no','2025-01-14 14:26:11','2025-01-15 15:21:40');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (35,21,5,'trere','general',NULL,'forum_wkps',0,'G0','archived','no','2025-01-14 14:27:46','2025-01-15 15:21:44');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (36,21,5,'trere','general',NULL,'forum_wkps',0,'G0','archived','no','2025-01-14 14:29:55','2025-01-15 15:21:47');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (37,21,5,'trere','general',NULL,'forum_wkps',0,'G0','archived','no','2025-01-14 14:30:46','2025-01-15 15:21:50');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (38,21,5,'trere','general',NULL,'forum_wkps',0,'G0','archived','no','2025-01-14 14:31:21','2025-01-15 15:21:53');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (39,21,5,'trere','general',NULL,'forum_wkps',0,'G0','online','no','2025-01-14 14:39:24','2025-01-14 14:39:24');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (40,21,5,'trere','general',NULL,'forum_wkps',0,'G0','online','no','2025-01-14 14:44:07','2025-01-14 14:44:07');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (41,21,5,'trere','general',NULL,'forum_wkps',0,'G0','online','no','2025-01-14 14:44:42','2025-01-14 14:44:42');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (42,21,5,'trere','general',NULL,'forum_wkps',0,'G0','online','no','2025-01-14 14:45:59','2025-01-14 14:45:59');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (43,21,5,'trere','general',NULL,'forum_wkps',0,'G0','online','no','2025-01-14 14:46:10','2025-01-14 14:46:10');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (44,21,5,'trere','general',NULL,'forum_wkps',0,'G0','online','no','2025-01-14 14:47:13','2025-01-14 14:47:13');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (45,21,5,'trere','general',NULL,'forum_wkps',0,'G0','online','no','2025-01-14 14:47:33','2025-01-14 14:47:33');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (46,21,5,'trere','general',NULL,'forum_wkps',0,'G0','online','no','2025-01-14 14:48:45','2025-01-14 14:48:45');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (47,21,5,'trere','general',NULL,'forum_wkps',0,'G0','online','no','2025-01-14 14:49:19','2025-01-14 14:49:19');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (48,21,5,'trere','general',NULL,'forum_wkps',0,'G0','online','no','2025-01-14 14:50:24','2025-01-14 14:50:24');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (49,21,5,'trere','general',NULL,'forum_wkps',0,'G0','online','no','2025-01-14 14:51:46','2025-01-14 14:51:46');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (50,21,5,'trere','general',NULL,'forum_wkps',1,'G0','online','no','2025-01-14 14:56:19','2025-01-17 10:14:37');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (51,21,5,'trere','general',NULL,'forum_wkps',0,'G0','archived','no','2025-01-14 14:56:24','2025-01-15 15:20:52');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (52,21,5,'trere','general',NULL,'forum_wkps',9,'G0','archived','no','2025-01-14 14:57:19','2025-01-15 15:19:17');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (53,21,5,'eez','general',NULL,'forum_wkps',0,'G0','archived','no','2025-01-14 16:58:17','2025-01-15 15:01:14');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (54,21,5,'eez','general',NULL,'forum_wkps',0,'G0','archived','no','2025-01-14 17:00:31','2025-01-15 15:00:52');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (55,21,5,'eez','general',NULL,'forum_wkps',0,'G0','archived','no','2025-01-14 17:00:48','2025-01-15 15:00:50');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (56,21,5,'ds','general',NULL,'forum_wkps',0,'G0','archived','no','2025-01-14 17:02:53','2025-01-15 15:00:49');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (57,21,5,'ds','general',NULL,'forum_wkps',1,'G0','archived','no','2025-01-14 17:04:40','2025-01-15 15:00:47');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (58,21,5,'dssdd','general',NULL,'forum_wkps',5,'G0','archived','no','2025-01-14 17:09:12','2025-01-15 15:00:45');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (59,21,5,'jhjh',NULL,NULL,'chat_wksp',0,'G0','archived','no','2025-01-15 14:13:08','2025-01-15 14:42:46');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (60,21,5,'hjjh',NULL,NULL,'chat_wksp',0,'G0','online','no','2025-01-15 14:14:14','2025-01-15 14:14:14');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (61,21,5,'sq',NULL,NULL,'chat_wksp',0,'G0','online','no','2025-01-15 14:24:32','2025-01-15 14:24:32');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (62,21,5,'qq',NULL,NULL,'chat_wksp',0,'G0','online','no','2025-01-15 14:26:12','2025-01-15 14:26:12');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (63,21,10,'bvbv','general',NULL,'forum_wkps',1,'G0','online','no','2025-01-15 15:22:52','2025-01-15 15:22:52');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (64,21,5,'sqsq',NULL,NULL,'chat_wksp',0,'G0','online','no','2025-01-15 15:26:54','2025-01-15 15:26:54');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (65,21,5,'nbn',NULL,NULL,'chat_wksp',0,'G0','online','no','2025-01-15 15:29:01','2025-01-15 15:29:01');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (66,21,NULL,'lklj',NULL,NULL,'chat',0,'G0','online','no','2025-01-15 15:31:28','2025-01-15 15:31:28');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (67,19,5,'ds',NULL,NULL,'chat_wksp',0,'G0','online','no','2025-01-17 09:46:49','2025-01-17 09:46:49');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (68,19,5,'ds',NULL,NULL,'chat_wksp',0,'G0','online','no','2025-01-17 09:47:43','2025-01-17 09:47:43');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (69,19,5,'ds',NULL,NULL,'chat_wksp',0,'G0','online','no','2025-01-17 09:49:19','2025-01-17 09:49:19');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (70,19,5,'ds',NULL,NULL,'chat_wksp',2,'G0','closed','no','2025-01-17 09:49:38','2025-01-17 10:17:54');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (71,19,5,'gfgf','general',NULL,'forum_wkps',1,'G0','online','no','2025-01-17 10:16:51','2025-01-17 10:16:51');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (72,19,5,'bvnb',NULL,NULL,'chat_wksp',0,'G0','closed','no','2025-01-17 10:17:28','2025-01-17 10:17:50');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (73,19,8,'zaza','general',NULL,'forum_wkps',1,'G0','online','no','2025-01-17 16:23:33','2025-01-17 16:23:34');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (74,19,8,'dsds','general',NULL,'forum_wkps',1,'G0','archived','no','2025-01-17 16:27:46','2025-01-18 09:38:04');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (75,19,8,'dsds','general',NULL,'forum_wkps',1,'G0','online','no','2025-01-17 16:28:10','2025-01-18 09:38:08');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (76,19,8,'fggfffffff',NULL,NULL,'chat_wksp',1,'G0','online','no','2025-01-18 09:38:54','2025-01-18 17:12:50');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (77,19,8,'fgfg',NULL,NULL,'chat_wksp',1,'G0','online','no','2025-01-18 09:42:33','2025-01-18 09:45:49');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (78,19,8,'xw',NULL,NULL,'chat_wksp',1,'G0','online','no','2025-01-18 09:58:10','2025-01-18 17:32:28');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (79,19,8,'xwx',NULL,NULL,'chat_wksp',0,'G0','online','no','2025-01-18 17:32:03','2025-01-18 17:32:03');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (80,19,10,'xccx',NULL,NULL,'chat_wksp',2,'G0','online','no','2025-01-18 17:48:32','2025-01-18 18:08:33');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (81,3,NULL,'jhjh',NULL,NULL,'chat',0,'G0','online','no','2025-01-19 16:54:30','2025-01-19 16:54:30');
INSERT INTO "forum_topics" ("topic_id","topic_author_id","workspace_id","topic_name","topic_category","debug_target","forum_type","number_messages","forum_group","topic_status","topic_selected","created_at","modified_at") VALUES (82,19,8,'sdds',NULL,NULL,'chat_wksp',0,'G0','online','no','2025-02-18 10:11:57','2025-02-18 10:11:57');
INSERT INTO "workspaces" ("workspace_id","workspace_coordinator_id","workspace_title","workspace_summary","workspace_category","workspace_status","workspace_participants_nb","created_at","modified_at") VALUES (4,3,'Workspace 01','007','sqsq','online',1,'2025-01-05 18:07:14','2025-03-11 11:22:45');
INSERT INTO "workspaces" ("workspace_id","workspace_coordinator_id","workspace_title","workspace_summary","workspace_category","workspace_status","workspace_participants_nb","created_at","modified_at") VALUES (6,3,'Workspace 02','dsds','dssd','online',1,'2025-01-06 10:00:47','2025-01-17 15:57:00');
INSERT INTO "workspaces" ("workspace_id","workspace_coordinator_id","workspace_title","workspace_summary","workspace_category","workspace_status","workspace_participants_nb","created_at","modified_at") VALUES (7,3,'Workspace 03','w<w<','w<','online',2,'2025-01-06 10:38:18','2025-03-07 11:02:04');
INSERT INTO "workspaces" ("workspace_id","workspace_coordinator_id","workspace_title","workspace_summary","workspace_category","workspace_status","workspace_participants_nb","created_at","modified_at") VALUES (9,3,'new','ds','ds','archived',0,'2025-01-06 13:00:58','2025-01-06 14:03:09');
INSERT INTO "workspaces" ("workspace_id","workspace_coordinator_id","workspace_title","workspace_summary","workspace_category","workspace_status","workspace_participants_nb","created_at","modified_at") VALUES (13,3,'nouvau group','ez','ez','archived',0,'2025-01-09 14:40:53','2025-01-10 11:12:17');
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor',3,'rTi1M3NwRBK0Itm8L0oLHrcP6STnDVDp','2025-01-07 08:29:43',NULL,45);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin',17,'jw8KKh0AOup8zEjMdaVYMOuSMALL8baR','2025-01-07 12:35:39',NULL,45);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor',3,'vntm8rFTw1P4wq6gzCNICOQF4gctLBl3','2025-01-07 17:07:53',NULL,45);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor',3,'fWDVLXljfmcQV3AuNe6uferNjg77VAKJ','2025-01-08 13:58:12',NULL,67);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor',3,'Tu6cCnAFuKjaXc9B3u8VmRDFQMafzumd','2025-01-09 13:48:24',NULL,67);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor',3,'4sXNeof4kOuLT607ERmM610c644qstds','2025-01-09 18:28:12',NULL,67);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor',3,'ME8qm7OgDORCdtDXn3yljXzZY18wwh2z','2025-01-10 08:40:56',NULL,68);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin',17,'TYMwlacAPy1NKxAO0rLPeGpDdf2WzOin','2025-01-10 14:17:27',NULL,45);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin',17,'RDWkRb9xZmbSaeTyH9DvdODNjbYRI57W','2025-01-10 14:18:22',NULL,45);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin',17,'fjAS9eTvAk9xphZgRkfBceiiZ2xPJsa1','2025-01-10 14:21:32',NULL,45);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor3',21,'tDwDQlWUUvxTmZXKhBj0JBIKigORY9Mu','2025-01-10 14:26:53',NULL,45);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin',17,'jdVETi0A53eEchoPMqBl9LWga8Wh4CVf','2025-01-10 14:39:39',NULL,45);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin',17,'FEw1Lj0PhQmgaIRZ1UurJrf60RhInYGg','2025-01-10 14:44:24',NULL,45);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor',19,'oh1TZkCL7EAcYIPsXzrVkzvHX7n6qe71','2025-01-10 14:44:39',NULL,564);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor',19,'ixTfFDWZBVYQ5vq7gFRgz7UYtf8w7vnq','2024-06-10 14:45:34',NULL,90);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor',3,'UiSrvKF4u4ZyDcRPtmuaLSJicFZUOmpr','2025-01-10 14:45:49',NULL,67);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor',3,'H3pOicaSjuKIJJaNKBBXkoqyKiSwEecH','2025-01-10 14:46:03',NULL,67);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor',3,'t6AOiAujEVYBZmWmKC3ipW0tHbTtKq6J','2025-01-10 14:46:50',NULL,67);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor3',21,'9uuhzo8vRZy6pcCSDBQSl2sxH3f843H6','2025-01-10 14:47:03',NULL,12);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor3',21,'OpzCGMJz38wxRF5TXDoJkSteimp98ucT','2025-01-10 14:47:41',NULL,12);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin',17,'hmd2Ze8cob3ZMPHvJ9hffXb2jrPEVqov','2025-01-11 09:16:13','2025-01-11 09:16:13',45);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin',17,'12IYUeSICVlU5JEo9Bk75SaTvXuKGx3O','2025-01-11 09:18:19','2025-01-11 09:19:08',45);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin',17,'A2o1DCYTVXOWxWOKNbxmVUB5CBFWjacj','2025-01-11 09:47:56','2025-01-11 10:08:03',90);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin',17,'x5VECt9GO0seB0NMbZqwJC5CQBFsbEZn','2025-01-11 10:08:33','2025-01-11 10:08:39',87);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin',17,'o2nfdlcEVBvIPRGT5BPxmszGoQOQKJ6I','2025-01-11 10:09:21','2025-01-11 10:09:24',56);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin',17,'6eXnsIv30kGNleHrRcam61n1v4E56HUk','2025-01-11 10:09:40','2025-01-11 10:11:07',32);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin',17,'umlFogAZFmdwRwYN0avodjgZY0FRaqN1','2025-01-11 10:12:11','2025-01-11 10:12:14',45);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin',17,'w3t86QjjdUTZMirNGUvknlrBf7lQ677U','2025-01-11 10:16:39','2025-01-11 10:16:42',3);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin',17,'DhK5PvEMjPgoHGZwPSZFfasrf76qTaHS','2025-01-11 10:18:13','2025-01-11 10:19:13',60);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin',17,'xiDvtWrjdQOG4sMrwqi0dgx1wbNlCwoi','2025-01-11 10:19:44','2025-01-11 10:19:44',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin',17,'P09Uz4cG7GwLj4WddAkUAjSuBKEB7kYS','2025-01-11 12:42:38','2025-01-11 12:42:38',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin',17,'v1FmSebMrxy54L1smIlHz6v6WguC3JDu','2025-01-11 12:49:56','2025-01-11 12:49:56',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin',17,'wHBwqimTmB5EDEAwLU6Enew3l5m2TUHw','2025-01-11 15:05:44','2025-01-11 15:05:44',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor3',21,'ZmRe4UulVxV3B0f5YNzlnEVIWRMMbgql','2025-01-12 10:39:03','2025-01-12 10:39:03',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor3',21,'7CZB2akpvg2yBvPfpgQYoy4O4IbWqGtG','2025-01-13 17:44:51','2025-01-13 17:44:51',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor3',21,'H55KiOFcm3Olga2ZzfL8pGK0jEYi76o5','2025-01-13 18:35:00','2025-01-13 18:35:00',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor3',21,'bgqSzHdqt7SJVDGDsh5AV5aM64rTSc3j','2025-01-14 09:06:40','2025-01-14 09:06:40',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor3',21,'JBiuPuqbKvBk9wWNAlReqe8n3o8hsFVy','2025-01-14 14:24:35','2025-01-14 14:24:35',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor3',21,'LYSqMUZgutH8CjmGZdjceBinnChyiwd5','2025-01-15 14:12:36','2025-01-15 16:45:06',9150);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor',19,'FVxD74khLhK0Nw1z0vJk2s3NnhL7DyB8','2025-01-15 16:45:15','2025-01-15 16:45:43',28);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor',3,'4MnKZ1sNdudIrUv2Se9DlZowjNwDObjm','2025-01-15 16:45:52','2025-01-15 16:47:44',112);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor3',21,'BshHQObKrKvE5bHpeh8itTLe0TFMpKxh','2025-01-15 16:48:02','2025-01-15 16:48:02',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor3',21,'EYn8pZ6bQryIkPAautdKSovsiAo5wT2z','2025-01-16 09:12:45','2025-01-16 09:12:45',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor3',21,'B9zozwNwzQUvKVJRjUnBUYDjdvveei7H','2025-01-16 13:39:13','2025-01-16 15:18:10',5937);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor3',21,'s4q4oRtIdSyYXiGX69Bf0VJljfojDHv2','2025-01-16 15:24:09','2025-01-16 16:31:58',4069);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor',19,'4HVh65sDgvbzAxhHoxVN1Y7lr4bj717A','2025-01-16 16:32:04','2025-01-16 16:57:28',1524);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor',19,'NKWuGlJsFGZRKGZrPNHqWGZ6Q3CYl6pD','2025-01-16 16:57:34','2025-01-16 16:57:34',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor',19,'xYPVNVhq9kcJTmupfgfjikkUJcKalYs4','2025-01-17 09:12:39','2025-01-17 09:12:39',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor',19,'rOmu5EYSpi0D6MfwGm2GG4uaykkUUn1E','2025-01-17 09:19:47','2025-01-17 09:19:47',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor',19,'jR57fJ44tR06Utuppyhx9RsgmdiytydG','2025-01-17 15:51:23','2025-01-17 15:51:23',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor',19,'rGEV9Ke5zH90cfnVPJVAFrT9uvvzdQRJ','2025-01-18 09:24:18','2025-01-18 09:24:18',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor',19,'fWyx9uX1usmlp79bPewIUjDNiTuXjG03','2025-01-18 17:12:22','2025-01-18 17:12:22',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor',19,'GH4PtiLMQELnCbbwQ8qS0ZBHpqmW4JK2','2025-01-19 08:37:30','2025-01-19 08:51:15',825);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin',17,'WbfVIvNF8LI9IR9aihGZRT65PKwJiWmn','2025-01-19 08:51:22','2025-01-19 11:32:06',9644);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor3',21,'136WgIqZrYGjOkJfaVndcm25rRoCeIrr','2025-01-19 11:32:15','2025-01-19 11:35:17',182);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin',17,'6tkRqXjBxJcaSrXwaNoY0u6qAHVSlkLp','2025-01-19 11:35:23','2025-01-19 11:36:08',45);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor3',21,'DzsRNHAyjB1BUOdhfYLxH0qVbUIKXJYe','2025-01-19 11:36:14','2025-01-19 11:37:14',60);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor',3,'yDTX9fLGOK7WV38egRjxF5CJAUvCJK9r','2025-01-19 11:37:21','2025-01-19 11:37:21',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor',19,'goEGLAnnJM93q1DNDVm4FTLj3oCDybR6','2025-01-20 10:24:25','2025-01-20 10:24:25',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor3',21,'ztonJgBTi9qXSl9lAlGNLQOnQZMS3JLO','2025-01-20 15:51:28','2025-01-20 15:57:15',347);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor',3,'qi9h2j4rEbOYH4cZzWiathKMTetAtiav','2025-01-20 15:57:22','2025-01-20 16:27:48',1826);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor',19,'yXfEQApb5IdgCinJahCxUthy38QscVWD','2025-01-20 16:27:54','2025-01-20 16:48:54',1260);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor3',21,'sDdZ2uGh8bQN1vi2jCaHJKKtTL77aNXU','2025-01-20 16:48:59','2025-01-20 16:54:57',358);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('viewer',5,'EjCNhCkDcxZZ0PylEweCA0SoN75n3jK8','2025-01-20 16:55:06','2025-01-20 16:56:49',103);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor3',21,'Pnbx8Wy3yKwGFD0g0iZSfu8v3wKQrYwe','2025-01-20 16:56:56','2025-01-20 17:02:10',314);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor3',21,'xPuTJMpZzLD2GMV20lg91WPdAb85DAZm','2025-01-20 17:02:16','2025-01-20 17:02:16',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor',19,'AOPqL5OYtGv39vjhyxL7jfIo8rQL2Vec','2025-01-21 08:32:25','2025-01-21 13:14:19',16914);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin',17,'LKNOoKeaUW87JChupiuzuqxDu7zyMEPc','2025-01-21 13:14:25','2025-01-21 14:22:49',4104);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor',19,'zEbyuTUoPZbNamj0kr4SQ5SG3jk0O4Dz','2025-01-21 14:22:56','2025-01-21 14:22:56',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor',19,'QBOpwxEFjvUQDdh6sFYzlNVj9q40kfSb','2025-01-21 16:01:44','2025-01-21 16:01:44',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin',17,'KwGGqEEONJGmLp1ETiuHHv0An4keXtzL','2025-01-22 11:22:01','2025-01-22 11:25:26',205);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor',19,'vR9wl30I3YFn0vsZwNK2p98sKaoDLlj9','2025-01-22 11:25:32','2025-01-22 11:33:31',479);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor',19,'IUb0nZ0h3CxFhdXlfMpgNQQFGAFBEjn5','2025-01-22 11:35:07','2025-01-22 11:35:43',36);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin',17,'kPRuBSQ1zSUo1DTzfhjim5x7k8fUglT1','2025-01-22 11:35:50','2025-01-22 11:36:26',36);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor3',21,'kXZeFvavSvqkDFcUpo1k6z5IE7cSETs8','2025-01-22 11:36:44','2025-01-22 11:36:44',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor3',21,'VHdTR3UrzL1LS5RZV7gz3l7H71jUudpi','2025-01-22 11:36:55','2025-01-22 11:37:26',31);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor',3,'nLoXCMoHTguH2QmPeNBeOtwahAIj2DLJ','2025-01-22 11:37:45','2025-01-22 11:38:14',29);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('viewer',5,'uQNFav6BRTwEghY9ZKVQwEpI4dVj3jud','2025-01-22 11:38:26','2025-01-22 12:54:49',4583);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin',17,'rEahQtcwsnObUf8dzWGDuQ6mgC5IILl6','2025-01-22 12:55:11','2025-01-22 13:00:00',289);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin',17,'MplsDkfuJwN9JCJuQlEyZkZSkOe6cBqg','2025-01-22 13:07:46','2025-01-22 13:15:15',449);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin',17,'VguEu59VVtSQvrzV1Iy1R7Zl8Kd0ERjt','2025-01-22 13:18:54','2025-01-22 13:19:14',20);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin',17,'bRXaHCJNL8fQ5lzw3bo8MfHvzq5pRDjq','2025-01-22 13:26:33','2025-01-22 15:04:34',5881);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin',17,'6STxuF8DFfhZaXpltPXHFxxgLBWzpqJ3','2025-01-22 17:55:28','2025-01-22 18:41:35',2767);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor',19,'lWZaBt4y9Vo6JJ1udjrgfw6R7WSUXR05','2025-01-22 18:41:43','2025-01-22 18:42:46',63);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin',17,'Bv7IwJ9muzBAsRrq9LIi0kMlu5MeJVYx','2025-01-22 18:42:52','2025-01-22 18:42:52',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor',19,'OqnbOZdaj06LrVLBUX0gT2zsnBAsnJD9','2025-01-23 10:14:22','2025-01-23 10:15:39',77);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'qqfnzEdyz7OfuCdHJNnPg0fh31o3jEqn','2025-01-23 10:16:28','2025-01-23 10:17:09',41);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'qjoXYJExaJLjfMCgVRmwVwyBOHoUrWhS','2025-01-23 10:17:16','2025-01-23 10:17:21',5);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin',17,'GL0831zJS5oUpujPxzYlYDpfyn7bqECh','2025-01-23 10:17:29','2025-01-23 10:19:11',102);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'XHiKHigaNprVa8GMirxbV8jQEWCl7Suy','2025-01-23 10:30:32','2025-01-23 10:31:08',36);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin1',17,'OilePQqeNvDVN6sBSgx7qrLbLAT5a9bL','2025-01-23 10:31:27','2025-01-23 10:31:32',5);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin2',26,'jCBzLdhvWzNXVzYJyeOYMTM8KbMKEvnd','2025-01-23 10:31:42','2025-01-23 10:31:42',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin2',26,'KjsKdlliAWao0iO1v6K7eKhKMGV2utMR','2025-01-23 10:32:02','2025-01-23 10:32:02',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin3',27,'DdHowsWFw4agOc7cMMN12zyhbYMUdNCY','2025-01-23 10:37:54','2025-01-23 10:37:54',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin3',27,'vb5hrrUBf1Iady2UnaSSrE9oUcXlqgtB','2025-01-23 10:38:21','2025-01-23 10:38:21',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin3',27,'1fJloV3fDhH5x59RJSGuIbVi4tulMkpr','2025-01-23 10:38:38','2025-01-23 10:38:38',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin3',27,'WifrSR6spGIMwpGoTJMcZG93i7H1b3pO','2025-01-23 10:39:00','2025-01-23 10:39:00',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin3',27,'SLpK4q042z7sCOSXjPWqx2kfYp0Gha4Y','2025-01-23 10:40:33','2025-01-23 10:40:33',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin3',27,'L5Elc0JfcsF9FGdoleQ9wkoud9lpDx6L','2025-01-23 10:40:56','2025-01-23 10:40:56',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin3',27,'LTmoMxycGRo31xJC1QL0sCBgeGIzy3pe','2025-01-23 10:41:16','2025-01-23 10:41:16',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin3',27,'F9TtLv0GrcoH6fmHfuR5jknKolgA5Hdw','2025-01-23 10:42:05','2025-01-23 10:42:05',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin3',27,'Ys9ivgq8PKIzOZbV97NWR6INSOYoGpF8','2025-01-23 10:42:56','2025-01-23 10:42:56',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin3',27,'Sl5PtO7t8ZtmC7zwJ292yecf6X3oE8g5','2025-01-23 10:43:39','2025-01-23 10:43:39',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin3',27,'TKm2Tg4NAFsiDRKLAzWQMAY361qxgSOE','2025-01-23 10:44:13','2025-01-23 10:44:13',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin3',27,'i0x8sDXtrBEF0H0Gjx6KHHUMbUxmFHGs','2025-01-23 10:44:43','2025-01-23 10:44:43',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin2',26,'rtUzNYgqvl9GoUGkruZEv7FKjQIb7bEL','2025-01-23 10:45:47','2025-01-23 10:45:47',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('viewer1',5,'lsesm7Gh0Xbqv0PyQjq2KKVPL6kZ2rvZ','2025-01-23 10:46:59','2025-01-23 10:51:11',252);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor',3,'aQNKSxrOMZJlJbzUoO6F18fRmWCE0td3','2025-01-23 10:52:06','2025-01-23 11:06:30',864);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin1',17,'bxrYUUtq6wdQnP5CR0C30DAQxwFR8XRP','2025-01-23 11:06:36','2025-01-23 11:06:36',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'3M8rK2gekjuy3wdlclBvdGP0NBy0ZCGA','2025-01-23 16:36:22','2025-01-23 16:36:22',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin1',17,'qWh7kJphVK2L9Ja4XCDcK8zTYeK2kxz0','2025-01-24 08:50:11','2025-01-24 08:50:11',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'ENOOr5jw5oeGBnxLx2jSic3wj84Ti0SL','2025-01-28 09:00:37','2025-01-28 13:51:06',17429);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'Ke0bhxBWoU41Vq5oyKL93AtsuyYvMjUf','2025-01-28 13:51:13','2025-01-28 13:51:13',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'qqNGdf43sqL7wW7skKOOtoRtHmJTsOr3','2025-01-28 17:33:11','2025-01-28 17:33:11',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'lAswGzcNgxyFmpf51Sfp7a1AzpDmI6OC','2025-01-29 11:16:46','2025-01-29 17:05:01',20895);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor1',3,'duAL35COz6pk8XQt008F3Pc3MALm53Rd','2025-01-29 17:05:59','2025-01-29 17:05:59',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor1',3,'JNQrrcmvtkxIHNZjUFOgZOV763nMRFmf','2025-01-30 09:37:22','2025-01-30 09:37:22',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor1',3,'7VpSHCnnkXUaszWNDueXVwZPTZ2QH2DX','2025-01-30 13:36:15','2025-01-30 13:55:59',1184);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'X0UL18n2T9EGGlPqWqGCIsIOm8rYl9pD','2025-01-30 13:56:06','2025-01-30 14:10:24',858);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor1',3,'w7OHBVPx1tbgxhaAfU27Wm4EimI8uBlV','2025-01-30 14:10:30','2025-01-30 15:29:02',4712);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'V0SkMHAhLAbEurBLuS7obaTJ4ALzWVEn','2025-01-30 15:29:09','2025-01-30 16:23:52',3283);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor1',3,'W21kALkjAsdcHqEU0Jc7RJ7oNAHYyTaS','2025-01-30 16:24:00','2025-01-30 16:24:00',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'jY7dh8y0zGiWA2SwO86HuMp8g3EkHLlX','2025-01-31 09:43:03','2025-01-31 09:52:52',589);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor1',3,'10qNdP1lvVYfM7RTBWFzEF4OhoVHukbA','2025-01-31 09:52:59','2025-01-31 09:53:36',37);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'mnh4MwQQKPCkdzskGSMnnKJEK0jmZvWL','2025-01-31 09:53:44','2025-01-31 09:53:44',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'CEKrlrJX3bnmstqtiin6vOIQJ8YWAtry','2025-02-01 10:52:45','2025-02-01 10:52:45',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'jzcFijLtGEnHuQ3dUOMVOBR2SdKW7peU','2025-02-02 09:41:19','2025-02-02 09:41:19',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'E9g7Mted8MVEKqGz1PtilCYldbkjKTqb','2025-02-02 18:10:46','2025-02-02 18:10:46',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'4cX2cpI3TZWwLM1K1BZe1WHU7GAO5QKK','2025-02-03 10:50:11','2025-02-03 10:50:11',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'oPq9oKFuIPP8NfIAJsEYoAiUocpQc6rh','2025-02-04 08:52:30','2025-02-04 08:52:30',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'AUcejcEVvMUeGEQoaUPFvK21nIiAvmI9','2025-02-04 10:50:49','2025-02-04 10:50:49',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'oO0qS9cu3pbvaZRd4EkojUzAGeH8PFgJ','2025-02-04 13:10:11','2025-02-04 13:10:11',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'aK5ZIN3qg66VBo1EkGFuLq4uibw1zYZC','2025-02-05 08:50:14','2025-02-05 09:06:05',951);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin1',17,'c6zPKkhK5rJfCBGJV8WCEH5GLu7JBM9Z','2025-02-05 09:06:13','2025-02-05 09:24:30',1097);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'OOAbBtX2DKdEWBnL3GgKJMVsvYI4TVH4','2025-02-05 09:24:38','2025-02-05 09:24:38',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin1',17,'CjWgc4GAoBYH9A09dfE5p6RUDrg8lTDZ','2025-02-05 18:12:28','2025-02-05 18:12:28',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor1',3,'5RdWQQckV0jsTiAseVzvmxcSo9mCwaON','2025-02-07 09:00:32','2025-02-07 17:11:22',29450);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'bLCxEbImbyHs8BOK0jt41bXGl6pJ4mls','2025-02-07 17:11:35','2025-02-07 17:12:29',54);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor1',3,'6M2bL6UGdpyJZ0GqYVNDcDzvFLXUaZOG','2025-02-07 17:12:39','2025-02-07 17:12:39',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor1',3,'VJzp2ttN8YARMbPsz8IYDrEv6Tf7FDbT','2025-02-07 17:52:37','2025-02-07 17:52:37',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor1',3,'Y62XY0dLM9MFobGbxlllLCCjHVSTgMIa','2025-02-08 08:57:48','2025-02-08 08:57:48',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor1',3,'0pog3JJoh9uM47FxiFRvUQ5Nbb9ceyxg','2025-02-09 10:07:17','2025-02-09 10:07:17',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'XNRLLo26emolnv1Y2clI5mTzI2WsFpnY','2025-02-10 08:42:40','2025-02-10 08:42:40',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor1',3,'DBgRXIvprvQXsW1XciZWeZvy9h76w0y2','2025-02-11 08:41:04','2025-02-11 08:41:04',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'4PY1itNFqwQg8XsKYbRqhw2cIBeQMqL1','2025-02-11 14:05:57','2025-02-11 14:05:57',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'k3UzjtpsSvYkt9MfCw1JQLWgKkY7x8bF','2025-02-11 16:26:29','2025-02-11 16:26:29',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'XrcWysxkmYni1hdfKQMszu8iwd8UB2kX','2025-02-12 08:40:56','2025-02-12 08:40:56',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'w8WOaeUsT1SAd50xMf9OMLdrFF6HGSH8','2025-02-13 08:23:41','2025-02-13 08:23:41',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'ZqHMAAPJlQ4dovCcmdt8FpQsAQP1JTVx','2025-02-14 08:49:59','2025-02-14 09:01:02',663);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor1',3,'1625rUS288ydD0ifTFJ2WWwR53MCd1sW','2025-02-14 09:01:08','2025-02-14 09:01:08',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'FuEjzdQ2O3DAv4EgwoM2BbvQ3oYOX3eG','2025-02-14 10:19:36','2025-02-14 10:19:36',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin1',17,'YXxd37WbDBlvSN3ZEjD5U9uJdVKXnIso','2025-02-14 14:10:06','2025-02-14 14:10:06',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin1',17,'c4V6faNSa0HBvVkhebFUUMyiopWRYbLl','2025-02-14 16:58:08','2025-02-14 16:58:08',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin1',17,'0kj0dvtP3y80IX4nxvoSKDwptMeFGLPK','2025-02-15 10:01:23','2025-02-15 11:11:04',4181);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'nSvdBz3a7865k29cTV4yl5ptgAAPQGIw','2025-02-15 11:11:11','2025-02-15 11:11:11',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin1',17,'H7xvmVMtUse5VETcIRUMDUePfSDf0e8y','2025-02-15 13:28:04','2025-02-15 13:38:32',628);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'9V2tv0IhsDaYYedG3n6XCGgPdMZ8eTaQ','2025-02-15 13:38:40','2025-02-15 13:43:49',309);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin1',17,'TkHV7eDaSF9VdjXuh52Ez7Hp52ObKhKO','2025-02-15 13:43:55','2025-02-15 13:43:55',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin1',17,'EuHGgYxrhWrdDP7AS7ZwJE7fVHdUHuHJ','2025-02-16 08:40:42','2025-02-16 08:40:42',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin1',17,'FfUQ8PbgYak2ScdqANQ3M6NT1tHFzZWP','2025-02-17 08:33:31','2025-02-17 09:07:00',2009);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'FGpomlNgCxBHXMGTG1HpoGVHnzP9fD40','2025-02-17 09:07:07','2025-02-17 09:14:44',457);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin1',17,'5PhQGINBLAfyBZiKwILWsHDqQcTtKcoA','2025-02-17 09:14:51','2025-02-17 12:59:45',13494);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin1',17,'CVQQVJKJUdZXjw29THTXvpWt39IIv5Og','2025-02-17 13:10:16','2025-02-17 13:42:09',1913);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin1',17,'Wca9WF4iFD9XOf4HuvEfFKxbcchoNWoX','2025-02-17 14:00:05','2025-02-17 14:01:31',86);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin1',17,'tov2MSB4p9lRHFP4ghqzTP1CWTBBhBmv','2025-02-17 16:23:31','2025-02-17 17:12:13',2922);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'ISE2XQl238i5ZeL86jGEufoLGu63eEnS','2025-02-17 17:12:19','2025-02-17 18:04:59',3160);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor1',3,'zr212dkieMh7YdspQ3YwjeW7IbT25sNa','2025-02-17 18:05:05','2025-02-17 18:13:45',520);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin1',17,'NFa3RTmLt0AVmrEnhuIUIK26K32bzbEQ','2025-02-17 18:13:56','2025-02-17 18:22:37',521);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'tKfQVkF1qyA7YOlKqfzs0H8R3ZNCKLCC','2025-02-17 18:22:43','2025-02-17 18:22:43',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'eQPJWTV3Aj5YK2YUMn8xqVbJH1g0SB6d','2025-02-18 08:33:02','2025-02-18 10:48:51',8149);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin1',17,'AJQumowESz0KN5kKPqeFJWn4hU0vkV0M','2025-02-18 10:48:59','2025-02-18 11:10:57',1318);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin2',26,'ATKohz7d8gYo7Oo7pNOUiCP4JlPT87QX','2025-02-18 11:11:04','2025-02-18 11:11:04',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'xZNWz9rUO0AcU3Qlm0iHtnDzSEvlhlry','2025-02-18 11:11:14','2025-02-18 11:13:07',113);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin1',17,'bKs1iAYeWxVWt94hvWz1ihLuv8Rxu76H','2025-02-18 11:13:14','2025-02-18 11:15:59',165);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'8QX7Jr3EmkdXAucv2OCPbNwWCLWGTImj','2025-02-18 11:16:05','2025-02-18 11:16:05',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'bs2onOg43lAAUOGH1njQIoGrjy3TYZZd','2025-02-18 14:43:50','2025-02-18 15:40:02',3372);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin1',17,'ZyF2ViYMpKIsuSKQ51xq9Qg8NH3FgZOm','2025-02-18 15:40:08','2025-02-18 15:48:50',522);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'IySk4lzuu9ohUU9PA086nEFbwIJtsqsM','2025-02-18 15:48:57','2025-02-18 17:53:47',7490);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin1',17,'EdabcvM7kNmKpJRxRBUb7XQvHCNYF3y7','2025-02-18 17:53:53','2025-02-18 18:00:31',398);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'k2YgpuPV6tSPbeKXkMO5hap0bJJ5qBg8','2025-02-18 18:00:37','2025-02-18 18:00:37',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'HPdDeYb7LJ2Wu2d4GhnzvsC7rgHAX9uG','2025-02-19 12:45:16','2025-02-19 14:17:03',5507);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin1',17,'o0a6DkRCiBBFkHLaI5vBT4HHTGKy03jy','2025-02-19 14:17:08','2025-02-19 14:22:03',295);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'W2Y7E1Twqq9zFUpikbrGjzJ0pnxEUZS9','2025-02-19 14:22:09','2025-02-19 17:28:13',11164);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin1',17,'uUQvlvhUTdPFEUl1qmg7MM6wMRLnjvAl','2025-02-19 17:28:20','2025-02-19 17:32:30',250);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin1',17,'Tn4ahvX0A9nuQiMtmxKdnhyVFrOGbtEK','2025-02-19 17:32:36','2025-02-19 17:32:39',3);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'k1BnBhqLFGMlO5BN5MBaaPOtKeQSp9oY','2025-02-19 17:32:46','2025-02-19 17:32:46',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'qE9L7iYv0MEMocAoLUC1oVIzKa8UMdLd','2025-02-20 07:18:37','2025-02-20 07:18:37',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'Qf2jbfX7XxyjmY0XUJSA9bOVojSpta5m','2025-02-20 09:39:41','2025-02-20 09:39:41',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'fFwngspgZY5NUbqOjqdtFr5dQ009GTZl','2025-02-20 09:46:51','2025-02-20 13:28:56',13325);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin1',17,'aJSKAm4kFplUWHkQYiQrU5ZsMgaj2QSr','2025-02-20 13:29:01','2025-02-20 13:32:50',229);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'axElOjSW1i9tR17Jr3w6zeaqRiOfhw2X','2025-02-20 13:32:56','2025-02-20 13:32:56',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'i8ysLKHOzfJ3ItQjwdIAD057C6Pl43eu','2025-02-20 17:31:20','2025-02-20 17:31:20',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'gz7rQ0xzyY67nuDEMxSB2veA4ZgeYRXt','2025-02-21 08:23:37','2025-02-21 08:42:26',1129);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin1',17,'XqeB9ZTLVCg2k8xjS73JNIBZbfT4Tuog','2025-02-21 08:42:32','2025-02-21 08:44:25',113);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'fO8cocHvApnN7qTNJGH02JSrCL5W0x2N','2025-02-21 08:44:31','2025-02-21 08:50:03',332);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin1',17,'2F0EKK4Ylc2C4rZGnApJkFPqipg1GPJP','2025-02-21 08:50:08','2025-02-21 08:51:57',109);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'GoSTGcGktBkjrPPxNyy4FYQWWJZjec5x','2025-02-21 08:52:02','2025-02-21 08:52:02',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin1',17,'Cok0Ovjyo5WdpRKZFXVGYCAMHRpWKjGZ','2025-02-22 08:35:14','2025-02-22 08:35:14',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin1',17,'IzMk89NTu1ST9u0STjJK76neoBSa2Gmx','2025-02-22 16:05:49','2025-02-22 16:05:49',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'RTEv8Vo3sYfCl7uQk2V9jAG3AnLP3lrG','2025-02-22 16:29:06','2025-02-22 16:29:06',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'XpuKSVypxSA5IHA3Fbs2Rh5fGPgR3xLL','2025-02-23 10:34:08','2025-02-23 10:34:08',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'FtQu7XpH4EoQsJ4RdqBgZ0rpa9Xyk3HW','2025-02-23 16:55:33','2025-02-23 16:55:33',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'HsxuqC5CCjysDscF9nH6jbtl37LHD25X','2025-02-24 08:16:35','2025-02-24 08:16:35',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'VDwZPBHWzoVX2tWKOWjdRF7iwBoqTxgd','2025-02-24 14:54:37','2025-02-24 14:54:37',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'geN4HW2PJZ86xKEmogTJ1Mf81jYJhG9Z','2025-02-25 08:04:50','2025-02-25 08:04:50',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin1',17,'JpmLIwgfmPhh40TDXI5MVJFfn51nFCRD','2025-02-25 17:59:30','2025-02-25 17:59:37',7);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'tAtBksfdyotEINkW8QpLNEOJU3VqKkJ8','2025-02-25 17:59:43','2025-02-25 17:59:43',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'uDS2QtFU6kdpv3gpljpb4yIvcrtM2MlV','2025-02-26 08:11:11','2025-02-26 08:11:11',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'HRMd99f0poVCUTz0djDquqcdZHVoBLFP','2025-02-27 08:23:02','2025-02-27 09:18:27',3325);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin1',17,'GqIT15lmfJmyXKRADS5NOAi2JaHrHhHN','2025-02-27 09:18:33','2025-02-27 09:30:55',742);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'LESIAoZBTiXjcJnXQbjgqsuDq2GwF35W','2025-02-27 09:31:01','2025-02-27 16:39:17',25696);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin1',17,'pp8aJHDVD3eWJGbv74tHMUyI2HIPzG4s','2025-02-27 16:39:25','2025-02-27 16:42:17',172);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'pC1957UVSrySonatCjpmP0KSOAluzOEP','2025-02-27 16:42:23','2025-02-27 16:42:23',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'KR2OMMgBT19CrVfZwdD2UPbKTyBt2EEy','2025-02-28 08:50:12','2025-02-28 08:50:12',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'xXOF2awIk8BtA1AaCTkOsoG3LaZyqdwn','2025-02-28 10:42:05','2025-02-28 17:19:57',23872);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'HdLMzARyHNO8DThqoxVkL0cKZh4bxXBU','2025-02-28 17:20:16','2025-02-28 17:20:16',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'sI3s41qKM6W4wfRUifhORT3FI3F2A6MR','2025-03-01 08:17:53','2025-03-01 08:17:53',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'DqahigU7rEHFWXFm8C58DyVq04AbfNHO','2025-03-02 08:58:48','2025-03-02 08:58:48',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'et1wOQ6nAdcpFjfJyrxIyKV9r7mQZHkq','2025-03-02 11:17:17','2025-03-02 11:17:17',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'fqfEANTz8hAmH8clqFgSZpCJQLU640dM','2025-03-02 12:48:54','2025-03-02 12:48:54',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'gOzndOub6Vc0pz3ue9kQZQ9r3R9jks9g','2025-03-02 16:22:49','2025-03-02 16:22:49',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'US87pyTSVtm42W6V3LFIyu2svDjdIfOt','2025-03-02 18:34:10','2025-03-02 18:34:10',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'A6nVfzfrnpe2kDU0eZCsslmixHDnuqGH','2025-03-03 08:04:37','2025-03-03 09:12:34',4077);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin1',17,'vyI6ZJbgAkN1lTn0RS8E7NfGpKneOd54','2025-03-03 09:12:42','2025-03-03 10:28:46',4564);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'N1h2m6ZmL13oUW1eNEsMHRmfOrgLdWLS','2025-03-03 10:28:52','2025-03-03 13:01:00',9128);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor1',3,'2x3c2mZz1HDiKFg8uZLt8BURr9JaMPA4','2025-03-03 13:01:08','2025-03-03 13:24:33',1405);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin1',17,'Q5fGffLj2pZbroosjR8nqcVx4bYXXTgX','2025-03-03 13:25:28','2025-03-03 13:26:50',82);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin3',27,'HrfIgy9Kx5IJHbOos7UjohmeocPxpFyG','2025-03-03 13:27:08','2025-03-03 13:27:08',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin3',27,'B5oFm5A8nb70YcBwMkvH1PyoYGf2wYSM','2025-03-03 13:28:30','2025-03-03 13:28:30',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin1',17,'fK693d72MbanGlPUMsme23Meqt8N7zpG','2025-03-03 13:28:48','2025-03-03 13:29:06',18);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor3',21,'9F678b7vglep83kjpgO7uyxI1NPKSs65','2025-03-03 13:29:51','2025-03-03 13:30:26',35);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor3',21,'jj9QzikrHmMcFJkt6BQm9QOHH0hE0AJC','2025-03-03 13:31:06','2025-03-03 13:31:09',3);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin1',17,'sAw6b3s6TMRiPN4Syo4xuQZQEIiv2BRt','2025-03-03 13:31:14','2025-03-03 13:31:18',4);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor1',3,'3bvYGMx6HcXpKGt5vNmWs5QXeLgJwRJl','2025-03-03 13:31:25','2025-03-03 13:55:33',1448);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'jvdq8UMpeGANJhw0EKOE4365YB559bIR','2025-03-03 13:55:40','2025-03-03 13:55:40',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'La9b59xefj5P3gd9ExcRiJRxMaBiUiqF','2025-03-04 08:11:40','2025-03-04 08:11:40',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin1',17,'QuBF8RtC8PmBeeTMOMPjheJi0okKSIqa','2025-03-05 15:52:04','2025-03-05 16:50:00',3476);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'Gj3pujyZJ1QfPXKOtJZY0ffSWqxaTELp','2025-03-05 16:50:09','2025-03-05 16:50:29',20);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin1',17,'pDlx3xOr2eNyOTwnxtvTTz08Bwage5K3','2025-03-05 16:50:34','2025-03-05 16:54:07',213);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'wMc9WVcuIATZj3hb6A2m6lUzlvhBMQer','2025-03-05 16:54:15','2025-03-05 17:20:44',1589);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin1',17,'AbCPWNb3zsYWgSOkcue4kGcSq8pmJ7fW','2025-03-05 17:20:50','2025-03-05 17:26:10',320);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'GSDZUMe9k8Fj9jeYKJJO6fdfYw2RTTMY','2025-03-05 17:26:18','2025-03-05 17:35:38',560);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'9aemUx2ai1ul4t8H0cpMaCHXQjJJqIxP','2025-03-06 08:30:09','2025-03-06 08:30:09',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'Bu5II9uSo182kK4SQ1m2WLlbIELKcMKV','2025-03-06 18:06:33','2025-03-06 18:06:33',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'KlocO3j42DItC267HezSRIbfRrbGP12A','2025-03-07 08:02:09','2025-03-07 11:07:24',11115);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin1',17,'lCoEuOpi9ueEypiOhey2bpg6798MyaIq','2025-03-07 11:07:30','2025-03-07 11:09:31',121);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'ki0yaNFidYg20NABiEEQE7zDMEdHSAzy','2025-03-07 11:09:36','2025-03-07 11:09:36',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'JWOPzrViqbnPYMKeQBeLfD5mwM2RTDkc','2025-03-08 15:51:39','2025-03-08 15:51:39',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'IDJa7E7cMLej84CaSKfsttp5tAVhvI8y','2025-03-08 18:19:39','2025-03-08 18:19:39',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'iXxisxX3QvOdrbzC03oUB0Ki3yfjA1BB','2025-03-09 08:45:50','2025-03-09 08:45:50',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'mZ8ErltbTetN95vKfq4eyitCrPbM55Rf','2025-03-09 14:13:07','2025-03-09 14:13:07',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'BhjtLa2LiIOtqsdIpT9ZEOJOIfWxba5q','2025-03-10 08:07:59','2025-03-10 14:44:42',23803);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('admin1',17,'VEGfkROGXO8K4R5eVaB4oD5hDPqotTo6','2025-03-10 14:44:49','2025-03-10 14:56:38',709);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'9TI9nmXowKaKP7y3gBrMLM01dSzue3ZJ','2025-03-10 14:56:45','2025-03-10 14:56:45',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'hRG5cg53R0tPD15tgKrYfsd0u4mbbZSn','2025-03-11 07:59:45','2025-03-11 07:59:45',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('supervisor1',19,'4kyVYlMSac8VSkgK6bOyrebw51UurBfL','2025-03-11 08:20:29','2025-03-11 08:20:29',NULL);
INSERT INTO "sessions" ("username","user_id","session_token","created_at","logout_at","session_duration") VALUES ('editor1',3,'HOkhJcLLvSNRnzacS7KuUAXIRscM6XWz','2025-03-11 10:57:53','2025-03-11 10:57:53',NULL);
INSERT INTO "news" ("news_id","news_title","news_content","news_date","news_img_url","news_category","news_public_private","news_status","created_at","modified_at") VALUES (5,'news 45','*Pren garde a tu ! Bas atrapa un arrebire-marioun que se pourtera bien* 

 Prends garde à toi ! Tu vas attraper une gifle qui se portera bien','2026-01-01',NULL,'annoncement','private','inactive','2024-12-30 18:34:36','2025-03-06 13:34:23');
INSERT INTO "news" ("news_id","news_title","news_content","news_date","news_img_url","news_category","news_public_private","news_status","created_at","modified_at") VALUES (6,'news 46','*Qu’es tout regagnat coum un herissoun, saben pa de cau bort lou préne* 

Il est tout rechigné comme un hérisson, on ne sait pas par de quel côté l’aborder ','2026-02-18','/x_news_pictures/2025-03-06_13h29m19s_Edq6ep7c.jpg','annoncement','public','active','2025-01-03 10:07:10','2025-03-06 13:34:47');
INSERT INTO "news" ("news_id","news_title","news_content","news_date","news_img_url","news_category","news_public_private","news_status","created_at","modified_at") VALUES (7,'news 47','*Souy tan sadout que n’èy pa mèy nade arrouniclhe au bénte*

J’ai tant mangé que je n’ai plus aucun pli au ventre','2025-10-15',NULL,'annoncement','private','active','2025-01-03 10:21:51','2025-03-06 13:35:04');
INSERT INTO "news" ("news_id","news_title","news_content","news_date","news_img_url","news_category","news_public_private","news_status","created_at","modified_at") VALUES (8,'news 48','*Que prefèri aué lous peus blans que de n’en aué pa du tout*

Je préfère avoir des cheveux blancs que ne pas en avoir du tout ','2027-02-26','/x_news_pictures/2025-03-06_13h33m52s_t81L1oaf.jpg','annoncement','private','active','2025-01-03 11:02:21','2025-03-06 13:35:51');
INSERT INTO "news" ("news_id","news_title","news_content","news_date","news_img_url","news_category","news_public_private","news_status","created_at","modified_at") VALUES (9,'news 49','*Qu’es ta bernique que trouberé peus aux ùus* 

Elle est si difficile qu’elle trouverait des poils sur les oeufs ','2026-02-07',NULL,'annoncement','private','active','2025-01-03 11:05:43','2025-03-06 13:36:16');
INSERT INTO "news" ("news_id","news_title","news_content","news_date","news_img_url","news_category","news_public_private","news_status","created_at","modified_at") VALUES (10,'news 50','*Podi pa mèy beue, èy trop beuut*

Je ne peux plus boire, j’ai trop bu','2025-05-08','/x_news_pictures/2025-03-06_13h31m05s_R92balJQ.jpg','','public','active','2025-01-16 16:09:24','2025-03-06 13:36:30');
INSERT INTO "news" ("news_id","news_title","news_content","news_date","news_img_url","news_category","news_public_private","news_status","created_at","modified_at") VALUES (11,'news 51','*Te careras pa d’anèyt, digue ?*

 Tu ne tairas pas d’aujourd’hui, dis ? ','2026-01-31','/x_pictures_events/2025-01-16_16h12m04s_MZe40bkm.pdf','comment','public','active','2025-01-16 16:12:04','2025-03-06 13:36:48');
INSERT INTO "news" ("news_id","news_title","news_content","news_date","news_img_url","news_category","news_public_private","news_status","created_at","modified_at") VALUES (12,'news 52','*I’a pas arré qu’arrangi l’estoumac coume de béue un coun cop a chabrot*

 Il n’y a rien qui fasse autant de bien à l’estomac comme de boire un bon coup de bouillon et de vin ensemble ','2025-02-08','/x_news_pictures/2025-03-06_13h32m41s_ROpK4Flv.jpg','comment','public','active','2025-01-16 16:12:14','2025-03-06 13:37:03');
INSERT INTO "news" ("news_id","news_title","news_content","news_date","news_img_url","news_category","news_public_private","news_status","created_at","modified_at") VALUES (13,'news 53','*Que sap leau lou couet*

 Il sait lever le coude ','2026-01-15','/x_pictures_events/2025-01-16_16h12m33s_mgshl90U.pdf','comment','public','active','2025-01-16 16:12:33','2025-03-06 13:37:20');
INSERT INTO "news" ("news_id","news_title","news_content","news_date","news_img_url","news_category","news_public_private","news_status","created_at","modified_at") VALUES (14,'news 54','*Tantoûlhits pas tan aquere boutelhe*

Ne secouez pas autant cette bouteille','2025-02-07',NULL,'annoncement','public','active','2025-01-16 16:13:17','2025-03-06 13:37:33');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_docs/2025-01-29_13h08m39s_LSa9hCG8.pdf','2025-01-29 13:20:32','2025-01-29 13:20:32');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_docs/2025-01-29_13h23m35s_e1CzQLjr.pdf','2025-01-29 13:23:39','2025-01-29 13:23:39');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_docs/2025-01-29_13h35m57s_EuwwZtMH.pdf','2025-01-29 13:55:06','2025-01-29 13:55:06');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_docs/2025-01-29_13h57m08s_STIp0smZ.pdf','2025-01-29 13:58:03','2025-01-29 13:58:03');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_docs/2025-01-29_13h57m49s_6bv21k2C.pdf','2025-01-29 13:58:03','2025-01-29 13:58:03');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_docs/2025-01-29_13h57m02s_6JCyJseX.pdf','2025-01-29 14:06:26','2025-01-29 14:06:26');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_docs/2025-01-30_14h29m19s_npSrzCJS.pdf','2025-01-30 14:47:31','2025-01-30 14:47:31');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_docs/2025-01-30_14h47m31s_hOHIkgI7.pdf','2025-01-30 14:48:08','2025-01-30 14:48:08');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-01-31 09:45:55','2025-01-31 09:45:55');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-01-31 09:47:35','2025-01-31 09:47:35');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-01-31 09:52:42','2025-01-31 09:52:42');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-01-31 09:52:42','2025-01-31 09:52:42');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-01-31 09:52:43','2025-01-31 09:52:43');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-01-31 09:53:30','2025-01-31 09:53:30');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-01-31 13:09:30','2025-01-31 13:09:30');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-01-31 13:10:36','2025-01-31 13:10:36');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-01-31 13:10:36','2025-01-31 13:10:36');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-01-31 13:10:36','2025-01-31 13:10:36');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-01-31 13:10:36','2025-01-31 13:10:36');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-01-31 13:10:41','2025-01-31 13:10:41');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-01-31 13:10:41','2025-01-31 13:10:41');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-01-31 13:10:41','2025-01-31 13:10:41');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-01-31 13:10:41','2025-01-31 13:10:41');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-01-31 14:42:47','2025-01-31 14:42:47');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-01-31 14:42:47','2025-01-31 14:42:47');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-01-31 14:42:47','2025-01-31 14:42:47');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-01-31 14:42:47','2025-01-31 14:42:47');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-01-31 14:43:02','2025-01-31 14:43:02');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-01-31 14:43:02','2025-01-31 14:43:02');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-01-31 14:43:02','2025-01-31 14:43:02');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-01-31 14:43:03','2025-01-31 14:43:03');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_docs/2025-01-31_15h35m25s_CGKq1kwt.pdf','2025-01-31 15:40:10','2025-01-31 15:40:10');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_docs/2025-01-31_15h30m46s_RlqyDyVk.pdf','2025-01-31 15:41:13','2025-01-31 15:41:13');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_docs/2025-01-31_15h28m06s_dcywIynC.pdf','2025-01-31 17:17:28','2025-01-31 17:17:28');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-01-31 17:18:21','2025-01-31 17:18:21');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_docs/2025-01-31_15h38m06s_Hqp2tn9z.pdf','2025-01-31 17:23:26','2025-01-31 17:23:26');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_docs/2025-01-31_17h07m38s_q3hyCL8R.pdf','2025-01-31 17:31:47','2025-01-31 17:31:47');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-01 11:25:10','2025-02-01 11:25:10');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-01 11:25:34','2025-02-01 11:25:34');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-01 11:25:47','2025-02-01 11:25:47');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-01 11:27:33','2025-02-01 11:27:33');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-01 11:27:41','2025-02-01 11:27:41');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-01 11:28:01','2025-02-01 11:28:01');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-01 11:31:39','2025-02-01 11:31:39');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-01 11:31:51','2025-02-01 11:31:51');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-01 11:32:34','2025-02-01 11:32:34');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-01 11:33:42','2025-02-01 11:33:42');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-01 13:00:07','2025-02-01 13:00:07');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-01 13:00:15','2025-02-01 13:00:15');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-01 13:00:21','2025-02-01 13:00:21');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-01 13:00:29','2025-02-01 13:00:29');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-01 13:00:40','2025-02-01 13:00:40');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-01 13:00:51','2025-02-01 13:00:51');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-01 16:17:39','2025-02-01 16:17:39');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-01 16:18:07','2025-02-01 16:18:07');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-01 16:18:35','2025-02-01 16:18:35');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_docs/2025-02-01_10h59m18s_vGRAHblk.pdf','2025-02-01 16:43:26','2025-02-01 16:43:26');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_docs/2025-02-01_10h55m26s_Kv8wCK8y.pdf','2025-02-01 16:44:39','2025-02-01 16:44:39');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_docs/2025-02-01_10h53m28s_Gn6Mprch.pdf','2025-02-01 16:46:38','2025-02-01 16:46:38');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_docs/2025-01-31_17h04m06s_454bb3uY.pdf','2025-02-01 16:50:02','2025-02-01 16:50:02');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-01 16:55:06','2025-02-01 16:55:06');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-02-03 11:35:31','2025-02-03 11:35:31');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_docs/2025-02-01_16h52m13s_voYyWvxC.pdf','2025-02-03 17:43:47','2025-02-03 17:43:47');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_docs/2025-02-01_16h50m17s_krh5ZywG.pdf','2025-02-03 17:45:05','2025-02-03 17:45:05');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-02-03 18:12:45','2025-02-03 18:12:45');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-02-03 19:41:44','2025-02-03 19:41:44');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-02-03 19:42:17','2025-02-03 19:42:17');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-02-03 19:43:15','2025-02-03 19:43:15');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-02-03 19:44:02','2025-02-03 19:44:02');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-02-04 09:10:47','2025-02-04 09:10:47');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-04 13:10:43','2025-02-04 13:10:43');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-04 13:12:29','2025-02-04 13:12:29');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-04 13:12:56','2025-02-04 13:12:56');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-04 13:13:22','2025-02-04 13:13:22');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-04 13:17:29','2025-02-04 13:17:29');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-04 13:31:25','2025-02-04 13:31:25');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-07 09:16:51','2025-02-07 09:16:51');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-07 09:18:19','2025-02-07 09:18:19');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-07 09:19:58','2025-02-07 09:19:58');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-07 09:20:07','2025-02-07 09:20:07');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-07 09:22:05','2025-02-07 09:22:05');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_docs/2025-02-10_12h54m13s_L8KRnM9S.pdf','2025-02-10 15:41:52','2025-02-10 15:41:52');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-02-11 17:26:55','2025-02-11 17:26:55');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-12 09:12:15','2025-02-12 09:12:15');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-12 09:13:00','2025-02-12 09:13:00');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-12 09:13:18','2025-02-12 09:13:18');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-12 09:14:59','2025-02-12 09:14:59');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-12 09:18:44','2025-02-12 09:18:44');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-12 09:20:32','2025-02-12 09:20:32');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_docs/2025-02-12_09h03m31s_Kfu2ILX2.md','2025-02-12 09:31:17','2025-02-12 09:31:17');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-02-14 12:37:45','2025-02-14 12:37:45');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-02-14 12:37:50','2025-02-14 12:37:50');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-02-14 12:37:55','2025-02-14 12:37:55');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-02-14 12:38:02','2025-02-14 12:38:02');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-17 09:09:08','2025-02-17 09:09:08');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-17 09:09:08','2025-02-17 09:09:08');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-18 11:12:51','2025-02-18 11:12:51');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-18 11:16:17','2025-02-18 11:16:17');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-18 11:17:21','2025-02-18 11:17:21');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-18 11:19:40','2025-02-18 11:19:40');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-02-18 11:19:49','2025-02-18 11:19:49');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-02-18 11:19:49','2025-02-18 11:19:49');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-02-18 11:19:49','2025-02-18 11:19:49');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-02-18 11:19:50','2025-02-18 11:19:50');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-02-18 11:19:54','2025-02-18 11:19:54');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-02-18 11:19:55','2025-02-18 11:19:55');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-02-18 11:19:55','2025-02-18 11:19:55');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-02-18 11:19:55','2025-02-18 11:19:55');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-19 13:55:38','2025-02-19 13:55:38');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_docs/2025-02-19_13h49m20s_v17sCWZq.pdf','2025-02-19 13:56:27','2025-02-19 13:56:27');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-02-19 13:57:53','2025-02-19 13:57:53');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_docs/2025-02-19_13h58m18s_jcbvEtSX.pdf','2025-02-19 13:58:27','2025-02-19 13:58:27');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-19 15:42:24','2025-02-19 15:42:24');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_pictures_spaces/2025-02-19_15h34m24s_7RPQRsAZ.png','2025-02-19 15:42:40','2025-02-19 15:42:40');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_pictures_spaces/2025-02-19_16h27m26s_D2pZhIZP.png','2025-02-19 16:30:02','2025-02-19 16:30:02');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-22 16:30:41','2025-02-22 16:30:41');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-22 16:30:41','2025-02-22 16:30:41');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_docs/2025-02-19_14h09m06s_2C2Uhlk9.pdf','2025-02-27 09:50:39','2025-02-27 09:50:39');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-02-27 09:50:43','2025-02-27 09:50:43');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-02-27 09:50:47','2025-02-27 09:50:47');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-27 09:53:07','2025-02-27 09:53:07');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-02-27 10:01:03','2025-02-27 10:01:03');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-02-27 10:14:20','2025-02-27 10:14:20');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-02-27 10:15:47','2025-02-27 10:15:47');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_docs/2025-02-27_10h17m46s_AmHJeTCu.png','2025-02-27 10:17:53','2025-02-27 10:17:53');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_docs/2025-02-27_10h19m08s_cr3OTP6f.md','2025-02-27 10:24:02','2025-02-27 10:24:02');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_docs/2025-01-29_12h49m26s_uUguofq6.pdf','2025-03-03 14:31:07','2025-03-03 14:31:07');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_docs/2024-12-19_10h42m16s_8jPRmKQk.pdf','2025-03-03 14:31:11','2025-03-03 14:31:11');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_docs/2024-12-19_10h34m15s_X6jJFQTT.pdf','2025-03-03 14:31:15','2025-03-03 14:31:15');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_docs/2024-11-26_17h59m25s_XxrNGJ69.pdf','2025-03-03 14:31:18','2025-03-03 14:31:18');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_docs/2024-11-26_17h59m41s_joZrALtG.pdf','2025-03-03 14:31:22','2025-03-03 14:31:22');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_docs/2024-11-26_18h00m06s_HNJ9nKHC.pdf','2025-03-03 14:31:26','2025-03-03 14:31:26');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_docs/2024-11-26_18h00m46s_HYnX6Etn.pdf','2025-03-03 14:31:30','2025-03-03 14:31:30');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_docs/2025-02-27_09h52m03s_hFLgQ7jR.md','2025-03-03 14:39:08','2025-03-03 14:39:08');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_workdocs/2025-01-17_16h47m36s_Sj4tWbLp.pdf','2025-03-03 14:39:32','2025-03-03 14:39:32');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_workspace_docs/2025-01-17_16h28m11s_Hton0l6t.pdf','2025-03-03 14:39:36','2025-03-03 14:39:36');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-03-03 14:39:39','2025-03-03 14:39:39');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_workspace_docs/2025-01-17_16h23m34s_yUjFXR9W.pdf','2025-03-03 14:39:42','2025-03-03 14:39:42');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_workdocs/2025-01-17_16h19m26s_fwenJz8G.pdf','2025-03-03 14:39:45','2025-03-03 14:39:45');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_workdocs/2025-01-17_16h17m35s_eIgUXizb.pdf','2025-03-03 14:39:48','2025-03-03 14:39:48');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_workdocs/2025-01-17_16h11m30s_XQGhcVqp.pdf','2025-03-03 14:39:50','2025-03-03 14:39:50');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_workspace_docs/2025-01-14_16h54m21s_IDxp3BW4.pdf','2025-03-03 14:39:53','2025-03-03 14:39:53');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_workspace_docs/2025-01-14_16h53m07s_nY8D1e1O.pdf','2025-03-03 14:39:57','2025-03-03 14:39:57');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_workspace_docs/2025-01-14_16h51m45s_p1tHQ6dy.pdf','2025-03-03 14:40:00','2025-03-03 14:40:00');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_workspace_docs/2025-01-14_16h49m31s_FmtJYDEp.pdf','2025-03-03 14:40:03','2025-03-03 14:40:03');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_workspace_docs/2025-01-14_16h25m08s_Aot1rusG.pdf','2025-03-03 14:40:06','2025-03-03 14:40:06');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_workspace_docs/2025-01-14_16h23m14s_ladWaf6x.pdf','2025-03-03 14:40:10','2025-03-03 14:40:10');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_docs/2025-02-04_13h17m19s_IAu7Qn7l.pdf','2025-03-03 14:43:33','2025-03-03 14:43:33');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_docs/2025-02-07_09h24m12s_abfaSRma.pdf','2025-03-03 14:43:37','2025-03-03 14:43:37');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_logos/2025-01-28_13h39m11s_YCyaDjXi.png','2025-03-03 14:47:09','2025-03-03 14:47:09');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_members_pictures/2024-12-19_09h51m07s_5YnVzkbb.jpg','2025-03-03 14:58:40','2025-03-03 14:58:40');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_pictures_persons/2024-12-19_09h04m59s_JXLy6Hfk.jpg','2025-03-03 14:59:00','2025-03-03 14:59:00');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_pictures_persons/2024-12-19_09h04m06s_J4iM3Ane.png','2025-03-03 14:59:32','2025-03-03 14:59:32');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_members_pictures/2024-12-19_09h45m42s_vk1cJHsk.jpg','2025-03-03 14:59:49','2025-03-03 14:59:49');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_pictures_spaces/2025-03-03_15h31m01s_Up1M0vE9.jpg','2025-03-03 15:59:20','2025-03-03 15:59:20');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-03-03 16:07:48','2025-03-03 16:07:48');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_pictures_spaces/2025-02-19_15h42m40s_LKjsUvBn.png','2025-03-03 16:07:56','2025-03-03 16:07:56');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-03-03 16:09:15','2025-03-03 16:09:15');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-03-03 16:10:08','2025-03-03 16:10:08');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-03-03 16:11:53','2025-03-03 16:11:53');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_pictures_spaces/2025-02-19_16h29m54s_9kzcgjhA.png','2025-03-03 16:15:37','2025-03-03 16:15:37');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-03-03 16:27:58','2025-03-03 16:27:58');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_docs/2025-03-06_09h49m37s_OGt44bVs.pdf','2025-03-06 09:52:19','2025-03-06 09:52:19');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_docs/2025-03-06_09h53m24s_ThmeTZlN.pdf','2025-03-06 09:55:32','2025-03-06 09:55:32');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-03-06 10:05:48','2025-03-06 10:05:48');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-03-06 10:39:09','2025-03-06 10:39:09');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-03-06 11:10:43','2025-03-06 11:10:43');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_pictures_spaces/2025-01-28_13h16m07s_52u7XqRP.png','2025-03-06 11:40:13','2025-03-06 11:40:13');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_pictures_spaces/2024-12-11_14h35m08s_n2Lix3TU.png','2025-03-06 11:41:10','2025-03-06 11:41:10');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-03-06 12:34:40','2025-03-06 12:34:40');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-03-06 12:34:51','2025-03-06 12:34:51');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-03-06 12:47:35','2025-03-06 12:47:35');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-03-06 12:47:35','2025-03-06 12:47:35');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_docs/2025-01-16_15h36m21s_qSaGe8lJ.pdf','2025-03-06 12:47:57','2025-03-06 12:47:57');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-03-06 12:47:57','2025-03-06 12:47:57');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-03-06 12:48:32','2025-03-06 12:48:32');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-03-06 12:48:32','2025-03-06 12:48:32');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-03-06 12:58:44','2025-03-06 12:58:44');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-03-06 12:58:44','2025-03-06 12:58:44');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_docs/2024-12-12_10h34m21s_a7onAyjM.png','2025-03-06 12:58:59','2025-03-06 12:58:59');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-03-06 12:58:59','2025-03-06 12:58:59');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_pictures_events/2024-12-30_14h40m15s_gfWfrnAK.png','2025-03-06 13:09:11','2025-03-06 13:09:11');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_pictures_events/2024-12-30_14h49m10s_ZH2N10So.png','2025-03-06 13:09:14','2025-03-06 13:09:14');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-03-06 13:12:33','2025-03-06 13:12:33');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-03-06 13:18:10','2025-03-06 13:18:10');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-03-06 13:18:45','2025-03-06 13:18:45');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-03-06 13:19:14','2025-03-06 13:19:14');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-03-06 13:20:01','2025-03-06 13:20:01');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-03-06 13:22:49','2025-03-06 13:22:49');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-03-06 13:23:32','2025-03-06 13:23:32');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-03-06 13:24:15','2025-03-06 13:24:15');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-03-06 13:24:50','2025-03-06 13:24:50');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-03-06 13:25:21','2025-03-06 13:25:21');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-03-06 13:25:53','2025-03-06 13:25:53');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-03-06 13:26:52','2025-03-06 13:26:52');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-03-06 13:26:56','2025-03-06 13:26:56');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-03-06 13:29:19','2025-03-06 13:29:19');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_pictures_events/2025-01-16_16h09m24s_cqRyMh3D.pdf','2025-03-06 13:31:05','2025-03-06 13:31:05');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('/x_pictures_events/2025-01-16_16h12m14s_IBVHEhxZ.pdf','2025-03-06 13:32:41','2025-03-06 13:32:41');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-03-06 13:33:52','2025-03-06 13:33:52');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-03-06 13:34:23','2025-03-06 13:34:23');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-03-06 13:34:47','2025-03-06 13:34:47');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-03-06 13:35:04','2025-03-06 13:35:04');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-03-06 13:35:20','2025-03-06 13:35:20');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-03-06 13:35:35','2025-03-06 13:35:35');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-03-06 13:35:51','2025-03-06 13:35:51');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-03-06 13:36:16','2025-03-06 13:36:16');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-03-06 13:36:30','2025-03-06 13:36:30');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-03-06 13:36:48','2025-03-06 13:36:48');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-03-06 13:37:03','2025-03-06 13:37:03');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-03-06 13:37:20','2025-03-06 13:37:20');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-03-06 13:37:33','2025-03-06 13:37:33');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-03-06 17:26:37','2025-03-06 17:26:37');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES (NULL,'2025-03-06 17:30:00','2025-03-06 17:30:00');
INSERT INTO "files_to_erase" ("file_url","created_at","modified_at") VALUES ('','2025-03-07 09:26:59','2025-03-07 09:26:59');
INSERT INTO "orga_partners" ("orga_partner_id","orga_id","orga_dept_id","orga_partner_name","orga_partner_acronym","orga_partner_scope","orga_partner_link","orga_partner_logo_url","orga_partner_logo_title","orga_partner_type","orga_partner_category","orga_partner_date_since","orga_partner_status","orga_partner_punchline","orga_partner_summary","orga_partner_selected","created_at","modified_at") VALUES (1,1,1,'LINUX','','software','https://fr.wikipedia.org/wiki/Linux','/x_logos/2025-01-28_13h25m42s_Ik75dKyF.png','logo de   LINUX','partner','','2002-12-03','active','Free and open','','no','2024-12-06 13:29:22','2024-12-06 13:29:22');
INSERT INTO "orga_partners" ("orga_partner_id","orga_id","orga_dept_id","orga_partner_name","orga_partner_acronym","orga_partner_scope","orga_partner_link","orga_partner_logo_url","orga_partner_logo_title","orga_partner_type","orga_partner_category","orga_partner_date_since","orga_partner_status","orga_partner_punchline","orga_partner_summary","orga_partner_selected","created_at","modified_at") VALUES (2,1,1,'SQLPage','','software','https://fr.wikipedia.org/wiki/Linux','/x_logos/2025-01-28_13h26m23s_GyR4XYE8.png','logo de   SQLPage','partner','gold','2002-12-03','yes','from SQL to WWW','','no','2024-12-07 11:06:37','2024-12-07 11:06:37');
INSERT INTO "orga_partners" ("orga_partner_id","orga_id","orga_dept_id","orga_partner_name","orga_partner_acronym","orga_partner_scope","orga_partner_link","orga_partner_logo_url","orga_partner_logo_title","orga_partner_type","orga_partner_category","orga_partner_date_since","orga_partner_status","orga_partner_punchline","orga_partner_summary","orga_partner_selected","created_at","modified_at") VALUES (3,1,1,'SQLITE','','database','https://www.sqlite.org/index.html','/x_logos/2025-01-28_13h26m39s_O7oTKSWj.png','logo de   SQLITE','partner','gold','2024-09-01','yes','A light weight database','','no','2024-12-07 13:23:47','2024-12-07 13:23:47');
INSERT INTO "orga_partners" ("orga_partner_id","orga_id","orga_dept_id","orga_partner_name","orga_partner_acronym","orga_partner_scope","orga_partner_link","orga_partner_logo_url","orga_partner_logo_title","orga_partner_type","orga_partner_category","orga_partner_date_since","orga_partner_status","orga_partner_punchline","orga_partner_summary","orga_partner_selected","created_at","modified_at") VALUES (4,1,1,'DB Browser for SQLite','DB4S','database','https://sqlitebrowser.org/','/x_logos/2025-01-28_13h26m53s_3CNIaVBr.png','logo de   DB Browser for SQLite','partner','silver','2024-09-01','yes','a simple SQLite databases manager','DB Browser for SQLite (DB4S) is a high quality','visual','open source tool designed for people who want to create','search');
INSERT INTO "orga_partners" ("orga_partner_id","orga_id","orga_dept_id","orga_partner_name","orga_partner_acronym","orga_partner_scope","orga_partner_link","orga_partner_logo_url","orga_partner_logo_title","orga_partner_type","orga_partner_category","orga_partner_date_since","orga_partner_status","orga_partner_punchline","orga_partner_summary","orga_partner_selected","created_at","modified_at") VALUES (5,1,1,'VSCodium','','code','https://vscodium.com/','/x_logos/2025-01-28_13h27m12s_monvTOiH.png','logo de   VSCodium','partner','silver','2024-09-01','yes','Free/Libre Open Source Software Binaries of VS Code','The VSCodium project exists so that you don’t have to download+build from source. This project includes special build scripts that clone Microsoft’s vscode repo','run the build commands','and upload the resulting binaries for you to GitHub releases. These binaries are licensed under the MIT license. Telemetry is disabled.','no');
INSERT INTO "orga_partners" ("orga_partner_id","orga_id","orga_dept_id","orga_partner_name","orga_partner_acronym","orga_partner_scope","orga_partner_link","orga_partner_logo_url","orga_partner_logo_title","orga_partner_type","orga_partner_category","orga_partner_date_since","orga_partner_status","orga_partner_punchline","orga_partner_summary","orga_partner_selected","created_at","modified_at") VALUES (6,1,1,'Pandoc','','data conversion','https://pandoc.org/','/x_logos/2025-01-28_13h27m23s_7XFJgsRU.png','logo de   Pandoc','partner','silver','2024-09-01','yes','a universal document converter','If you need to convert files from one markup format into another, pandoc is your swiss-army knife. Pandoc can convert between the following formats:

(← = conversion from; → = conversion to; ↔︎ = conversion from and to)','no','2024-12-07 13:47:14','2024-12-07 13:47:14');
INSERT INTO "orga_partners" ("orga_partner_id","orga_id","orga_dept_id","orga_partner_name","orga_partner_acronym","orga_partner_scope","orga_partner_link","orga_partner_logo_url","orga_partner_logo_title","orga_partner_type","orga_partner_category","orga_partner_date_since","orga_partner_status","orga_partner_punchline","orga_partner_summary","orga_partner_selected","created_at","modified_at") VALUES (7,1,1,'Linux Mint','','os','https://www.linuxmint.com/','/x_logos/2025-01-28_13h27m33s_w9heeLwp.png','logo de   Linux Mint','partner','bronze','2015-01-01','yes','a friendly operating system','Linux Mint is an operating system for desktop and laptop computers. It is designed to work ''out of the box'' and comes fully equipped with the apps most people need.','no','2024-12-07 13:50:07','2024-12-07 13:50:07');
INSERT INTO "orga_partners" ("orga_partner_id","orga_id","orga_dept_id","orga_partner_name","orga_partner_acronym","orga_partner_scope","orga_partner_link","orga_partner_logo_url","orga_partner_logo_title","orga_partner_type","orga_partner_category","orga_partner_date_since","orga_partner_status","orga_partner_punchline","orga_partner_summary","orga_partner_selected","created_at","modified_at") VALUES (8,1,1,'Linkedin','','','https://fr.linkedin.com/in/co-op-0000000000000000000000','/x_logos/2025-01-28_13h27m48s_xDTbvGw5.png','logo de   Linkedin','social_network','','','yes','','','no','2024-12-08 09:50:44','2024-12-08 09:50:44');
INSERT INTO "orga_partners" ("orga_partner_id","orga_id","orga_dept_id","orga_partner_name","orga_partner_acronym","orga_partner_scope","orga_partner_link","orga_partner_logo_url","orga_partner_logo_title","orga_partner_type","orga_partner_category","orga_partner_date_since","orga_partner_status","orga_partner_punchline","orga_partner_summary","orga_partner_selected","created_at","modified_at") VALUES (9,1,1,'You Tube','','','https://www.youtube.com/c/COOP00000000000000','/x_logos/2025-01-28_13h28m00s_rLTLwQv6.png','logo de   You Tube','social_network','','','yes','','','no','2024-12-08 10:00:18','2024-12-08 10:00:18');
INSERT INTO "orga_partners" ("orga_partner_id","orga_id","orga_dept_id","orga_partner_name","orga_partner_acronym","orga_partner_scope","orga_partner_link","orga_partner_logo_url","orga_partner_logo_title","orga_partner_type","orga_partner_category","orga_partner_date_since","orga_partner_status","orga_partner_punchline","orga_partner_summary","orga_partner_selected","created_at","modified_at") VALUES (10,1,1,'Peertube','','','https://peertube.fr/','/x_logos/2025-01-28_13h28m11s_hCvDrENA.png','logo de   Peertube','social_network','','','yes','','','no','2024-12-08 10:01:40','2024-12-08 10:01:40');
INSERT INTO "orga_partners" ("orga_partner_id","orga_id","orga_dept_id","orga_partner_name","orga_partner_acronym","orga_partner_scope","orga_partner_link","orga_partner_logo_url","orga_partner_logo_title","orga_partner_type","orga_partner_category","orga_partner_date_since","orga_partner_status","orga_partner_punchline","orga_partner_summary","orga_partner_selected","created_at","modified_at") VALUES (11,1,1,'Mastodon','','','https://joinmastodon.org/fr','/x_logos/2025-01-28_13h28m21s_OhvNwuih.png','logo de   Mastodon','social_network','','','yes','','','no','2024-12-08 10:03:03','2024-12-08 10:03:03');
INSERT INTO "orga_partners" ("orga_partner_id","orga_id","orga_dept_id","orga_partner_name","orga_partner_acronym","orga_partner_scope","orga_partner_link","orga_partner_logo_url","orga_partner_logo_title","orga_partner_type","orga_partner_category","orga_partner_date_since","orga_partner_status","orga_partner_punchline","orga_partner_summary","orga_partner_selected","created_at","modified_at") VALUES (12,1,1,'Facebook','','','https://fr-fr.facebook.com/','/x_logos/2025-01-28_13h28m42s_OFbW4onO.png','logo de   Facebook','social_network','','','no','','','no','2024-12-08 10:04:28','2024-12-08 10:04:28');
INSERT INTO "orga_partners" ("orga_partner_id","orga_id","orga_dept_id","orga_partner_name","orga_partner_acronym","orga_partner_scope","orga_partner_link","orga_partner_logo_url","orga_partner_logo_title","orga_partner_type","orga_partner_category","orga_partner_date_since","orga_partner_status","orga_partner_punchline","orga_partner_summary","orga_partner_selected","created_at","modified_at") VALUES (13,1,1,'X','','','https://x.com/__x','/x_logos/2025-01-28_13h29m17s_dMqKpPP7.png','logo de   X','social_network','','','yes','','','no','2024-12-08 10:05:40','2024-12-08 10:05:40');
INSERT INTO "orga_partners" ("orga_partner_id","orga_id","orga_dept_id","orga_partner_name","orga_partner_acronym","orga_partner_scope","orga_partner_link","orga_partner_logo_url","orga_partner_logo_title","orga_partner_type","orga_partner_category","orga_partner_date_since","orga_partner_status","orga_partner_punchline","orga_partner_summary","orga_partner_selected","created_at","modified_at") VALUES (14,1,1,'Instagram','','','https://www.instagram.com/','/x_logos/2025-01-28_13h29m29s_c7o2n9h3.png','logo de   Instagram','social_network','','','yes','','','no','2024-12-08 10:08:35','2024-12-08 10:08:35');
INSERT INTO "orga_partners" ("orga_partner_id","orga_id","orga_dept_id","orga_partner_name","orga_partner_acronym","orga_partner_scope","orga_partner_link","orga_partner_logo_url","orga_partner_logo_title","orga_partner_type","orga_partner_category","orga_partner_date_since","orga_partner_status","orga_partner_punchline","orga_partner_summary","orga_partner_selected","created_at","modified_at") VALUES (15,1,1,'TikTok','','','https://www.tiktok.com/fr/','/x_logos/2025-01-28_13h29m41s_WdyYqhJK.png','logo de   TikTok','social_network','','','yes','','','no','2024-12-08 10:10:17','2024-12-08 10:10:17');
INSERT INTO "orga_partners" ("orga_partner_id","orga_id","orga_dept_id","orga_partner_name","orga_partner_acronym","orga_partner_scope","orga_partner_link","orga_partner_logo_url","orga_partner_logo_title","orga_partner_type","orga_partner_category","orga_partner_date_since","orga_partner_status","orga_partner_punchline","orga_partner_summary","orga_partner_selected","created_at","modified_at") VALUES (16,1,1,'WhatsApp','','','https://web.whatsapp.com/','/x_logos/2025-01-28_13h29m53s_JbqtIOHU.png','logo de   WhatsApp','social_network','','','yes','','','no','2024-12-08 10:11:46','2024-12-08 10:11:46');
INSERT INTO "orga_partners" ("orga_partner_id","orga_id","orga_dept_id","orga_partner_name","orga_partner_acronym","orga_partner_scope","orga_partner_link","orga_partner_logo_url","orga_partner_logo_title","orga_partner_type","orga_partner_category","orga_partner_date_since","orga_partner_status","orga_partner_punchline","orga_partner_summary","orga_partner_selected","created_at","modified_at") VALUES (17,1,1,'Discord','','','https://discord.com/','/x_logos/2025-01-28_13h30m05s_9gmXyNrT.png','logo de   Discord','social_network','','','yes','','','no','2024-12-08 10:14:25','2024-12-08 10:14:25');
INSERT INTO "orga_partners" ("orga_partner_id","orga_id","orga_dept_id","orga_partner_name","orga_partner_acronym","orga_partner_scope","orga_partner_link","orga_partner_logo_url","orga_partner_logo_title","orga_partner_type","orga_partner_category","orga_partner_date_since","orga_partner_status","orga_partner_punchline","orga_partner_summary","orga_partner_selected","created_at","modified_at") VALUES (18,1,1,'Twitch','','','https://www.twitch.tv/','/x_logos/2025-01-28_13h30m18s_XWXlLnhT.png','logo de   Twitch','social_network','','','yes','','','no','2024-12-08 10:15:50','2024-12-08 10:15:50');
INSERT INTO "orga_partners" ("orga_partner_id","orga_id","orga_dept_id","orga_partner_name","orga_partner_acronym","orga_partner_scope","orga_partner_link","orga_partner_logo_url","orga_partner_logo_title","orga_partner_type","orga_partner_category","orga_partner_date_since","orga_partner_status","orga_partner_punchline","orga_partner_summary","orga_partner_selected","created_at","modified_at") VALUES (19,1,1,'Reddit','','','https://www.reddit.com/','/x_logos/2025-01-28_13h30m30s_cooo41G4.png','logo de   Reddit','social_network','','','yes','','','no','2024-12-08 10:19:30','2024-12-08 10:19:30');
INSERT INTO "orga_partners" ("orga_partner_id","orga_id","orga_dept_id","orga_partner_name","orga_partner_acronym","orga_partner_scope","orga_partner_link","orga_partner_logo_url","orga_partner_logo_title","orga_partner_type","orga_partner_category","orga_partner_date_since","orga_partner_status","orga_partner_punchline","orga_partner_summary","orga_partner_selected","created_at","modified_at") VALUES (20,1,1,'Pinrest','','','https://fr.pinterest.com/','/x_logos/2025-01-28_13h30m42s_kvTmKmkG.png','logo de   Pinrest','social_network','','','yes','','','no','2024-12-08 10:21:34','2024-12-08 10:21:34');
INSERT INTO "orga_partners" ("orga_partner_id","orga_id","orga_dept_id","orga_partner_name","orga_partner_acronym","orga_partner_scope","orga_partner_link","orga_partner_logo_url","orga_partner_logo_title","orga_partner_type","orga_partner_category","orga_partner_date_since","orga_partner_status","orga_partner_punchline","orga_partner_summary","orga_partner_selected","created_at","modified_at") VALUES (21,1,1,'Instructables','','','https://www.instructables.com/projects','/x_logos/2025-01-28_13h30m53s_kky7mKlr.png','logo de   Instructables','social_network','','','yes','','','no','2024-12-08 10:24:17','2024-12-08 10:24:17');
INSERT INTO "users" ("user_id","username","password_hash","user_gender","user_first_name","user_last_name","user_email","user_phone","user_short_cv","user_role","user_lang","user_level","user_group","rgpd_validation","user_selected","user_status","created_at","modified_at") VALUES (3,'editor1','$argon2id$v=19$m=19456,t=2,p=1$/w6UtYcG8eoLWX5hneaZ5g$HnGCH4RHIuD9+IuLGksFBlGpo/CI30xNaulhmrDx7pA','F','Barbara ','Strozzi ','editor1@coopcoop.net','','éditrice','editor','','L0','G1','yes','no','active','2024-10-18 08:20:51','2025-01-23 10:54:18');
INSERT INTO "users" ("user_id","username","password_hash","user_gender","user_first_name","user_last_name","user_email","user_phone","user_short_cv","user_role","user_lang","user_level","user_group","rgpd_validation","user_selected","user_status","created_at","modified_at") VALUES (5,'viewer1','$argon2id$v=19$m=19456,t=2,p=1$l1oRFKn9dfSNdFTuPPlx7A$hH6FzXlSjFlBhu/OXkmmkCK5FXT9bofcY4vNG2bhUSQ','M','John','Doe','viewer1@coopcoop.net','+(33)70000000','simple amateur','viewer','FR','L0','G1','yes','no','active','2024-10-18 11:54:22','2025-01-22 14:51:52');
INSERT INTO "users" ("user_id","username","password_hash","user_gender","user_first_name","user_last_name","user_email","user_phone","user_short_cv","user_role","user_lang","user_level","user_group","rgpd_validation","user_selected","user_status","created_at","modified_at") VALUES (17,'admin1','$argon2id$v=19$m=19456,t=2,p=1$5IxmNS7NlJuxNNXrU8J0AQ$kod8mYiUSRjQE4uQc2Eqknwe3D49gAkVNvtcJnZq8R8','M','Matteo','Palotta','admin1@coopcoop.net','+(33) 7 00 00 00 00','admin !','admin','FR','L0','G0','yes','no','active','2024-11-16 18:21:53','2025-01-23 10:19:06');
INSERT INTO "users" ("user_id","username","password_hash","user_gender","user_first_name","user_last_name","user_email","user_phone","user_short_cv","user_role","user_lang","user_level","user_group","rgpd_validation","user_selected","user_status","created_at","modified_at") VALUES (19,'supervisor1','$argon2id$v=19$m=19456,t=2,p=1$7PI25qCNni/MP+/rOtQHnw$8eUg5TEYQ6eyoLmwyFH8rktsnn+O6xdCFrtiLRhj1Lg','M','Domenico ','Sarro','supervisor1@coopcoop.net','+(33) 7 00 00 00 00','supeviseur','supervisor','FR','L0','G0','yes','no','active','2024-11-18 08:11:41','2025-01-23 10:17:04');
INSERT INTO "users" ("user_id","username","password_hash","user_gender","user_first_name","user_last_name","user_email","user_phone","user_short_cv","user_role","user_lang","user_level","user_group","rgpd_validation","user_selected","user_status","created_at","modified_at") VALUES (21,'editor3','$argon2id$v=19$m=19456,t=2,p=1$Z3dhRCYQwn4a5jI8UtLaoA$cI64ESxquE7c/kxDu8UeMJxnIkOMbJRyFa90J2aJ10k','M','editor3','editor3','editor3@coopcoop.net','0000000000','editor3','editor','FR','L0','G0','yes','no','active','2025-01-10 14:21:15','2025-03-03 13:28:58');
INSERT INTO "users" ("user_id","username","password_hash","user_gender","user_first_name","user_last_name","user_email","user_phone","user_short_cv","user_role","user_lang","user_level","user_group","rgpd_validation","user_selected","user_status","created_at","modified_at") VALUES (22,'viewer2','$argon2id$v=19$m=19456,t=2,p=1$3bUshwr2YOWWz5BhUMkcwg$yh7cDsC7wXwiUx9i76w7bF6nRVx/Log+40EkedOxKBU','M','Michael ','Praetorius ','viewer2@coopcoop.net','+33 600000000','compositeur de musique baroque',NULL,'FR','L0','G0','yes','no','active','2025-01-22 17:53:00','2025-01-22 17:53:00');
INSERT INTO "users" ("user_id","username","password_hash","user_gender","user_first_name","user_last_name","user_email","user_phone","user_short_cv","user_role","user_lang","user_level","user_group","rgpd_validation","user_selected","user_status","created_at","modified_at") VALUES (23,'viewer3','$argon2id$v=19$m=19456,t=2,p=1$Ufg/E3bgX3fB2XbbfE5kGw$O4kY6zLEhUHXEO0qT1uQ6xtSlLuBnDHEzzP8ksbggII','F','Johann ','Pachelbel','viewer3@coopcoop.net','+33 600000000','un autre compositeur allemand',NULL,'FR','L0','G0','yes','no','active','2025-01-22 17:55:12','2025-01-22 17:55:12');
INSERT INTO "users" ("user_id","username","password_hash","user_gender","user_first_name","user_last_name","user_email","user_phone","user_short_cv","user_role","user_lang","user_level","user_group","rgpd_validation","user_selected","user_status","created_at","modified_at") VALUES (24,'supervisor2','$argon2id$v=19$m=19456,t=2,p=1$mQyrsmdzYsD2KrUGldJ1MA$snlg0FZ/7DHCFBfjVJrkRDkhHABbRawslaLvUCV+8PM','M','Isabella','Leonarda ','supervisor2@coopcoop.net','+33 6','compositrice musique baroque',NULL,'FR','L0','G0','yes','no','active','2025-01-23 10:10:06','2025-01-23 10:10:06');
INSERT INTO "users" ("user_id","username","password_hash","user_gender","user_first_name","user_last_name","user_email","user_phone","user_short_cv","user_role","user_lang","user_level","user_group","rgpd_validation","user_selected","user_status","created_at","modified_at") VALUES (25,'supervisor3','$argon2id$v=19$m=19456,t=2,p=1$CHDZ4T3FraDTZYuAV8xrcw$rqFGi8+jPAZv1d/PYud1DIixaoJzgTqr59xHDYpKNwU','M','Cristofaro','Caresana ','supervisor3@coopcoop.net','+33 6000000000','compositeur musique baroque',NULL,'FR','L0','G0','yes','no','active','2025-01-23 10:13:47','2025-01-23 10:13:47');
INSERT INTO "users" ("user_id","username","password_hash","user_gender","user_first_name","user_last_name","user_email","user_phone","user_short_cv","user_role","user_lang","user_level","user_group","rgpd_validation","user_selected","user_status","created_at","modified_at") VALUES (26,'admin2','$argon2id$v=19$m=19456,t=2,p=1$zlW9KnL6tWNqCsCMV/orqw$CVoBJEh8crcCZ3xJ1rU7pE7MYqvsa8NBrEu923kNiYg','M','Vandini','Antonio','admin2@coopcoop.net','+33 6000000000','nouvel admin',NULL,'FR','L0','G0','yes','no','active','2025-01-23 10:20:37','2025-01-23 10:20:37');
INSERT INTO "users" ("user_id","username","password_hash","user_gender","user_first_name","user_last_name","user_email","user_phone","user_short_cv","user_role","user_lang","user_level","user_group","rgpd_validation","user_selected","user_status","created_at","modified_at") VALUES (27,'admin3','$argon2id$v=19$m=19456,t=2,p=1$w8BZOYPK0w3zCc9FZi6dMw$NRObWwESvFAJRsvMC9d84rHk4nS9HR0P8QQMKT1Yiwg','F','Maria Margherita',' Grimani ','admin3@coopcoop.net','+33 6000000000','administratice',NULL,'FR','L0','G0','yes','no','active','2025-01-23 10:22:20','2025-01-23 10:22:20');
INSERT INTO "users" ("user_id","username","password_hash","user_gender","user_first_name","user_last_name","user_email","user_phone","user_short_cv","user_role","user_lang","user_level","user_group","rgpd_validation","user_selected","user_status","created_at","modified_at") VALUES (28,'editor2','$argon2id$v=19$m=19456,t=2,p=1$thZGZyFGddbDXfSX6ZFhKA$AWVXmydRFuKX7LRE6xiaV/9Pdlmf/uJimGvHnyFzrwo','M','Baldassare ','Galuppi ','editor2@coopcoop.net','+33 6000000000','editeur','editor','FR','L0','G0','yes','no','inactive','2025-01-23 10:24:24','2025-01-23 11:14:59');
INSERT INTO "prm2" ("prm2_id","prm2_name","prm2_acronym","prm2_logo_url","prm2_punchline","prm2_summary","prm2_adress","prm2_postal_code","prm2_town","prm2_country","prm2_latitude","prm2_longitude","prm2_contact_phone","prm2_contact_mail","prm2_status","prm2_legal_status","prm2_no_rna","prm2_no_siren","prm2_no_siret","prm2_no_tva_intracom","prm2_code_naf_ape","prm2_date_creation","prm2_number_employees","prm2_selected","modified_at","created_at") VALUES (1,'La Compagnie XXL','',NULL,'','','','','','','','','','','active','','','','','','','','','no','2025-02-04 13:10:43','2025-01-31 09:53:12');
INSERT INTO "prm2" ("prm2_id","prm2_name","prm2_acronym","prm2_logo_url","prm2_punchline","prm2_summary","prm2_adress","prm2_postal_code","prm2_town","prm2_country","prm2_latitude","prm2_longitude","prm2_contact_phone","prm2_contact_mail","prm2_status","prm2_legal_status","prm2_no_rna","prm2_no_siren","prm2_no_siret","prm2_no_tva_intracom","prm2_code_naf_ape","prm2_date_creation","prm2_number_employees","prm2_selected","modified_at","created_at") VALUES (2,'dsds','',NULL,'','','','','','','','','','',NULL,'','','','','','','','','no','2025-01-31 13:24:36','2025-01-31 13:24:36');
INSERT INTO "prm1" ("prm1_id","prm1_gender","prm1_first_name","prm1_last_name","prm1_phone","prm1_email","prm1_category","prm1_function","prm1_date_birthday","prm1_cv_short","prm1_cv_long","prm1_selected","prm1_status","created_at","modified_at") VALUES (5,'F','Pierrette','Durande','000000','durant.pierrette@nowhere.com','cat2','','','','','yes','active','2025-02-02 18:43:30','2025-03-07 09:23:20');
INSERT INTO "prm1" ("prm1_id","prm1_gender","prm1_first_name","prm1_last_name","prm1_phone","prm1_email","prm1_category","prm1_function","prm1_date_birthday","prm1_cv_short","prm1_cv_long","prm1_selected","prm1_status","created_at","modified_at") VALUES (6,'F','Thomas','Thomas','000000','thomas.thomas@nowhere.com','cat2','','','','','yes','active','2025-02-02 18:45:14','2025-03-06 17:25:57');
INSERT INTO "prm1" ("prm1_id","prm1_gender","prm1_first_name","prm1_last_name","prm1_phone","prm1_email","prm1_category","prm1_function","prm1_date_birthday","prm1_cv_short","prm1_cv_long","prm1_selected","prm1_status","created_at","modified_at") VALUES (7,'F','Raoul','Maurice','000000','raoul.maurice@nowhere.com','cat2','','','','','yes','active','2025-02-02 18:46:21','2025-03-06 17:26:25');
INSERT INTO "prm1" ("prm1_id","prm1_gender","prm1_first_name","prm1_last_name","prm1_phone","prm1_email","prm1_category","prm1_function","prm1_date_birthday","prm1_cv_short","prm1_cv_long","prm1_selected","prm1_status","created_at","modified_at") VALUES (9,'F','François','Premier','000000','francois.premier@nowhere.com','cat2','','','','','yes','active','2025-02-02 18:48:48','2025-03-06 17:27:15');
INSERT INTO "prm1" ("prm1_id","prm1_gender","prm1_first_name","prm1_last_name","prm1_phone","prm1_email","prm1_category","prm1_function","prm1_date_birthday","prm1_cv_short","prm1_cv_long","prm1_selected","prm1_status","created_at","modified_at") VALUES (11,'F','Charles','Quint','000000','charles.quint@nowhere.com','cat2','','','','','yes','active','2025-02-02 18:52:41','2025-03-06 17:27:40');
INSERT INTO "prm1" ("prm1_id","prm1_gender","prm1_first_name","prm1_last_name","prm1_phone","prm1_email","prm1_category","prm1_function","prm1_date_birthday","prm1_cv_short","prm1_cv_long","prm1_selected","prm1_status","created_at","modified_at") VALUES (12,'F','Louis','Quatorze','000000','louis.quatorze@nowhere.com','cat2','','','','','yes','active','2025-02-02 18:54:14','2025-03-06 17:28:15');
INSERT INTO "prm1" ("prm1_id","prm1_gender","prm1_first_name","prm1_last_name","prm1_phone","prm1_email","prm1_category","prm1_function","prm1_date_birthday","prm1_cv_short","prm1_cv_long","prm1_selected","prm1_status","created_at","modified_at") VALUES (13,'F','Jenny','Fer','000000','jenny.fer@nowhere.com','cat2','','','','','yes','active','2025-02-02 18:55:19','2025-03-06 17:29:05');
INSERT INTO "prm1" ("prm1_id","prm1_gender","prm1_first_name","prm1_last_name","prm1_phone","prm1_email","prm1_category","prm1_function","prm1_date_birthday","prm1_cv_short","prm1_cv_long","prm1_selected","prm1_status","created_at","modified_at") VALUES (14,'F','Mirabelle','Kiwi','000000','mirabel.kiwi@nowhere.com','cat2','','','','','yes','active','2025-02-04 09:24:59','2025-03-06 17:29:48');
INSERT INTO "prm1" ("prm1_id","prm1_gender","prm1_first_name","prm1_last_name","prm1_phone","prm1_email","prm1_category","prm1_function","prm1_date_birthday","prm1_cv_short","prm1_cv_long","prm1_selected","prm1_status","created_at","modified_at") VALUES (16,'M','Jean-Paul','Dupont','+33 7 00000000','Jean.dupont@coopcoop.net',NULL,NULL,'','','','yes','active','2025-02-04 15:41:33','2025-02-26 16:02:05');
INSERT INTO "prm1" ("prm1_id","prm1_gender","prm1_first_name","prm1_last_name","prm1_phone","prm1_email","prm1_category","prm1_function","prm1_date_birthday","prm1_cv_short","prm1_cv_long","prm1_selected","prm1_status","created_at","modified_at") VALUES (17,'M','Max','Pondu','+33 7 00000000','max.pondu@coopcoop.net','prm1_cat1','','','','','yes','active','2025-02-04 15:41:49','2025-03-06 17:22:01');
INSERT INTO "prm1" ("prm1_id","prm1_gender","prm1_first_name","prm1_last_name","prm1_phone","prm1_email","prm1_category","prm1_function","prm1_date_birthday","prm1_cv_short","prm1_cv_long","prm1_selected","prm1_status","created_at","modified_at") VALUES (18,'M','Jim','My','+33 7 00000000','jim.my@coopcoop.net',NULL,'','','','','yes','active','2025-02-04 15:42:23','2025-03-06 17:22:28');
INSERT INTO "prm1" ("prm1_id","prm1_gender","prm1_first_name","prm1_last_name","prm1_phone","prm1_email","prm1_category","prm1_function","prm1_date_birthday","prm1_cv_short","prm1_cv_long","prm1_selected","prm1_status","created_at","modified_at") VALUES (19,'M','Paul','Pierre','+33 7 00000000','paul.pierre@coopcoop.net',NULL,'','','','','yes','active','2025-02-04 15:49:28','2025-03-06 17:23:03');
INSERT INTO "prm1" ("prm1_id","prm1_gender","prm1_first_name","prm1_last_name","prm1_phone","prm1_email","prm1_category","prm1_function","prm1_date_birthday","prm1_cv_short","prm1_cv_long","prm1_selected","prm1_status","created_at","modified_at") VALUES (20,'F','marie','marie','+33 7 00000000','marie.marie@coopcoop.net',NULL,'','','','','yes','active','2025-02-04 15:50:07','2025-03-06 17:24:13');
INSERT INTO "prm1" ("prm1_id","prm1_gender","prm1_first_name","prm1_last_name","prm1_phone","prm1_email","prm1_category","prm1_function","prm1_date_birthday","prm1_cv_short","prm1_cv_long","prm1_selected","prm1_status","created_at","modified_at") VALUES (21,'F','Jeanne','Jeanne','+33 7 00000000','jeanne.jeanne@coopcoop.net',NULL,'','','','','yes','active','2025-02-05 08:53:41','2025-03-06 17:23:59');
INSERT INTO "prm1" ("prm1_id","prm1_gender","prm1_first_name","prm1_last_name","prm1_phone","prm1_email","prm1_category","prm1_function","prm1_date_birthday","prm1_cv_short","prm1_cv_long","prm1_selected","prm1_status","created_at","modified_at") VALUES (22,'M','Georges','Georges','+33 7 00000000','georges.georges@coopcoop.net',NULL,'','','','','yes','active','2025-02-05 08:54:55','2025-03-06 17:24:49');
INSERT INTO "prm1" ("prm1_id","prm1_gender","prm1_first_name","prm1_last_name","prm1_phone","prm1_email","prm1_category","prm1_function","prm1_date_birthday","prm1_cv_short","prm1_cv_long","prm1_selected","prm1_status","created_at","modified_at") VALUES (23,'F','Alexandrie','Alexandra','+33 7 00000000','alexandrie.alexandra@coopcoop.net',NULL,'','','','','yes','active','2025-02-05 08:58:57','2025-03-06 17:25:25');
INSERT INTO "prm1" ("prm1_id","prm1_gender","prm1_first_name","prm1_last_name","prm1_phone","prm1_email","prm1_category","prm1_function","prm1_date_birthday","prm1_cv_short","prm1_cv_long","prm1_selected","prm1_status","created_at","modified_at") VALUES (113,'','dsdsdsds','fffdfdfdfdfddsds','+33 6','lucie.intheskdsdsy@sdds.sd','','','','','','no','active','2025-03-06 18:17:24','2025-03-06 18:17:24');
INSERT INTO "prm1" ("prm1_id","prm1_gender","prm1_first_name","prm1_last_name","prm1_phone","prm1_email","prm1_category","prm1_function","prm1_date_birthday","prm1_cv_short","prm1_cv_long","prm1_selected","prm1_status","created_at","modified_at") VALUES (114,'M','Lucas','Skywalker','+33 6','lucas@skywalker.ee','','','','','','no','active','2025-03-07 08:06:18','2025-03-07 09:25:57');
INSERT INTO "orga_dept" ("orga_dept_id","orga_dept_name","orga_id","orga_dept_acronym","orga_dept_logo_url","orga_dept_punchline","orga_dept_summary","orga_dept_adress","orga_dept_postal_code","orga_dept_town","orga_dept_country","orga_dept_latitude","orga_dept_longitude","orga_dept_contact_phone","orga_dept_contact_mail","orga_dept_date_creation","orga_dept_rank","orga_dept_status","orga_dept_legal_status","orga_dept_number_employees","orga_dept_no_rna","orga_dept_no_siren","orga_dept_no_siret","orga_dept_code_naf_ape","orga_dept_no_tva_intracom","orga_dept_selected","modified_at","created_at") VALUES (1,'CO-OP',1,'','/x_logos/2025-03-03_14h47m09s_eXWx45RY.png','','','','','','','','','+33 6 00000000','coop@coopxxx.fr','2024-09-01','main','active','','','','',1467798393,'','',NULL,'2025-03-06 10:05:48',NULL);
INSERT INTO "orga_dept" ("orga_dept_id","orga_dept_name","orga_id","orga_dept_acronym","orga_dept_logo_url","orga_dept_punchline","orga_dept_summary","orga_dept_adress","orga_dept_postal_code","orga_dept_town","orga_dept_country","orga_dept_latitude","orga_dept_longitude","orga_dept_contact_phone","orga_dept_contact_mail","orga_dept_date_creation","orga_dept_rank","orga_dept_status","orga_dept_legal_status","orga_dept_number_employees","orga_dept_no_rna","orga_dept_no_siren","orga_dept_no_siret","orga_dept_code_naf_ape","orga_dept_no_tva_intracom","orga_dept_selected","modified_at","created_at") VALUES (2,'les indes de l''ouest',2,'','','','','','','Pondichery','','','','','','','main','active',NULL,'','','','','',NULL,NULL,'2024-12-19 13:29:52','2024-11-21 15:04:26');
INSERT INTO "orga_dept" ("orga_dept_id","orga_dept_name","orga_id","orga_dept_acronym","orga_dept_logo_url","orga_dept_punchline","orga_dept_summary","orga_dept_adress","orga_dept_postal_code","orga_dept_town","orga_dept_country","orga_dept_latitude","orga_dept_longitude","orga_dept_contact_phone","orga_dept_contact_mail","orga_dept_date_creation","orga_dept_rank","orga_dept_status","orga_dept_legal_status","orga_dept_number_employees","orga_dept_no_rna","orga_dept_no_siren","orga_dept_no_siret","orga_dept_code_naf_ape","orga_dept_no_tva_intracom","orga_dept_selected","modified_at","created_at") VALUES (3,'les indes de l''est',2,'','','','','','','bombay','','','','','','','dept','active',NULL,'','','','','',NULL,NULL,'2024-12-19 13:21:05','2024-11-25 09:21:07');
INSERT INTO "orga_dept" ("orga_dept_id","orga_dept_name","orga_id","orga_dept_acronym","orga_dept_logo_url","orga_dept_punchline","orga_dept_summary","orga_dept_adress","orga_dept_postal_code","orga_dept_town","orga_dept_country","orga_dept_latitude","orga_dept_longitude","orga_dept_contact_phone","orga_dept_contact_mail","orga_dept_date_creation","orga_dept_rank","orga_dept_status","orga_dept_legal_status","orga_dept_number_employees","orga_dept_no_rna","orga_dept_no_siren","orga_dept_no_siret","orga_dept_code_naf_ape","orga_dept_no_tva_intracom","orga_dept_selected","modified_at","created_at") VALUES (5,'les indes du sud',2,'','','','','','','bombay','','','','','','','dept','active',NULL,'','','','','',NULL,NULL,'2024-12-19 13:30:18','2024-11-25 09:24:25');
INSERT INTO "orga_dept" ("orga_dept_id","orga_dept_name","orga_id","orga_dept_acronym","orga_dept_logo_url","orga_dept_punchline","orga_dept_summary","orga_dept_adress","orga_dept_postal_code","orga_dept_town","orga_dept_country","orga_dept_latitude","orga_dept_longitude","orga_dept_contact_phone","orga_dept_contact_mail","orga_dept_date_creation","orga_dept_rank","orga_dept_status","orga_dept_legal_status","orga_dept_number_employees","orga_dept_no_rna","orga_dept_no_siren","orga_dept_no_siret","orga_dept_code_naf_ape","orga_dept_no_tva_intracom","orga_dept_selected","modified_at","created_at") VALUES (19,'La petite annexe',3,'',NULL,'','','','','','','','','','','','main','active','','','','','','','',NULL,NULL,NULL);
INSERT INTO "orga_dept" ("orga_dept_id","orga_dept_name","orga_id","orga_dept_acronym","orga_dept_logo_url","orga_dept_punchline","orga_dept_summary","orga_dept_adress","orga_dept_postal_code","orga_dept_town","orga_dept_country","orga_dept_latitude","orga_dept_longitude","orga_dept_contact_phone","orga_dept_contact_mail","orga_dept_date_creation","orga_dept_rank","orga_dept_status","orga_dept_legal_status","orga_dept_number_employees","orga_dept_no_rna","orga_dept_no_siren","orga_dept_no_siret","orga_dept_code_naf_ape","orga_dept_no_tva_intracom","orga_dept_selected","modified_at","created_at") VALUES (20,'test',NULL,'',NULL,'','','','','','','','','','','','main','active','','','','','','','','no','2025-01-31 13:10:16','2025-01-31 13:10:16');
INSERT INTO "orga_dept" ("orga_dept_id","orga_dept_name","orga_id","orga_dept_acronym","orga_dept_logo_url","orga_dept_punchline","orga_dept_summary","orga_dept_adress","orga_dept_postal_code","orga_dept_town","orga_dept_country","orga_dept_latitude","orga_dept_longitude","orga_dept_contact_phone","orga_dept_contact_mail","orga_dept_date_creation","orga_dept_rank","orga_dept_status","orga_dept_legal_status","orga_dept_number_employees","orga_dept_no_rna","orga_dept_no_siren","orga_dept_no_siret","orga_dept_code_naf_ape","orga_dept_no_tva_intracom","orga_dept_selected","modified_at","created_at") VALUES (21,'test',NULL,'',NULL,'','','','','','','','','','','','main','active','','','','','','','','no','2025-01-31 13:10:53','2025-01-31 13:10:53');
INSERT INTO "prm3_participants" ("prm3_participant_id","prm3_id","prm1_id","prm2_sub_id","employee_id","prm3_participant_role","prm3_participant_type","prm3_participant_status","created_at","modified_at") VALUES (2,2,5,1,NULL,'finance','employee','archived','2025-02-12 13:53:13','2025-02-13 13:24:50');
INSERT INTO "prm3_participants" ("prm3_participant_id","prm3_id","prm1_id","prm2_sub_id","employee_id","prm3_participant_role","prm3_participant_type","prm3_participant_status","created_at","modified_at") VALUES (3,2,5,'',NULL,'commercial','person','archived','2025-02-12 15:04:48','2025-02-13 14:09:14');
INSERT INTO "prm3_participants" ("prm3_participant_id","prm3_id","prm1_id","prm2_sub_id","employee_id","prm3_participant_role","prm3_participant_type","prm3_participant_status","created_at","modified_at") VALUES (7,2,20,3,NULL,'legal','employee','archived','2025-02-12 16:52:40','2025-02-13 14:09:29');
INSERT INTO "prm3_participants" ("prm3_participant_id","prm3_id","prm1_id","prm2_sub_id","employee_id","prm3_participant_role","prm3_participant_type","prm3_participant_status","created_at","modified_at") VALUES (8,2,NULL,3,NULL,'coordinator','corporate','active','2025-02-12 16:56:09','2025-02-12 16:56:09');
INSERT INTO "prm3_participants" ("prm3_participant_id","prm3_id","prm1_id","prm2_sub_id","employee_id","prm3_participant_role","prm3_participant_type","prm3_participant_status","created_at","modified_at") VALUES (9,2,NULL,3,NULL,'legal','corporate','active','2025-02-13 08:26:09','2025-02-13 08:26:09');
INSERT INTO "prm3_participants" ("prm3_participant_id","prm3_id","prm1_id","prm2_sub_id","employee_id","prm3_participant_role","prm3_participant_type","prm3_participant_status","created_at","modified_at") VALUES (12,2,20,3,45,'commercial','employee','active','2025-02-13 08:37:18','2025-02-13 08:37:18');
INSERT INTO "prm3_participants" ("prm3_participant_id","prm3_id","prm1_id","prm2_sub_id","employee_id","prm3_participant_role","prm3_participant_type","prm3_participant_status","created_at","modified_at") VALUES (13,2,16,1,43,'coach','employee','active','2025-02-13 08:51:57','2025-02-13 08:51:57');
INSERT INTO "prm3_participants" ("prm3_participant_id","prm3_id","prm1_id","prm2_sub_id","employee_id","prm3_participant_role","prm3_participant_type","prm3_participant_status","created_at","modified_at") VALUES (15,2,20,3,45,'commercial','employee','active','2025-02-13 08:57:12','2025-02-13 08:57:12');
INSERT INTO "prm3_participants" ("prm3_participant_id","prm3_id","prm1_id","prm2_sub_id","employee_id","prm3_participant_role","prm3_participant_type","prm3_participant_status","created_at","modified_at") VALUES (17,2,NULL,1,NULL,'commercial','corporate','active','2025-02-13 09:01:38','2025-02-13 09:01:38');
INSERT INTO "prm3_participants" ("prm3_participant_id","prm3_id","prm1_id","prm2_sub_id","employee_id","prm3_participant_role","prm3_participant_type","prm3_participant_status","created_at","modified_at") VALUES (18,2,17,NULL,NULL,'legal','person','active','2025-02-13 11:11:10','2025-02-13 11:11:10');
INSERT INTO "prm3_participants" ("prm3_participant_id","prm3_id","prm1_id","prm2_sub_id","employee_id","prm3_participant_role","prm3_participant_type","prm3_participant_status","created_at","modified_at") VALUES (20,2,16,1,43,'technical','employee','active','2025-02-13 11:11:42','2025-02-13 11:11:42');
INSERT INTO "prm3_participants" ("prm3_participant_id","prm3_id","prm1_id","prm2_sub_id","employee_id","prm3_participant_role","prm3_participant_type","prm3_participant_status","created_at","modified_at") VALUES (21,3,16,NULL,NULL,'finance','person','active','2025-02-13 15:00:31','2025-02-13 15:00:31');
INSERT INTO "prm3_participants" ("prm3_participant_id","prm3_id","prm1_id","prm2_sub_id","employee_id","prm3_participant_role","prm3_participant_type","prm3_participant_status","created_at","modified_at") VALUES (22,2,NULL,1,NULL,'participant','corporate','active','2025-03-07 10:29:23','2025-03-07 10:29:23');
INSERT INTO "prm3_participants" ("prm3_participant_id","prm3_id","prm1_id","prm2_sub_id","employee_id","prm3_participant_role","prm3_participant_type","prm3_participant_status","created_at","modified_at") VALUES (23,2,5,1,2,'leader','employee','active','2025-03-07 10:29:33','2025-03-07 10:29:33');
INSERT INTO "prm3" ("prm3_id","prm3_name","prm3_summary","prm3_category","prm3_status","prm3_selected","prm3_formal","prm3_nb_participants","prm3_type","prm3_date_creation","created_at","modified_at") VALUES (2,'Team02','sqsqsq','consortium','active','non','formal',NULL,'prm2_prm2','2024-12-10','2025-02-11 17:03:28','2025-03-07 10:31:43');
INSERT INTO "prm3" ("prm3_id","prm3_name","prm3_summary","prm3_category","prm3_status","prm3_selected","prm3_formal","prm3_nb_participants","prm3_type","prm3_date_creation","created_at","modified_at") VALUES (3,'Team03','sq','coloc','active','non','formal',NULL,'prm1_prm1','2025-02-27','2025-02-11 17:36:59','2025-02-13 15:00:31');
INSERT INTO "prm3" ("prm3_id","prm3_name","prm3_summary","prm3_category","prm3_status","prm3_selected","prm3_formal","prm3_nb_participants","prm3_type","prm3_date_creation","created_at","modified_at") VALUES (8,'az009','','red','active','non','',NULL,'','','2025-02-14 12:37:27','CURRENT_TIMETSTAMP');
INSERT INTO "prm3" ("prm3_id","prm3_name","prm3_summary","prm3_category","prm3_status","prm3_selected","prm3_formal","prm3_nb_participants","prm3_type","prm3_date_creation","created_at","modified_at") VALUES (9,'team23','','couple','active','non','formal',NULL,'prm1-prm1','2025-03-28','2025-03-07 10:04:50','CURRENT_TIMETSTAMP');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (1,'status','active',NULL,'2025-02-14 15:42:15','2025-02-14 15:42:15');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (2,'gender','active',NULL,'2025-02-15 10:20:05','2025-02-15 10:20:05');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (3,'lang','active',NULL,'2025-02-15 10:21:45','2025-02-15 10:21:45');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (4,'doc_format','active','','2025-02-15 10:53:20','2025-02-15 10:54:12');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (5,'img_format','active',NULL,'2025-02-15 10:56:01','2025-02-15 10:56:01');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (6,'status_publication','active',NULL,'2025-02-15 13:28:51','2025-02-15 13:28:51');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (7,'event','active',NULL,'2025-02-15 13:32:24','2025-02-15 13:32:24');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (8,'question_category','active',NULL,'2025-02-15 13:45:52','2025-02-15 13:45:52');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (9,'member_category','active',NULL,'2025-02-15 13:48:54','2025-02-15 13:48:54');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (10,'news_category','active','article post','2025-02-15 13:55:44','2025-02-15 13:59:00');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (11,'legal_status','active','sa sarl  ','2025-02-15 14:03:25','2025-02-15 14:03:25');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (12,'doc_category','active','report bilan','2025-02-15 14:11:19','2025-02-15 14:11:19');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (13,'doc_type','active','report leaflet manual','2025-02-15 14:14:38','2025-02-15 14:14:38');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (14,'partner_type','active','partenaire réseau social','2025-02-15 14:23:36','2025-02-15 14:23:36');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (15,'partner_category','active','or argent','2025-02-15 14:24:53','2025-02-15 14:24:53');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (16,'place_type','active','siège bureaux salle de réunion','2025-02-16 16:09:14','2025-02-16 16:09:14');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (17,'space_type','active','visio training','2025-02-16 16:14:43','2025-02-16 16:14:43');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (18,'space_level','active','siège annexe','2025-02-16 16:19:25','2025-02-16 16:19:25');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (19,'topic_category','active','technique general...','2025-02-16 16:27:14','2025-02-16 16:27:14');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (20,'debug_category','active','bug ','2025-02-16 16:35:21','2025-02-16 16:35:21');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (21,'meeting_category','active','conference concert...','2025-02-17 09:04:34','2025-02-17 09:15:49');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (22,'workspace_category','active','','2025-02-17 09:33:12','2025-02-17 09:33:12');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (23,'prm1_category','active','','2025-02-17 09:47:28','2025-02-17 09:47:28');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (24,'employee_function','active','','2025-02-17 10:17:43','2025-02-17 10:17:43');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (25,'employee_category','active','','2025-02-17 10:22:01','2025-02-17 10:22:01');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (26,'prm3_type','active','','2025-02-17 10:33:05','2025-02-17 10:33:05');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (27,'prm3_category','active','','2025-02-17 10:37:12','2025-02-17 10:37:12');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (28,'prm3_role','active','','2025-02-17 12:30:02','2025-02-17 12:30:02');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (29,'user_role','active','admin supervisor','2025-02-17 13:10:45','2025-02-17 13:10:45');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (30,'user_group','active','','2025-02-17 13:12:37','2025-02-17 13:12:37');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (31,'user_level','active','','2025-02-17 13:14:15','2025-02-17 13:14:15');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (32,'workmeeting_alert','active','','2025-02-17 18:16:53','2025-02-17 18:16:53');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (33,'project_category','active','','2025-02-18 15:40:28','2025-02-18 15:40:28');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (34,'building_type','active','','2025-02-18 17:54:12','2025-02-18 17:54:12');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (35,'building_accessibility','active','','2025-02-18 17:54:32','2025-02-18 17:54:32');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (36,'project_role','active','','2025-02-19 14:17:25','2025-02-19 14:17:25');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (37,'room_type','active','','2025-02-19 17:28:52','2025-02-19 17:28:52');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (38,'workpackage_type','active','','2025-02-20 13:29:15','2025-02-20 13:29:15');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (39,'worksequence_role','active','','2025-02-21 08:42:44','2025-02-21 08:42:44');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (40,'worksequence_type','active','','2025-02-21 08:50:18','2025-02-21 08:50:18');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (41,'doc_cloud_format','active','','2025-02-27 09:18:56','2025-02-27 09:18:56');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (42,'meeting_participant_role','active','meeting_participant_type','2025-02-27 16:39:39','2025-02-27 16:42:14');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (43,'list_hours','active','','2025-03-03 09:13:07','2025-03-03 09:13:07');
INSERT INTO "choices_categories" ("choice_category_id","choice_category_name","choice_category_status","choice_category_summary","created_at","modified_at") VALUES (44,'workspace_category','active','','2025-03-07 11:07:57','2025-03-07 11:07:57');
INSERT INTO "regex" ("regex_id","regex_name","regex_value","regex_description","regex_comment","regex_status","created_at","modified_at") VALUES (1,'email','^[a-zA-Z0-9\.]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]{2,4}$','''xxxxx@xxxx.xx ou yyyy.xxx@dxxxx.yy''','','active','2025-02-17 12:58:07','2025-02-17 13:40:26');
INSERT INTO "regex" ("regex_id","regex_name","regex_value","regex_description","regex_comment","regex_status","created_at","modified_at") VALUES (2,'phone','^(?:(?:\+|00)33|0)\s*[1-9] (?:[\s.-]*\d{2}){4}$','''format +33 6 00 00 00 00''','','active','2025-02-17 13:33:09','2025-02-17 13:33:09');
INSERT INTO "regex" ("regex_id","regex_name","regex_value","regex_description","regex_comment","regex_status","created_at","modified_at") VALUES (3,'password','^(?=.{8,}$)(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*\W).*$','  Le mot de passe doit contenir au moins 8 caractères, une majuscule, un chiffre, un cractère spécial : #?!@$%^&*-','','active','2025-02-17 13:40:16','2025-02-17 14:01:26');
INSERT INTO "regex" ("regex_id","regex_name","regex_value","regex_description","regex_comment","regex_status","created_at","modified_at") VALUES (4,'date','^[0-9]{4}-(((0[13578]|(10|12))-(0[1-9]|[1-2][0-9]|3[0-1]))|(02-(0[1-9]|[1-2][0-9]))|((0[469]|11)-(0[1-9]|[1-2][0-9]|30)))$','format : DD-MM-YYYY','','active','2025-02-17 16:24:11','2025-02-17 16:24:11');
INSERT INTO "regex" ("regex_id","regex_name","regex_value","regex_description","regex_comment","regex_status","created_at","modified_at") VALUES (5,'hour','^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$','hh:mm (ex : 12:30)','','active','2025-02-17 16:25:58','2025-02-17 16:25:58');
INSERT INTO "regex" ("regex_id","regex_name","regex_value","regex_description","regex_comment","regex_status","created_at","modified_at") VALUES (6,'year','^[0-9]{4}$','format : YYYY','','active','2025-02-17 16:49:51','2025-02-17 16:49:51');
INSERT INTO "regex" ("regex_id","regex_name","regex_value","regex_description","regex_comment","regex_status","created_at","modified_at") VALUES (7,'latitude','^-?([0-8]?[0-9]|90)(\.[0-9]{1,10})$','ex :      56.3847     -56.387','','active','2025-02-18 10:49:47','2025-02-18 10:49:47');
INSERT INTO "regex" ("regex_id","regex_name","regex_value","regex_description","regex_comment","regex_status","created_at","modified_at") VALUES (8,'longitude','^(\+|-)?(?:180(?:(?:\.0{1,6})?)|(?:[0-9]|[1-9][0-9]|1[0-7][0-9])(?:(?:\.[0-9]{1,6})?))$','ex : -1.171809','=> 9 digits','active','2025-02-18 10:59:49','2025-02-18 11:15:56');
INSERT INTO "workdocs_cloud" ("workdoc_cloud_id","workspace_id","message_id","workdoc_cloud_url","workdoc_cloud_title","workdoc_cloud_summary","workdoc_cloud_author","workdoc_cloud_category","workdoc_cloud_format","workdoc_cloud_status","workdoc_cloud_type","workdoc_cloud_lang","created_at","modified_at") VALUES (2,8,NULL,'https://fr.wikipedia.org/wiki/Structured_Query_Language','page sql wiki','',NULL,'','','online','','FR','2025-02-18 09:51:49','2025-02-18 09:51:49');
INSERT INTO "project_building_rooms_pictures" ("room_picture_id","building_id","project_id","room_id","room_picture_url","room_picture_title","room_picture_summary","room_picture_format","room_picture_status","room_picture_selected","created_at","modified_at") VALUES (6,1,1,4,'/x_pictures_spaces/2025-02-24_16h31m37s_zH9SdhrC.png','dsdssd',NULL,'jpeg','active','no','2025-02-24 16:31:37','2025-02-24 16:31:37');
INSERT INTO "project_building_rooms_pictures" ("room_picture_id","building_id","project_id","room_id","room_picture_url","room_picture_title","room_picture_summary","room_picture_format","room_picture_status","room_picture_selected","created_at","modified_at") VALUES (8,1,1,4,'/x_pictures_spaces/2025-02-24_17h02m30s_sx3wDxJ7.jpg','dsds',NULL,'','active','no','2025-02-24 17:02:30','2025-02-24 17:02:30');
INSERT INTO "project_building_rooms_pictures" ("room_picture_id","building_id","project_id","room_id","room_picture_url","room_picture_title","room_picture_summary","room_picture_format","room_picture_status","room_picture_selected","created_at","modified_at") VALUES (10,2,1,2,'/x_pictures_spaces/2025-03-03_15h59m20s_imxpJ98N.jpg','ccxwcwxxcw',NULL,'jpeg','active','no','2025-03-03 15:31:01','2025-03-03 15:59:20');
INSERT INTO "project_building_rooms_pictures" ("room_picture_id","building_id","project_id","room_id","room_picture_url","room_picture_title","room_picture_summary","room_picture_format","room_picture_status","room_picture_selected","created_at","modified_at") VALUES (12,2,1,8,'/x_pictures_spaces/2025-03-03_15h59m50s_eMgTKjUZ.jpg','w<<w',NULL,'','active','no','2025-03-03 15:59:50','2025-03-03 15:59:50');
INSERT INTO "project_building_rooms" ("room_id","building_id","room_name","room_level","room_type","room_summary","room_todo","room_access","room_accessibility","room_capacity_seats","room_capacity_standup","room_status","room_selected","room_width","room_length","room_height","room_wall_material","room_floor_material","room_quality_level","modified_at","created_at") VALUES (1,1,'building01',NULL,'living_room','sqsq','','','','','','active',NULL,'','','','','',NULL,'2025-03-03 16:35:15','2025-02-18 17:40:08');
INSERT INTO "project_building_rooms" ("room_id","building_id","room_name","room_level","room_type","room_summary","room_todo","room_access","room_accessibility","room_capacity_seats","room_capacity_standup","room_status","room_selected","room_width","room_length","room_height","room_wall_material","room_floor_material","room_quality_level","modified_at","created_at") VALUES (2,2,'Building02','main','workshop',NULL,NULL,NULL,'accessible','','workshop',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-02-18 18:04:03','2025-02-18 18:04:03');
INSERT INTO "project_building_rooms" ("room_id","building_id","room_name","room_level","room_type","room_summary","room_todo","room_access","room_accessibility","room_capacity_seats","room_capacity_standup","room_status","room_selected","room_width","room_length","room_height","room_wall_material","room_floor_material","room_quality_level","modified_at","created_at") VALUES (3,3,'sqqs','main','small_heritage',NULL,NULL,NULL,'','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-02-19 15:15:44','2025-02-19 15:15:44');
INSERT INTO "project_building_rooms" ("room_id","building_id","room_name","room_level","room_type","room_summary","room_todo","room_access","room_accessibility","room_capacity_seats","room_capacity_standup","room_status","room_selected","room_width","room_length","room_height","room_wall_material","room_floor_material","room_quality_level","modified_at","created_at") VALUES (4,1,'room03',NULL,'bedroom','','','','','','','active',NULL,'','','','','',NULL,'2025-02-20 15:15:08','2025-02-19 16:53:48');
INSERT INTO "project_building_rooms" ("room_id","building_id","room_name","room_level","room_type","room_summary","room_todo","room_access","room_accessibility","room_capacity_seats","room_capacity_standup","room_status","room_selected","room_width","room_length","room_height","room_wall_material","room_floor_material","room_quality_level","modified_at","created_at") VALUES (6,4,'newland','main','factory',NULL,NULL,NULL,'','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-02-20 15:18:21','2025-02-20 15:18:21');
INSERT INTO "project_building_rooms" ("room_id","building_id","room_name","room_level","room_type","room_summary","room_todo","room_access","room_accessibility","room_capacity_seats","room_capacity_standup","room_status","room_selected","room_width","room_length","room_height","room_wall_material","room_floor_material","room_quality_level","modified_at","created_at") VALUES (7,4,'atelier01',NULL,'bedroom','','',NULL,'','','','active',NULL,'','','','',NULL,NULL,'2025-02-20 15:18:40','2025-02-20 15:18:40');
INSERT INTO "project_building_rooms" ("room_id","building_id","room_name","room_level","room_type","room_summary","room_todo","room_access","room_accessibility","room_capacity_seats","room_capacity_standup","room_status","room_selected","room_width","room_length","room_height","room_wall_material","room_floor_material","room_quality_level","modified_at","created_at") VALUES (8,2,'room AA',NULL,'bathroom','','',NULL,'','','','active',NULL,'','','','',NULL,NULL,'2025-02-20 15:26:48','2025-02-20 15:26:48');
INSERT INTO "project_building_rooms" ("room_id","building_id","room_name","room_level","room_type","room_summary","room_todo","room_access","room_accessibility","room_capacity_seats","room_capacity_standup","room_status","room_selected","room_width","room_length","room_height","room_wall_material","room_floor_material","room_quality_level","modified_at","created_at") VALUES (9,5,'b5','main','',NULL,NULL,NULL,'','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-03-04 12:59:12','2025-03-04 12:59:12');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (1,'1. Finalités du projet','## Le coq et le renard  
*Jean de la Fontaine*

Sur la brandie d’un arbre était en sentinelle

Un vieux coq adroit et matois.

Frère, dit un renard, adoucissant sa voix,

Nous ne sommes plus en querelle ;

Paix générale cette fois.

Je viens te l’annoncer ; descends, que je t’embrasse :

Ne me retarde point, de grâce ;

Je dois faire aujourd’hui vingt postes sans manquer.

Les tiens et toi pouvez vaquer,

Sans nulle crainte, à vos affaires ;

Nous vous y servirons en frères.

Faites-en les feux dès ce soir,

Et cependant viens recevoir

Le baiser d’amour fraternelle.

Ami, reprit le coq, je ne pouvais jamais

Apprendre une plus douce et meilleure nouvelle

Que celle

De cette paix ;

Et ce m’est une double joie

De la tenir de toi. Je vois deux lévriers,

Qui, je m’assure, sont courriers

Que pour ce sujet on envoie :

Ils vont vite, et seront dans un moment à nous.

Je descends : nous pourrons nous entre-baiser tous.

Adieu, dit le renard, ma traite est longue à faire :

Nous nous réjouirons du succès de l’affaire

Une autre fois. Le galant aussitôt

Tire ses grègues, gagne au haut,

Mal content de son stratagème.

Et notre vieux coq en soi-même

Se mit à rire de sa peur ;

Car c’est double plaisir de tromper le trompeur. ','about','FR',1,'yes','2024-10-28 14:36:38','2025-03-06 09:45:38');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (2,'2. Histoire de Co-op','## La belette entrée dans un grenier  
*Jean de la Fontaine*

Damoiselle belette, au corps long et fluet,  
Entra dans un grenier par un trou fort étroit :  
Elle sortait de maladie.  
Là, vivant à discrétion,  
La galande fit chère lie,  
Mangea, rongea : Dieu sait la vie,  
Et le lard qui périt en cette occasion !  
La voilà, pour conclusion,  
Grasse, maflue, et rebondie.  
Au bout de la semaine, ayant dîné son soûl,  
Elle entend quelque bruit, veut sortir par le trou,  
Ne peut plus repasser, et croit s’être méprise.  
Après avoir fait quelques tours,  
C’est, dit-elle, l’endroit, me voilà bien surprise ;  
J’ai passé par ici depuis cinq ou six jours,  
Un rat, qui la voyait en peine,  
Lui dit : Vous aviez lors la panse un peu moins pleine.  
Vous êtes maigre entrée, il faut maigre sortir.  
Ce que je vous dis là, l’on le dit à bien d’autres ;  
Mais ne confondons point, par trop approfondir,  
Leurs affaires avec les vôtres.   ','about','FR',2,'yes','2024-10-28 14:37:19','2025-03-06 09:45:49');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (4,'3. Fonctionnement de l''''équipe-projet',' ## Les grenouilles qui demandent un roi  
*Jean de la Fontaine*

Les grenouilles se lassant  
De l’état démocratique  
Par leurs clameurs firent tant  
Que Jupin les soumit au pouvoir monarchique.  
Il leur tomba du ciel un roi tout pacifique :  
Ce roi fit toutefois un tel bruit en tombant,  
Que la gent marécageuse,  
Cent fort sotte et fort peureuse,  
S’alla cacher sous les eaux,  
Dans les joncs, dans les roseaux,  
Dans les trous du marécage,  
Sans oser de longtemps regarder au visage  
Celui quelles croyaient être un géant nouveau.  
Or c’était un soliveau,  
De qui la gravité fit peur à la première  
Qui, de le voir, s’aventurant,  
Osa bien quitter sa tanière.  
Elle approcha, mais en tremblant.  
Une autre la suivit, une autre en fit autant :  
Il en vint une fourmilière ;  
Et leur troupe à la fin se rendit familière  
Jusqu’à sauter sur l’épaule du roi.  
Le bon sire le souffre, et se tient toujours coi.  
Jupin en a bientôt la cervelle rompue :  
Donnez-nous, dit ce peuple, un roi qui se remue !  
Le monarque des dieux leur envoie une grue,  
Qui les croque, qui les tue,  
Qui les gobe à son plaisir  
Et grenouilles de se plaindre,  
Et Jupin de leur dire ; Eh quoi ! votre désir  
À ses lois croit-il nous astreindre ?  
Vous avez dû premièrement  
Garder votre gouvernement ;  
Mais ne l’ayant pas fait, il vous devait suffire   
Que votre premier roi fût débonnaire et doux.  
De celui-ci contentez-vous,  
De peur d’en rencontrer un pire.   ','about','FR',3,'yes','2024-10-28 16:51:15','2025-03-06 09:45:09');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (7,'1. Nous contacter','Pour toute question concernant la modération ou l''administration du site
lui-même ou une problématique ne pouvant être évoquée publiquement, ou
si vous avez rencontré un bogue en parcourant le site web l\''association
XXX ou si vous souhaitez suggérer des évolutions pour le site, vous
pouvez nous contacter, en déposant votre message sur [le formulaire de
contact](http://localhost:8080/a_faq/faq_form.sql).

Pour toute question concernant des demandes d''aide liées aux thématiques
du site (comme *comment faire marcher tel logiciel* ou *j''ai tel message
d''erreur qui s''affiche*), veuillez consulter [la foire aux
questions.](http://localhost:8080/a_faq/faq_display.sql)

Pour poser des questions techniques, vous pouvez utiliser [le
forum](http://localhost:8080/a_forum/forum.sql) ( cela nécessite de se
créer un compte).','legal','FR',1,'yes','2024-10-29 09:34:24','2024-12-05 15:32:43');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (8,'2. Éditeur','Ce site est édité par l''association XXX

Siège social : ????','legal','FR',2,'yes','2024-10-29 09:42:36','2024-10-29 09:47:36');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (9,'3. Hébergeur','Ce site est hébergé sur les serveurs de la société XXXX. Siège social :
XXXXX','legal','FR',3,'yes','2024-10-29 09:43:19','2024-10-29 09:47:43');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (10,'4. Directeur de publication','Le directeur de publication est M. XXXX, \<xxxxx@asso-coopXXXXX.org\>.
Les courriels nécessitent une confirmation de votre part.','legal','FR',4,'yes','2024-10-29 09:43:48','2024-10-29 09:47:49');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (11,'5. Cookies','Le site utilise actuellement les cookies suivants :

-   *session_token* :

    -   durée : courte (suppression à la fermeture du navigateur),

    -   usage : cookie de session sur le site,

    -   concerne : les visites authentifiées ;','legal','FR',5,'yes','2024-10-29 09:44:24','2024-10-29 09:47:57');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (12,'6. Données à caractère personnel','Cette liste de données à caractère personnel concerne les visites du
site effectuées avec un compte. Il n''y a pas de données à caractère
personnel lors des visites anonymes sans compte.

La loi (le [Règlement sur la protection des données à caractère
personnel ou
RGPD](https://fr.wikipedia.org/wiki/Règlement_général_sur_la_protection_des_données)
et la [Loi informatique et libertés ou
LIL](https://fr.wikipedia.org/wiki/Loi_informatique_et_libertés) en
France) requiert une base légale pour chaque traitement de DCP. Cette
obligation s''applique quelle que soit l''état d''activité du compte.
Ainsi, si un compte est inactif, une base légale doit exister pour
justifier d''une conservation des DCP associées.

\-- à adapter en fonction de la gestion réelle des données des
utilisateurs

*Pour les comptes actifs, des données sont obligatoirement stockées en
base pour rendre le service. Les tâches suivantes sont réalisées pour le
service :*

-   *transmettre un mot de passe initial pour créer un compte en ayant
    > validé l''adresse. Cette tâche utilise l''adresse de courriel ;*

-   *transmettre des notifications liées aux services, par exemple les
    > publications/rejets de dépêches ou les attributions de prix
    > mensuels. Cette tâche utilise l''adresse de courriel ;*

-   *afficher les données publiques liées au compte (le compte lui-même,
    > les contenus du compte, les commentaires du compte, etc.). Cette
    > tâche nécessite en interne un identifiant unique par compte ;*

-   *gérer les litiges éventuels (par exemple, le manifestement illégal,
    > le prétendument illégal) et le cadre légal (par exemple, la
    > modification des données de son propre compte, le droit d''auteur).
    > Cette tâche nécessite d''avoir des données d''identification,
    > d''attribution et de contact pour les publications de contenus /
    > commentaires faits par des tiers (les comptes) ;*

-   *détecter et gérer des éventuels abus du service (comptes multiples,
    > etc.) ;*

-   *gérer la limitation de la conservation des DCP et la limitation
    > dans le temps des habilitations (modération, administration).
    > Cette tâche nécessite d''avoir la date de dernière visite.*

*Le RGPD limite la conservation des DCP. Dans le présent contexte, cette
obligation concerne à la fois les comptes toujours ouverts mais
inutilisés pendant une certaine durée aussi bien que les comptes fermés.
En tout état de cause, l\''association XXX n''a pas d''intérêt ou de besoin
légitime à conserver indéfiniment ces données, dès qu''une période
raisonnable est passée. Pour définir cette période raisonnable,
l\''association XXX tient compte de la prescription après 3 mois pour le
droit de la presse en France. l\''association XXX estime que les risques
de revoir le même spammeur avec les mêmes coordonnées diminuent
énormément en quelques mois ou mêmes semaines. Etc.*

*Les données à caractère personnel nécessaires à la fourniture du
service :*

-   *identifiant ou pseudo : unique dans l''ensemble du site, il définit
    > aussi un élément de l''adresse qui sera associé au compte (la
    > partie entre le \''/users/\'' et le \''/\'' dans l''adresse associée au
    > compte). Il n''est pas modifiable par la personne utilisant le
    > compte. Il est nécessaire pour créer un compte identifiable de
    > l''extérieur de façon unique.*

-   *nom affichable : choisi par la personne utilisant le compte et
    > modifiable à tout moment tant que le compte est ouvert. Il est
    > nécessaire à identifier l''utilisateur aux autres utilisateurs du
    > site (sachant que l''identifiant ou pseudo est utilisé à défaut).*

-   *adresse de courriel : définie par la personne utilisant le compte,
    > validée par le courriel initialement envoyé à la création du
    > compte ; elle est modifiable par la suite tant que le compte est
    > ouvert. Il est nécessaire pour valider l''humanité du compte et
    > pour les notifications.*

-   *mot de passe : initialement généré aléatoirement et pouvant être
    > modifié à tout moment par la personne utilisant le compte tant que
    > celui-ci est ouvert. Il sert à s''authentifier sur le site.*

-   *date et adresse IP de connexion courante ;*

-   *date et adresse IP de connexion précédente ;*

-   *date de dernière visite ;*

*Les données à caractère personnel non-obligatoires pour le service et
fournies par les utilisateurs sont :*

-   *une image d''avatar : la personne utilisant le compte peut y
    > associer une image (qui peut ou non l''identifier) et peut la
    > modifier à tout moment tant que le compte est ouvert ;*

-   *une adresse d''un site web personnel : la personne utilisant le
    > compte peut y associer une telle adresse et peut la modifier à
    > tout moment tant que le compte est ouvert ;*

-   *une adresse de messagerie instantanée XMPP : la personne utilisant
    > le compte peut y associer une telle adresse et peut la modifier à
    > tout moment tant que le compte est ouvert ;*

-   *une adresse de compte Mastodon : la personne utilisant le compte
    > peut y associer une telle adresse et peut la modifier à tout
    > moment tant que le compte est ouvert ;*

-   *une signature ajoutée à chaque commentaire : la personne utilisant
    > le compte peut y associer une telle signature et peut la modifier
    > à tout moment tant que le compte est ouvert ;*

-   *une feuille de style personnelle : la personne utilisant le compte
    > peut y associer une telle feuille de style et peut la modifier à
    > tout moment tant que le compte est ouvert.*','legal','FR',6,'yes','2024-10-29 09:45:16','2024-10-29 09:48:03');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (13,'7. Quelles sont les données sans caractère personnel relatives au compte traitées par le site ?','Cette liste de données sans caractère personnel concerne les visites du
site effectuées avec un compte.

Le compte peut être associé à des contenus (dépêches, journal personnel,
entrées de forums, sondages, pages wiki, liens, entrées dans le système
de suivi), des commentaires, des notes ou des étiquetages, ainsi que des
contenus sur lesquels le compte a contribué. Le compte peut aussi être
associé à des applications ou sites tiers, ayant été autorisés à accéder
à certaines informations via une API Oauth2. Le compte est associé
éventuellement à des opérations administratives (changement de mot de
passe, sanctions temporaires d''interdiction de commenter, etc.).

La fermeture du compte était sans effet sur ces données. Une demande
d''anonymisation (réattribution de tout à l''utilisateur fictif Anonyme)
est possible en passant par l''équipe du site.','legal','FR',7,'yes','2024-10-29 09:46:33','2024-10-29 09:48:22');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (14,'8. Quelles sont les données inutiles au service qui sont supprimées des comptes fermés ?','[Depuis le 28 juin
2023](https://linuxfr.org/news/regles-de-perennite-des-comptes-linuxfr-org-et-donnees-a-caractere-personnel),
les données associées inutiles au service des comptes fermés sont
supprimées.

Les comptes créés et sans connexion pendant sept jours seront purgés.

Les comptes inactifs pendant trois ans seront fermés :

-   les éventuels contenus et commentaires non publics de ces comptes
    > seront supprimés ;

-   en l''absence de contenus ou commentaires publics ou de contributions
    > à des contenus publics, le compte sera purgé (les éventuels
    > étiquetages seront réattribués à l\''utilisateur Anonyme) ;

-   sinon

    -   seront conservés l''identifiant ou pseudo, l''adresse de courriel,
        > le nom affichable et la signature (pour l''attribution du droit
        > d''auteur) ;

    -   seront supprimées de la base le mot de passe, les dates et
        > adresses IP des deux dernières connexions du compte, l''image
        > éventuelle d''avatar, les éventuelles adresses de site web
        > personnel, de messagerie instantanée XMPP et/ou de compte
        > Mastodon, l''éventuelle feuille de style personnelle ;

    -   seront supprimées les applications utilisant l\''API du site
        > reliées au compte, ainsi que les accès et tokens reliés à ces
        > applications ou au compte.

Précision : la durée de trois ans commence à courir à partir du
lendemain de la dernière activité sur le compte.

Les comptes fermés (par les personnes détentrices des comptes ou par
l''équipe) depuis plus d''un an verront les données associées réduites par
rapport au besoin de service :

-   les éventuels contenus et commentaires non publics de ces comptes
    > seront supprimés ;

-   en l''absence de contenus ou commentaires publics ou de contributions
    > à des contenus publics, le compte sera purgé (les éventuels
    > étiquetages seront réattribués à l\''utilisateur Anonyme) ;

-   sinon

    -   seront conservés l''identifiant ou pseudo, le nom affichable et
        > la signature (pour l''attribution du droit d''auteur) ;

    -   seront supprimées de la base active l''adresse de courriel, le
        > mot de passe, les dates et adresses IP des deux dernières
        > connexions du compte, l''image éventuelle d''avatar, les
        > éventuelles adresses de site web personnel, de messagerie
        > instantanée XMPP et/ou de compte Mastodon, l''éventuelle
        > feuille de style personnelle ;

    -   seront supprimées les applications utilisant l\''API du site
        > reliées au compte, ainsi que les accès et tokens reliés à ces
        > applications ou au compte.

La principale différence concerne la conservation de l''adresse de
courriel pour permettre une réouverture du compte et un envoi de nouveau
mot de passe en cas de demande.

Ces opérations seront faites manuellement dans les meilleurs délais (par
une équipe de bénévoles initialement, puis, et à terme,
automatiquement).','legal','FR',8,'yes','2024-10-29 09:47:19','2024-10-29 09:48:09');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (15,'Préambule','Les présentes Conditions Générales d''Utilisation (ci-après "CGU") régissent l''accès et l''utilisation du site [Nom du site], édité par [Nom de l''entreprise], dont le siège social est situé [Adresse de l''entreprise]. L''utilisateur reconnaît avoir pris connaissance des CGU et s''engage à les respecter.','CGU','FR',0,'yes','2024-10-29 10:22:56','2024-12-05 15:35:30');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (16,'Article 1 – Définitions','Site : désigne le site internet accessible à l''adresse [URL du site].
Visiteur :  toute personne  naviguant sur le Site, à quelque titre que ce soit, sans s''être connecté.
Utilisateur : toute personne  naviguant sur le Site, à quelque titre que ce soit après s''être connecté en fournissant son email et son mot de passe.
Contenu : désigne l''ensemble des éléments présents sur le Site (textes, images, vidéos, logos, etc.).','CGU','FR',1,'yes','2024-10-29 10:23:23','2024-12-05 15:45:40');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (17,'Article 2 – Objet','Les présentes CGU ont pour objet de définir les conditions dans lesquelles les utilisateurs peuvent accéder au Site et l''utiliser. En accédant au Site, l''utilisateur accepte sans réserve les présentes CGU.','CGU','FR',2,'yes','2024-10-29 10:23:49','2024-10-29 10:28:12');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (18,'Article 3 – Accès au site','L''accès au Site est ouvert à tout utilisateur disposant d''une connexion Internet. Le site est accessible gratuitement, hors coûts de connexion et d''abonnement à Internet. 
Certaines sections du site sont toutefois  réservées aux seuls utilisateurs enregistrés, en fonction des droits qui leur ont été accordés.
 ','CGU','FR',3,'yes','2024-10-29 10:24:26','2024-12-05 15:47:36');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (19,'Article 4 – Propriété intellectuelle','Le contenu du site (textes, images, logos, etc.) accessible aux visiteurs est sous licence creative commons CC-BY-NC-SA (Attribution Pas d''utilisation commerciale Partage dans les mêmes conditions).
Le contenu du site (textes, images, logos, etc.) accessible aux utilisateurs est sous licence creative commons CC-Zero pour faciliter le partage et la coproduction des contenus.','CGU','FR',4,'yes','2024-10-29 10:24:53','2024-12-05 15:53:27');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (20,'Article 5 – Données personnelles','Le site ne collecte que le nom, et l''adresse e-mail des visiteurs qui introduisent une demande via le formulaire de contact. Ces données ne sont collectées que pour pouvoir répondre aux demandes formulées. Conformément à la réglementation en vigueur (RGPD), le visiteur dispose d''un droit d''accès, de rectification et de suppression de ses données personnelles. Pour toute demande, contactez [email du DPO].
De même les utilisateurs enregistrés  dispose d''un droit d''accès, de rectification et de suppression de ses données personnelles. Pour toute demande, contactez [email du DPO].','CGU','FR',5,'yes','2024-10-29 10:25:22','2024-12-05 15:56:47');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (21,'Article 6 – Responsabilité','L''utilisation du Site se fait sous la seule responsabilité de l''utilisateur. [Nom de l''entreprise] ne saurait être tenu responsable de tout dommage direct ou indirect, y compris pertes de données ou de profit, résultant de l''accès ou de l''utilisation du Site.','CGU','FR',6,'yes','2024-10-29 10:25:51','2024-10-29 10:28:46');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (22,'Article 7 – Liens hypertextes','Le site peut contenir des liens vers d''autres sites internet. [Nom de l''entreprise] n''exerce aucun contrôle sur le contenu de ces sites et ne saurait être tenu responsable de leur disponibilité ou de leur contenu.','CGU','FR',7,'yes','2024-10-29 10:26:21','2024-10-29 10:28:52');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (23,'Article 8 – Modification des CGU','[Nom de l''entreprise] se réserve le droit de modifier à tout moment les présentes CGU. Les utilisateurs sont invités à les consulter régulièrement. Les modifications prennent effet à compter de leur publication sur le Site.','CGU','FR',8,'yes','2024-10-29 10:26:51','2024-10-29 10:28:58');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (24,'Article 9 – Loi applicable','Les présentes CGU sont régies par la loi française. En cas de litige, et après tentative de résolution amiable, les tribunaux de [Ville] seront compétents.','CGU','FR',9,'yes','2024-10-29 10:27:24','2024-10-29 10:29:04');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (25,'Article 10 – Contact','Pour toute question relative aux présentes CGU, vous pouvez contacter [Nom de l''entreprise] à l''adresse suivante : [Adresse e-mail].','CGU','FR',10,'yes','2024-10-29 10:27:58','2024-10-29 10:29:12');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (28,'CO-OP un site internet simple mais complet réalisé avec sqlpage ','COOP est le résultat d''un parcours d''apprentissage de sql via SQLPage
par un « no-pro » (le développement informatique n''est pas mon métier et
ma culture informatique est très limitée). L''objectif était de
développer un site web complet, fonctionnel, dynamique (tous les
contenus gérés à partir de tables). L''argument de cette base de données
est le suivi de chantiers de réhabilitation de bâtiments dans le cadre
de chantiers participatifs associant des professionnels et des
particuliers. Le suivi et la coordination de ces chantiers sont assurés
par des associations indépendantes organisées en réseau. Cela explique
le nom du site et le volet consacré au travail collaboratif.

Le code de COOP est très simple : utilisation de SQLITE comme moteur de
gestion de base de données, requêtes SQL de base (requêtes
élémentaires : pas d''utilisation de triggers, pragma...), SQLPage socle
(pas de composants « custom », pas de scripts), une écriture des
requêtes très scolaire, des noms de fichiers et de dossiers très
explicites...','hero','EN',1,'yes','2024-11-14 17:08:38','2025-03-05 17:00:59');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (29,'CO-OP a simple but complete website built with sqlpage','COOP is the result of a "no-pro" learning curve in sql via SQLPage (IT
development is not my profession and my IT culture is very limited). The
aim was to develop a complete, functional, dynamic website (all content
managed from tables). The purpose of the central database is to monitor
building rehabilitation projects as part of participative projects
involving professionals and private individuals. These projects are
monitored and coordinated by a network of independent associations. This
explains the name of the site and the section devoted to collaborative
work.

COOP\''s code is very simple: use of SQLITE as the database management
engine, basic SQL queries (elementary queries: no use of triggers,
pragma\...), SQLPage base (no custom components, no scripts), very
academic query writing, very explicit file and folder names\...','hero','EN',2,'yes','2024-12-05 16:57:13','2025-03-05 17:02:19');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (30,'CO-OP un site pour présenter une organisation et ses projets','
Il existe de nombreuses applications commerciales ou open source,
no-code pour répondre aux besoins les plus classiques attendues d''un
site web . Mais il existe des cas où la structure de la base de données
est trop spécifique pour que l''on puisse utiliser une de ces
applications. Il faut donc construire le site web autour de la base de
données. C''est la finalité de SQLPage dont un gros atout est d''être une
application à « code simple » accessible à des personnes dont le
développement informatique n''est pas le cœur de métier mais qui ont
besoin de mettre en ligne une base de données spécifiques.

Mettre en ligne une base de données ne se limite pas à la mise en ligne
des données proprement dites. Il faut aussi assurer le développement des
autres fonctions périphériques attendues d''un site web :

-   **fonction « admin » **: administrer le site web : gérer des droits
    des utilisateurs, assurer la maintenance,

-   **fonction « corporate »** : présenter la structure éditrice du site
    web : qui nous sommes, quelles sont nos activités, présentation de
    notre équipe...

-   **fonction « contact » **: offrir une interface de contact et
    d''échange avec les visiteurs : formulaire de contact, formulaire
    d''inscription, FAQ...

-   **fonction « interface» **: offrir une interface pour alimenter et
    maintenir la base de données qui a justifié la création du site,

-   **fonction « community » **: offrir des outils collaboratifs pour
    les rédacteurs qui alimente la base de données ou produisent les
    contenus sur le site.

La structure de COOP, tente de répondre à toutes fonctions.','hero','FR',3,'yes','2024-12-05 17:02:17','2025-03-05 17:04:13');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (31,'CO-OP a website built ti present an organization and its projects','There are many commercial or open source, no-code applications available
to meet the most classic needs expected of a web site. But there are
cases where the database structure is too specific to use one of these
applications. The website must therefore be built around the database.
This is the purpose of SQLPage, a major advantage of which is that it is
a "simple code" application accessible to people whose core business is
not IT development, but who need to put a specific database online.

Putting a database online is not limited to putting the data itself
online. It also involves the development of other peripheral functions
expected of a web site:

-   "**admin**" function: website administration, user rights management
    and maintenance,

-   "**corporate**" function: presenting the structure that publishes
    the website: who we are, what we do, presenting our team\...

-   "**contact**" function: provide a contact and exchange interface for
    visitors: contact form, registration form, FAQ\...

-   "**interface**" function: to provide an interface for feeding and
    maintaining the database that justified the creation of the site,

-   **"community**" function: offering collaborative tools for editors
    who feed the database or produce content for the site.

COOP\''s structure is designed to meet all these functions.','hero','EN',4,'yes','2024-12-05 17:03:05','2025-03-05 17:05:06');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (32,'CO-OP une plateforme pour faciliter le travail collaboratif autour d''un projet','CO-OP entre dans la catégorie PSM : Project Management
System. Il existe de nombreuses applications de gestion de projets.
Elles se distinguent entre elles par les finalités recherchées et le
contexte métier dans lesquelles elles sont déployées.

CO-OP vise surtout l''analyse des interventions des acteurs à chaque
niveau du projet. CO-OP a été conçu dans le contexte spécifique de
conduite de chantiers de rénovation de bâtiment avec des équipes mixtes
de professionnels et non professionnels (démarche ARA : auto
réhabilitation accompagnée). Il serait possible d''enrichir CO-OP avec
des tables sur les matériaux et services de manière à pouvoir mettre une
analyse plus complète incluant le détail des coûts.

CO-OP peut toutefois être transposer à d''autres types de projet
sstructurés autour de la notion de lots de travaux/tâches et de
séquences/tâches.

Un autre aspect de CO-OP est de proposer un espace virtuel de travail,
un « hub » autour du projet avec des modules de planification des
réunions, de gestion de la documentation, un forum. Cela évite la
dispersion souvent constatée entre un outil de gestion de projet, des
documents dispersés ici et là, un outil de messagerie séparé...

CO-OP ne vise pas les projets complexes. Il privilégie une interface
sobre et ergonomique pour une possible alternative à la gestion de
projets avec des feuilles de calcul sous excel® ou calc® . Ces outils
sont très simples d''emploi mais marquent des limites. SQLPAge qui permet
d''exploiter une vraie base de données, permet de dépasser ces limites.','hero','FR',5,'yes','2024-12-05 17:03:58','2025-03-05 17:09:30');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (33,'CO-OP a digital coworking place to develop projects','The project module falls into the PSM category: Project Management
System. There are many different project management applications. They
can be distinguished from one another by their intended purpose and the
business context in which they are deployed.

CO-OP main aim is to analyze the actions of players at every level of
the project. CO-OP was designed for the specific context of building
renovation projects involving mixed teams of professionals and
non-professionals (ARA: auto réhabilitation accompagnée). It would be
possible to enrich CO-OP with tables on materials and services in order
to provide a more complete analysis, including detailed costs.

CO-OP can, however, be transposed to other types of project structured
around the notion of work packages/tasks and sequences/tasks.

Another aspect of CO-OP is that it offers a virtual workspace, a "hub"
around the project, with modules for scheduling meetings, managing
documentation and a forum. This avoids the dispersion often seen between
a project management tool, documents scattered here and there, a
separate messaging tool...

CO-OP is not designed for complex projects. It favors a sober, ergonomic
interface as a possible alternative to project management with excel® or
calc® spreadsheets. These tools are very easy to use, but have their
limitations. SQLPAge, which allows you to use a real database, overcomes
these limitations.','hero','EN',6,'yes','2024-12-05 17:04:52','2025-03-05 17:07:54');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (34,'Préambule','La compagnie **Anonymous international** est une association déclarée sous la loi du 1er juillet 1901, à but non
lucratif. Le présent document fixe les conditions générales de vente pour les prestations de service fournies par la
compagnie (cession de spectacles, interventions de comédiens, formation, action culturelle…) ainsi que la vente de
billets pour les spectacles organisés par la compagnie (billetterie). La compagnie déclare être en règle vis-à-vis des
obligations liées à l’activité de spectacle vivant, et être titulaire des licences d’entrepreneur du spectacle de catégorie 2
et 3 ou équivalent.
En l’absence de dispositions contractuelles plus précises, le droit commun s’applique aux contrats passés avec la
compagnie.
Le présent document est scindé en deux parties distinctes. La première est liée aux prestations de services. La
seconde à la vente de tickets dans le cadre de billetteries de spectacles.
Il est entendu par “prestations de services”, de manière non-exhaustive : la vente spectacles (contrats de cession), les
prestations de formation, les interventions de comédiens sous forme d’improvisation ou non, les ateliers, stages et
formations (en dehors des ateliers hebdomadaires organisés par la compagnie elle-même), les prestations
d’accompagnement, les actions culturelles ou de médiation…
Il est entendu par “billetterie” les cas où la compagnie elle-même est chargée de l’organisation de la billetterie d’un
spectacle (notamment lorsqu’elle est organisatrice de la représentation). Les conditions de vente évoquées dans la
partie “billetterie” ne sauraient donc être appliquées aux représentations de spectacles de la compagnie organisés par
des tiers, ceux-ci ayant leurs propres conditions de billetterie.','CGV','FR',1,'yes','2024-12-17 10:16:10','2024-12-17 10:44:45');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (35,'PARTIE I - PRESTATIONS DE SERVICE','Les présentes conditions de vente s''appliquent de plein droit et sans restrictions à toutes les prestations de services effectuées à compter du 1er septembre 2018. Elles sont susceptibles de modifications sans préavis. Les présentes conditions sont acceptées sans restriction par le client qui fait appel aux services de la compagnie. 

## I. ENGAGEMENT DE LA COMPAGNIE

1. Il est entendu que la compagnie ne s’engage à intervenir qu’après la production d’un accord écrit et officiel de la part du client (a minima la  signature d’un devis). Dans le cas où des négociations auraient été entamées sans la production d’un tel écrit, le client ne pourra se retourner contre la compagnie si celle-ci n’est plus disponible pour l’intervention visée.

2 . Si un devis signé suffit pour certaines interventions, il est à noter que la cession de spectacles devra impérativement faire l’objet d’un contrat de cession. 

3 . Nos devis sont valables 6 semaines à compter de leur date d’édition.

4 . Dans le cas où une intervention aurait lieu sans signature du client (retard ou oubli) malgré son accord oral ou écrit, des frais de pénalité à hauteur de 50 € TTC seront facturés en sus du prix de la prestation afin de couvrir les frais engendrés.','CGV','FR',2,'yes','2024-12-17 10:18:47','2024-12-17 10:44:54');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (36,'II. FRAIS ANNEXES À LA PRESTATION','1 . Le client, dans le cas d’un contrat de cession de spectacle, devra s’assurer des formalités déclaratives vis-à-vis des droits d’auteurs et droits voisins liés à la représentation, et du règlement de ces droits.

2 . Des frais de déplacements, d’hébergement et de repas peuvent s’appliquer pour les prestations de service réalisées en dehors du lieu de domicile des intervenants ou de la ville du siège social de la compagnie. Il est à noter que les intervenants peuvent également partir de leur lieu de domicile ou du lieu de leur dernière prestation, auquel cas la facturation des frais de déplacements prendra en compte ce point de départ en lieu et place du siège de l’association. ','CGV','FR',3,'yes','2024-12-17 10:20:18','2024-12-17 10:45:03');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (37,'III . ACCUEIL DE LA COMPAGNIE','1 . L’accueil d’un spectacle de la compagnie est soumis aux conditions énoncées dans la fiche technique, qui fait partie intégrale du contrat de cession.

2 . Si des adaptations et ajustements techniques sont à prévoir pour accueillir le spectacle, le client s’engage à contacter le responsable technique de la compagnie le plus tôt possible afin de s’assurer que ces modifications sont compatibles avec la représentation. La compagnie se réserve le droit d’annuler la représentation dans le cas où l’accueil ne correspond pas à ce qui est demandé dans la fiche technique ou aux ajustements
consentis. Cette annulation n’ouvre droit à aucune indemnité et la prestation est tout de même facturée. 

3 . Dans le cas d’ateliers théâtres organisés par le client, en particulier pour les publics mineurs, le client est seul responsable de la sécurité des bénéficiaires de l’atelier.
','CGV','FR',4,'yes','2024-12-17 10:21:44','2024-12-17 10:45:12');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (38,'IV . ATELIERS ET COURS','1 . Toute inscription aux cours de théâtre organisés par la compagnie est ferme et définitive. L’élève s’engage pour l’année, et aucun remboursement ne saurait être consenti, y compris dans le cas d’un paiement mensuel ou trimestriel.

2 . En cas de retard ou d’arrêt des paiements, la compagnie emploiera la procédure indiquée en V-3.

3 . Tout manquement au règlement intérieur fourni en début d’année peut mener à l’exclusion des cours. Aucun remboursement ne saurait alors être réclamé.','CGV','FR',5,'yes','2024-12-17 10:22:54','2024-12-17 10:45:35');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (39,'V . PAIEMENT','1 . À l’issue de la prestation, une facture est envoyée par mail à au client. Dès l’envoi de cette facture, le client dispose de 30 jours pour la régler.

2 . Le paiement se fait par virement sur le compte de la compagnie. Il n’est possible de régler par chèque qu’avec l’accord exprès de la compagnie.

3 . Toute facture impayée sous 30 jours fera l’objet d’une relance. Dès cette première relance, conformément à l''article L. 441-6 du code de commerce, une indemnité forfaitaire de recouvrement de 4 0 € s e r a automatiquement due, et des pénalités de retard au taux annuel de 20 % commenceront à courir. ','CGV','FR',6,'yes','2024-12-17 10:24:39','2024-12-17 10:45:26');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (40,'VI . RÉCLAMATIONS - LITIGES','1 . Toute contestation, quelle qu''en soit la nature doit être formulée par écrit adressé à la direction Anonymous International.

2 . Nous nous réservons la possibilité d''apporter toutes modifications dans l''ordre, la durée et la distribution du spectacle. D''autre part, nous nous  réservons le droit d''annuler toute représentation qui ne pourrait avoir lieu si des cas fortuits ou des cas de force majeure nous y contraignaient tels que (et sans que cette liste ne soit exhaustive) intempéries, grèves, incendie, dégât des eaux, maladie d''un interprète etc... dans une telle hypothèse nous proposerions une autre date de représentation. 

3 . Dans le cas d’une annulation décidée par l’organisateur, notamment dans le cadre d’une interdiction de rassemblement ou de consignes sanitaires alourdies, la prestation sera intégralement facturée. Un avoir sera ensuite remis à l’organisateur afin qu’il puisse reprogrammer la prestation, ou une autre de son choix.

4 . Le contrat de cession d’un spectacle ne donne aucun droit à un enregistrement du spectacle. Tout enregistrement sous quelque forme que ce soit, y compris photographique, est strictement interdit. Nous nous réservons le droit d''entamer une procédure en réparation des préjudices subis.','CGV','FR',7,'yes','2024-12-17 10:27:15','2024-12-17 10:45:43');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (41,'PARTIE II - BILLETTERIE','Les présentes conditions de vente s''appliquent de plein droit et sans restrictions à toutes les réservations effectuées pour des représentations à compter du 1er septembre 2018. Elles sont susceptibles de modifications sans préavis. La réservation de places par le client ou le règlement des places implique son adhésion sans réserves aux présentes.','CGV','FR',8,'yes','2024-12-17 10:28:24','2024-12-17 10:45:50');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (42,'I. TARIF ET DÉTERMINATION DES PLACES','1. Le tarif et la situation des places sont affichés sur la plateforme HelloAsso, sur les éléments de communication du spectacle, ainsi qu’au guichet le soir du spectacle ou communiqués sur simple demande. Tous les tarifs sont susceptibles de modification sans préavis. Ils sont validés uniquement après confirmation de notre part du règlement demandé. Les éventuelles réductions et opérations de promotion organisées sont annoncées par voie de presse et/ou d''affichage. Il appartient aux spectateurs qui entendent s’en prévaloir d''en réclamer l''application au moment de la réservation des places ou de leur achat en billetterie.

2 . Le spectateur doit être présent au plus tard 20 minutes avant l’heure annoncée de début du spectacle. Le public entre en salle 15 minutes avant le début de la représentation. Toute place non-retirée 20 minutes avant le début de la représentation est susceptible d’être remise en vente, et ce même si un paiement avait été encaissé pour ces places. Anonymous International se réserve le droit de refuser l’entrée à un spectateur ne  espectant pas ces délais.

3. Les prix des places indiqués sont les prix pratiqués pour des billets au tarif normal achetés sur place, directement au guichet. Pour les billets réservés par tous autres moyens, des frais de réservation peuvent être perçus en sus du prix guichet. Par ailleurs, le pourboire éventuellement consenti par l’acheteur à la plateforme HelloAsso n’est en aucun cas lié à Anonymous International.

4. Les billets émis sont uniques et nous ne pouvons en délivrer de duplicata.

5. Le billet électronique émis par HelloAsso représente une preuve de paiement qui ne dispense pas l’acheteur de retirer un ticket le soir de la  représentation.

6. Le placement est libre. Ne sont réservées que des places pour les personnes à mobilité réduite, et, éventuellement, pour quelques professionnels ou
partenaires invités. 

7. Le spectacle débute à l''heure indiquée sur les billets. Les horaires annoncés sont susceptibles de modifications sans préavis. Seul l''horaire porté sur le billet est garanti. Aucun remboursement ne sera consenti aux spectateurs retardataires.

8. Les billets émis ne sont ni repris ni remboursés. Ils sont valables uniquement pour la représentation pour laquelle ils ont été émis. En cas ''annulation de la représentation de notre fait, ils peuvent être échangés pour une autre date en fonction de la disponibilité des places, mais en cas d''interruption d''une représentation après la première moitié du spectacle ils ne pourraient être ni échangés pour une autre date, ni remboursés.

9. Nos prix sont établis en euros et nous n''acceptons pas les règlements dans d’autres devises.
','CGV','FR',9,'yes','2024-12-17 10:32:49','2024-12-17 10:46:00');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (43,'II . RÉSERVATION - DÉLAIS DE PAIEMENT','1. Toute place réservée par mail ou par téléphone est considérée comme due, même en cas d’absence au moment de la représentation. Une facture correspondant au montant des places réservées sera dans ce cas envoyée après la représentation. Anonymous International se réserve le droit de remettre en vente toute place réservée et non retirée 20 minutes avant le début de la représentation.','CGV','FR',10,'yes','2024-12-17 10:34:13','2024-12-17 10:46:08');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (44,'III . ANNULATIONS','1. Nous n''acceptons aucune annulation après paiement des places par le client. En matière de spectacle, la jurisprudence considère que le rapport qui s''établit entre la structure qui annonce un spectacle, indique le prix des places et l''heure de représentation et le public qui achète un billet, quel que soit ensuite le mode de paiement (espèces, chèque, carte de crédit, mandat), est un rapport contractuel. Dans ces conditions, ce n''est que si l''entreprise de spectacle ne remplit pas son obligation que le spectateur peut demander le remboursement ou contester le contrat. Le règlement
par carte bancaire des places spontanément achetées par les spectateurs n’est pas assimilé aux ventes à distance de produits ou de prestations de service et ne peut s''appliquer au contrat passé entre le spectateur et Anonymous International','CGV','FR',11,'yes','2024-12-17 10:35:49','2024-12-17 10:46:17');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (45,'IV . RÉCLAMATIONS - LITIGES','1. Toute contestation, quelle qu''en soit la nature doit être formulée par écrit à la direction d’Anonymous International.

2. Le nombre de billets doit être vérifié par le client au moment où ils sont délivrés par notre personnel. Aucune réclamation ultérieure ne pourra être prise en compte.

3. Nous nous réservons la possibilité d''apporter toutes modifications dans l''ordre, la durée et la distribution du spectacle. D''autre part, nous nous réservons le droit d''annuler toute représentation qui ne pourrait avoir lieu si des cas fortuits ou des cas de force majeure nous y contraignaient tels que (et sans que cette liste ne soit exhaustive) intempéries, grèves, incendie, dégât des eaux, maladie d''un interprète etc... dans une telle hypothèse nous proposerions une autre date de représentation.

4. Nous déclinons toute responsabilité pour les dommages quelle qu''en soit la nature qui seraient susceptibles d''atteindre les effets, objets ou  matériels apportés par les spectateurs. Les spectateurs sont responsables de tout dommage direct ou indirect qu''ils pourraient causer à l''occasion de leur présence durant la représentation.

5. Les billets ne donnent aucun droit à un enregistrement du spectacle. Tout enregistrement, sous quelque forme que ce soit, y compris  photographiquement est strictement interdit. Nous nous réservons le droit d''entamer une procédure en réparation des préjudices subis','CGV','FR',12,'yes','2024-12-17 10:38:05','2024-12-17 10:46:32');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (46,'1. Préambule','## 1.1. Contexte du développement de COOP

COOP est le résultat d''un parcours d''apprentissage de sql via SQLPage
par un « no-pro » (le développement informatique n''est pas mon métier et
ma culture informatique est très limitée). L''objectif était de
développer un site web complet, fonctionnel, dynamique (tous les
contenus gérés à partir de tables). L''argument de cette base de données
est le suivi de chantiers de réhabilitation de bâtiments dans le cadre
de chantiers participatifs associant des professionnels et des
particuliers. Le suivi et la coordination de ces chantiers sont assurés
par des associations indépendantes organisées en réseau. Cela explique
le nom du site et le volet consacré au travail collaboratif (voir volet
C plus loin).

Le code de COOP est très simple : utilisation de SQLITE comme moteur de
gestion de base de données, requêtes SQL de base (requêtes
élémentaires : pas d''utilisation de triggers, pragma...), SQLPage socle
(pas de composants « custom », pas de scripts), une écriture des
requêtes très scolaire, des noms de fichiers et de dossiers très
explicites...

Il doit traîner des erreurs dans le schéma de la base de données et dans
l''écriture de certaines requêtes.

## 1.2. Utilisations possibles de COOP

### 121. Un objet de curiosité

COOP permet de voir une manière possible de construire un site web
    avec SQLPage. Certains aspects peuvent constituer une source
    d''inspiration. Cela complète les exemples mis en avant [dans la
    documentation officielle de
    SQLPage](https://sql-page.com/documentation.sql) ou dans des
    tutoriels comme [LearnSQLPage](http://learnsqlpage.com/).

### 122. Bac à sable

COOP est le résultat d''un parcours d''apprentissage ; il se prête bien à
une utilisation comme bac à sable pour d''autres « no-pro » souhaitant se
familiariser avec l''application SQLPage, le langage SQL et la conception
de site web pour accueillir une base de données spécifiques.

Le développement de COOP n''a impliqué que des logiciels libres et
gratuits (voir le menu ''nos sponsors'' dans le site).

Les principales sources de documentation utilisées ont été :

-   [documentation SQLPage](https://sql-page.com/documentation.sql)

-   [espace de discussion
    SQLPage](https://github.com/sqlpage/SQLPage/discussions)

-   divers sites de tutoriels et forums centrés sur SQLITE, SQL, CSS...
    (**merci à tous les contributeurs!**)

-   et pour tester, un site gratuit d''IA . Le recours à l''IA est, à
    court terme, assez efficace, pour un débutant isolé, pour corriger
    la syntaxe de requêtes SQL ; toutefois il faut rester conscient du
    coût environnemental de l''IA et de sa dimension prédatrice, car elle
    se nourrit du travail de ceux qui rédigent des tutoriels ou
    fournissent des réponses sur les forums. Et, en efficacité réelle,
    il est finalement plus efficace de s''astreindre à suivre un cours
    complet sur le SQL ou acheter un ouvrage de référence que de devenir
    dépendant d''un moteur de recherche IA. L''IA appliquée au code
    informatique, c''est comparer la pizza surgelée à la pizza faite
    maison, c''est vite fait, cela présente bien mais au final c''est plus
    cher et pas forcément meilleur.

### 121. Socle pour une version de production

***Avertissement** : COOP est certes fonctionnel, mais il serait peu
prudent de l''employer pour une version de production. On peut en
utiliser, à la limite, des parties, par exemple, le volet A (voir COOP
structure générale) pour mettre en ligne une base de données maison.
Mais, avant d''envisager d''utiliser COOP en totalité ou en partie pour
une version de production, il faudrait d''abord en faire relire le code
et le schéma par un pro.*

Par ailleurs, pour des raisons de faciliter et d''apprentissage, COOP a
été développé sur sqlite. Or ce type de moteur de base de données n''est
pas optimum pour des connexions simultanées, ce qui est pourtant la
spécificité de COOP (voir plus loin les « community tools »). Pour une
version de production, il faudrait engager une migration vers
postgresql. Mais cette migration n''est pas triviale ,car elle
impliquerait :

-   revoir les formats des données (sqlite est assez simpliste sur cet
    aspect alors que postgresql est plus sophistiqué),

-   revoir certaines requêtes (json object...) car sqlite et postgresql
    ne respectent pas la même syntaxe

-   revoir le système de gestion des permissions (voir plus loin droits
    permissions privilèges) qui sont gérées au niveau des tables
    elles-mêmes dans postgresql.

Enfin, il faudrait tout de même intégrer quelques scripts pour assurer
certaines fonctions, par exemple, pour assurer  :

-   une authentification à double niveau,

-   la gestion des mots de passe oubliés,

-   l''envoi de mails et de notifications,

-   le paramétrage des impressions,

-   la gestion des tâches de maintenance de la base.

## 1.3. Problèmes divers et bugs

### 1.3.1. Internationalisation

Je suis francophone et le contenu des *labels, contents, contents_md*...
est en français. SQLPage n''inclut pas, en version de base, de
fonctionnalité d''internationalisation (cela est envisageable via des
scripts). Mais tous les navigateurs web récents incluent des
fonctionnalités de traduction instantanée qui rendant inutile la
traduction des contenus en amont dans le code du site. Toutefois, les
listes de choix sont gérées à partir de 2 tables (choice_categories,
choice_items) ce qui facilite l''adaptation éventuelle de celles-ci.

Par contre, le parti a été pris de nommer les tables, les dossiers, les
fichiers en « globish » (global english aka broken english!) qui est la
norme dans les langages informatiques comme le sql, html, css, SQLPage,
... Cela permet une utilisation de COOP par des non francophones..

### 1.3.2. Bugs

Autant que possible COOP a été débogué, mais il doit subsister encore
ici et là des bugs. SQLPage inclut un moteur de vérification assez
efficace qui permet de localiser ceux-ci. Mais parfois on peut arriver
sur une page blanche. La cause est souvent liée soit à ;

-   un chemin incorrect

-   l''absence d''un argument type « myparemeter_id » dans un chemin
    (myfile.sql?myparameter_id=''\|\|\$myparameter)

-   une requête dans une colonne contenant une valeur NULL.','help-dev','FR',1,'yes','2024-12-19 18:19:18','2025-02-22 12:29:16');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (47,'0. Pour les impatients','Si vous ne connaissez pas [l''expression
RTFM](https://fr.wikipedia.org/wiki/RTFM_(expression)) vous pouvez
directement découvrir le site web COOP soit comme simple visiteur (non
connecté) soit en utilisant successivement les différents statuts
possibles : viewer, editor, supervisor, admin.

L''installation de COOP est classique :

-   télécharger l''ensemble du dossier COOP depuis Github

-   coller ce dossier dans /var/www

-   libérer les droits d''écriture sur les sous dossiers ayant un préfixe
    « x\_ » (ils sont utilisés pour le téléchargement de documents ou
    d''images)

-   dans le terminal, se placer dans le dossier COOP : /var/www/coop

-   lancer SQLPage : /var/www/sqlpage/sqlpage.bin

-   dans votre navigateur se rendre à : http://localhost:8080/

-   commencer la visite.

Pour changer de rôle, il suffit d''utiliser les identifiants suivants :

-   viewer1@coopcoop.net

-   editor1@coopcoop.net

-   supervisor1@coopcoop.net

-   admin1@coopcoop.net

avec le mot de passe : CoopCoop1

Vous pouvez créer de nouveaux utilisateurs, mais vous devrez passer
ensuite en mode « admin » pour fixer les droits des nouveaux
administrateurs.

Dans le panneau administrateur, vous trouverez un menu « Help Dev » avec
la documentation embarquée de COOP.

Pour compléter la démo, dans les panneaux d''administration admin,
supervisor et editor, vous trouvez les liens vers des flux RSS (voir le
principe de ces flux dans Help-Dev).
','help-dev','FR',0,'no','2025-01-11 15:24:09','2025-02-22 12:30:33');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (48,'2. COOP structure générale','Il existe de nombreuses applications commerciales ou open source,
no-code pour répondre aux besoins les plus classiques attendues d''un
site web . Mais il existe des cas où la structure de la base de données
est trop spécifique pour que l''on puisse utiliser une de ces
applications. Il faut donc construire le site web autour de la base de
données. C''est la finalité de SQLPage dont un gros atout est d''être une
application à « code simple » accessible à des personnes dont le
développement informatique n''est pas le cœur de métier mais qui ont
besoin de mettre en ligne une base de données spécifiques.

Mettre en ligne une base de données ne se limite pas à la mise en ligne
des données proprement dites. Il faut aussi assurer le développement des
autres fonctions périphériques attendues d''un site web :

-   **fonction « admin » **: administrer le site web : gérer des droits
    des utilisateurs, assurer la maintenance,

-   **fonction « corporate »** : présenter la structure éditrice du site
    web : qui nous sommes, quelles sont nos activités, présentation de
    notre équipe...

-   **fonction « contact » **: offrir une interface de contact et
    d''échange avec les visiteurs : formulaire de contact, formulaire
    d''inscription, FAQ...

-   **fonction « interface» **: offrir une interface pour alimenter et
    maintenir la base de données qui a justifié la création du site,

-   **fonction « community » **: offrir des outils collaboratifs pour
    les rédacteurs qui alimente la base de données ou produisent les
    contenus sur le site.

La structure de COOP, tente de répondre à toutes fonctions. Les dossiers
sont organisés d''une manière logique avec un système de repérage des
fonctions par des suffixes alphabétiques.

-   Le premier groupe couvre des fonctions non-spécifiques

    -   **groupe A suffixe /a\_ **: modules admin de gestion du site :
        sessions, users, infos, rss...

    -   **groupe B suffixe /b\_ **: modules corporate et contact avec
        les visiteurs 

    -   **groupe C suffixe /c\_** : modules community : forum, chat,
        wokspaces...

-   et un second groupe de dossiers spécifiques à COOP dont la
    thématique est la gestion de projets de réhabilitation accompagnée
    de logements (fonction interface) :

    -   **groupe D suffixe /d\_** : modules PRM (project relationship
        management)

    -   **groupe E suffixe /e\_** : modules PMS (project management
        system)

-   Enfin, les documents, images... sont regroupés dans des dossiers
    particuliers :

    -   **groupe X suffixe /x\_** : modules de stockage des documents.

Pour arriver à mettre en ligne une base de donnée spécifique (groupe D
et E), il faut assurer aussi le développement des autres volets et au
moins les modules du groupe A.
','help-dev','FR',2,'yes','2025-02-22 08:38:59','2025-02-22 08:38:59');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (49,'3. COOP approche modulaire','## 3.1. Principe général

Par module, on entend tous les éléments qui vont permettre de créer une
fonctionnalité particulière. Chaque volet A, B, C, D, E correspond à un
ensemble cohérent de modules.

## 3.2. Module simple

Un module simple est constitué de :

-   une table

-   un dossier simple (voir contenu des dossiers) contenant les fichiers
    permettant la création, l''édition, la publication et la suppression
    des données,

-   un lien dans la barre des menus

-   un lien dans le tableau d''administration des admins, des
    superviseurs ou des éditeurs suivant le cas

Exemple de module simple : **news** (dossier /b_news) qui permet la
publication d''articles soit sur le site public soit sur le site interne.

## 3.3. Module complexe

Un module complexe est constitué de :

-   plusieurs tables parfois liées par des contraintes (clés étrangères)

-   plusieurs dossiers contenant les fichiers permettant la création,
    l''édition, la publication et la suppression des données dans chaque
    table,

-   un lien dans la barre des menus

-   un lien dans le tableau d''administration des admins, des
    superviseurs ou des éditeurs suivant le cas

exemple de module complexe : **workspaces** (dossier /c_wokspaces) qui
associe des tables permettant la gestion d''un forum, de chat, de partage
de documents et d''organisation de réunions.

## 3.4. Dépendance entre les modules

Même pour les modules simples, il y a des liens de dépendance :

-   **tous les modules dépendent des modules du groupe A : users,
    sessions, shells, panels, info**

-   il y a des liens de dépendance entre certains modules à l''intérieur
    du groupe B (exemple : les tables members, orga_dept, events, place,
    place_space dépendent de orga)

-   il y a des liens de dépendance entre certains modules du groupe C
    avec des tables du groupe B (meetings et workmeetings, dépendent ,
    place_space donc d''orga et orga-dept)

-   les modules du groupe D ne dépendent que des modules socles du
    groupe A

-   les modules du groupe E dépendent des modules du groupe D et des
    modules socles du groupe A

On peut visualiser les liens de dépendances en parcourant les tables
pour repérer les références à une table externe souvent (mais pas
toujours) à une clé étrangère.

La suppression de certains enregistrements d''une table impliquent la
suppression des enregistrements liés dans d''autres tables. Dans ce cas
de figure, dans COOP, un message d''alerte est systématiquement affiché
avant la suppression d''un enregistrement parent. Un champ
« my_table_status » a été introduit dans la plupart des tables. Il
permet d''archiver un enregistrement plutôt que de le supprimer. Pour les
tables de type users, members... il est prévu une anonymisation des
données qui peut être utilisée quand une personne demande la suppression
de ses données personnelles dans la base de données.

## 3.5. Clonage des modules

Si l''on respecte une certaine constance dans le nommage des tables, des
colonnes, des dossiers et des fichiers, il est possible de créer un
nouveau module, par une succession de copie/coller/renommer à partir de
la structure d''un module de référence. Cela n''évite pas un travail de
codage si l''on ajoute ou l''on retire des colonnes à certaines tables
mais cela permet de gagner un temps certain sur le codage général du
module','help-dev','FR',3,'yes','2025-02-22 11:22:12','2025-02-22 11:22:12');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (50,'4. Droits Permissions Privilèges des utilisateurs','## 4.1. Permissions CRUD

COOP distingue plusieurs rôles pour les utilisateurs connectés :

-   **viewer** : ce rôle permet d''accéder à la lecture des informations
    internes (news, agenda, FAQ) et de poster dans le forum

-   **editor**: ce rôle permet de lire, créer et éditer des contenus

-   **supervisor**: ce rôle permet de lire, créer, éditer et supprimer
    des contenus

-   **admin**: ce rôle est surtout dédié à la gestion du site et il a
    surtout un pouvoir de contrôle sur les utilisateurs.

Les utilisateurs créent leur compte et leur mot de passe eux-mêmes. Par
défaut, ils n''ont aucun rôle. Leur niveau de permission sera décidé par
l''admin. Il n''y a donc à aucin moment de circulation des mots de passe
et ceux-ci ne sont pas stockés dans la base (seulement le
hash_password).

L''admin est informé qu''il y a une demande de création de compte via un
flux RSS dédié (/a_rss_feed/rss_new_users_5.sql).

Le filtrage d''accès aux fichiers sql est assuré au niveau d''un composant
« shell » spécifique :

-   /a_shells/shell_2.sql pour les viewers

-   /a_shells/shell_3.sql pour les éditeurs

-   /a_shells/shell_4.sql pour les superviseurs

-   /a_shells/shell_5.sql pour les admins

Chaque shell après vérification du rôle de l''utilisateur, appelle un
shell_core (/a_shells/shell_core.sql) qui va permettre l''affichage du
menu des permissions de l''utilisateur.

Pour se repérer facilement dans les fichiers en fonction des niveaux de
droits, le principe adopté est celui d''utiliser des suffixes à la fin du
nom du fichier :

-   /news_private_display_3.sql : fichier éditeur pour liste les news
    internes

-   /news_private_display_4.sql : fichier superviseur pour liste les
    news internes (identique au précédent mais avec une fonction DELETE
    en plus)

-   Les fichiers avec un suffixe \_1₁ concernent des fichiers
    accessibles à tout utilisateur connecté (exemple :
    /a_panels/panel_user_1.sql pour l''actualisation du profil de
    l''utilisateur).

-   Les fichiers avec un suffixe \_0 concernent des fichiers de
    traitement intermédiaires (INSERT, UPDATE, DELETE) sans en tête.

-   Les fichiers sans suffixe concernent les fichiers liés aux visiteurs
    du site, non-connectés.(exemple :
    /var/www/SQLPage/b_about/orga_about.sql pour le menu « qui sommes
    nous ? »)

## 4.2. Permissions Niveaux et Groupes

COOP inclut la possibilité de gérer 2 autres types de permissions :

-   **niveau (L)** : permission d''accès à certains champs d''une table ou
    à une table fille particulière d''une table principale

-   **groupe**  **(G)**: permission sur tous les champs d''une table mais
    pour seulement une partie des données

Pour comprendre l''utilité possible de ces deux filtres, imaginons un
club sportif avec 2 sections : football et rugby :

-   on attribue une permission CRUD « viewer » aux adhérents, ils
    peuvent consulter les nouvelles internes, intervenir sur le forum...
    mais n''ont aucun accès sur les données concernant les joueurs

-   on attribue une permission CRUD « editor » aux coachs sportifs, aux
    soigneurs, aux comptables

-   on attribue une permission CRUD « supervisor » aux dirigeants, au
    médecin et au directeur financier.

-   On peut concevoir la table des données des joueurs de 2 manières :
    soit une table PLAYER avec des champs  : L1_player_sport_data,
    L2_player_medical_data, L3_player_financial_data ou une table
    principale PLAYER (player_id, player_name) et 3 tables liées :
    L1_SPORT (player_id, sport_data), L2_MEDICAL (player_id,
    medical_data), L3_FINANCIAL (player_id, financial_data). On attribue
    ensuite une permission L1 aux coachs sportifs, L2 aux soigneurs, L3
    aux comptables. Cela permet que chaque encadrant ne voit que les
    données qui le concernent (et cela évite que tout le monde ait accès
    aux données médicales ou financières sensibles).

-   Par ailleurs, on peut introduire un champ « group » dans chaque
    table avec comme valeur G1 pour le foot et G2 pour le rugby. Un
    coach G1 ne pourra consulter et éditer que les données de niveau 1
    (données sportives) pour les joueurs de foot. On peut mettre en
    place aussi des requêtes CREATE telle qu''un enregistrement créé par
    un coach G1 prendra automatiquement la valeur G1.

-   Pour les dirigeants on peut garder le filtre L (les données
    médicales ne sont visibles que par un médecin) mais on peut leur
    donner accès à tous les joueurs, avec des droits de suppression des
    données.

La combinaison des trois types de permissions (CRUD, L, G) permet de
couvrir un très grand nombre de cas de figures. Dans une entreprise, on
peut associer chaque service à un groupe, dans une école on peut créer
des combinaisons entre des classes et des niveaux...

## 4.3.Principe de distribution des droits sur les différents modules

Les droits sont répartis par volet :

-   modules du volet /a\_ : admin (5) *administration générale du site,
    gestion des utilisateurs, debug, ...*

-   modules du volet /b\_ superviseur (4) *contenus généraux,
    descriptions des organisations et des membres, validation des
    événements...*

-   modules du volets /c\_ : tous les utilisateurs connectés (1) avec
    une modération ultime de l''administrateur (5)

-   modules des volets /d\_ et /e\_ : les éditeurs (3) avec une
    modération des superviseurs (4)

COOP ne valorise pas les filtres L et G. Cela aurait pu être possible
sur les modules PRM et projet pour séparer les équipes ou affecter
certaines équipes à certains travaux ou encore répartir les équipes en
fonction de la localisation des bâtiments.','help-dev','FR',4,'yes','2025-02-22 11:25:23','2025-02-22 11:30:00');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (51,'5. Dossiers et fichiers','## 5.1. Nommage des dossiers

Les dossiers regroupent les fichiers d''un même module ou sous module
(voir approche modulaire).

Le nommage des fichiers repose sur :

-   un suffixe qui permet de repérer le profil de l''utilisateur sans
    avoir à ouvrir le fichier (voir permissions CRUD)

-   un rappel du nom de la table

## 5.2. Nommage des fichiers

Le nommage des fichiers repose sur :

-   un terme qui évoque intuitivement la table associée au module,

-   un terme qui évoque le volet du module : main, archive, doc....,

-   un terme qui évoque la requête sql ou le composant SQLPage,

-   un préfixe en rappel de la section à laquelle le dossier se rattache
    (voir COOP structure générale).

Exemple :

-   **my_table_main_display_4.sql** → le fichier ne peut être ouvert que
    par un utilisateur ayant des droits de superviseur, il concerne la
    table/module « my_table », « main » signifie que l''on est sur le
    traitement central du module et display que la requête est soit un
    composant table ou list,

-   **my_table_archive_display_4.sql** → le fichier ne peut être ouvert
    que par un utilisateur ayant des droits de administrateur, il
    concerne la table/module « my_table », « archive» signifie que l''on
    est sur des colonnes où la valeur de
    « may_table_status »= »archived » et display que la requête est soit
    un composant

-   **my_table_main_create_0.sql** → le fichier est un fichier de
    traitement, sans en tête, avec une requête CREATE. il concerne la
    table/module « my_table ».

Cela conduit à des noms de chemins de fichiers assez lourds mais cela
rend la lecture assez intuitive (inutile d''ouvrir le fichier pour
connaître son contenu et son rôle) et cela évite les confusions
possibles entre des modules qui sont presque jumeaux (exemple les
modules forum et debug). Cela est donc surtout utile lors de la
conception du site web surtout si cette conception se déroule en mode
collaboratif.

La constance dans le nommage des fichiers facilite le clonage des
modules. Il suffit de conduire une série de copier/coller/renommer pour
créer un nouveau module à partir d''un module de référence.

## 5.3. Contenu des dossiers

Le dossier contient une série de fichiers que l''on peut désigner comme
le cœur du module et que l''on repère par le term « main ». Par exemple :

-   **my_table_main_display_4.sql :** la liste ou la table qui permet de
    visualiser les données de la table (le 4 indique que ce fichier en
    pourra être ouvert que par un superviseur avec une permission
    DELETE)

-   **my_table_main_display_3.sql :** la liste ou la table qui permet de
    visualiser les données de la table (le 4 indique que ce fichier en
    pourra être ouvert que par un éditeur avec une permission de
    lecture, création et modification)

-   **my_table_main_form_3.sql :** le formulaire qui permet de créer les
    données

-   **my_table_main_edit_3.sql :** le formulaire qui permet d''actualiser
    les données

-   **my_table_main_form_4.sql :** le formulaire qui permet de créer les
    données (le superviseur peut avoir accès à certains champs
    supplémentaires par rapport à l''éditeur. Par exemple, c''est lui qui
    maîtrise le champs « my_table_status » qui autorise la mise en ligne
    ou l''archivage d''un enregistrement).

-   **my_table_main_edit_4.sql :** le formulaire qui permet d''actualiser
    les données

-   **my_table_main_create_0.sql :** le traitement d''insertion des
    données dans la base

-   **my_table_main_update_0.sql :** le traitement d''insertion des
    données dans la base

-   **my_table_main_delete_0.sql :** le traitement qui permet
    l''effacement des données dans la base

Autour du cœur « main » du dossier, suivant la complexité du module, on
crée avec la même logique les fichiers liés aux fonctions secondaires :

-   **my_table_doc_display_4.sql :** si la fonction principale du module
    est la description d''une entreprise, les fichiers « doc » concernent
    le traitement des documents associés à chaque entreprise

On peut aussi avoir des fichiers pour des fonctionnalités
particulières :

-   **my_table_archive_display_4.sql :** viiualisation des données
    archivées

-   **my_table_anonym_0.sql :** traitement pour anonymiser des données
    (pour éviter la suppression de données dans des tables avec des
    contraintes de clés étrangères)

-   **my_table_csv_0.sql :** traitement pour l''exportation csv des
    données.

On peut ajouter systématiquement un fichier 404.sql dans chaque dossier.
Cela est assez utile pendant le développement où l''on peut faire des
erreurs sur les chemins.

Certains dossiers de COOP contiennent beaucoup de fichiers. Cela résulte
d''un choix d''appliquer le principe d''une fonction/fonctionnalité par
fichier. On pourrait avoir une application plus compacte en regroupant
plusieurs fonctions dans un même fichier mais COOP est un exercice
d''apprentissage où la lisibilité a été préférée à la performance.

## 5.4. Contenu des fichiers

Les fichiers ont une structure type :

-   **un entête** avec un filtre sur le niveau de permission de
    l''utilisateur  (SELECT \''dynamic\'' AS component,
    sqlpage.run_sql(\''a_shells/shell_5.sql\'') AS properties;)

-   (en option) la déclaration de **quelques variables** (SET
    my_variable =\...)

-   **un chemin de navigation **: (select \''breadcrumb\'' as component; )
    ou **un panneau de gestion (**select \''datagrid\'' as component;) ou
    des boutons / alertes (select \''button'' as component; ), (select
    \''alert'' as component; ),

-   **le composant principal **: (select \''form'' as component; ), :
    (select \''table'' as component; ) : (select \''list'' as component; )
    \...avec un lien vers le ou les fichiers de traitement
    (create_0.sql, delete_0.sql\...)

Les fichiers de traitement avec un suffixe ₀ ont une structure plus
simple :

-   pas d''entête

-   (en option) la déclaration de **quelques variables** (SET
    my_variable =...)

-   une **requête SQL **: INSERT, UPDATE, DELETE

-   un retour (select \''redirect\'' AS component,)

Dans les fichiers de traitement, les listes des champs sont souvent
rédigées avec un champ/une ligne ; cela facilite la lecture et la
correction).','help-dev','FR',5,'yes','2025-02-22 11:26:03','2025-02-22 11:26:03');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (52,'6. Structures des tables','## 6.1. Nommage des tables et des colonnes

Le parti a été pris de nommer les colonnes de manière la plus explicite
possible, avec un rappel du nom de la table dans le nom de la colonne.
Cela alourdit l''écriture des requêtes mais d''une part cela facilite la
lecture de celle-ci et d''autre part cela évite les ambiguïtés entre les
tables (exemple : user_first_name ne peut être confondu avec
member_first_name) ou des confusions entre le nom d''une colonne et des
termes réservés (exemple : user_role ne peut être confondu avec le terme
réservé rôle).

## 6.2. Structures des tables

Si l''objectif est de publier des données dans le cadre d''un site web, la
structure des tables doit être adaptée à cet objectif.

Les tables sont construites autour de 4 types de colonnes :

-   les colonnes des clés primaires et étrangères,

-   les colonnes des données,

-   les colonnes de gestion des données,

-   les colonnes des métadonnées.

**Les colonnes des clés primaires et étrangères **: elles permettent de
maintenir la cohérence de la base de données mais dans la gestion du
site web elles vont jouer un rôle important dans l''écriture de chemins
pour la navigation d''un écran à l''autre
(my_file.sql ?table2_id=''\|\|\$table2_id)

**Les colonnes de gestion des données** ont un intérêt particulier dans
le cadre d''un site web qui va servir d''outil de gestion des données, par
exemple :

-   le champ « **my_table_status **» avec les valeurs possibles :
    *online, draft, archived* va permettre de gérer la publication d''une
    donnée.

-   Le champ « **my_table_selected **» avec les valeurs possibles :
    *yes, no* va permettre de faire des sélections sur un groupe de
    données en vue d''une modification par lots,

-   le champ « **my_table_public_private**» avec les valeurs possibles :
    *public, private* va permettre de gérer la publication d''une donnée
    soit sur le site public soit pour des utilisateurs connectés.

-   Le schamps « **my_table_category **» ou « **my_table_type **» vont
    permettre d''utiliser la même table pour 2 modules distincts ou
    mettre en place des filtres dans l''affichage des données.

**Les colonnes de métadonnées** sont des données qui décrivent les
données. On peut donc décrire qui a créé la donnée, quand elle a été
créée, à qui est destinée... Cela peut être utile dans certains
traitements :

-   Les champs «**created_at, modified_at** vont permettre , par
    exemple, de retirer de l''affichage des événements dont la date est
    dépassée,

-   les champs «** author_id** » et « **recipient_id** » vont être
    centraux dans le module « chat »','help-dev','FR',6,'yes','2025-02-22 11:26:41','2025-02-22 11:26:41');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (53,'7. Volet « corporate » et « community »','Le site est conçu pour une gestion dynamique de tous les éléments. La
table info_sections permet d''alimenter les différentes rubriques : CGV,
CGU, mentions légales

Les informations administratives, la composition de l''équipe... sont
liées à une organisation. Le seul réglage initial est de fixer
correctement l''identifiant de cette organisation. Par défaut, le réglage
est orga_id = 1 et orga_dept_id = 1.

La description des organisations étant à 2 niveaux (orga et orga_dept),
il serait possible, si nécessaire, de présenter plusieurs départements
d''une même entreprise (ou plusieurs équipes d''un club de sport, ou
plusieurs classes d''une école).

La gestion des membres de l''organisation permet une gestion élémentaire
des adhérents d''une association. De même le module event permet la
gestion élémentaire de manifestations, réunions\...

Le module « espaces de travail » associe plusieurs modules. Les
chemins vers les fichiers doivent souvent prendre en compte 2
paramètres (par ex : user_id et workspace_id) pour éviter des
ruptures dans les logiques d''affichage et de navigation. Le module
est une version élémentaire et sans prétention de modules qui sont
proposés dans de grandes applications type office365 ou
googleworkspace. Mais au fil des ans ces applications sont devenues
de plus en plus riches en fonctionnalités et sont parfois
surdimensionnées pour des petites communautés de travail.L''accent a
été placé sur l''ergonomie : rejoindre ou quitter un groupe de
travail se fait d''un clic (join_0.sql, quit_0.sql). Le créateur d''un
groupe de travail en devient le coordinateur et il est le seul à
pouvoir créer une réunion, mais il peut aussi désigner un autre ou
plusieurs participants comme co-cordinateurs, ils pourront alors
créer aussi des réunions. Le coordinateur peut décider de fermer le
groupe de travail. Cela revient à passer son statut à « archived »
mais cela ne le supprime pas. Seuls des superviseurs auront la
possibilité de supprimer définitivement un espace de travail.

L''introduction de modules « community » dans COOP participe au
souhait d''avoir tous les outils sous la main dans le cadre de la
gestion d''un projet. On constate souvent une dispersion du travail
des équipes entre une application de gestion de projet, une
application de messagerie, une application de gestion de groupe...
Mais il est difficile de rivaliser avec des applications dédiées et
donc les modules de COOP restent très simples voir simplistes.
','help-dev','FR',7,'yes','2025-02-22 11:27:28','2025-02-22 11:27:28');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (54,'8. PRM : Project Relationship Management','
L''acronyme CRM : Customer Relationship Management est bien connu.
L''approche CRM s''appuie le plus souvent sur une relation binaire :
vendeur_acheteur. Un projet est souvent un travail d''équipe et les
outils basés sur une relation binaire ne suffisent pas.

Dans l''approche PRM on trouve les classiques tables / carnets d''adresses
pour les personnes physiques (PRM1) et les personnes morales (PRM2).
Dans COOP on détaille les employées qui sont les personnes physiques
liées à une personne morale, comme dans les bases HRM (human resources
management). Cela permet d''utiliser COOP par exemple pour constituer des
équipes de joueurs ou gérer la répartition des élèves dans les classes
constituant une école.

COOP introduit une autre table, celle des groupes (PRM3) qui permet
toutes sortes de combinaisons : entre personnes physiques (un couple,
une famille, un groupe de bénévoles), entre des entreprises
(consortium...), entre des entreprises et des personnes physiques. Cette
table permet de résoudre ensuite des problèmes sur le volet intervention
sur des constructions. En effet, une maison est souvent la propriété non
d''une personne mais d''un couple. On peut aussi avoir à faire des travaux
dans un logement partagé par des colocataires. Durant les travaux, il
est courant que des entreprises s''associent temporairement pour répondre
à un appel d''offres. Dans le cas spécifique de COOP, on analyse le suivi
de chantiers réalisés par une famille et des artisans. La table PRM3
permet de gérer des situations comme la comme la constitution d''une
équipe sportive incluant selon le cas seulement les joueurs amateurs ou
les joueurs et les salariés du club sportifs.
','help-dev','FR',8,'yes','2025-02-22 11:27:58','2025-02-22 11:27:58');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (55,'9.  Module Projet','## 9.1. Module Projet : orientation générale

Le module projet entre dans la catégorie PSM : Project Management
System. Il existe de nombreuses applications de gestion de projets.
Elles se distinguent entre elles par les finalités recherchées et le
contexte métier dans lesquelles elles sont déployées.

CO-OP vise surtout l''analyse des interventions des acteurs à chaque
niveau du projet. CO-OP a été conçu dans le contexte spécifique de
conduite de chantiers de rénovation de bâtiment avec des équipes mixtes
de professionnels et non professionnels (démarche ARA : auto
réhabilitation accompagnée). Il serait possible d''enrichir CO-OP avec
des tables sur les matériaux et services de manière à pouvoir mettre une
analyse plus complète incluant le détail des coûts.

CO-OP peut toutefois être transposer à d''autres types de projet
sstructurés autour de la notion de lots de travaux/tâches et de
séquences/tâches.

Un autre aspect de CO-OP est de proposer un espace virtuel de travail,
un « hub » autour du projet avec des modules de planification des
réunions, de gestion de la documentation, un forum. Cela évite la
dispersion souvent constatée entre un outil de gestion de projet, des
documents dispersés ici et là, un outil de messagerie séparé...

CO-OP ne vise pas les projets complexes. Il privilégie une interface
sobre et ergonomique pour une possible alternative à la gestion de
projets avec des feuilles de calcul sous excel® ou calc® . Ces outils
sont très simples d''emploi mais marquent des limites. SQLPAge qui permet
d''exploiter une vraie base de données, permet de dépasser ces limites.

## 9.2. Module Projet : structure

Dans CO-OP, les projets sont composés de lots de travaux
(wokpackages)qui regroupent des séquences (worksequences). Les
workpackages sont des lots de travaux cohérents : le génie civil, le
gros œuvre, la menuiserie, la plomberie... Les séquences de travail sont
les séquences de chantier proprement dites.

L''objet de COOP étant la création ou la rénovation de bâtiment, chaque
projet est associé à un ou plusieurs lieux. Chaque lieu peut être
décomposé en pièces. On peut ainsi relier les séquences de travaux à une
pièce spécifique (ex : chantier école d''installation électrique dans une
cuisine). On peut associer des images à chaque pièce.

SQLPage permet enfin avec le composant chart de visualiser les résultats
sous forme de graphiques (ex : statistique des coûts...) ou de publier
des résultats sur le site public (menu projet).

## 9.3. Module Projet : gestion des droits

La gestion des projets est assurée par les superviseurs et les éditeurs.

Les superviseurs ont tous les droits (création, édition, suppression)
sur les projets et les éléments d''un projet. Ils ont une section
« tableau de bord » dans le hub d''un projet. Ils ont accès au
téléchargement des temps de travail par séquence ou par participant.

Les éditeurs / chargés de projet ne peuvent pas créer de projet ni de
sprint, mais ils peuvent créer tous les éléments d''un projet :
workpackage, worksequence, bâtiment, réunion, document.

Il serait possible de configurer rapidement CO-OP pour mettre des
filtres d''accès suivant le type de projet. On pourrait ainsi répartir
les projets entre les éditeurs en fonction de la nature du projet ou de
leur localisation géographique. Pour cela, il suffirait d''ajouter une
colonne G dans la table projet, un champ de saisie G lors de la création
d''un projet puis ajouter une condition G sur l''affichage des projets. On
réglera alors les droits des éditeurs en G1, G2, G3... Ils ne pourront
alors ne travailler que sur les projets correspondants à leur groupe.

## 9.4. Module Projet : trucs et astuces

**Sprint :** Chaque projet est aussi associé à des phases (sprints).
Cela permet d''établir un calendrier global du projet avec le composant
chart. il serait logique de lier les sprints et les workpackages comme
cela se fait dans les grands projets. Dans COOP, il a été choisi de ne
pas relier les sprints et les workpackages, pour éviter une trop grande
rigidité. Le module sprint permet surtout de visualiser les grandes
phases d''un projet et de les relier à des documents type programme de
travaux...

La mécanique de ce module est basée sur la date de départ (planifiée ou
réelle) et la durée (planifiée ou réelle) d''un sprint. La date de fin
(planifiée ou réelle) est calculée directement à partir de ces deux
données. Un sprint peut être indépendant ou relié à un sprint parent.
Dans ce cas, la date de début planifiée est automatiquement renseignée à
partir de la date de fin planifiée du sprint parent.

En cas de modification de la date de lancement planifiée ou de la durée
d''un sprint qui est parent d''un ou plusieurs autres sprints, alors les
dates de lancement planifiées seront recalculées via un CTE récursive.

On visualise le calendrier des sprints via le composant « chart » sous
forme d''un graphique de GANTT.

Si l''on souhaite marquer des jalons dans la progression du projet, on
peut créer des sprints d''une journée qui permettront de visualiser ces
jalons dans le calendrier. On peut alors passer au module « réunion »
pour fixer la date de la réunion de revue de chantier correspondante.

La planification n''a pas été introduite au niveau des workpackages mais
les colonnes nécessaires ont été créées dans la table
project_workpackage et il suffit de cloner le module « sprint » pour
mettre une planification au niveau des lots de travaux.

**Documents** : on distingue les documents locaux, stockés sur le
serveur et les documents en ligne stockés sur un serveur distant. Cela
permet à une équipe projet de travailler collaborativement sur un
document type google doc®, office365® ou framapad®.

**Réunions** : l''inscription et la désinscription est très simple pour
les utilisateurs connectés ; il est possible d''inscrire des personnes
extérieures à partir des carnets d''adresse PRM1 ou PRM2. Mais sans
script supplémentaire il n''est pas possible de gérer l''envoi
d''invitations ou de notifications. L''expérience nous apprend que les
réunions des équipe projet changent souvent de date, d''heure, de lieu ou
de contenu. Il a donc été prévu un système d''alerte avec une
notification par icône sur la liste des réunions.

**Réunions (coordinateur)**: Quand un éditeur crée une réunion, il en
devient coordinateur et il peut l''éditer pour modification.

**Bâtiments** : la création d''un bâtiment entraîne automatiquement la
création d''une pièce du même nom qui aura le rang « main ». On ne
travaille ensuite qu''au niveau des pièces. La pièce « main » désigne le
bâtiment dans son ensemble.

**Localisation des bâtiments** : en cliquant sur le bâtiment, on peut
visualiser la description complète de celui-ci.

**Description géométrique/géopgraphique des bâtiments **: CO-OP ne
permet pas d''intégrer les bâtiments dans un système d''information
géographique (GIS). Toutefois, il est possible d''ajouter la clause
\"sqlite_extensions\": \[\"mod_spatialite\"\] dans
/var/www/sqlpage/sqlpage/sqlpage.json pour assurer cette intégration. Il
faudrait bien sûr revoir la structure des tables « buildings » et
« building_rooms » pour finaliser cette intégration.

**Worksequence (durée)** : par défaut, CO-OP établit la durée d''une
séquence de travail par différence entre l''heure de fin et l''heure de
début. Toutefois, il serait possible de mettre en place un calcul à
partir de la durée déclarée pour chaque séquence. Une séquence de
chantier est de maximum 24 heures. La date de début de la séquence fait
aussi office de date de fin de la séquence.

Pour une analyse fine, il est préférable de séquencer les temps de
travail au plus près du réel. Par exemple une séquence le matin de 7:30
à 12:00 et une séquence dans l''après-midi de 13:30 à 17:00, plutôt
qu''une seule séquence 7;30 -- 17:00. Le grain de temps est de 15 mn, ce
qui est déjà très fin sur des chantiers où le calcul se fait plus
généralement à l''heure, la demie-journée ou la journée.

**CSV** : CO-OP permet d''exporter grâce au composant CSV le détail des
temps de chantier (worksequence) par lot de travaux, par séquence ou
pour un participant spécifique. Cela est possible par un jeu de liaisons
entre 6 tables, ce qu''il aurait été très difficile de réaliser dans un
simple tableur.

**Participants :** Les projets, workpackages et woksequences sont tous
liés à des participants. Ceux-ci sont choisis dans les tables PRM1, PRM2
et PRM3. Le type de participation dépend du niveau dans le projet :

-   participants → projet : maître d''ouvrage, assistant maître
    d''ouvrage, architecte, maître d''œuvre, banque...

-   participants → workpackage : entreprises, consortium d''entreprises

-   participants → worksequence : entrprise, employé d''entreprise,
    intervenants non professionnel : maître d''ouvrage, membre de la
    famille, groupe d''entraide, bénévole.

Dans CO-OP, il y a 3 tables participants distinctes. On aurait pu
imaginer une table unique avec un filtre suivant le type de
participation mais cela complique la structuration des formulaires de
saisie et les tables d''affichage sans apporter d''information','help-dev','FR',9,'yes','2025-02-22 11:28:33','2025-03-10 14:55:00');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (56,'10. Trucs et astuces','COOP se base sur la version socle de SQLPage, sans script ni
composant maison ni fonction avancée. Il y a donc certaines
situations qui demandent de trouver des solutions de contournement.
Celles-ci résident essentiellement dans la structure des tables avec
l''utilisation de colonnes spécifiquement créées pour faciliter la
gestion des données et la construction des requêtes. Les trucs et
astuces suivants ne sont pas forcément tout à fait orthodoxes et
relèvent parfois du « bricolage».

## 10.0. Install CO-OP
Une install d’une base vide de CO-OP est possible à partir du fichier sql :
/var/www/sqlpage/a_install/install_create_table.sql

Pour la création du premier administrateur, il faut lancer le fichier : 
/var/www/sqlpage/a_install/install_first_admin.sql

Il sera alors possible d’entrer dans COOP avec le couple email/mot de passe :
 admin1@coopcoop.net / CoopCoop1

Une fois entré dans CO-OP, il faudra impérativement modifier le profil (mot de passe...) d’admin1 via le sous menu « mon profil » sous le menu « connect ». et détruire le fichier install_first_admin.sql.

Une alternative est de créer un profil avec le sous menu « sign-up » puis aller dans la base pour renseigner la colonne « user-role » avec la valeur admin pour le profil qui a été créé.

## 10.1. orga/orga_dept, place/place_space, building/building_room

Le volet « corporate » de COOP (volet B) décrit la structure qui est à
l''initiative de la publication du site web. Dans COOP, il a été prévu
que cette structure puisse avoir des « départements ». Si l''on prend
l''exemple d''un club sportif, celui-ci pourra avoir une section foot et
une section rugby. Intuitivement on pourrait organiser la liaison entre
les tables orga et orga_dept :

-   le club  → orga_id=1

-   la section foot → orga_id=1, orga_dept=1

-   la section rugby → orga_id=1, orga_dept=2

En fait, cela pose quelques problèmes pour formuler en une seule requête
SQL plusieurs cas de figures comme, par exemple, prendre en compte des
clubs qui ne sont pas organisés avec des sections (les joueurs
doivent-ils être rattachés au club ou à la section ?...). Cela oblige à
des requêtes sur la table orga et sur la table orga_dept. Il y a
plusieurs moyens pour contourner le problème. Dans COOP, le principe
adopté est de créer systématiquement un département fictif, étiqueté
« main » :

-   le club  → orga_id=1, orga_name= « sporting club »

-   la section « main » → orga_id=1, orga_dept=1, dept_type= « main »,
    dept_name = « sporting club »

-   la section foot → orga_id=1, orga_dept=2, dept_type= « dept »,
    dept_name= « foot »

-   la section rugby → orga_id=1, orga_dept=3, dept_type= « dept»,
    dept_name= « rugby »

Toutes les requêtes vont donc cibler le niveau des départements. La
création d''un département « main » va faciliter et clarifier traitements
comme le rattachement des joueurs à leur section sportive et des
salariés de l''encadrement du club à la section « main » (cela évite
d''avoir à gérer le rattachement de certains salariés à la table orga et
les autres à la table orga_dept). Le principe s''adapte bien avec une
entreprise avec un siège social et des établissements ou une école avec
plusieurs classes.

Le même principe est appliqué pour la gestion des lieux. L''utilisation
d''une table place_spaces permet de gérer des situations où une
organisation dispose de plusieurs lieux ou plusieurs salles dans un même
bâtiment (cas d''une école), plusieurs terrains sur un même centre
sportif. La création d''un lieu dans la table places (place_id=1,
place_name= « my_place ») entraîne la création automatique d''un espace
dans la table spaces (space_id=1, place_id=1, space_type= « main » ,
space_name= « my_place »).

Le fonctionnement des forums est aussi basé sur l''étiquetage du premier
message comme « main » les autres messages pouvant être qualifiés de
«post ».

Le principe utilisé s''avère assez robuste, mais il a une dimension
contre-intuitive quand on utilise COOP pour une organisation qui n''a pas
de département ou un seul lieu. Le pied de page de la page d''accueil du
site COOP est basé sur une requête sur orga_id=1, orga_dept_id=1. Il en
va de même pour le contenu des rubriques du menu « about » qui se base
sur la table « info_sections ». Le principe permet d''envisager de
sophistiquer le menu « about » par exemple pour présenter le profil des
joueurs de chaque section ou des élèves de chaque classe.

## 10.2. Forum, debug, chat

Ces trois modules s''appuient sur les mêmes tables : forum_topics,
forum_messages. Le filtrage entre les forums se fait grâce à la colonne
« forum_type ».

Forum et Debug sont des modules quasi jumeaux. Ils se distinguent que
par leurs finalités : discussion générale dans un cas et remontée de bug
sans l''autre. Certaines colonnes (debug_target) ne seront pas utilisés
dans forum et les choix de catégorie seront différents.

Chat se distingue la l''utilisation de deux colonnes de métadonnées
author_id et recipient qui permettent de limiter les échanges sur le
forum à 2 personnes.

La table forum_topics inclut des colonnes workspace_id, forum_group qui
permettent de créer des forums aux participants d''un espace de travail
ou à un groupe d''utilisateurs (voir notion de groupe dans la section
droits et permissions).

## 10.3. Liste de choix. Pattern

Les listes de choix dans les menus déroulants sont pilotées à partir de
2 tables sous contrôle de l''administrateur. Cela permet de garantir une
constance dans les listes et la possibilité de faire évoluer ces listes
sans avoir à intervenir sur les fichiers.

De même les règles RegEX sont pilotées depuis une table sous contrôle de
l''administrateur. Cela permet de les faire évoluer si nécessaires.

## 10.4. RSS

Dans la version socle de SQLPAGE (sans scripts), il n''est pas possible
d''envoyer des notifications vers un admin ou un superviseur depuis
SQLPage à partir de la création d''un enregistrement. L''admin doit donc,
par exemple, consulter la liste des comptes en attente pour débloquer
les droits des nouveaux utilisateurs. Pour éviter qu''il ait à consulter
cette liste toutes les heures, il a été créé dans COOP des flux RSS
(dossier /a_RSS-feed). L''admin peut alors coller le lien dans son client
courrier type thunderbird et il sera informé au rythme qu''il aura fixé
(toutes les heures, un fois pas jour...) d''une nouvelle inscription sur
le site.

Les fichiers de configuration des flux RSS doivent être codés à la main,
mais COOP intègre un module RSS de description de ces flux, ce qui
permet de les afficher soit dans le menu « about » pour les flux grand
public soit dans les panneaux d''administration admin, supervisor,
editor.

## 10.5 Purge des fichiers documents et images

Dans COOP il est possible de rattacher des documents à une organisation,
un groupe de travail, un bâtiment... Par prudence, il a été mis un
limite de 5 Mo pour la taille des documents mais le cumul de tous les
documents peut à la longue charger inutilement le serveur.

Quand on supprime un enregistrement lié à un document, on supprime les
métadonnées de description du document mais pas le fichier proprement
dit. Sans script, il n''est pas possible de déclencher la suppression du
fichier en même temps que la suppression de l''enregistrement. Pour
contourner le problème il a été prévu une table « files_to_erase » qui
stocke les url des fichiers à supprimer. L''admin peut alors
périodiquement purger le serveur des fichiers inutiles. La procédure a
fait l''objet d''une description qui est basé sur le composant « step » de
SQLPage.
','help-dev','FR',10,'yes','2025-02-22 11:29:06','2025-03-05 16:09:14');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (57,'0. For those who don''t read the manuals','If you are unfamiliar with [the term
RTFM](https://en.wikipedia.org/wiki/RTFM), you can explore the COOP
website directly, either as a simple visitor (not logged in), or by
successively using the various possible statuses: viewer, editor,
supervisor, admin.

Installing COOP is straightforward:

-   download the entire COOP folder from Github

-   paste this folder into /var/www

-   release write permissions on sub-folders with an "x\_" prefix (these
    are used to download documents or images)

-   in the terminal, go to the COOP folder: /var/www/coop

-   launch SQLPage: /var/www/SQLPage/SQLPage.bin

-   in your browser, go to: http://localhost:8080/

-   start the tour.

To change roles, simply use the following identifiers:

-   viewer1@coopcoop.net

-   editor1@coopcoop.net

-   supervisor1@coopcoop.net

-   admin1@coopcoop.net

with password: CoopCoop1

You can create new users, but you\''ll then need to switch to "admin"
mode to set the rights of new administrators.

In the admin panel, you\''ll find a "Help Dev" menu with COOP\''s on-board
documentation.

To complete the demo, in the admin, supervisor and editor panels,
you\''ll find links to RSS feeds (see the principle of these feeds in
Help-Dev).','help-dev','EN',0,'no','2025-02-22 16:10:58','2025-02-22 16:19:26');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (58,'1. Preamble','## 1.1 Background to COOP development

COOP is the result of a "no-pro" learning curve in sql via SQLPage (IT
development is not my profession and my IT culture is very limited). The
aim was to develop a complete, functional, dynamic website (all content
managed from tables). The purpose of the central database is to monitor
building rehabilitation projects as part of participative projects
involving professionals and private individuals. These projects are
monitored and coordinated by a network of independent associations. This
explains the name of the site and the section devoted to collaborative
work (see section C below).

COOP\''s code is very simple: use of SQLITE as the database management
engine, basic SQL queries (elementary queries: no use of triggers,
pragma\...), SQLPage base (no custom components, no scripts), very
academic query writing, very explicit file and folder names\...

There must be errors in the database schema and in the writing of
certain queries.

## 1.2 Possible uses for COOP

### 121. A curio

COOP offers a possible way of building a web site with SQLPage. Certain
aspects of COOP may provide a source of inspiration. This completes the
examples given in [the official SQLPage
documentation](https://sql-page.com/documentation.sql) website or in
tutorials such as [LearnSQLPage](http://learnsqlpage.com/).

### 122. Sandbox

COOP is the result of a learning curve; it can be used as a sandbox for
other "no-pro" wishing to familiarize themselves with the SQLPage
application, the SQL language and website design to host a specific
database.

The development of COOP has involved only free and open source software
(see the \''our sponsors\'' menu on the site).

The main documentation sources used were :

-   [SQLPage documentation](https://sql-page.com/documentation.sql)

-   [SQLPage discussion
    forum](https://github.com/sqlpage/SQLPage/discussions)

-   various tutorial sites and forums focusing on SQLITE, SQL, CSS\...
    **(thanks to all contributors!**)

-   and for testing purposes, a free AI site. The use of AI is, in the
    short term, quite effective, for an isolated beginner, to correct
    the syntax of SQL queries; however, we must remain aware of the
    environmental cost of AI and its predatory dimension, as it feeds on
    the work of those who write tutorials or provide answers on forums.
    And, in terms of real efficiency, it is ultimately more effective to
    take a complete course on SQL or buy a reference book than to become
    dependent on an AI search engine. AI applied to computer code is
    like comparing frozen pizza to homemade pizza: it\''s quick, it looks
    good, but in the end it\''s more expensive and not necessarily
    better.

### 121.Base for a production version

**Warning***: COOP may be functional, but it would be unwise to use it
for a production version. You can use parts of it, for example,
component A (see COOP general structure) to put an in-house database
online. But before considering using COOP in whole or in part for a
production version, you should first have the code and schema reviewed
by a professional.*

Furthermore, for reasons of ease of use and learning, COOP was developed
using SQLITE. However, this type of database engine is not optimal for
simultaneous connections, which is COOP\''s specificity (see "community
tools" below). For a production version, we would need to migrate to
postgresql. But this migration is not trivial, as it would involve :

-   revising data formats (sqlite is rather simplistic in this respect,
    whereas postgresql is more sophisticated),

-   revising certain queries (json object\...), as sqlite and postgresql
    do not use the same syntax

-   review the permissions management system (see below: rights
    permissions privileges), which are managed at table level in
    postgresql.

Last but not least, you\''ll need to integrate a few scripts to perform
certain functions, for example, to ensure :

-   dual-level authentication

-   management of forgotten passwords,

-   sending e-mails and notifications,

-   print settings,

-   manage database maintenance tasks.

## 1.3.Miscellaneous problems and bugs {#miscellaneous-problems-and-bugs .unnumbered}

### 1.3.1 Internationalization

I\''m a French speaker and the content of labels, contents,
contents_md\... is in French. The basic version of SQLPage does not
include internationalization functionality (this can be done via
scripts). However, all recent web browsers include instant translation
functions, making it unnecessary to translate content upstream in the
site code. However, the choice lists are managed from 2 tables
(choice_categories, choice_items), which facilitates their eventual
adaptation.

On the other hand, we\''ve decided to name tables, folders and files in
"globish" (global english aka broken english!), which is the standard
for computer languages such as sql, html, css, SQLPage, etc. This means
that COOP can be used by non-French speakers.

### 1.3.2. Bugs

As far as possible, COOP has been debugged, but there may still be bugs
here and there. SQLPage includes a fairly efficient bug-checking engine
to help locate these. Occasionally, however, you may come across a blank
page. This is often due to ;

-   an incorrect path

-   the absence of a "myparemeter_id" argument in a path
    (myfile.sql?myparameter_id=\''\|\|\$myparameter)

-   a query in a column containing a NULL value.
','help-dev','EN',1,'yes','2025-02-22 16:11:52','2025-02-22 16:19:14');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (59,' 2. COOP general structure','There are many commercial or open source, no-code applications available
to meet the most classic needs expected of a web site. But there are
cases where the database structure is too specific to use one of these
applications. The website must therefore be built around the database.
This is the purpose of SQLPage, a major advantage of which is that it is
a "simple code" application accessible to people whose core business is
not IT development, but who need to put a specific database online.

Putting a database online is not limited to putting the data itself
online. It also involves the development of other peripheral functions
expected of a web site:

-   "**admin**" function: website administration, user rights management
    and maintenance,

-   "**corporate**" function: presenting the structure that publishes
    the website: who we are, what we do, presenting our team\...

-   "**contact**" function: provide a contact and exchange interface for
    visitors: contact form, registration form, FAQ\...

-   "**interface**" function: to provide an interface for feeding and
    maintaining the database that justified the creation of the site,

-   **"community**" function: offering collaborative tools for editors
    who feed the database or produce content for the site.

COOP\''s structure is designed to meet all these functions. The folders
are logically organized, with functions identified by alphabetical
suffixes.

-   The first group covers non-specific functions

    -   **group A suffix /a\_**: site management admin modules:
        sessions, users, info, rss\...

    -   **group B suffix /b\_**: corporate and visitor contact modules

    -   **group C suffix /c\_**: community modules: forum, chat,
        wokspaces\...

-   and a second group of files specific to COOP whose theme is the
    management of supported housing rehabilitation projects (interface
    function):

    -   **group D suffix /d\_**: PRM (project relationship management)
        modules

    -   **group E suffix /e\_**: PMS (project management system) modules

-   Finally, documents, images, etc. are grouped in special folders:

    -   **group X suffix /x\_**: document storage modules.

In order to put a specific database online (groups D and E), it is
necessary to ensure the development of the other components and at least
the modules of group A.
','help-dev','EN',2,'yes','2025-02-22 16:12:26','2025-02-22 16:12:26');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (60,' 3.COOP modular approach','## 3.1. General principle

A module is defined as all the elements required to create a particular
functionality. Each component A, B, C, D, E corresponds to a coherent
set of modules.

## 3.2 Simple module

A simple module consists of :

-   a table

-   a simple folder (see folder contents) containing files for creating,
    editing, publishing and deleting data,

-   a link in the menu bar

-   a link in the admin, supervisor or editor administration table, as
    appropriate

Example of a simple module: news (folder /b_news), which enables
articles to be published either on the public site or on the internal
site.

## 3.3 Complex module

A complex module is made up of :

-   several tables, sometimes linked by constraints (foreign keys)

-   several folders containing files for creating, editing, publishing
    and deleting data in each table,

-   a link in the menu bar

-   a link in the admin, supervisor or editor administration table, as
    appropriate

example of a complex module: workspaces (folder /c_wokspaces), which
combines tables for forum management, chat, document sharing and meeting
organization.

## 3.4. Dependency between modules

Even for simple modules, there are dependencies:

-   all modules depend on Group A modules: users, sessions, shells,
    panels, info

-   there are dependencies between certain modules within group B (e.g.:
    members, orga_dept, events, place, place_space tables depend on
    orga)

-   certain modules in group C are dependent on tables in group B
    (meetings and workmeetings are dependent on place_space, and
    therefore on orga and orga_dept)

-   group D modules depend only on group A base modules

-   group E modules depend on group D modules and group A base modules

Dependency links can be visualized by browsing through tables to
identify references to an external table, often (but not always) to a
foreign key.

The deletion of certain records in a table implies the deletion of
related records in other tables. In this case, COOP systematically
displays a warning message before deleting a parent record. A
"my_table_status" field has been introduced in most tables. This allows
a record to be archived rather than deleted. For tables of type users,
members, etc., data anonymization is provided, which can be used when a
person requests the deletion of their personal data from the database.

## 3.5. Cloning modules

If a certain consistency is maintained in the naming of tables, columns,
folders and files, it is possible to create a new module, by a
succession of copy/paste/rename operations based on the structure of a
reference module. This doesn\''t mean you don\''t have to do some coding
if you add or remove columns from certain tables, but it does save you a
lot of time on the overall coding of the module.','help-dev','EN',3,'yes','2025-02-22 16:13:00','2025-02-22 16:13:00');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (61,'4. Rights Permissions User privileges','## 4.1. CRUD permissions

COOP distinguishes several roles for logged-in users:

-   **viewer**: this role gives access to read internal information
    (news, agenda, FAQ) and post in the forum

-   **editor:** this role enables users to read, create and edit content

-   **supervisor**: this role allows you to read, create, edit and
    delete content

-   **admin**: this role is mainly dedicated to site management and has
    control over users.

Users create their own accounts and passwords. By default, they have no
role. Their permission level will be decided by the admin. There is
therefore no circulation of passwords at any time, and they are not
stored in the database (only the hash_password).

The admin is informed of account creation requests via a dedicated RSS
feed (/a_rss_feed/rss_new_users_5.sql).

Access to sql files is filtered by a specific shell component:

-   /a_shells/shell_2.sql for viewers

-   /a_shells/shell_3.sql for editors

-   /a_shells/shell_4.sql for supervisors

-   /a_shells/shell_5.sql for admins

After verifying the user\''s role, each shell calls a shell_core
(/a_shells/shell_core.sql), which displays the user\''s permissions menu.

To make it easier to find your way around files according to permission
levels, we\''ve adopted the principle of using suffixes at the end of the
file name:

-   /news_private_display_3.sql: editor file for internal news list

-   /news_private_display_4.sql: supervisor file for listing internal
    news (same as above, but with an additional DELETE function).

-   Files with the suffix \_1₁ are files accessible to any logged-in
    user (e.g. /a_panels/panel_user_1.sql for user profile updates).

-   Files with the suffix \_0 are intermediate processing files (INSERT,
    UPDATE, DELETE) without a header.

-   Files without a suffix are files linked to site visitors who are not
    logged in (e.g. /var/www/SQLPage/b_about/orga_about.sql for the "Who
    are we?" menu).

## 4.2. Level and Group permissions

COOP includes the ability to manage 2 other types of permissions:

-   level (L): permission to access certain fields in a table, or a
    particular child table of a main table

-   group (G): permission to access all the fields in a table, but only
    part of the data.

To understand the possible usefulness of these two filters, let\''s
imagine a sports club with 2 sections: soccer and rugby:

-   members are assigned a CRUD "viewer" permission: they can consult
    internal news, post comments on the forum\... but have no access to
    player data

-   an "editor" CRUD permission is assigned to sports coaches, trainers
    and accountants

-   a CRUD "supervisor" permission is assigned to managers, the doctor
    and the financial director.

-   The player data table can be designed in 2 ways: either as a PLAYER
    table with fields: L1_player_sport_data, L2_player_medical_data,
    L3_player_financial_data or as a main PLAYER table (player_id,
    player_name) and 3 linked tables:L1_SPORT (player_id, sport_data),
    L2_MEDICAL (player_id, medical_data), L3_FINANCIAL (player_id,
    financial_data).

-   We then assign L1 permission to sports coaches, L2 to caretakers and
    L3 to accountants. This ensures that each manager only sees the data
    relevant to him or her (and avoids everyone having access to
    sensitive medical or financial data).

-   In addition, you can insert a "group" field in each table, with the
    value G1 for soccer and G2 for rugby. A G1 coach will only be able
    to consult and edit level 1 data (sports data) for soccer players.
    CREATE queries can also be set up, so that a record created by a G1
    coach will automatically take the value G1.

-   For managers, we can keep the L filter (medical data is only visible
    to a doctor), but give them access to all players, with data
    deletion rights.

The combination of the three types of permissions (CRUD, L, G) covers a
very wide range of situations.In a company, you can associate each
department with a group; in a school, you can create combinations
between classes and levels\...

## 4.3 Module rights distribution principle

Rights are distributed by section:

-   /a\_ modules: admin (5) general site administration, user
    management, debugging, \...

-   /b\_ : supervisor (4) general content, organization and member
    descriptions, event validation\...

-   /c\_ modules: all logged-in users (1) with ultimate moderation by
    the administrator (5)

-   /d\_ and /e\_ modules: editors (3) with supervisor moderation (4)

COOP does not value the L and G filters. This could have been possible
on the PRM and project modules to separate teams or assign certain teams
to certain jobs, or distribute teams according to building location.','help-dev','EN',4,'yes','2025-02-22 16:13:44','2025-03-05 17:21:43');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (62,'5. Folders and files','## 5.1. Naming folders

Folders group together the files of a given module or sub-module (see
modular approach).

File naming is based on :

-   a suffix to identify the user\''s profile without having to open the
    file (see CRUD permissions)

-   a reminder of the table name

## 5.2. File naming

File naming is based on :

-   a term that intuitively evokes the table associated with the module,

-   a term that evokes the module component: main, archive, doc\....,

-   a term that evokes the sql query or SQLPage component,

-   a prefix that refers to the section to which the file belongs (see
    COOP general structure).

Example:

-   **my_table_main_display_4.sql** → the file can only be opened by a
    user with supervisor rights, it concerns the "my_table"
    table/module, "main" means that we\''re on the module\''s central
    processing and display that the query is either a table or list
    component,

-   **my_table_archive_display_4.sql** → the file can only be opened by
    a user with administrator rights, it concerns the "my_table"
    table/module, "archive" means we\''re on columns where the value of
    "may_table_status"="archived" and display that the query is either a
    component

-   **my_table_main_create_0.sql** → the file is a processing file,
    without a header, with a CREATE request. it concerns the "my_table"
    table/module.

This leads to rather cumbersome file path names, but makes for intuitive
reading (no need to open the file to find out its contents and role) and
avoids possible confusion between modules that are almost twins (e.g.
forum and debug modules). This is particularly useful when designing a
website, especially if this is done in collaborative mode.

Consistent file naming facilitates module cloning. Simply perform a
series of copy/paste/rename operations to create a new module from a
reference module.

## 5.3 Folder contents

The folder contains a series of files that can be referred to as the
heart of the module, and which are identified by the term "main". For
example :

-   **my_table_main_display_4.sql**: the list or table used to display
    table data (the 4 indicates that this file can only be opened by a
    supervisor with DELETE permission).
-   **my_table_main_display_3.sql**: the list or table used to display
    table data (the 4 indicates that this file can only be opened by an
    editor with read, create and modify permissions)

-   **my_table_main_form_3.sql**: the form used to create data

-   **my_table_main_edit_3.sq**l: the form used to update data

-   **my_table_main_form_4.sql**: the form used to create data (the
    supervisor may have access to certain additional fields compared to
    the editor. For example, the supervisor controls the
    "my_table_status" field, which authorizes a record to be put online
    or archived).

-   **my_table_main_edit_4.sql**: the form used to update data

-   **my_table_main_create_0.sql**: data insertion processing in the
    database

-   **my_table_main_update_0.sql**: data insertion processing in the
    database

-   **my_table_main_delete_0.sql:** processing used to delete data from
    the database

Around the \"main\" heart of the folder, depending on the complexity of
the module, we create with the same logic the files linked to the
secondary functions:

-   **my_table_doc_display_4.sql**: if the main function of the module
    is the description of a company, the \"doc\" files concern the
    processing of documents associated with each company We can also
    have files for specific functionalities:

-   **my_table_archive_display_4.sql:** visualization of archived data

-   **my_table_anonym_0.sql**: processing to anonymize data (to avoid
    deleting data in tables with foreign key constraints)

-   **my_table_csv_0.sql**: processing for csv export of data. We can
    systematically add a 404.sql file in each folder. This is quite
    useful during development where we can make mistakes on the paths.
    Some COOP folders contain a lot of files. This results from a choice
    to apply the principle of one function/functionality per file. A
    more compact application could be achieved by grouping several
    functions in a single file, but COOP is a learning exercise where
    readability was preferred to performance.

## 5.4. File contents 

The files have a typical structure:

-   a header with a filter on the user permission level (SELECT
    \''dynamic\'' AS component, sqlpage.run_sql(\''a_shells/shell_5.sql\'')
    AS properties;)

-   (optional) the declaration of some variables (SET my_variable =\...)

-   a navigation path: (select \''breadcrumb\'' as component; ) or a
    management panel (select \''datagrid\'' as component;) or
    buttons/alerts (select \''button'' as component; ), (select \''alert''
    as component; ),

-   the main component: (select \''form'' as component; ), : (select
    \''table'' as component; ) : (select \''list'' as component; ) \...with
    a link to the processing file(s) (create_0.sql, delete_0.sql\...)

Processing files with a suffix ₀ have a simpler structure:

-   no header

-   (optional) the declaration of some variables (SET my_variable =...)

-   a SQL query: INSERT, UPDATE, DELETE

-   a return (select \''redirect\'' AS component,) In processing files,
    field lists are often written with one field/one line; this makes
    reading and correction easier).
','help-dev','EN',5,'yes','2025-02-22 16:14:26','2025-02-22 16:14:26');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (63,'6. Table structures','## 6.1. Naming tables and columns

The decision was made to name the columns as explicitly as possible,
with a reminder of the table name in the column name. This makes writing
queries more cumbersome, but on the one hand it makes them easier to
read and on the other hand it avoids ambiguities between tables
(example: user_first_name cannot be confused with member_first_name) or
confusion between the name of a column and reserved terms (example:
user_role cannot be confused with the reserved term role).

## 6.2. Table structures

If the objective is to publish data as part of a website, the structure
of the tables must be adapted to this objective. The tables are built
around 4 types of columns:

-   primary and foreign key columns,

-   data columns,

-   data management columns,

-   metadata columns.

**Primary and foreign key columns**: they help maintain the consistency
of the database but in the management of the website they will play an
important role in writing paths for navigation from one screen to
another (my_file.sql?table2_id=''\|\|\$table2_id)

**Data management columns** are of particular interest in the context of
a website that will serve as a data management tool, for example:

-   the "my_table_status" field with the possible values: online, draft,
    archived will allow you to manage the publication of data.

-   the "my_table_selected" field with the possible values: yes, no will
    allow you to make selections on a group of data for batch
    modification,

-   the "my_table_public_private" field with the possible values:
    public, private will allow you to manage the publication of data
    either on the public site or for connected users.

-   The \"my_table_category\" or \"my_table_type\" fields will allow you
    to use the same table for 2 separate modules or set up filters in
    the data display.

**Metadata columns** are data that describe the data. We can therefore
describe who created the data, when it was created, who it is intended
for, etc. This can be useful in certain treatments:

-   The \"created_at, modified_at\" fields will allow, for example, to
    remove events whose date has passed from the display,

-   the \"author_id\" and \"recipient_id\" fields will be central in the
    \"chat\" module
','help-dev','EN',6,'yes','2025-02-22 16:15:03','2025-02-22 16:15:03');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (64,'7. "Corporate" and "Community" section','The site is designed for dynamic management of all elements.

The info_sections table is used to populate the various sections: T&Cs,
T&Cs, legal notices Administrative information, team composition, etc.
are linked to an organization. The only initial setting is to correctly
set the identifier of this organization. By default, the setting is
orga_id = 1 and orga_dept_id = 1. Since the description of organizations
is at 2 levels (orga and orga_dept), it would be possible, if necessary,
to present several departments of the same company (or several teams of
a sports club, or several classes of a school).

The management of the members of the organization allows basic
management of the members of an association. Similarly, the event module
allows basic management of events, meetings, etc.

The \"workspaces\" module combines several modules. File paths often
need to take into account 2 parameters (e.g.: user_id and workspace_id)
to avoid breaks in display and navigation logic. The module is a basic
and unpretentious version of modules that are offered in large
applications such as office365 or googleworkspace. But over the years
these applications have become increasingly rich in features and are
sometimes oversized for small work communities.

The emphasis has been placed on ergonomics: joining or leaving a
workgroup is done with one click (join_0.sql, quit_0.sql). The creator
of a workgroup becomes its coordinator and is the only one who can
create a meeting, but he can also designate another or several
participants as co-coordinators, they will then also be able to create
meetings. The coordinator can decide to close the workgroup. This is
equivalent to changing its status to \"archived\" but this does not
delete it. Only supervisors will be able to permanently delete a
workspace.

The introduction of \"community\" modules in COOP contributes to the
desire to have all the tools at hand as part of project management. We
often see a dispersion of team work between a project management
application, a messaging application, a group management application,
etc. But it is difficult to compete with dedicated applications and
therefore COOP modules remain very simple or even simplistic.
','help-dev','EN',7,'yes','2025-02-22 16:15:37','2025-02-22 16:18:13');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (65,'8. PRM: Project Relationship Management','The acronym CRM: Customer Relationship Management is well known. The CRM
approach is most often based on a binary relationship: seller_buyer. A
project is often a team effort and tools based on a binary relationship
are not enough.

In the PRM approach we find the classic tables / address books for
individuals (PRM1) and legal entities (PRM2). In COOP we detail the
employees who are the individuals linked to a legal entity, as in the
HRM (human resources management) databases. This allows COOP to be used,
for example, to form teams of players or manage the distribution of
students in the classes making up a school. COOP introduces another
table, that of groups (PRM3) which allows all sorts of combinations:
between individuals (a couple, a family, a group of volunteers), between
companies (consortium, etc.), between companies and individuals. This
table then allows you to solve problems on the construction intervention
side. Indeed, a house is often owned not by one person but by a couple.
You may also have to do work in a home shared by roommates. During the
work, it is common for companies to temporarily join forces to respond
to a call for tenders. In the specific case of COOP, we analyze the
monitoring of construction sites carried out by a family and craftsmen.
The PRM3 table allows you to manage situations such as the constitution
of a sports team including, depending on the case, only amateur players
or players and employees of the sports club.
','help-dev','EN',8,'yes','2025-02-22 16:16:04','2025-02-22 16:16:04');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (66,'9. Project module','## 9.1. Project module: general orientation

The project module falls into the PSM category: Project Management
System. There are many different project management applications. They
can be distinguished from one another by their intended purpose and the
business context in which they are deployed.

CO-OP\''s main aim is to analyze the actions of players at every level of
the project. CO-OP was designed for the specific context of building
renovation projects involving mixed teams of professionals and
non-professionals (ARA: auto réhabilitation accompagnée). It would be
possible to enrich CO-OP with tables on materials and services in order
to provide a more complete analysis, including detailed costs.

CO-OP can, however, be transposed to other types of project structured
around the notion of work packages/tasks and sequences/tasks.

Another aspect of CO-OP is that it offers a virtual workspace, a "hub"
around the project, with modules for scheduling meetings, managing
documentation and a forum. This avoids the dispersion often seen between
a project management tool, documents scattered here and there, a
separate messaging tool\...

CO-OP is not designed for complex projects. It favors a sober, ergonomic
interface as a possible alternative to project management with excel® or
calc® spreadsheets. These tools are very easy to use, but have their
limitations. SQLPAge, which allows you to use a real database, overcomes
these limitations.

## 9.2 Project module: structure

In CO-OP, projects are made up of wokpackages, which group together
worksequences. Workpackages are coherent work packages: civil
engineering, structural work, carpentry, plumbing, etc. Worksequences
are the actual site sequences.

Since COOP\''s purpose is to create or renovate buildings, each project
is associated with one or more locations. Each location can be broken
down into rooms. In this way, work sequences can be linked to a specific
room (e.g. a kitchen electrical installation project). Images can be
associated with each room.

Finally, SQLPage\''s chart component enables you to view results in
graphical form (e.g. cost statistics) or publish results on the public
site (project menu).

## 9.3. Project module: rights management

Projects are managed by supervisors and editors.

Supervisors have full rights (create, edit, delete) over projects and
project elements. They have a "dashboard" section in the project hub.
They can download working times by sequence or by participant.

Editors cannot create projects, no sprints but they can create all the elements of
a project: workpackage, worksequence, building, meeting, document.

It would be possible to quickly configure CO-OP to set access filters
according to project type. In this way, projects could be distributed
among editors according to the nature of the project or their
geographical location. To do this, simply add a G column in the project
table, a G input field when creating a project and then add a G
condition to the project display. We would then set editors\'' rights to
G1, G2, G3\... They would then only be able to work on projects
corresponding to their group.

## 9.4.Project module: tips and tricks
**Sprint:** Each project is also associated with phases (sprints). It
would be logical to link sprints and workpackages, as is done in major
projects. In COOP, we have chosen not to link sprints and workpackages,
to avoid excessive rigidity. The sprint module is mainly used to
visualize the major phases of a project, and to link them to documents
such as work schedules\...

The mechanics of this module are based on the start date (planned or
actual) and duration (planned or actual) of a sprint. The end date
(planned or actual) is calculated directly from these two data. A sprint
can be independent or linked to a parent sprint. In this case, the
planned start date is automatically calculated from the planned end date
of the parent sprint.

If the planned start date or duration of a sprint that is the parent of
one or more other sprints is modified, the planned start dates will be
recalculated via a recursive CTE.

The sprint schedule is visualized via the "chart" component in the form
of a GANTT graph.

If you wish to mark milestones in the progress of the project, you can
create one-day sprints, which will enable you to visualize these
milestones in the calendar. You can then move on to the "meeting" module
to set the date for the corresponding site review meeting.

Planning has not been introduced at the workpackage level, but the
necessary columns have been created in the project_workpackage table,
and the "sprint" module simply needs to be cloned to put planning at the
workpackage level.

**Documents:** a distinction is made between local documents, stored on
the server, and online documents, stored on a remote server. This
enables a project team to work collaboratively on a document such as
google doc®, office365® or framapad®.

**Meetings:** registration and deregistration is very simple for
logged-in users; it is possible to register external persons from the
PRM1 or PRM2 address books.But without additional scripting, it is not
possible to manage the sending of invitations or
notifications.Experience has taught us that project team meetings often
change date, time, place or content. We have therefore included an alert
system with a notification icon on the meeting list.

**Meetings (coordinator)**:When an editor creates a meeting, he becomes
its coordinator and can edit it for modification.

**Buildings:** when a building is created, a room of the same name is
automatically created, with the rank of "main".From then on, we only
work at part level.The "main" part refers to the building as a whole.

**Building location:** click on the building to view its full
description.

**Geometric/geopgraphic description of buildings:**CO-OP does not allow
buildings to be integrated into a geographic information system (GIS).
However, it is possible to add the "sqlite_extensions" clause:
\["mod_spatialite"\] in /var/www/sqlpage/sqlpage/sqlpage.json to ensure
this integration.Of course, the structure of the "buildings" and
"building_rooms" tables would have to be revised to finalize this
integration.

**Worksequence (duration):** by default, CO-OP establishes the duration
of a work sequence by the difference between the end time and the start
time.However, it would be possible to set up a calculation based on the
duration declared for each sequence. A worksite sequence is a maximum of
24 hours.The sequence start date also acts as the sequence end date.

For a detailed analysis, it is preferable to sequence working times as
close as possible to the actual time. For example, a morning sequence
from 7:30 to 12:00 and an afternoon sequence from 13:30 to 17:00, rather
than a single sequence from 7:30 to 17:00. The time grain is 15 minutes,
which is already very fine on construction sites where calculations are
usually made by the hour, half-day or day.

**CSV:** CO-OP\''s CSV component enables you to export worksequence
details by work package, by sequence or for a specific participant.This
is made possible by a set of links between 6 tables, which would have
been very difficult to achieve in a simple spreadsheet.

**Participants :** Projects, workpackages and woksequences are all
linked to participants. These are selected from the PRM1, PRM2 and PRM3
tables.The type of participation depends on the project level:

-   participants → project: owner, assistant owner, architect, prime
    contractor, bank\...

-   participants → workpackage: companies, consortium of companies

-   participants → worksequence: entrprise, company employee,
    non-professional stakeholders: project owner, family member,
    self-help group, volunteer.

In CO-OP, there are 3 distinct participant tables. We could have
imagined a single table with a filter according to the type of
participation, but this would complicate the structuring of input forms
and display tables without providing any additional information.','help-dev','EN',9,'yes','2025-02-22 16:16:35','2025-03-10 14:50:32');
INSERT INTO "info_sections" ("section_id","section_title","section_content","section_category","section_lang","section_number","section_status","created_at","modified_at") VALUES (67,'10. Tips and tricks','COOP is based on the basic version of SQLPage, without scripts,
home-made components or advanced functions. There are therefore certain
situations that require finding workarounds. These mainly reside in the
structure of the tables with the use of columns specifically created to
facilitate data management and query construction. The following tips
and tricks are not necessarily completely orthodox and sometimes involve
\"tinkering\".

## 10.0 Installing CO-OP

You can install an empty CO-OP database from the sql file :

/var/www/sqlpage/a_install/install_create_table.sql

To create the first administrator, run the :

var/www/sqlpage/a_install/install_first_admin.sql

It will then be possible to log into COOP with the email/password pair:

admin1@coopcoop.net / CoopCoop1

Once you\''ve entered CO-OP, you\''ll need to modify the profile
(password, etc.) of admin1 via the "my profile" sub-menu under the
"connect" menu, and delete the install_first_admin.sql file.

Alternatively, you can create a profile using the "sign-up" sub-menu,
then go into the database and fill in the "user-role" column with the
value admin for the profile you\''ve created.

## 10.1. orga/orga_dept, place/place_space, building/building_room

The \"corporate\" section of COOP (section B) describes the structure
that is responsible for publishing the website. In COOP, it has been
planned that this structure can have \"departments\". If we take the
example of a sports club, it could have a football section and a rugby
section. Intuitively we could organize the link between the orga and
orga_dept tables:

-   the club → orga_id=1

-   the football section → orga_id=1, orga_dept=1

-   the rugby section → orga_id=1, orga_dept=2

In fact, this poses some problems to formulate in a single SQL query
several cases such as, for example, taking into account clubs that are
not organized with sections (should the players be attached to the club
or to the section?\...). This requires queries on the orga table and on
the orga_dept table. There are several ways to get around the problem.
In COOP, the principle adopted is to systematically create a fictitious
department, labeled \"main\":

-   the club → orga_id=1, orga_name= \"sporting club\"

-   the \"main\" section → orga_id=1, orga_dept=1, dept_type= \"main\",
    dept_name = \"sporting club\"

-   the football section → orga_id=1, orga_dept=2, dept_type= \"dept\",
    dept_name= \"foot\"

-   the rugby section → orga_id=1, orga_dept=3, dept_type= \"dept\",
    dept_name= \"rugby\"

All queries will therefore target the department level. The creation of
a \"main\" department will facilitate and clarify processes such as the
attachment of players to their sports section and club management
employees to the \"main\" section (this avoids having to manage the
attachment of certain employees to the orga table and others to the
orga_dept table). The principle adapts well to a company with a head
office and establishments or a school with several classes.

The same principle is applied for managing places. Using a place_spaces
table allows you to manage situations where an organization has several
places or several rooms in the same building (case of a school), several
fields on the same sports center. Creating a place in the places table
(place_id=1, place_name= "my_place") automatically creates a space in
the spaces table (space_id=1, place_id=1, space_type= "main",
space_name= "my_place"). The functioning of forums is also based on
labeling the first message as "main" the other messages can be qualified
as "post". The principle used turns out to be quite robust, but it has a
counter-intuitive dimension when using COOP for an organization that
does not have a department or a single place. The footer of the COOP
website home page is based on a query on orga_id=1, orga_dept_id=1. The
same goes for the content of the sections of the \"about\" menu which is
based on the \"info_sections\" table. The principle allows us to
consider making the \"about\" menu more sophisticated, for example, to
present the profile of the players in each section or the students in
each class.

## 10.2. Forum, debug, chat

These three modules are based on the same tables: forum_topics,
forum_messages. Filtering between forums is done using the
\"forum_type\" column. Forum and Debug are almost twin modules. They are
distinguished only by their purposes: general discussion in one case and
bug reporting in the other. Some columns (debug_target) will not be used
in forum and the category choices will be different. Chat is
distinguished by the use of two metadata columns author_id and recipient
which allow to limit exchanges on the forum to 2 people. The
forum_topics table includes columns workspace_id, forum_group which
allow to create forums for participants of a workspace or a group of
users (see notion of group in the rights and permissions section).

## 10.3. Choice list. Pattern

The choice lists in the drop-down menus are driven from 2 tables under
the administrator\''s control. This ensures consistency in the lists and
the ability to change these lists without having to intervene on the
files. Similarly, the RegEX rules are driven from a table under the
administrator\''s control. This allows them to be changed if necessary.

## 10.4. RSS

In the base version of SQLPAGE (without scripts), it is not possible to
send notifications to an admin or supervisor from SQLPage from the
creation of a record. The admin must therefore, for example, consult the
list of pending accounts to unlock the rights of new users. To avoid
having to consult this list every hour, RSS feeds have been created in
COOP (folder /a_RSS-feed). The admin can then paste the link into his
Thunderbird-type mail client and he will be informed at the rate he has
set (every hour, once a day, etc.) of a new registration on the site.
The RSS feed configuration files must be coded by hand, but COOP
integrates an RSS module for describing these feeds, which allows them
to be displayed either in the \"about\" menu for general public feeds or
in the admin, supervisor, editor administration panels.

## 10.5 Purging document and image files 

1.  In COOP, it is possible to attach documents to an organization, a
    work group, a building, etc. As a precaution, a limit of 5 MB has
    been set for the size of documents, but the accumulation of all
    documents can unnecessarily load the server in the long run. When
    you delete a record linked to a document, you delete the document
    description metadata but not the file itself. Without a script, it
    is not possible to trigger the deletion of the file at the same time
    as the deletion of the record. To get around the problem, a
    \"files_to_erase\" table has been provided that stores the URLs of
    the files to be deleted. The admin can then periodically purge the
    server of unnecessary files. The procedure has been described, which
    is based on the \"step\" component of SQLPage.
','help-dev','EN',10,'yes','2025-02-22 16:17:04','2025-03-05 16:46:45');
INSERT INTO "project_forum_topics" ("project_forum_topic_id","project_id","project_forum_topic_author_id","project_forum_topic_name","project_forum_topic_category","debug_target","forum_type","number_messages","forum_group","project_forum_topic_status","project_forum_topic_selected","created_at","modified_at") VALUES (16,1,19,'xx','general',NULL,'forum',0,'G0','online','no','2025-03-02 12:44:11','2025-03-02 12:44:11');
INSERT INTO "project_forum_topics" ("project_forum_topic_id","project_id","project_forum_topic_author_id","project_forum_topic_name","project_forum_topic_category","debug_target","forum_type","number_messages","forum_group","project_forum_topic_status","project_forum_topic_selected","created_at","modified_at") VALUES (17,1,19,'xx','general',NULL,'forum',0,'G0','online','no','2025-03-02 12:48:05','2025-03-02 12:48:05');
INSERT INTO "project_forum_topics" ("project_forum_topic_id","project_id","project_forum_topic_author_id","project_forum_topic_name","project_forum_topic_category","debug_target","forum_type","number_messages","forum_group","project_forum_topic_status","project_forum_topic_selected","created_at","modified_at") VALUES (18,1,19,'fd','general',NULL,'forum',15,'G0','online','no','2025-03-02 12:52:16','2025-03-11 12:55:25');
INSERT INTO "project_forum_topics" ("project_forum_topic_id","project_id","project_forum_topic_author_id","project_forum_topic_name","project_forum_topic_category","debug_target","forum_type","number_messages","forum_group","project_forum_topic_status","project_forum_topic_selected","created_at","modified_at") VALUES (19,1,19,'fd','general',NULL,'forum',0,'G0','online','no','2025-03-02 12:53:27','2025-03-02 12:53:27');
INSERT INTO "project_meeting_places" ("project_meeting_place_id","project_meeting_place_name","project_meeting_place_status","project_meeting_place_summary","project_meeting_place_adress","project_meeting_place_postal_code","project_meeting_place_town","project_meeting_place_country","project_meeting_place_latitude","project_meeting_place_longitude","project_meeting_place_contact_phone","project_meeting_place_contact_mail","project_meeting_place_type","project_meeting_place_accessibility","project_meeting_place_capacity_seats","project_meeting_place_capacity_standup","project_meeting_place_selected","created_at","modified_at") VALUES (4,'Lieu de réunion 01','active','','','','','','','','','','','','','',NULL,'2025-02-24 12:49:41','2025-03-06 14:16:13');
INSERT INTO "project_meeting_places" ("project_meeting_place_id","project_meeting_place_name","project_meeting_place_status","project_meeting_place_summary","project_meeting_place_adress","project_meeting_place_postal_code","project_meeting_place_town","project_meeting_place_country","project_meeting_place_latitude","project_meeting_place_longitude","project_meeting_place_contact_phone","project_meeting_place_contact_mail","project_meeting_place_type","project_meeting_place_accessibility","project_meeting_place_capacity_seats","project_meeting_place_capacity_standup","project_meeting_place_selected","created_at","modified_at") VALUES (5,'Lieu de réunion 02','active','','','','','','','','','','','','','',NULL,'2025-02-28 18:18:57','2025-03-06 14:11:43');
INSERT INTO "project_meeting_places" ("project_meeting_place_id","project_meeting_place_name","project_meeting_place_status","project_meeting_place_summary","project_meeting_place_adress","project_meeting_place_postal_code","project_meeting_place_town","project_meeting_place_country","project_meeting_place_latitude","project_meeting_place_longitude","project_meeting_place_contact_phone","project_meeting_place_contact_mail","project_meeting_place_type","project_meeting_place_accessibility","project_meeting_place_capacity_seats","project_meeting_place_capacity_standup","project_meeting_place_selected","created_at","modified_at") VALUES (6,'Lieu de réunion 03','active','','','','','','','','','','','','','',NULL,'2025-03-06 14:12:29','2025-03-06 14:12:29');
INSERT INTO "project_worksequences" ("worksequence_id","workpackage_id","room_id","worksequence_name","worksequence_summary","worksequence_todo","worksequence_type","worksequence_nb_participants","worksequence_start_date_scheduled","worksequence_start_date_actual","worksequence_start_hour_scheduled","worksequence_start_hour_actual","worksequence_end_hour_scheduled","worksequence_end_hour_actual","worksequence_duration_scheduled","worksequence_duration_actual","worksequence_completion_percentage","worksequence_status","created_at","modified_at") VALUES (1,1,1,'Sequence 01','','',NULL,11,'2025-02-21','2025-02-21','10:00','13:30','01:45','17:45','01:00','01:00',100,'active','2025-02-20 16:02:46','2025-03-06 16:08:03');
INSERT INTO "project_worksequences" ("worksequence_id","workpackage_id","room_id","worksequence_name","worksequence_summary","worksequence_todo","worksequence_type","worksequence_nb_participants","worksequence_start_date_scheduled","worksequence_start_date_actual","worksequence_start_hour_scheduled","worksequence_start_hour_actual","worksequence_end_hour_scheduled","worksequence_end_hour_actual","worksequence_duration_scheduled","worksequence_duration_actual","worksequence_completion_percentage","worksequence_status","created_at","modified_at") VALUES (2,1,2,'séquence 02','','',NULL,5,'2025-02-22','2025-02-21','17:00','18:00','21:00','21:00','','',25,'active','2025-02-20 16:26:05','2025-03-04 09:08:02');
INSERT INTO "project_worksequences" ("worksequence_id","workpackage_id","room_id","worksequence_name","worksequence_summary","worksequence_todo","worksequence_type","worksequence_nb_participants","worksequence_start_date_scheduled","worksequence_start_date_actual","worksequence_start_hour_scheduled","worksequence_start_hour_actual","worksequence_end_hour_scheduled","worksequence_end_hour_actual","worksequence_duration_scheduled","worksequence_duration_actual","worksequence_completion_percentage","worksequence_status","created_at","modified_at") VALUES (3,1,3,'sequence 03','','',NULL,4,'2025-02-22','2025-02-22','07:00','07:00','10:00','12:30','','',45,'active','2025-02-20 16:31:23','2025-03-04 10:03:58');
INSERT INTO "project_worksequences" ("worksequence_id","workpackage_id","room_id","worksequence_name","worksequence_summary","worksequence_todo","worksequence_type","worksequence_nb_participants","worksequence_start_date_scheduled","worksequence_start_date_actual","worksequence_start_hour_scheduled","worksequence_start_hour_actual","worksequence_end_hour_scheduled","worksequence_end_hour_actual","worksequence_duration_scheduled","worksequence_duration_actual","worksequence_completion_percentage","worksequence_status","created_at","modified_at") VALUES (6,2,1,'sequence AA','sqdsdq','sdq',NULL,4,'2025-02-22','2025-02-22','07:00','07:00','15:00','17:00','','','','active','2025-02-28 17:46:10','2025-03-04 10:15:40');
INSERT INTO "project_worksequences" ("worksequence_id","workpackage_id","room_id","worksequence_name","worksequence_summary","worksequence_todo","worksequence_type","worksequence_nb_participants","worksequence_start_date_scheduled","worksequence_start_date_actual","worksequence_start_hour_scheduled","worksequence_start_hour_actual","worksequence_end_hour_scheduled","worksequence_end_hour_actual","worksequence_duration_scheduled","worksequence_duration_actual","worksequence_completion_percentage","worksequence_status","created_at","modified_at") VALUES (7,2,2,'sequence BB','xw','xw',NULL,5,'2025-02-21','2025-02-21','12:00','14:00','15:00','17:00','','',100,'active','2025-02-28 17:47:49','2025-03-04 10:15:56');
INSERT INTO "project_worksequences" ("worksequence_id","workpackage_id","room_id","worksequence_name","worksequence_summary","worksequence_todo","worksequence_type","worksequence_nb_participants","worksequence_start_date_scheduled","worksequence_start_date_actual","worksequence_start_hour_scheduled","worksequence_start_hour_actual","worksequence_end_hour_scheduled","worksequence_end_hour_actual","worksequence_duration_scheduled","worksequence_duration_actual","worksequence_completion_percentage","worksequence_status","created_at","modified_at") VALUES (10,2,'','sequence CC','','',NULL,NULL,'2025-03-27',NULL,'17:30',NULL,'20:30',NULL,'',NULL,NULL,'active','2025-03-04 10:16:22','2025-03-04 10:16:22');
INSERT INTO "project_worksequences" ("worksequence_id","workpackage_id","room_id","worksequence_name","worksequence_summary","worksequence_todo","worksequence_type","worksequence_nb_participants","worksequence_start_date_scheduled","worksequence_start_date_actual","worksequence_start_hour_scheduled","worksequence_start_hour_actual","worksequence_end_hour_scheduled","worksequence_end_hour_actual","worksequence_duration_scheduled","worksequence_duration_actual","worksequence_completion_percentage","worksequence_status","created_at","modified_at") VALUES (11,3,'','sequence A1','','',NULL,NULL,'2025-03-26',NULL,'10:30',NULL,'12:15',NULL,'',NULL,NULL,'active','2025-03-04 10:17:08','2025-03-04 10:17:08');
INSERT INTO "project_worksequences" ("worksequence_id","workpackage_id","room_id","worksequence_name","worksequence_summary","worksequence_todo","worksequence_type","worksequence_nb_participants","worksequence_start_date_scheduled","worksequence_start_date_actual","worksequence_start_hour_scheduled","worksequence_start_hour_actual","worksequence_end_hour_scheduled","worksequence_end_hour_actual","worksequence_duration_scheduled","worksequence_duration_actual","worksequence_completion_percentage","worksequence_status","created_at","modified_at") VALUES (12,3,'','sequence A2','','',NULL,NULL,'2025-04-03',NULL,'16:45',NULL,'19:15',NULL,'',NULL,NULL,'active','2025-03-04 10:17:33','2025-03-04 10:17:33');
INSERT INTO "project_worksequences" ("worksequence_id","workpackage_id","room_id","worksequence_name","worksequence_summary","worksequence_todo","worksequence_type","worksequence_nb_participants","worksequence_start_date_scheduled","worksequence_start_date_actual","worksequence_start_hour_scheduled","worksequence_start_hour_actual","worksequence_end_hour_scheduled","worksequence_end_hour_actual","worksequence_duration_scheduled","worksequence_duration_actual","worksequence_completion_percentage","worksequence_status","created_at","modified_at") VALUES (13,3,'','sequence A3','','',NULL,NULL,'2025-04-04',NULL,'09:00',NULL,'10:30',NULL,'',NULL,NULL,'active','2025-03-04 10:17:57','2025-03-04 10:17:57');
INSERT INTO "project_worksequences" ("worksequence_id","workpackage_id","room_id","worksequence_name","worksequence_summary","worksequence_todo","worksequence_type","worksequence_nb_participants","worksequence_start_date_scheduled","worksequence_start_date_actual","worksequence_start_hour_scheduled","worksequence_start_hour_actual","worksequence_end_hour_scheduled","worksequence_end_hour_actual","worksequence_duration_scheduled","worksequence_duration_actual","worksequence_completion_percentage","worksequence_status","created_at","modified_at") VALUES (14,1,1,'ssqsq','','',NULL,NULL,'2025-03-27','','','','','','','','','active','2025-03-04 10:38:16','2025-03-04 10:38:25');
INSERT INTO "project_meeting_participants" ("project_meeting_participant_id","project_meeting_id","user_id","prm1_id","prm2_sub_id","employee_id","project_meeting_participant_role","project_meeting_participant_type","project_meeting_participant_status","created_at","modified_at") VALUES (1,3,19,NULL,NULL,NULL,'speaker',NULL,NULL,'2025-02-24 10:24:35','2025-02-24 10:24:35');
INSERT INTO "project_meeting_participants" ("project_meeting_participant_id","project_meeting_id","user_id","prm1_id","prm2_sub_id","employee_id","project_meeting_participant_role","project_meeting_participant_type","project_meeting_participant_status","created_at","modified_at") VALUES (2,4,19,NULL,NULL,NULL,'speaker',NULL,NULL,'2025-02-24 12:58:52','2025-02-24 12:58:52');
INSERT INTO "project_meeting_participants" ("project_meeting_participant_id","project_meeting_id","user_id","prm1_id","prm2_sub_id","employee_id","project_meeting_participant_role","project_meeting_participant_type","project_meeting_participant_status","created_at","modified_at") VALUES (13,5,NULL,18,NULL,NULL,'speaker','person','active','2025-02-27 14:46:53','2025-02-27 14:46:53');
INSERT INTO "project_meeting_participants" ("project_meeting_participant_id","project_meeting_id","user_id","prm1_id","prm2_sub_id","employee_id","project_meeting_participant_role","project_meeting_participant_type","project_meeting_participant_status","created_at","modified_at") VALUES (28,8,19,NULL,NULL,NULL,'speaker',NULL,NULL,'2025-02-27 16:09:57','2025-02-27 16:09:57');
INSERT INTO "project_meeting_participants" ("project_meeting_participant_id","project_meeting_id","user_id","prm1_id","prm2_sub_id","employee_id","project_meeting_participant_role","project_meeting_participant_type","project_meeting_participant_status","created_at","modified_at") VALUES (29,9,19,NULL,NULL,NULL,'speaker',NULL,NULL,'2025-02-27 16:16:32','2025-02-27 16:16:32');
INSERT INTO "project_meeting_participants" ("project_meeting_participant_id","project_meeting_id","user_id","prm1_id","prm2_sub_id","employee_id","project_meeting_participant_role","project_meeting_participant_type","project_meeting_participant_status","created_at","modified_at") VALUES (30,6,19,NULL,NULL,NULL,'speaker','orga_member',NULL,'2025-02-27 16:35:29','2025-02-27 17:42:10');
INSERT INTO "project_meeting_participants" ("project_meeting_participant_id","project_meeting_id","user_id","prm1_id","prm2_sub_id","employee_id","project_meeting_participant_role","project_meeting_participant_type","project_meeting_participant_status","created_at","modified_at") VALUES (31,5,19,NULL,NULL,NULL,'speaker','orga_member',NULL,'2025-02-27 16:36:33','2025-02-27 16:36:33');
INSERT INTO "project_meeting_participants" ("project_meeting_participant_id","project_meeting_id","user_id","prm1_id","prm2_sub_id","employee_id","project_meeting_participant_role","project_meeting_participant_type","project_meeting_participant_status","created_at","modified_at") VALUES (32,10,19,NULL,NULL,NULL,'speaker','orga_member',NULL,'2025-02-27 16:37:05','2025-02-27 16:37:05');
INSERT INTO "project_meeting_participants" ("project_meeting_participant_id","project_meeting_id","user_id","prm1_id","prm2_sub_id","employee_id","project_meeting_participant_role","project_meeting_participant_type","project_meeting_participant_status","created_at","modified_at") VALUES (33,10,19,NULL,NULL,NULL,'speaker','orga_member',NULL,'2025-02-27 16:38:20','2025-02-27 16:38:20');
INSERT INTO "project_meeting_participants" ("project_meeting_participant_id","project_meeting_id","user_id","prm1_id","prm2_sub_id","employee_id","project_meeting_participant_role","project_meeting_participant_type","project_meeting_participant_status","created_at","modified_at") VALUES (34,6,NULL,20,NULL,NULL,'coach','person','active','2025-02-27 17:42:29','2025-02-27 17:42:36');
INSERT INTO "project_meeting_participants" ("project_meeting_participant_id","project_meeting_id","user_id","prm1_id","prm2_sub_id","employee_id","project_meeting_participant_role","project_meeting_participant_type","project_meeting_participant_status","created_at","modified_at") VALUES (35,6,NULL,20,3,45,'speaker','employee','active','2025-02-27 17:46:14','2025-02-27 17:46:14');
INSERT INTO "project_meeting_participants" ("project_meeting_participant_id","project_meeting_id","user_id","prm1_id","prm2_sub_id","employee_id","project_meeting_participant_role","project_meeting_participant_type","project_meeting_participant_status","created_at","modified_at") VALUES (36,6,NULL,52,NULL,NULL,'secretary','person','active','2025-02-27 17:47:07','2025-02-27 17:47:21');
INSERT INTO "project_meeting_participants" ("project_meeting_participant_id","project_meeting_id","user_id","prm1_id","prm2_sub_id","employee_id","project_meeting_participant_role","project_meeting_participant_type","project_meeting_participant_status","created_at","modified_at") VALUES (39,11,NULL,17,NULL,NULL,'co_coordinator','person','active','2025-03-03 08:53:11','2025-03-03 08:53:34');
INSERT INTO "project_meeting_participants" ("project_meeting_participant_id","project_meeting_id","user_id","prm1_id","prm2_sub_id","employee_id","project_meeting_participant_role","project_meeting_participant_type","project_meeting_participant_status","created_at","modified_at") VALUES (40,12,19,NULL,NULL,NULL,'coordinator','orga_member',NULL,'2025-03-03 10:33:17','2025-03-03 10:33:17');
INSERT INTO "project_meeting_participants" ("project_meeting_participant_id","project_meeting_id","user_id","prm1_id","prm2_sub_id","employee_id","project_meeting_participant_role","project_meeting_participant_type","project_meeting_participant_status","created_at","modified_at") VALUES (41,13,19,NULL,NULL,NULL,'coordinator','orga_member',NULL,'2025-03-03 10:38:35','2025-03-03 10:38:35');
INSERT INTO "project_meeting_participants" ("project_meeting_participant_id","project_meeting_id","user_id","prm1_id","prm2_sub_id","employee_id","project_meeting_participant_role","project_meeting_participant_type","project_meeting_participant_status","created_at","modified_at") VALUES (42,1,NULL,16,NULL,NULL,'coordinator','person','active','2025-03-11 12:28:17','2025-03-11 12:29:59');
INSERT INTO "projects" ("project_id","project_name","project_summary","project_date_creation","project_category","project_nb_participants","project_status","created_at","modified_at") VALUES (1,'Project001','dsdsssq','2025-02-28','building_creation',NULL,'active','2025-02-18 15:52:18','2025-03-06 17:06:38');
INSERT INTO "projects" ("project_id","project_name","project_summary","project_date_creation","project_category","project_nb_participants","project_status","created_at","modified_at") VALUES (2,'Projet002','','','building_renovation',NULL,'active','2025-02-20 14:04:04','2025-02-28 17:56:35');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (4,'active','active',1,'active','2025-02-14 14:55:19','2025-02-15 10:49:43');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (5,'inactive','inactive',1,'active','2025-02-14 15:08:29','2025-02-15 10:49:36');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (6,'Homme','M',2,'active','2025-02-15 10:26:56','2025-02-15 10:49:30');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (7,'Femme','F',2,'active','2025-02-15 10:27:31','2025-02-15 10:49:12');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (8,'Unknown','N',2,'active','2025-02-15 10:37:15','2025-02-15 10:49:21');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (9,'archive','archived',1,'active','2025-02-15 10:50:15','2025-02-15 10:50:15');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (10,'français','FR',3,'active','2025-02-15 10:50:38','2025-02-15 10:50:38');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (11,'english','EN',3,'active','2025-02-15 10:50:58','2025-02-15 10:50:58');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (12,'deutsch','DE',3,'active','2025-02-15 10:51:15','2025-02-15 10:51:15');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (13,'Español','ES',3,'active','2025-02-15 10:52:29','2025-02-15 10:52:29');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (14,'pdf','pdf',4,'active','2025-02-15 10:53:41','2025-02-15 10:53:41');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (15,'doc','doc',4,'active','2025-02-15 10:53:56','2025-02-15 10:53:56');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (16,'docx','docx',4,'active','2025-02-15 10:54:33','2025-02-15 10:54:33');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (17,'jpeg','jpeg',4,'active','2025-02-15 10:55:21','2025-02-15 10:55:21');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (18,'jpeg','jpeg',5,'active','2025-02-15 10:56:24','2025-02-15 10:56:24');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (19,'png','png',5,'active','2025-02-15 10:56:36','2025-02-15 10:56:36');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (20,'svg','svg',5,'active','2025-02-15 10:56:55','2025-02-15 10:56:55');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (21,'online','online',6,'active','2025-02-15 13:29:05','2025-02-15 13:29:05');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (22,'brouillon','draft',6,'active','2025-02-15 13:29:26','2025-02-15 13:29:26');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (23,'archivé','archived',6,'active','2025-02-15 13:29:44','2025-02-15 13:29:44');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (24,'réunion','meeting',7,'active','2025-02-15 13:32:48','2025-02-15 13:32:48');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (25,'conférence','conference',7,'active','2025-02-15 13:33:07','2025-02-15 13:33:07');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (26,'concert','concert',7,'active','2025-02-15 13:33:20','2025-02-15 13:33:20');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (27,'repas','festive_meal',7,'active','2025-02-15 13:34:29','2025-02-15 13:34:29');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (28,'bal','ball',7,'active','2025-02-15 13:35:03','2025-02-15 13:35:03');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (29,'rencontre sportive','sports_meeting',7,'active','2025-02-15 13:36:14','2025-02-15 13:36:14');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (30,'autre','N',7,'active','2025-02-15 13:36:26','2025-02-15 13:36:26');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (31,'general','general',8,'active','2025-02-15 13:46:08','2025-02-15 13:46:08');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (32,'technique','technical',8,'active','2025-02-15 13:46:23','2025-02-15 13:46:23');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (33,'autre','N',8,'active','2025-02-15 13:46:49','2025-02-15 13:46:49');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (34,'gouvernance','govern',9,'active','2025-02-15 13:49:19','2025-02-15 13:49:19');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (35,'salarié ou membre actif','team',9,'active','2025-02-15 13:49:52','2025-02-15 13:49:52');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (36,'simple salarié ou adhérent','member',9,'active','2025-02-15 13:50:22','2025-02-15 13:50:22');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (37,'autre','N',9,'active','2025-02-15 13:50:32','2025-02-15 13:50:32');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (38,'annonce','annoncement',10,'active','2025-02-15 13:56:17','2025-02-15 13:56:17');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (39,'article','article',10,'active','2025-02-15 13:56:38','2025-02-15 13:56:38');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (40,'info','info',10,'active','2025-02-15 13:56:53','2025-02-15 13:56:53');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (41,'autre','N',10,'active','2025-02-15 13:57:10','2025-02-15 13:57:10');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (42,'éditorial','edito',10,'active','2025-02-15 13:57:57','2025-02-15 13:57:57');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (43,'asso 1901','NGO',11,'active','2025-02-15 14:03:57','2025-02-15 14:03:57');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (44,'agence gouvernementale','GO',11,'active','2025-02-15 14:04:40','2025-02-15 14:04:40');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (45,'collectivité locale','EPCI',11,'active','2025-02-15 14:05:00','2025-02-15 14:05:00');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (46,'entreprise individuelle','EI',11,'active','2025-02-15 14:05:26','2025-02-15 14:05:26');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (47,'Sarl','SARL',11,'active','2025-02-15 14:05:46','2025-02-15 14:05:46');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (48,'SA','SA',11,'active','2025-02-15 14:06:00','2025-02-15 14:06:00');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (49,'SAS','SAS',11,'active','2025-02-15 14:06:11','2025-02-15 14:06:11');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (50,'SCI','SCI',11,'active','2025-02-15 14:06:30','2025-02-15 14:06:30');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (51,'SCIC','SCIC',11,'active','2025-02-15 14:06:48','2025-02-15 14:06:48');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (52,'autre','N',11,'active','2025-02-15 14:06:59','2025-02-15 14:06:59');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (53,'rapport annuel d''activité','annual_report',12,'active','2025-02-15 14:11:49','2025-02-15 14:11:49');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (54,'bilan annuel','annual_results',12,'active','2025-02-15 14:12:32','2025-02-15 14:12:32');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (55,'plaquette d''info','leaflet',12,'active','2025-02-15 14:13:09','2025-02-15 14:13:09');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (56,'autre','N',12,'active','2025-02-15 14:13:21','2025-02-15 14:13:21');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (57,'manuel','manual',13,'active','2025-02-15 14:15:01','2025-02-15 14:15:01');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (58,'plaquette','leaflet',13,'active','2025-02-15 14:15:33','2025-02-15 14:15:33');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (59,'affiche','poster',13,'active','2025-02-15 14:15:46','2025-02-15 14:15:46');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (60,'autre','N',13,'active','2025-02-15 14:16:24','2025-02-15 14:16:24');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (61,'devis','quote',12,'active','2025-02-15 14:16:44','2025-02-15 14:17:24');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (62,'facture','invoice',12,'active','2025-02-15 14:17:08','2025-02-15 14:17:08');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (63,'carte','map',13,'active','2025-02-15 14:17:44','2025-02-15 14:17:44');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (64,'partenaire','partner',14,'active','2025-02-15 14:23:52','2025-02-15 14:23:52');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (65,'réseau social','social_network',14,'active','2025-02-15 14:24:26','2025-02-15 14:24:26');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (66,'or','gold',15,'active','2025-02-15 14:25:09','2025-02-15 14:25:09');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (67,'argent','silver',15,'active','2025-02-15 14:25:25','2025-02-15 14:25:25');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (68,'bronze','bronze',15,'active','2025-02-15 14:25:38','2025-02-15 14:25:38');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (69,'siège','headquarters',16,'active','2025-02-16 16:09:47','2025-02-16 16:09:47');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (70,'salle des fêtes','ballroom',16,'active','2025-02-16 16:10:17','2025-02-16 16:10:17');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (71,'salle de réunion','meeting_room',16,'active','2025-02-16 16:10:42','2025-02-16 16:10:42');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (72,'stade','stadium',13,'active','2025-02-16 16:11:05','2025-02-16 16:11:05');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (73,'autre','N',16,'active','2025-02-16 16:11:17','2025-02-16 16:11:17');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (74,'groupe scolaire','school',16,'active','2025-02-16 16:12:02','2025-02-16 16:12:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (75,'salle visio','visio',17,'active','2025-02-16 16:15:01','2025-02-16 16:15:01');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (76,'salle de formation','training_room',17,'active','2025-02-16 16:15:25','2025-02-16 16:15:25');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (77,'amphithéâtre','amphitheatre',17,'active','2025-02-16 16:16:22','2025-02-16 16:16:22');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (78,'auditorium','auditorium',17,'active','2025-02-16 16:16:40','2025-02-16 16:16:40');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (79,'autre','N',17,'active','2025-02-16 16:16:55','2025-02-16 16:16:55');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (80,'terrain de sport','sportfield',17,'active','2025-02-16 16:17:20','2025-02-16 16:17:20');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (81,'siège','main',18,'active','2025-02-16 16:19:46','2025-02-16 16:19:46');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (82,'salle','room',18,'active','2025-02-16 16:20:08','2025-02-16 16:20:08');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (83,'annexe','annex',18,'active','2025-02-16 16:20:38','2025-02-16 16:20:38');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (84,'autre','N',18,'active','2025-02-16 16:20:50','2025-02-16 16:20:50');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (85,'closed','closed',6,'active','2025-02-16 16:24:39','2025-02-16 16:24:39');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (86,'general','general',19,'active','2025-02-16 16:27:41','2025-02-16 16:27:41');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (87,'projet','project',19,'active','2025-02-16 16:27:59','2025-02-16 16:27:59');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (88,'autre','N',19,'active','2025-02-16 16:28:11','2025-02-16 16:28:11');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (89,'relation aux bénéficiaires','beneficiaries',19,'active','2025-02-16 16:28:48','2025-02-16 16:28:48');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (90,'bug','bug',20,'active','2025-02-16 16:35:34','2025-02-16 16:35:34');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (91,'amélioration','enhacement',20,'active','2025-02-16 16:36:43','2025-02-16 16:36:43');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (92,'autre','N',20,'active','2025-02-16 16:36:54','2025-02-16 16:36:54');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (93,'concert','concert',21,'active','2025-02-17 09:04:53','2025-02-17 09:04:53');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (94,'conference','conference',21,'active','2025-02-17 09:05:19','2025-02-17 09:05:19');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (95,'AG','General_assembly',21,'active','2025-02-17 09:16:23','2025-02-17 09:16:23');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (96,'formation','courses',21,'active','2025-02-17 09:17:46','2025-02-17 09:17:46');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (97,'conseil d''administration','CA',21,'active','2025-02-17 09:18:24','2025-02-17 09:18:24');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (98,'mooc','mooc',21,'active','2025-02-17 09:18:42','2025-02-17 09:18:42');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (99,'autre','N',21,'active','2025-02-17 09:19:21','2025-02-17 09:19:21');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (100,'groupe projet','project_team',22,'active','2025-02-17 09:34:49','2025-02-17 09:34:49');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (101,'espace utilisateurs','users_group',22,'active','2025-02-17 09:35:26','2025-02-17 09:35:26');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (102,'réflexion stratégie','strategy_group',22,'active','2025-02-17 09:36:17','2025-02-17 09:36:17');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (103,'autre','N',22,'active','2025-02-17 09:36:29','2025-02-17 09:36:29');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (104,'prm1_cat1','prm1_cat1',23,'active','2025-02-17 09:47:55','2025-02-17 09:47:55');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (105,'prm1_cat2','prm1_cat2',23,'active','2025-02-17 09:48:09','2025-02-17 09:48:09');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (106,'prm1_cat3','prm1_cat3',23,'active','2025-02-17 09:48:25','2025-02-17 09:48:25');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (107,'directeur','general_manager',24,'active','2025-02-17 10:18:20','2025-02-17 10:18:20');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (108,'représentant légal','legal_representative',24,'active','2025-02-17 10:18:46','2025-02-17 10:18:46');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (109,'responsable financier','financial_manager',24,'active','2025-02-17 10:19:12','2025-02-17 10:19:12');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (110,'responsable technique','technical_manager',24,'active','2025-02-17 10:19:34','2025-02-17 10:19:34');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (111,'responsable formation','training_manager',24,'active','2025-02-17 10:20:03','2025-02-17 10:20:03');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (112,'responsable administratif','office_manager',24,'active','2025-02-17 10:20:29','2025-02-17 10:20:29');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (113,'salarié','employee',24,'active','2025-02-17 10:20:48','2025-02-17 10:20:48');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (114,'autre','N',24,'active','2025-02-17 10:20:59','2025-02-17 10:20:59');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (115,'pro_cat1','pro_cat1',25,'active','2025-02-17 10:22:27','2025-02-17 10:22:27');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (116,'pro_cat2','pro_cat2',25,'active','2025-02-17 10:22:41','2025-02-17 10:22:41');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (117,'pro_cat3','pro_cat3',25,'active','2025-02-17 10:22:54','2025-02-17 10:22:54');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (118,'prm1-prm1','prm1-prm1',26,'active','2025-02-17 10:33:30','2025-02-17 10:33:30');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (119,'prm2-prm2','prm2-prm2',26,'active','2025-02-17 10:33:51','2025-02-17 10:33:51');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (120,'prm1-prm2','prm1-prm2',26,'active','2025-02-17 10:34:12','2025-02-17 10:34:12');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (121,'employees','employees',26,'active','2025-02-17 10:34:29','2025-02-17 10:34:29');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (122,'prm1-employees','prm1-employees',26,'active','2025-02-17 10:34:49','2025-02-17 10:34:49');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (123,'couple','couple',27,'active','2025-02-17 10:37:29','2025-02-17 10:37:29');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (124,'famille','family',27,'active','2025-02-17 10:37:48','2025-02-17 10:37:48');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (125,'coloc','coloc',27,'active','2025-02-17 10:38:01','2025-02-17 10:38:01');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (126,'copropriété','co-ownership',27,'active','2025-02-17 10:38:49','2025-02-17 10:38:49');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (127,'entraide','self-help_group',27,'active','2025-02-17 10:39:43','2025-02-17 10:39:43');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (128,'consortium','consortium',27,'active','2025-02-17 10:40:09','2025-02-17 10:40:09');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (129,'equipe pro','pro_team',27,'active','2025-02-17 10:40:29','2025-02-17 10:40:29');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (130,'equipe non pro','nopro_team',27,'active','2025-02-17 10:40:53','2025-02-17 10:40:53');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (131,'equipe pro no-pro','mixed_team',27,'active','2025-02-17 10:41:14','2025-02-17 10:41:14');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (132,'autre','N',27,'active','2025-02-17 10:41:25','2025-02-17 10:41:25');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (133,'pilote','leader',28,'active','2025-02-17 12:30:28','2025-02-17 12:30:28');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (134,'coordinateur','coordinator',28,'active','2025-02-17 12:30:43','2025-02-17 12:30:43');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (135,'animateur technique','technical_assistant',28,'active','2025-02-17 12:31:21','2025-02-17 12:31:21');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (136,'formateur','coach',28,'active','2025-02-17 12:31:34','2025-02-17 12:31:34');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (137,'conseiller juridique','legal_advisor',28,'active','2025-02-17 12:32:08','2025-02-17 12:32:08');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (138,'controleur','controler',28,'active','2025-02-17 12:32:26','2025-02-17 12:32:26');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (139,'participant','participant',28,'active','2025-02-17 12:32:42','2025-02-17 12:32:42');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (140,'autre','N',28,'active','2025-02-17 12:32:57','2025-02-17 12:32:57');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (141,'admin','admin',29,'active','2025-02-17 13:10:59','2025-02-17 13:10:59');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (142,'superviseur','supervisor',29,'active','2025-02-17 13:11:21','2025-02-17 13:11:21');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (143,'editeur','editor',29,'active','2025-02-17 13:11:38','2025-02-17 13:11:38');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (144,'viewer','viewer',29,'active','2025-02-17 13:11:54','2025-02-17 13:11:54');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (145,'groupe 0','G0',30,'active','2025-02-17 13:13:01','2025-02-17 13:13:01');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (146,'groupe 1','G1',30,'active','2025-02-17 13:13:20','2025-02-17 13:13:20');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (147,'groupe 2','G2',30,'active','2025-02-17 13:13:33','2025-02-17 13:13:33');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (148,'groupe 3','G3',30,'active','2025-02-17 13:13:47','2025-02-17 13:13:47');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (149,'groupe 4','G4',30,'active','2025-02-17 13:14:01','2025-02-17 13:14:01');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (150,'niveau 0','L0',31,'active','2025-02-17 13:14:47','2025-02-17 13:14:47');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (151,'niveau 1','l1',31,'active','2025-02-17 13:15:03','2025-02-17 13:15:03');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (152,'niveau 2','L2',31,'active','2025-02-17 13:15:17','2025-02-17 13:15:17');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (153,'niveau 3','L3',31,'active','2025-02-17 13:15:31','2025-02-17 13:17:39');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (154,'niveau 4','L4',31,'active','2025-02-17 13:15:47','2025-02-17 13:15:47');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (155,'fin d''alerte','alert_end',32,'active','2025-02-17 18:17:43','2025-02-17 18:17:43');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (156,'réunion confirmée','confirmed',32,'active','2025-02-17 18:18:09','2025-02-17 18:18:09');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (157,'changement de date','change_date',32,'active','2025-02-17 18:18:44','2025-02-17 18:18:44');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (158,'changemet horaire','change_hour',32,'active','2025-02-17 18:19:03','2025-02-17 18:19:03');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (159,'chagement_lieu','change_place',32,'active','2025-02-17 18:19:21','2025-02-17 18:19:21');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (160,'changement lien visio','change_url',32,'active','2025-02-17 18:19:45','2025-02-17 18:19:45');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (161,'change OdJ','change_agenda',32,'active','2025-02-17 18:20:06','2025-02-17 18:20:06');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (162,'important','important',32,'active','2025-02-17 18:20:37','2025-02-17 18:20:37');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (163,'rénovation maison individuelle','house_renovation',33,'active','2025-02-18 15:41:56','2025-02-18 15:43:32');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (164,'création maison individuelle','house_creation',33,'active','2025-02-18 15:42:20','2025-02-18 15:44:23');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (165,'rénovation batiment','building_renovation',33,'active','2025-02-18 15:45:07','2025-02-18 15:45:07');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (166,'création batiment','building_creation',33,'active','2025-02-18 15:45:44','2025-02-18 15:45:44');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (167,'restauration petit patrimoine','small_heritage_restoration',33,'active','2025-02-18 15:46:44','2025-02-18 15:46:44');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (168,'autre','N',33,'active','2025-02-18 15:46:55','2025-02-18 15:46:55');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (169,'accessible PMR','accessible',35,'active','2025-02-18 17:55:46','2025-02-18 17:55:46');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (170,'non accessible','no_accessible',35,'active','2025-02-18 17:56:09','2025-02-18 17:56:09');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (171,'accessibilité partielle','part_accessible',35,'active','2025-02-18 17:57:00','2025-02-18 17:57:00');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (172,'inconnu','N',35,'active','2025-02-18 17:57:18','2025-02-18 17:57:18');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (173,'maison individuelle','house',34,'active','2025-02-18 17:57:36','2025-02-18 17:57:36');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (174,'bâtiment','building',34,'active','2025-02-18 17:57:55','2025-02-18 17:57:55');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (175,'petit patrimoine','small_heritage',34,'active','2025-02-18 17:58:20','2025-02-18 18:00:21');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (176,'atelier','workshop',34,'active','2025-02-18 17:58:41','2025-02-18 17:58:41');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (177,'usine','factory',34,'active','2025-02-18 17:58:56','2025-02-18 17:58:56');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (178,'commerce','trade_buidling',34,'active','2025-02-18 17:59:46','2025-02-18 17:59:46');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (179,'non précisé','N',34,'active','2025-02-18 18:00:01','2025-02-18 18:00:01');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (180,'pilote','leader',36,'active','2025-02-19 14:17:46','2025-02-19 14:17:46');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (181,'maître d''ouvrage','project_owner',36,'active','2025-02-19 14:18:36','2025-02-19 14:18:36');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (182,'maître d''oeuvre','project_manager',36,'active','2025-02-19 14:19:10','2025-02-19 14:19:10');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (183,'entreprise bâtiment','building_contractor',36,'active','2025-02-19 14:20:15','2025-02-19 14:20:15');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (184,'pro bâtiment','builder',36,'active','2025-02-19 14:20:53','2025-02-19 14:20:53');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (185,'participant','participant',36,'active','2025-02-19 14:21:11','2025-02-19 14:21:11');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (186,'financeur','funder',36,'active','2025-02-19 14:21:44','2025-02-19 14:21:44');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (187,'autre','N',36,'active','2025-02-19 14:21:58','2025-02-19 14:21:58');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (188,'salle de séjour','living_room',37,'active','2025-02-19 17:29:26','2025-02-19 17:29:26');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (189,'chambre','bedroom',37,'active','2025-02-19 17:29:48','2025-02-19 17:29:48');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (190,'cuisine','kitchen',37,'active','2025-02-19 17:30:04','2025-02-19 17:30:04');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (191,'wc','wc',37,'active','2025-02-19 17:30:17','2025-02-19 17:30:17');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (192,'salle de bain','bathroom',37,'active','2025-02-19 17:30:37','2025-02-19 17:30:37');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (193,'couloir','corridor',37,'active','2025-02-19 17:30:56','2025-02-19 17:30:56');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (194,'débarras','storeroom',37,'active','2025-02-19 17:31:25','2025-02-19 17:31:25');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (195,'grenier','attic',37,'active','2025-02-19 17:31:54','2025-02-19 17:31:54');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (196,'cave','cellar',37,'active','2025-02-19 17:32:13','2025-02-19 17:32:13');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (197,'autre','N',37,'active','2025-02-19 17:32:24','2025-02-19 17:32:24');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (198,'génie civil','civil_engineering',38,'active','2025-02-20 13:29:52','2025-02-20 13:29:52');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (199,'maçonnerie','brickworking',38,'active','2025-02-20 13:30:19','2025-02-20 13:30:19');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (200,'charpente','woodwork',38,'active','2025-02-20 13:30:40','2025-02-20 13:30:40');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (201,'électricité','electricity',38,'active','2025-02-20 13:30:56','2025-02-20 13:30:56');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (202,'peinture','painting',38,'active','2025-02-20 13:31:11','2025-02-20 13:31:11');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (203,'plomberie','plumbing',38,'active','2025-02-20 13:31:31','2025-02-20 13:31:31');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (204,'carrelage','carrelage',38,'active','2025-02-20 13:32:05','2025-02-20 13:32:05');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (205,'démolition','demolition',38,'active','2025-02-20 13:32:28','2025-02-20 13:32:28');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (206,'autre','N',38,'active','2025-02-20 13:32:46','2025-02-20 13:32:46');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (207,'animateur technique','technical_advisor',39,'active','2025-02-21 08:43:17','2025-02-21 08:43:17');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (208,'formateur','coach',39,'active','2025-02-21 08:43:32','2025-02-21 08:43:32');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (209,'participant','participant',39,'active','2025-02-21 08:43:49','2025-02-21 08:43:49');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (210,'apprenti','trainee',39,'active','2025-02-21 08:44:09','2025-02-21 08:44:09');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (211,'autre','N',39,'active','2025-02-21 08:44:20','2025-02-21 08:44:20');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (212,'chantier école','training',40,'active','2025-02-21 08:50:46','2025-02-21 08:50:46');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (213,'pré-prod','preprod',40,'active','2025-02-21 08:51:08','2025-02-21 08:51:08');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (214,'production','prod',40,'active','2025-02-21 08:51:22','2025-02-21 08:51:22');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (215,'postprod','postprod',40,'active','2025-02-21 08:51:39','2025-02-21 08:51:39');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (216,'autre','N',40,'active','2025-02-21 08:51:53','2025-02-21 08:51:53');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (217,'google_sheet','google_sheet',41,'active','2025-02-27 09:19:36','2025-02-27 09:19:36');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (218,'google_doc','google_doc',41,'active','2025-02-27 09:20:00','2025-02-27 09:20:00');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (219,'office365-excel','excel',41,'active','2025-02-27 09:24:25','2025-02-27 09:24:25');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (220,'office365-word','word',41,'active','2025-02-27 09:24:48','2025-02-27 09:24:48');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (221,'office365-powerpoint','powerpoint',41,'active','2025-02-27 09:26:04','2025-02-27 09:26:04');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (222,'pdf','pdf',41,'active','2025-02-27 09:26:33','2025-02-27 09:26:33');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (223,'page web','website',41,'active','2025-02-27 09:27:09','2025-02-27 09:27:09');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (224,'office365-form','form',41,'active','2025-02-27 09:28:49','2025-02-27 09:28:49');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (225,'google-slide','google_slide',41,'active','2025-02-27 09:29:13','2025-02-27 09:29:13');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (226,'google survey','google_survey',41,'active','2025-02-27 09:29:35','2025-02-27 09:29:35');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (227,'framapad','framapad',41,'active','2025-02-27 09:30:22','2025-02-27 09:30:22');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (228,'github','github',41,'active','2025-02-27 09:30:38','2025-02-27 09:30:38');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (229,'autre','N',41,'active','2025-02-27 09:30:50','2025-02-27 09:30:50');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (230,'coordinator','coordinator',42,'active','2025-02-27 16:40:01','2025-02-27 16:40:01');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (231,'co_coordinator','co_coordinator',42,'active','2025-02-27 16:40:24','2025-02-27 16:40:24');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (232,'participant','participant',42,'active','2025-02-27 16:40:42','2025-02-27 16:40:42');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (233,'speaker','speaker',42,'active','2025-02-27 16:41:03','2025-02-27 16:41:03');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (234,'coach','coach',42,'active','2025-02-27 16:41:15','2025-02-27 16:41:15');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (235,'secretary','secretary',42,'active','2025-02-27 16:41:33','2025-02-27 16:41:33');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (236,'autre','N',42,'active','2025-02-27 16:41:52','2025-02-27 16:41:52');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (237,'00:00','00:00',43,'active','2025-03-03 09:13:32','2025-03-03 09:13:32');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (238,'00:15','00:15',43,'active','2025-03-03 09:43:20','2025-03-03 09:43:20');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (239,'00:30','00:30',43,'active','2025-03-03 09:43:36','2025-03-03 09:43:36');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (240,'00:45','00:45',43,'active','2025-03-03 09:43:52','2025-03-03 09:43:52');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (241,'01:00','01:00',43,'active','2025-03-03 09:48:53','2025-03-03 09:48:53');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (242,'01:15','01:15',43,'active','2025-03-03 09:49:13','2025-03-03 09:49:13');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (243,'01:30','01:30',43,'active','2025-03-03 09:49:28','2025-03-03 09:49:28');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (244,'01:45','01:45',43,'active','2025-03-03 09:49:50','2025-03-03 09:49:50');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (245,'02:00','02:00',43,'active','2025-03-03 09:50:07','2025-03-03 09:50:07');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (246,'02:15','02:15',43,'active','2025-03-03 09:50:24','2025-03-03 09:50:24');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (247,'02:30','02:30',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (248,'02:45','02:45',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (249,'03:00','03:00',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (250,'03:15','03:15',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (251,'03:30','03:30',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (252,'03:45','03:45',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (253,'04:00','04:00',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (254,'04:15','04:15',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (255,'04:30','04:30',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (256,'04:45','04:45',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (257,'05:00','05:00',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (258,'05:15','05:15',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (259,'05:30','05:30',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (260,'05:45','05:45',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (261,'06:00','06:00',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (262,'06:15','06:15',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (263,'06:30','06:30',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (264,'06:45','06:45',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (265,'07:00','07:00',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (266,'07:15','07:15',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (267,'07:30','07:30',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (268,'07:45','07:45',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (269,'07:00','07:00',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (270,'07:15','07:15',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (271,'07:30','07:30',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (272,'07:45','07:45',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (273,'08:00','08:00',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (274,'08:15','08:15',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (275,'08:30','08:30',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (276,'08:45','08:45',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (277,'09:00','09:00',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (278,'09:15','09:15',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (280,'09:30','09:30',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (281,'09:45','09:45',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (282,'10:00','10:00',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (283,'10:15','10:15',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (284,'10:30','10:30',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (285,'10:45','10:45',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (286,'11:00','11:00',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (287,'11:15','11:15',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (288,'11:30','11:30',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (289,'11:45','11:45',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (290,'12:00','12:00',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (291,'12:15','12:15',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (292,'12:30','12:30',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (293,'12:45','12:45',43,'active','2025-03-03 09:51:02','2025-03-03 09:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (294,'13:00','13:00',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (295,'13:15','13:15',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (296,'13:30','13:30',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (297,'13:45','13:45',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (298,'14:00','14:00',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (299,'14:15','14:15',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (300,'14:30','14:30',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (301,'15:00','15:00',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (302,'15:15','15:15',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (303,'15:30','15:30',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (304,'15:45','15:45',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (305,'16:00','16:00',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (306,'16:15','16:15',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (307,'16:30','16:30',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (308,'16:45','16:45',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (309,'17:00','17:00',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (310,'17:15','17:15',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (311,'17:30','17:30',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (312,'17:45','17:45',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (313,'17:00','17:00',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (314,'17:15','17:15',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (315,'17:30','17:30',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (316,'17:45','17:45',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (317,'18:00','18:00',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (318,'18:15','18:15',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (319,'18:30','18:30',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (320,'18:45','18:45',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (321,'19:00','19:00',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (322,'19:15','19:15',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (323,'19:30','19:30',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (324,'19:45','19:45',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (325,'20:00','20:00',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (326,'20:15','20:15',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (327,'20:30','20:30',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (328,'20:45','20:45',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (329,'21:00','21:00',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (330,'21:15','21:15',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (331,'21:30','21:30',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (332,'21:45','21:45',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (333,'22:00','22:00',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (334,'22:15','22:15',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (335,'22:30','22:30',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (336,'23:00','23:00',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (337,'23:15','23:15',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (338,'23:30','23:30',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (339,'23:45','23:45',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (340,'14:45','14:45',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (341,'22:45','22:45',43,'active','2025-03-03 19:51:02','2025-03-03 19:51:02');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (342,'wks-projet','wks_project',44,'active','2025-03-07 11:08:41','2025-03-07 11:08:41');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (343,'wks_website','wks_website',44,'active','2025-03-07 11:09:09','2025-03-07 11:09:09');
INSERT INTO "choices_items" ("choice_id","choice_label","choice_value","choice_category_id","choice_status","created_at","modified_at") VALUES (344,'Autre','N',44,'active','2025-03-07 11:09:25','2025-03-07 11:09:25');
INSERT INTO "prm2_sub" ("prm2_sub_id","prm2_sub_name","prm2_id","prm2_sub_acronym","prm2_sub_logo_url","prm2_sub_punchline","prm2_sub_summary","prm2_sub_adress","prm2_sub_postal_code","prm2_sub_town","prm2_sub_country","prm2_sub_latitude","prm2_sub_longitude","prm2_sub_contact_phone","prm2_sub_contact_mail","prm2_sub_date_creation","prm2_sub_rank","prm2_sub_status","prm2_sub_legal_status","prm2_sub_nb_employees","prm2_sub_no_rna","prm2_sub_no_siren","prm2_sub_no_siret","prm2_sub_code_naf_ape","prm2_sub_no_tva_intracom","prm2_sub_selected","modified_at","created_at") VALUES (1,'Dept bleu',1,'DB','/x_logos/2025-02-03_11h35m31s_NaLWsafe.png','','','','','','','','','','','',NULL,'active','',11,'','','','','',NULL,'2025-03-07 09:26:59',NULL);
INSERT INTO "prm2_sub" ("prm2_sub_id","prm2_sub_name","prm2_id","prm2_sub_acronym","prm2_sub_logo_url","prm2_sub_punchline","prm2_sub_summary","prm2_sub_adress","prm2_sub_postal_code","prm2_sub_town","prm2_sub_country","prm2_sub_latitude","prm2_sub_longitude","prm2_sub_contact_phone","prm2_sub_contact_mail","prm2_sub_date_creation","prm2_sub_rank","prm2_sub_status","prm2_sub_legal_status","prm2_sub_nb_employees","prm2_sub_no_rna","prm2_sub_no_siren","prm2_sub_no_siret","prm2_sub_code_naf_ape","prm2_sub_no_tva_intracom","prm2_sub_selected","modified_at","created_at") VALUES (2,'dsds',2,'',NULL,'','','','','','','','','','','','main','active','',1,'','','','','','no','2025-02-03 16:56:39','2025-01-31 13:24:36');
INSERT INTO "prm2_sub" ("prm2_sub_id","prm2_sub_name","prm2_id","prm2_sub_acronym","prm2_sub_logo_url","prm2_sub_punchline","prm2_sub_summary","prm2_sub_adress","prm2_sub_postal_code","prm2_sub_town","prm2_sub_country","prm2_sub_latitude","prm2_sub_longitude","prm2_sub_contact_phone","prm2_sub_contact_mail","prm2_sub_date_creation","prm2_sub_rank","prm2_sub_status","prm2_sub_legal_status","prm2_sub_nb_employees","prm2_sub_no_rna","prm2_sub_no_siren","prm2_sub_no_siret","prm2_sub_code_naf_ape","prm2_sub_no_tva_intracom","prm2_sub_selected","modified_at","created_at") VALUES (3,'Dept rouge',1,'DR',NULL,'','','','','','','','','','','','dept','active','',4,'','','','','',NULL,'2025-03-07 09:26:38','2025-02-01 16:54:35');
INSERT INTO "prm2_sub_employees" ("employee_id","prm1_id","prm2_sub_id","employee_title","employee_function","employee_category","employee_status","employee_selected","employee_since","created_at","modified_at") VALUES (2,5,1,'','legal','cat1pro','active','no','2025-02-04 09:15:39','2025-02-04 09:15:52','2025-02-26 16:01:46');
INSERT INTO "prm2_sub_employees" ("employee_id","prm1_id","prm2_sub_id","employee_title","employee_function","employee_category","employee_status","employee_selected","employee_since","created_at","modified_at") VALUES (7,15,1,'','','','active','no',NULL,'2025-02-07 09:55:49','2025-02-07 09:55:49');
INSERT INTO "prm2_sub_employees" ("employee_id","prm1_id","prm2_sub_id","employee_title","employee_function","employee_category","employee_status","employee_selected","employee_since","created_at","modified_at") VALUES (15,4,1,'','','','active','no',NULL,'2025-02-07 18:08:39','2025-02-10 14:14:25');
INSERT INTO "prm2_sub_employees" ("employee_id","prm1_id","prm2_sub_id","employee_title","employee_function","employee_category","employee_status","employee_selected","employee_since","created_at","modified_at") VALUES (17,89,1,'','','','active','no',NULL,'2025-02-07 18:28:50','2025-02-07 18:28:50');
INSERT INTO "prm2_sub_employees" ("employee_id","prm1_id","prm2_sub_id","employee_title","employee_function","employee_category","employee_status","employee_selected","employee_since","created_at","modified_at") VALUES (24,96,1,'','','','active','no',NULL,'2025-02-08 09:00:27','2025-02-08 09:00:27');
INSERT INTO "prm2_sub_employees" ("employee_id","prm1_id","prm2_sub_id","employee_title","employee_function","employee_category","employee_status","employee_selected","employee_since","created_at","modified_at") VALUES (43,16,1,'','','','active','no',NULL,'2025-02-11 08:41:29','2025-02-26 16:02:05');
INSERT INTO "prm2_sub_employees" ("employee_id","prm1_id","prm2_sub_id","employee_title","employee_function","employee_category","employee_status","employee_selected","employee_since","created_at","modified_at") VALUES (44,20,1,'','','','active','no',NULL,'2025-02-11 08:41:44','2025-02-11 08:41:44');
INSERT INTO "prm2_sub_employees" ("employee_id","prm1_id","prm2_sub_id","employee_title","employee_function","employee_category","employee_status","employee_selected","employee_since","created_at","modified_at") VALUES (46,23,1,'','','','active','no',NULL,'2025-03-06 17:41:04','2025-03-06 17:41:04');
INSERT INTO "prm2_sub_employees" ("employee_id","prm1_id","prm2_sub_id","employee_title","employee_function","employee_category","employee_status","employee_selected","employee_since","created_at","modified_at") VALUES (48,114,1,'','','','active','no',NULL,'2025-03-07 08:06:18','2025-03-07 09:25:57');
INSERT INTO "prm2_sub_employees" ("employee_id","prm1_id","prm2_sub_id","employee_title","employee_function","employee_category","employee_status","employee_selected","employee_since","created_at","modified_at") VALUES (49,13,3,'','','','active','no',NULL,'2025-03-07 09:26:22','2025-03-07 09:26:22');
INSERT INTO "prm2_sub_employees" ("employee_id","prm1_id","prm2_sub_id","employee_title","employee_function","employee_category","employee_status","employee_selected","employee_since","created_at","modified_at") VALUES (50,22,3,'','','','active','no',NULL,'2025-03-07 09:26:38','2025-03-07 09:26:38');
INSERT INTO "prm3_docs" ("prm3_doc_id","prm3_id","prm3_doc_title","prm3_doc_url","prm3_doc_summary","prm3_doc_keywords","prm3_doc_status","prm3_doc_category","prm3_doc_format","prm3_doc_selected","prm3_doc_date_publication","prm3_doc_type","created_at","modified_at") VALUES (2,2,'ccxxc','/x_docs/2025-02-12_09h31m34s_MgS6hGZt.md','','','online','legal','','no','','','2025-02-12 09:31:34','CURRENT_TIMESTAMP');
INSERT INTO "project_participants_workpackage" ("workpackage_participant_id","workpackage_id","prm1_id","prm2_sub_id","employee_id","prm3_id","workpackage_participant_role","workpackage_participant_type","workpackage_participant_status","created_at","modified_at") VALUES (1,1,16,NULL,NULL,NULL,'builder','person','active','2025-02-20 17:10:28','2025-02-20 17:10:28');
INSERT INTO "project_participants_workpackage" ("workpackage_participant_id","workpackage_id","prm1_id","prm2_sub_id","employee_id","prm3_id","workpackage_participant_role","workpackage_participant_type","workpackage_participant_status","created_at","modified_at") VALUES (2,1,NULL,1,NULL,NULL,'builder','corporate','active','2025-02-20 17:10:42','2025-02-20 17:10:42');
INSERT INTO "project_participants_workpackage" ("workpackage_participant_id","workpackage_id","prm1_id","prm2_sub_id","employee_id","prm3_id","workpackage_participant_role","workpackage_participant_type","workpackage_participant_status","created_at","modified_at") VALUES (3,1,20,3,45,NULL,'funder','employee','active','2025-02-20 17:10:53','2025-02-20 17:10:53');
INSERT INTO "project_participants_workpackage" ("workpackage_participant_id","workpackage_id","prm1_id","prm2_sub_id","employee_id","prm3_id","workpackage_participant_role","workpackage_participant_type","workpackage_participant_status","created_at","modified_at") VALUES (4,2,17,NULL,NULL,NULL,'','person','active','2025-02-23 10:34:33','2025-02-23 10:34:33');
INSERT INTO "project_participants_workpackage" ("workpackage_participant_id","workpackage_id","prm1_id","prm2_sub_id","employee_id","prm3_id","workpackage_participant_role","workpackage_participant_type","workpackage_participant_status","created_at","modified_at") VALUES (5,2,17,NULL,NULL,NULL,'','person','active','2025-02-23 10:37:14','2025-02-23 10:37:14');
INSERT INTO "project_participants_workpackage" ("workpackage_participant_id","workpackage_id","prm1_id","prm2_sub_id","employee_id","prm3_id","workpackage_participant_role","workpackage_participant_type","workpackage_participant_status","created_at","modified_at") VALUES (6,1,NULL,NULL,NULL,NULL,'participant','group','active','2025-02-26 13:20:41','2025-02-26 13:20:41');
INSERT INTO "project_participants_workpackage" ("workpackage_participant_id","workpackage_id","prm1_id","prm2_sub_id","employee_id","prm3_id","workpackage_participant_role","workpackage_participant_type","workpackage_participant_status","created_at","modified_at") VALUES (7,2,NULL,NULL,NULL,NULL,'','group','active','2025-02-26 13:21:49','2025-02-26 13:21:49');
INSERT INTO "project_participants_workpackage" ("workpackage_participant_id","workpackage_id","prm1_id","prm2_sub_id","employee_id","prm3_id","workpackage_participant_role","workpackage_participant_type","workpackage_participant_status","created_at","modified_at") VALUES (10,1,NULL,NULL,NULL,2,'participant','group','active','2025-03-01 10:55:27','2025-03-01 10:55:27');
INSERT INTO "project_participants_workpackage" ("workpackage_participant_id","workpackage_id","prm1_id","prm2_sub_id","employee_id","prm3_id","workpackage_participant_role","workpackage_participant_type","workpackage_participant_status","created_at","modified_at") VALUES (11,1,19,NULL,NULL,NULL,'','person','active','2025-03-02 17:37:58','2025-03-02 17:37:58');
INSERT INTO "project_participants_workpackage" ("workpackage_participant_id","workpackage_id","prm1_id","prm2_sub_id","employee_id","prm3_id","workpackage_participant_role","workpackage_participant_type","workpackage_participant_status","created_at","modified_at") VALUES (12,1,17,NULL,NULL,NULL,'building_contractor','person','active','2025-03-06 16:20:27','2025-03-06 16:20:27');
INSERT INTO "project_participants_workpackage" ("workpackage_participant_id","workpackage_id","prm1_id","prm2_sub_id","employee_id","prm3_id","workpackage_participant_role","workpackage_participant_type","workpackage_participant_status","created_at","modified_at") VALUES (13,1,NULL,3,NULL,NULL,'project_manager','corporate','active','2025-03-06 16:26:13','2025-03-06 16:26:13');
INSERT INTO "project_participants_workpackage" ("workpackage_participant_id","workpackage_id","prm1_id","prm2_sub_id","employee_id","prm3_id","workpackage_participant_role","workpackage_participant_type","workpackage_participant_status","created_at","modified_at") VALUES (14,1,20,3,45,NULL,'participant','employee','active','2025-03-06 16:26:20','2025-03-06 16:26:20');
INSERT INTO "project_participants_workpackage" ("workpackage_participant_id","workpackage_id","prm1_id","prm2_sub_id","employee_id","prm3_id","workpackage_participant_role","workpackage_participant_type","workpackage_participant_status","created_at","modified_at") VALUES (15,1,23,NULL,NULL,NULL,'','person','active','2025-03-11 12:17:05','2025-03-11 12:17:05');
INSERT INTO "project_participants_worksequence" ("worksequence_participant_id","worksequence_id","prm1_id","prm2_sub_id","employee_id","prm3_id","worksequence_participant_role","worksequence_participant_type","worksequence_participant_status","created_at","modified_at") VALUES (5,1,16,NULL,NULL,NULL,'participant','person','active','2025-02-21 08:45:45','2025-02-21 08:45:45');
INSERT INTO "project_participants_worksequence" ("worksequence_participant_id","worksequence_id","prm1_id","prm2_sub_id","employee_id","prm3_id","worksequence_participant_role","worksequence_participant_type","worksequence_participant_status","created_at","modified_at") VALUES (6,2,16,NULL,NULL,NULL,'','person','active','2025-02-24 17:47:39','2025-02-24 17:47:39');
INSERT INTO "project_participants_worksequence" ("worksequence_participant_id","worksequence_id","prm1_id","prm2_sub_id","employee_id","prm3_id","worksequence_participant_role","worksequence_participant_type","worksequence_participant_status","created_at","modified_at") VALUES (7,2,6,NULL,NULL,NULL,'','person','active','2025-02-24 17:47:46','2025-02-24 17:47:46');
INSERT INTO "project_participants_worksequence" ("worksequence_participant_id","worksequence_id","prm1_id","prm2_sub_id","employee_id","prm3_id","worksequence_participant_role","worksequence_participant_type","worksequence_participant_status","created_at","modified_at") VALUES (8,3,20,3,45,NULL,'','employee','active','2025-02-24 17:48:07','2025-02-24 17:48:07');
INSERT INTO "project_participants_worksequence" ("worksequence_participant_id","worksequence_id","prm1_id","prm2_sub_id","employee_id","prm3_id","worksequence_participant_role","worksequence_participant_type","worksequence_participant_status","created_at","modified_at") VALUES (10,1,16,NULL,NULL,NULL,'','person','active','2025-02-26 15:31:10','2025-02-26 15:31:10');
INSERT INTO "project_participants_worksequence" ("worksequence_participant_id","worksequence_id","prm1_id","prm2_sub_id","employee_id","prm3_id","worksequence_participant_role","worksequence_participant_type","worksequence_participant_status","created_at","modified_at") VALUES (12,1,5,1,2,NULL,'','employee','active','2025-02-26 15:31:28','2025-02-26 15:31:28');
INSERT INTO "project_participants_worksequence" ("worksequence_participant_id","worksequence_id","prm1_id","prm2_sub_id","employee_id","prm3_id","worksequence_participant_role","worksequence_participant_type","worksequence_participant_status","created_at","modified_at") VALUES (16,7,12,NULL,NULL,NULL,'','person','active','2025-02-28 17:49:20','2025-02-28 17:49:20');
INSERT INTO "project_participants_worksequence" ("worksequence_participant_id","worksequence_id","prm1_id","prm2_sub_id","employee_id","prm3_id","worksequence_participant_role","worksequence_participant_type","worksequence_participant_status","created_at","modified_at") VALUES (17,1,NULL,NULL,NULL,3,'','group','active','2025-03-01 11:03:31','2025-03-01 11:03:31');
INSERT INTO "project_participants_worksequence" ("worksequence_participant_id","worksequence_id","prm1_id","prm2_sub_id","employee_id","prm3_id","worksequence_participant_role","worksequence_participant_type","worksequence_participant_status","created_at","modified_at") VALUES (19,1,17,NULL,NULL,NULL,'','person','active','2025-03-06 15:52:47','2025-03-06 15:52:47');
INSERT INTO "project_participants_worksequence" ("worksequence_participant_id","worksequence_id","prm1_id","prm2_sub_id","employee_id","prm3_id","worksequence_participant_role","worksequence_participant_type","worksequence_participant_status","created_at","modified_at") VALUES (20,1,5,1,2,NULL,'technical_advisor','employee','active','2025-03-06 16:00:24','2025-03-06 16:00:24');
INSERT INTO "project_participants_worksequence" ("worksequence_participant_id","worksequence_id","prm1_id","prm2_sub_id","employee_id","prm3_id","worksequence_participant_role","worksequence_participant_type","worksequence_participant_status","created_at","modified_at") VALUES (21,1,NULL,NULL,NULL,2,'trainee','group','active','2025-03-06 16:04:39','2025-03-06 16:04:39');
INSERT INTO "project_participants_worksequence" ("worksequence_participant_id","worksequence_id","prm1_id","prm2_sub_id","employee_id","prm3_id","worksequence_participant_role","worksequence_participant_type","worksequence_participant_status","created_at","modified_at") VALUES (22,1,20,3,45,NULL,'technical_advisor','employee','active','2025-03-06 16:07:56','2025-03-06 16:07:56');
INSERT INTO "project_participants" ("project_participant_id","project_id","prm1_id","prm2_sub_id","employee_id","prm3_id","project_participant_role","project_participant_type","project_participant_status","created_at","modified_at") VALUES (3,1,NULL,1,NULL,NULL,'building_contractor','corporate','archived','2025-02-19 14:22:53','2025-03-11 11:27:01');
INSERT INTO "project_participants" ("project_participant_id","project_id","prm1_id","prm2_sub_id","employee_id","prm3_id","project_participant_role","project_participant_type","project_participant_status","created_at","modified_at") VALUES (4,1,5,1,2,NULL,'builder','employee','active','2025-02-19 14:23:06','2025-02-19 14:23:06');
INSERT INTO "project_participants" ("project_participant_id","project_id","prm1_id","prm2_sub_id","employee_id","prm3_id","project_participant_role","project_participant_type","project_participant_status","created_at","modified_at") VALUES (5,1,16,NULL,NULL,NULL,'','person','active','2025-02-23 11:12:24','2025-02-23 11:12:24');
INSERT INTO "project_participants" ("project_participant_id","project_id","prm1_id","prm2_sub_id","employee_id","prm3_id","project_participant_role","project_participant_type","project_participant_status","created_at","modified_at") VALUES (6,1,NULL,1,NULL,NULL,NULL,'corporate','active','2025-03-06 17:03:49','2025-03-06 17:03:49');
INSERT INTO "project_participants" ("project_participant_id","project_id","prm1_id","prm2_sub_id","employee_id","prm3_id","project_participant_role","project_participant_type","project_participant_status","created_at","modified_at") VALUES (7,1,NULL,1,NULL,NULL,NULL,'corporate','active','2025-03-06 17:03:59','2025-03-06 17:03:59');
INSERT INTO "project_participants" ("project_participant_id","project_id","prm1_id","prm2_sub_id","employee_id","prm3_id","project_participant_role","project_participant_type","project_participant_status","created_at","modified_at") VALUES (8,1,NULL,1,NULL,NULL,'participant',NULL,NULL,'2025-03-06 17:04:48','2025-03-06 17:04:48');
INSERT INTO "project_participants" ("project_participant_id","project_id","prm1_id","prm2_sub_id","employee_id","prm3_id","project_participant_role","project_participant_type","project_participant_status","created_at","modified_at") VALUES (9,1,20,3,45,NULL,'','employee','active','2025-03-06 17:05:03','2025-03-06 17:05:03');
INSERT INTO "project_participants" ("project_participant_id","project_id","prm1_id","prm2_sub_id","employee_id","prm3_id","project_participant_role","project_participant_type","project_participant_status","created_at","modified_at") VALUES (10,1,5,1,2,NULL,'','employee','active','2025-03-06 17:06:21','2025-03-06 17:06:21');
INSERT INTO "project_meetings" ("project_meeting_id","project_meeting_place_id","project_id","project_meeting_title","project_meeting_agenda","project_meeting_visio","project_meeting_visio_url","project_meeting_visio_code","project_meeting_date","project_meeting_hour_start","project_meeting_hour_end","project_meeting_duration","project_meeting_type","project_meeting_participants_nb","project_meeting_alert","project_meeting_status","created_at","modified_at") VALUES (1,'',1,'dssd','dsds','no','','','2025-06-29','','','','concert',NULL,'alert_end','online','2025-02-24 10:05:48','2025-03-11 12:28:17');
INSERT INTO "project_meetings" ("project_meeting_id","project_meeting_place_id","project_id","project_meeting_title","project_meeting_agenda","project_meeting_visio","project_meeting_visio_url","project_meeting_visio_code","project_meeting_date","project_meeting_hour_start","project_meeting_hour_end","project_meeting_duration","project_meeting_type","project_meeting_participants_nb","project_meeting_alert","project_meeting_status","created_at","modified_at") VALUES (2,NULL,1,'dssd','dsds','no','','','2025-02-28','','','','concert',NULL,'alert_end','online','2025-02-24 10:07:31','2025-02-24 10:07:31');
INSERT INTO "project_meetings" ("project_meeting_id","project_meeting_place_id","project_id","project_meeting_title","project_meeting_agenda","project_meeting_visio","project_meeting_visio_url","project_meeting_visio_code","project_meeting_date","project_meeting_hour_start","project_meeting_hour_end","project_meeting_duration","project_meeting_type","project_meeting_participants_nb","project_meeting_alert","project_meeting_status","created_at","modified_at") VALUES (3,'',1,'dssd','dsds','no','','','2025-02-28','','','','concert',NULL,'alert_end','online','2025-02-24 10:24:34','2025-02-24 10:24:34');
INSERT INTO "project_meetings" ("project_meeting_id","project_meeting_place_id","project_id","project_meeting_title","project_meeting_agenda","project_meeting_visio","project_meeting_visio_url","project_meeting_visio_code","project_meeting_date","project_meeting_hour_start","project_meeting_hour_end","project_meeting_duration","project_meeting_type","project_meeting_participants_nb","project_meeting_alert","project_meeting_status","created_at","modified_at") VALUES (4,4,1,'meeting01','','no','','','2025-03-01','','','','',NULL,'alert_end','online','2025-02-24 12:58:51','2025-02-24 12:58:51');
INSERT INTO "project_meetings" ("project_meeting_id","project_meeting_place_id","project_id","project_meeting_title","project_meeting_agenda","project_meeting_visio","project_meeting_visio_url","project_meeting_visio_code","project_meeting_date","project_meeting_hour_start","project_meeting_hour_end","project_meeting_duration","project_meeting_type","project_meeting_participants_nb","project_meeting_alert","project_meeting_status","created_at","modified_at") VALUES (5,'',1,'meetin02','','no','','','2025-03-08','','','','concert',-9,'alert_end','online','2025-02-24 13:00:57','2025-03-03 08:54:01');
INSERT INTO "project_meetings" ("project_meeting_id","project_meeting_place_id","project_id","project_meeting_title","project_meeting_agenda","project_meeting_visio","project_meeting_visio_url","project_meeting_visio_code","project_meeting_date","project_meeting_hour_start","project_meeting_hour_end","project_meeting_duration","project_meeting_type","project_meeting_participants_nb","project_meeting_alert","project_meeting_status","created_at","modified_at") VALUES (6,'',1,'meetin03','','no','','','2025-03-08','','','','concert',7,'alert_end','online','2025-02-24 13:02:17','2025-03-03 10:38:57');
INSERT INTO "project_meetings" ("project_meeting_id","project_meeting_place_id","project_id","project_meeting_title","project_meeting_agenda","project_meeting_visio","project_meeting_visio_url","project_meeting_visio_code","project_meeting_date","project_meeting_hour_start","project_meeting_hour_end","project_meeting_duration","project_meeting_type","project_meeting_participants_nb","project_meeting_alert","project_meeting_status","created_at","modified_at") VALUES (7,'',1,'dsdsds','','no','','','2025-02-28','','','','',0,'alert_end','online','2025-02-27 16:08:33','2025-02-27 16:08:33');
INSERT INTO "project_meetings" ("project_meeting_id","project_meeting_place_id","project_id","project_meeting_title","project_meeting_agenda","project_meeting_visio","project_meeting_visio_url","project_meeting_visio_code","project_meeting_date","project_meeting_hour_start","project_meeting_hour_end","project_meeting_duration","project_meeting_type","project_meeting_participants_nb","project_meeting_alert","project_meeting_status","created_at","modified_at") VALUES (8,4,1,'dsdsds','','no','','','2025-02-28','','','','',1,'alert_end','online','2025-02-27 16:09:56','2025-02-27 16:21:00');
INSERT INTO "project_meetings" ("project_meeting_id","project_meeting_place_id","project_id","project_meeting_title","project_meeting_agenda","project_meeting_visio","project_meeting_visio_url","project_meeting_visio_code","project_meeting_date","project_meeting_hour_start","project_meeting_hour_end","project_meeting_duration","project_meeting_type","project_meeting_participants_nb","project_meeting_alert","project_meeting_status","created_at","modified_at") VALUES (9,4,1,'azcqsfdjyjy','','no','','','2025-02-28','','','','',1,'alert_end','online','2025-02-27 16:16:31','2025-02-27 16:16:32');
INSERT INTO "project_meetings" ("project_meeting_id","project_meeting_place_id","project_id","project_meeting_title","project_meeting_agenda","project_meeting_visio","project_meeting_visio_url","project_meeting_visio_code","project_meeting_date","project_meeting_hour_start","project_meeting_hour_end","project_meeting_duration","project_meeting_type","project_meeting_participants_nb","project_meeting_alert","project_meeting_status","created_at","modified_at") VALUES (10,'',1,'test','','no','','','2025-03-02','','','','',2,'alert_end','online','2025-02-27 16:37:05','2025-02-27 16:38:20');
INSERT INTO "project_meetings" ("project_meeting_id","project_meeting_place_id","project_id","project_meeting_title","project_meeting_agenda","project_meeting_visio","project_meeting_visio_url","project_meeting_visio_code","project_meeting_date","project_meeting_hour_start","project_meeting_hour_end","project_meeting_duration","project_meeting_type","project_meeting_participants_nb","project_meeting_alert","project_meeting_status","created_at","modified_at") VALUES (11,4,1,'meeting 04cxcx','','no','','','2025-03-30','12:45','15:50','','',1,'alert_end','draft','2025-03-02 18:04:53','2025-03-03 09:00:15');
INSERT INTO "project_meetings" ("project_meeting_id","project_meeting_place_id","project_id","project_meeting_title","project_meeting_agenda","project_meeting_visio","project_meeting_visio_url","project_meeting_visio_code","project_meeting_date","project_meeting_hour_start","project_meeting_hour_end","project_meeting_duration","project_meeting_type","project_meeting_participants_nb","project_meeting_alert","project_meeting_status","created_at","modified_at") VALUES (12,'',1,'meeting 78','','no','','','2025-03-29','17:15','02:00','00:45','',1,'alert_end','online','2025-03-03 10:33:17','2025-03-03 10:37:16');
INSERT INTO "project_meetings" ("project_meeting_id","project_meeting_place_id","project_id","project_meeting_title","project_meeting_agenda","project_meeting_visio","project_meeting_visio_url","project_meeting_visio_code","project_meeting_date","project_meeting_hour_start","project_meeting_hour_end","project_meeting_duration","project_meeting_type","project_meeting_participants_nb","project_meeting_alert","project_meeting_status","created_at","modified_at") VALUES (13,'',1,'qssq','','no','','','2025-03-27','02:15','02:45','','',1,'alert_end','online','2025-03-03 10:38:35','2025-03-03 10:38:36');
INSERT INTO "workspace_participants" ("workspace_participant_id","workspace_id","user_id","workspace_participant_role","workspace_partcipant_status","created_at","modified_at") VALUES (19,6,NULL,'coordinator',NULL,'2025-01-06 10:19:25','2025-01-06 10:19:25');
INSERT INTO "workspace_participants" ("workspace_participant_id","workspace_id","user_id","workspace_participant_role","workspace_partcipant_status","created_at","modified_at") VALUES (3,7,NULL,'participant',NULL,'2025-01-06 14:24:43','2025-01-06 14:24:43');
INSERT INTO "workspace_participants" ("workspace_participant_id","workspace_id","user_id","workspace_participant_role","workspace_partcipant_status","created_at","modified_at") VALUES (3,6,NULL,'participant',NULL,'2025-01-09 14:34:52','2025-01-09 14:34:52');
INSERT INTO "workspace_participants" ("workspace_participant_id","workspace_id","user_id","workspace_participant_role","workspace_partcipant_status","created_at","modified_at") VALUES (3,13,NULL,'coordinator',NULL,'2025-01-09 14:40:53','2025-01-09 14:40:53');
INSERT INTO "workspace_participants" ("workspace_participant_id","workspace_id","user_id","workspace_participant_role","workspace_partcipant_status","created_at","modified_at") VALUES (19,7,NULL,'participant',NULL,'2025-03-07 11:02:04','2025-03-07 11:02:04');
INSERT INTO "workspace_participants" ("workspace_participant_id","workspace_id","user_id","workspace_participant_role","workspace_partcipant_status","created_at","modified_at") VALUES (3,4,NULL,'participant',NULL,'2025-03-11 11:22:45','2025-03-11 11:22:45');
INSERT INTO "faq_questions" ("question_id","contact_id","question","question_content","answer","answer_yes_no","faq_yes_no","question_public_private","question_category","question_status","created_at","modified_at") VALUES (9,10,'Faire du bruit',' Comment appelait-on la pratique qui consistait à faire du bruit dans les rues la nuit d’un second mariage ?','Autrefois, beaucoup de femmes mouraient jeunes en couches avant leur mari. Il y avait donc surabondance de veufs, encore jeunes, qui cherchaient à épouser des femmes plus jeunes, ce qui réduisait d’autant les chances des jeunes hommes de trouver une épouse. Quand un veuf se remariait, il avait droit à un tapage nocturne sous ses fenêtres avec concert de sifflets, cloches, casseroles et autres ustensiles. Cela ne cessait généralement pas tant que le mari visé ne payait pas à boire aux perturbateurs. Quand un mari était supposé dominé, voire battu par sa femme, on promenait les deux époux ou des mannequins sur un âne. L’épouse devant et le mari en croupe mais tenant la queue de l’âne. C’était l’asoada.
','yes','yes','private','technical','active','2025-01-02 15:10:04','2025-03-06 13:56:41');
INSERT INTO "faq_questions" ("question_id","contact_id","question","question_content","answer","answer_yes_no","faq_yes_no","question_public_private","question_category","question_status","created_at","modified_at") VALUES (10,11,'Que faisait « lo (h)ongrur » ?',' Que faisait « lo (h)ongrur » ?','Le hongreur castrait les porcs. Mais ce n’était pas la seule misère qu’on leur faisait. Une ancienne carte postale présente leur « dentiste » qui exerçait sur le marché de Miélan. Les porcelets qui devaient être expédiés par chemin de fer étaient mis dans l’impossibilité de mordre leurs congénères. Le « dentiste » montait dans la cremèra (charrette à 4 roues qui les avait transportés) et leur cassait incisives et canines à l’aide d’un davier spécial, une espèce de pince coupante.','yes','yes','public','general','active','2025-01-21 14:53:04','2025-03-06 14:03:28');
INSERT INTO "faq_questions" ("question_id","contact_id","question","question_content","answer","answer_yes_no","faq_yes_no","question_public_private","question_category","question_status","created_at","modified_at") VALUES (11,13,' Qu''es aquò ?','Qu’est-ce que le rondeau ?
','Qu’il se danse en couple ou en chaîne, le rondeau (le rondèu) est par excellence la danse traditionnelle de la Gascogne. Après avoir failli disparaître, il a connu un renouveau dans les années soixante-dix grâce aux collectages réalisés auprès des anciens, notamment à Samatan. Aujourd''hui, il donne lieu à un rassemblement très fréquenté de musiciens et de danseurs, la Hèsta deu rondèu, qui se déroule tous les 2 ans à Castelnau-Barbarens. Les musiciens peuvent être amenés à jouer « Fotètz-me lo camp canalha ! », rondeau de fin de bal, pour signifier aux danseurs qu''il est temps de rentrer !
','yes','yes','private','general','active','2025-01-21 14:55:19','2025-03-06 14:04:20');
INSERT INTO "place_spaces_pictures" ("space_picture_id","place_id","space_id","space_picture_url","space_picture_title","space_picture_summary","space_picture_format","space_picture_status","space_picture_selected","created_at","modified_at") VALUES (1,1,5,'/x_pictures_spaces/2025-03-06_11h40m13s_cv6R297k.jpg','vue d''ensemble',NULL,'','active','no','2024-12-11 11:05:38','2025-03-06 12:34:40');
INSERT INTO "place_spaces_pictures" ("space_picture_id","place_id","space_id","space_picture_url","space_picture_title","space_picture_summary","space_picture_format","space_picture_status","space_picture_selected","created_at","modified_at") VALUES (2,1,5,'/x_pictures_spaces/2025-03-06_11h41m10s_IalHHO6k.jpg','vue arrière',NULL,'','active','no','2024-12-11 11:06:14','2025-03-06 12:34:51');
INSERT INTO "place_spaces_pictures" ("space_picture_id","place_id","space_id","space_picture_url","space_picture_title","space_picture_summary","space_picture_format","space_picture_status","space_picture_selected","created_at","modified_at") VALUES (3,1,8,'/x_pictures_spaces/2025-03-06_11h05m42s_cH8LCa6I.jpg','le chateau',NULL,'png','active','no','2025-03-06 11:05:42','2025-03-06 11:10:43');
INSERT INTO "place_spaces_pictures" ("space_picture_id","place_id","space_id","space_picture_url","space_picture_title","space_picture_summary","space_picture_format","space_picture_status","space_picture_selected","created_at","modified_at") VALUES (4,2,6,'/x_pictures_spaces/2025-03-06_12h44m15s_DelPznGr.jpg','plan de masse',NULL,'jpeg','active','no','2025-03-06 12:44:15','2025-03-06 12:44:15');
INSERT INTO "place_spaces_pictures" ("space_picture_id","place_id","space_id","space_picture_url","space_picture_title","space_picture_summary","space_picture_format","space_picture_status","space_picture_selected","created_at","modified_at") VALUES (5,3,7,'/x_pictures_spaces/2025-03-06_12h45m13s_Pekohabc.jpg','vue aérienne',NULL,'jpeg','active','no','2025-03-06 12:45:13','2025-03-06 12:45:13');
INSERT INTO "orga_docs" ("orga_doc_id","orga_id","orga_dept_id","orga_doc_title","orga_doc_author","orga_doc_url","orga_doc_summary","orga_doc_keywords","orga_doc_date_publication","orga_doc_date_period","orga_doc_lang","orga_doc_format","orga_doc_number_page","orga_doc_category","orga_doc_type","orga_doc_edition","orga_doc_publication","orga_doc_selected","orga_doc_status","created_at","modified_at") VALUES (1,1,1,'Rapport d''activité 2023','CO-OP','/x_docs/2025-03-06_09h57m16s_4nknmmwk.pdf','','','2024-01-03',2023,'FR','pdf',NULL,'annual_report','','valid','active','no',NULL,'2025-03-06 09:57:16','2025-03-06 09:57:16');
INSERT INTO "orga_docs" ("orga_doc_id","orga_id","orga_dept_id","orga_doc_title","orga_doc_author","orga_doc_url","orga_doc_summary","orga_doc_keywords","orga_doc_date_publication","orga_doc_date_period","orga_doc_lang","orga_doc_format","orga_doc_number_page","orga_doc_category","orga_doc_type","orga_doc_edition","orga_doc_publication","orga_doc_selected","orga_doc_status","created_at","modified_at") VALUES (2,1,1,'Bilan 2023','CO-OP','/x_docs/2025-03-06_09h58m26s_4wEyktLO.pdf','','','2024-02-21',2023,'FR','pdf',NULL,'annual_results','','valid','active','no',NULL,'2025-03-06 09:58:26','2025-03-06 09:58:26');
INSERT INTO "project_buildings" ("building_id","project_id","building_name","building_status","building_summary","building_adress","building_postal_code","building_town","building_country","building_latitude","building_longitude","building_contact_phone","building_contact_mail","building_type","building_accessibility","building_capacity_seats","building_capacity_standup","building_selected","created_at","modified_at") VALUES (1,1,'Building01','active','','','','','',44.14797,-1.21897,'','','','accessible','','',NULL,'2025-02-18 17:40:08','2025-03-04 13:30:32');
INSERT INTO "project_buildings" ("building_id","project_id","building_name","building_status","building_summary","building_adress","building_postal_code","building_town","building_country","building_latitude","building_longitude","building_contact_phone","building_contact_mail","building_type","building_accessibility","building_capacity_seats","building_capacity_standup","building_selected","created_at","modified_at") VALUES (2,1,'Building02','active','','','','','',44.0873,-1.3149,'','','workshop','accessible','','',NULL,'2025-02-18 18:04:03','2025-02-20 15:25:58');
INSERT INTO "project_buildings" ("building_id","project_id","building_name","building_status","building_summary","building_adress","building_postal_code","building_town","building_country","building_latitude","building_longitude","building_contact_phone","building_contact_mail","building_type","building_accessibility","building_capacity_seats","building_capacity_standup","building_selected","created_at","modified_at") VALUES (3,1,'Building03','active','','','','','',44.1646,-1.29913,'','','small_heritage','accessible','','',NULL,'2025-02-19 15:15:44','2025-02-20 15:26:14');
INSERT INTO "project_buildings" ("building_id","project_id","building_name","building_status","building_summary","building_adress","building_postal_code","building_town","building_country","building_latitude","building_longitude","building_contact_phone","building_contact_mail","building_type","building_accessibility","building_capacity_seats","building_capacity_standup","building_selected","created_at","modified_at") VALUES (4,2,'newland','active','','','','','','','','','','factory','','','',NULL,'2025-02-20 15:18:21','2025-02-20 15:18:21');
INSERT INTO "project_buildings" ("building_id","project_id","building_name","building_status","building_summary","building_adress","building_postal_code","building_town","building_country","building_latitude","building_longitude","building_contact_phone","building_contact_mail","building_type","building_accessibility","building_capacity_seats","building_capacity_standup","building_selected","created_at","modified_at") VALUES (5,1,'Building O4','active','','','','','',44.14801,-1.163392,'','','building','no_accessible','','',NULL,'2025-03-04 12:59:12','2025-03-04 13:32:21');
INSERT INTO "project_workpackages" ("workpackage_id","workpackage_parent_id","project_id","workpackage_name","workpackage_summary","workpackage_todo","workpackage_type","workpackage_cost_estimated","workpackage_cost_actual","workpackage_nb_participants","workpackage_status","workpackage_date_start_scheduled","workpackage_date_start_actual","workpackage_date_end_scheduled","workpackage_date_end_actual","workpackage_duration_scheduled","workpackage_duration_actual","modified_at","created_at") VALUES (1,NULL,1,'wkp01','','','brickworking',345,'',NULL,'active',NULL,NULL,NULL,NULL,NULL,NULL,'2025-03-11 12:17:05','2025-02-20 13:16:53');
INSERT INTO "project_workpackages" ("workpackage_id","workpackage_parent_id","project_id","workpackage_name","workpackage_summary","workpackage_todo","workpackage_type","workpackage_cost_estimated","workpackage_cost_actual","workpackage_nb_participants","workpackage_status","workpackage_date_start_scheduled","workpackage_date_start_actual","workpackage_date_end_scheduled","workpackage_date_end_actual","workpackage_duration_scheduled","workpackage_duration_actual","modified_at","created_at") VALUES (2,NULL,1,'wkp02','','sqs','civil_engineering',765,'',NULL,'active',NULL,NULL,NULL,NULL,NULL,NULL,'2025-02-26 13:21:49','2025-02-20 13:38:01');
INSERT INTO "project_workpackages" ("workpackage_id","workpackage_parent_id","project_id","workpackage_name","workpackage_summary","workpackage_todo","workpackage_type","workpackage_cost_estimated","workpackage_cost_actual","workpackage_nb_participants","workpackage_status","workpackage_date_start_scheduled","workpackage_date_start_actual","workpackage_date_end_scheduled","workpackage_date_end_actual","workpackage_duration_scheduled","workpackage_duration_actual","modified_at","created_at") VALUES (3,NULL,1,'wkp03','zaza','azaz','plumbing',100,'',NULL,'active',NULL,NULL,NULL,NULL,NULL,NULL,'2025-02-20 13:54:48','2025-02-20 13:45:54');
COMMIT;
