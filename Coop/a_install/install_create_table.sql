-- Table for forum topics
CREATE TABLE IF NOT EXISTS forum_topics (
    id            INTEGER PRIMARY KEY,
    forum_topic   TEXT NOT NULL,
    forum_category TEXT,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table for forum messages
CREATE TABLE IF NOT EXISTS forum_messages (
    id            INTEGER PRIMARY KEY,
    topic_id      INTEGER NOT NULL,
    forum_author        TEXT NOT NULL,
    forum_message       TEXT NOT NULL,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (topic_id) REFERENCES forum_topics(id)
);

-- Table for users
CREATE TABLE "users" (
	"user_id"	INTEGER,
	"username"	TEXT NOT NULL UNIQUE,
	"password_hash"	TEXT,
	"first_name"	NUMERIC,
	"last_name"	NUMERIC,
	"user_role"	NUMERIC,
	"email"	TEXT,
	"phone"	REAL,
	"motivation"	TEXT,
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"modified_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("user_id")
)
-- Table for FAQ messages
CREATE TABLE "faq_messages" (
	"name"	INTEGER,
	"email"	INTEGER,
	"subject"	INTEGER,
	"msg"	INTEGER NOT NULL,
	"created_at"	INTEGER NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"guid"	INTEGER UNIQUE,
	"answer"	INTEGER,
	"faq"	INTEGER,
	"modified_at"	INTEGER,
	"category"	INTEGER,
	PRIMARY KEY("guid")
)

-- Table for sessions
CREATE TABLE "sessions" (
	"created_at"	INTEGER DEFAULT CURRENT_TIMESTAMP,
	"username"	TEXT,
	"user_id"	TEXT,
	"session_token"	TEXT,
	PRIMARY KEY("session_token")
)