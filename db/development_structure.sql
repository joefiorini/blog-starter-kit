CREATE TABLE posts ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(255) DEFAULT NULL, "body" text DEFAULT NULL, "excerpt" text DEFAULT NULL, "is_published" boolean DEFAULT NULL, "created_at" datetime DEFAULT NULL, "updated_at" datetime DEFAULT NULL);
CREATE TABLE schema_info (version integer);
INSERT INTO schema_info (version) VALUES (1)