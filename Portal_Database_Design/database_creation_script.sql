CREATE DATABASE my_database;

-- Connect to the Database
\connect my_database

-- See all tables in the 'public' schema
\dt public.*

-- INSERT INTO products (product_id, name) VALUES (100, 'Laptop'); 

CREATE TYPE user_status_enum AS ENUM ('active', 'suspended');

CREATE TYPE user_role_enum AS ENUM (
    'company_employee',
    'company_manager',
    'restaurant_employee',
    'restaurant_manager'
);

CREATE TYPE post_status_enum AS ENUM (
	'open',
	'locked',
	'resolved',
	'suspended',
	'archived'
);

CREATE TABLE users (
	user_id BIGINT  GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	user_date_created_at TIMESTAMPTZ NOT NULL,
	user_first_name VARCHAR(100) NOT NULL,
	user_last_name  VARCHAR(100),
	user_password VARCHAR(100) NOT NULL,
	user_email VARCHAR(100) NOT NULL UNIQUE,
	user_dob DATE NOT NULL,
	user_role user_role_enum NOT NULL,
	user_address_room_no VARCHAR(5),
	user_address_building VARCHAR(50),
	user_address_street VARCHAR(100) NOT NULL,
	user_address_city VARCHAR(100) NOT NULL,
	user_address_admin_division VARCHAR(100),
	user_address_country VARCHAR(100) NOT NULL,
	user_address_post_code VARCHAR(12) NOT NULL,
	outlet_id BIGINT,
	user_mobile_no VARCHAR(12) NOT NULL UNIQUE,
	user_is_moderator BOOLEAN NOT NULL,
	user_status user_status_enum NOT NULL DEFAULT 'active'

);

CREATE TABLE posts (
	post_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	post_date_created_at TIMESTAMPTZ NOT NULL,
	post_content VARCHAR(20000) NOT NULL,
	user_id BIGINT NOT NULL,
	post_status post_status_enum NOT NULL DEFAULT 'open'
);

CREATE TABLE comments (
	comment_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	comment_date_created_at TIMESTAMPTZ NOT NULL,
	comment_content VARCHAR(20000) NOT NULL,
	comment_is_deleted BOOLEAN NOT NULL,
	post_id BIGINT NOT NULL,
	user_id  BIGINT NOT NULL,
	reply_id BIGINT

);

CREATE TABLE images (
	image_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	image_date_created_at TIMESTAMPTZ NOT NULL,
	image_path VARCHAR(256) NOT NULL,
	image_tag VARCHAR(1000),
	post_id BIGINT NOT NULL
);

CREATE TABLE chains (
	chain_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	chain_date_created_at TIMESTAMPTZ NOT NULL,
	chain_name VARCHAR(100) NOT NULL UNIQUE,
	chain_headquarters_address_room_no VARCHAR(5),
	chain_headquarters_address_building VARCHAR(50),
	chain_headquarters_address_street VARCHAR(100) NOT NULL,
	chain_headquarters_address_city VARCHAR(100) NOT NULL,
	chain_headquarters_address_admin_division VARCHAR(100),
	chain_headquarters_address_country VARCHAR(100) NOT NULL,
	chain_headquarters_address_post_code VARCHAR(12) NOT NULL
);

CREATE TABLE outlets (
	outlet_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	outlet_date_created_at TIMESTAMPTZ NOT NULL,
	outlet_name VARCHAR(100) NOT NULL UNIQUE,
	outlet_address_room_no VARCHAR(5),
	outlet_address_building VARCHAR(50),
	outlet_address_street VARCHAR(100) NOT NULL,
	outlet_address_city VARCHAR(100) NOT NULL,
	outlet_address_admin_division VARCHAR(100),
	outlet_address_country VARCHAR(100) NOT NULL,
	outlet_address_post_code VARCHAR(12) NOT NULL,
	chain_id BIGINT
);

--ALTER TABLE chains
--ADD CONSTRAINT uq_chain_name UNIQUE (chain_name);

--ALTER TABLE outlets
--ADD CONSTRAINT uq_outlet_name UNIQUE (outlet_name);


--ALTER TABLE posts
--DROP COLUMN post_status;

--ALTER TABLE posts
--ADD COLUMN post_status post_status_enum NOT NULL DEFAULT 'open';


ALTER TABLE posts 
ADD CONSTRAINT fk_post_user 
FOREIGN KEY (user_id) REFERENCES users(user_id)
ON DELETE CASCADE;

ALTER TABLE comments
ADD CONSTRAINT fk_comment_user
FOREIGN KEY (user_id) REFERENCES users(user_id)
ON DELETE CASCADE;

ALTER TABLE comments
ADD CONSTRAINT fk_comment_post
FOREIGN KEY(post_id) REFERENCES posts(post_id)
ON DELETE CASCADE;

ALTER TABLE comments
ADD CONSTRAINT fk_comment_reply
FOREIGN KEY(reply_id) REFERENCES comments(comment_id)
ON DELETE SET NULL;

ALTER TABLE images
ADD CONSTRAINT fk_image_post 
FOREIGN KEY(post_id) REFERENCES posts(post_id)
ON DELETE CASCADE;

ALTER TABLE outlets
ADD CONSTRAINT fk_outlet_chain
FOREIGN KEY(chain_id) REFERENCES chains(chain_id)
ON DELETE RESTRICT;

--CREATE TYPE user_status_enum AS ENUM ('active', 'suspended');

--ALTER TABLE users
--ADD COLUMN user_status user_status_enum NOT NULL;

--ALTER TABLE users
--ALTER COLUMN user_status SET DEFAULT 'active';

ALTER TABLE users
ADD CONSTRAINT fk_user_outlet
FOREIGN KEY(outlet_id) REFERENCES outlets(outlet_id)
ON DELETE SET NULL;


-- Trigger to coduct actions during soft delete of comments.
CREATE OR REPLACE FUNCTION replace_deleted_comment_content()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.comment_is_deleted = true THEN
        NEW.comment_content := 'This comment has been deleted';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_replace_deleted_comment_content
BEFORE UPDATE ON comments
FOR EACH ROW
EXECUTE FUNCTION replace_deleted_comment_content();


INSERT INTO  users (user_id, user_date_created_at, user_first_name, user_last_name, user_password, user_email, user_dob, user_role, user_address_room_no, user_address_building, user_address_street, user_address_city, user_address_admin_division, user_address_country, user_address_post_code, outlet_id, user_mobile_no, user_is_moderator, user_status) VALUES (1, NOW(), 'ABCFname', 'ABCLname', 'abc@123pwd00', 'abc@server.com', '1998-04-06', 'restaurant_employee', '1204', 'Marina Heights', 'Dubai Marina', 'Dubai', 'Dubai', 'United Arab Emirates', '000000', NULL, '971501234567', false, 'active');

INSERT INTO  users (user_id, user_date_created_at, user_first_name, user_last_name, user_password, user_email, user_dob, user_role, user_address_room_no, user_address_building, user_address_street, user_address_city, user_address_admin_division, user_address_country, user_address_post_code, outlet_id, user_mobile_no, user_is_moderator, user_status) VALUES (2, NOW(), 'DEFFname', 'DEFLname', 'defc@256pwd11', 'def@server.com', '1999-04-06', 'restaurant_manager', '18', 'Al Bateen', 'Al Khaleej Al Arabi Street', 'Abu Dhabi', 'Abu Dhabi', 'United Arab Emirates', '000000', NULL, '971522345678', false, 'active');

INSERT INTO  users (user_id, user_date_created_at, user_first_name, user_last_name, user_password, user_email, user_dob, user_role, user_address_room_no, user_address_building, user_address_street, user_address_city, user_address_admin_division, user_address_country, user_address_post_code, outlet_id, user_mobile_no, user_is_moderator, user_status) VALUES (3, NOW(), 'GHIFname', 'GHILname', 'ghi@267pwd00', 'ghi@server.com', '1998-05-06', 'company_employee', '704', 'Al Qasimia Tower', 'Al Qasimia', 'Sharjah', 'Sharjah', 'United Arab Emirates', '000000', NULL, '971543456789', true, 'active');

INSERT INTO  users (user_id, user_date_created_at, user_first_name, user_last_name, user_password, user_email, user_dob, user_role, user_address_room_no, user_address_building, user_address_street, user_address_city, user_address_admin_division, user_address_country, user_address_post_code, outlet_id, user_mobile_no, user_is_moderator, user_status) VALUES (4, NOW(), 'GHSFname', 'GHSLname', 'ghs@107pwd00', 'ghs@server.com', '1996-05-06', 'company_manager', '714', 'Al Qasimia Tower', 'Al Qasimia', 'Sharjah', 'Sharjah', 'United Arab Emirates', '000000', NULL, '971542345678', true, 'active');

INSERT INTO  users (user_id, user_date_created_at, user_first_name, user_last_name, user_password, user_email, user_dob, user_role, user_address_room_no, user_address_building, user_address_street, user_address_city, user_address_admin_division, user_address_country, user_address_post_code, outlet_id, user_mobile_no, user_is_moderator, user_status) VALUES (5, NOW(), 'JKLFname', 'JKLLname', 'jkl@193pwdn1', 'jkl@server.com', '1994-05-06', 'restaurant_employee', '305', 'Al Nuaimiya Tower', 'Al Nuaimiya', 'Ajman', 'Ajman', 'United Arab Emirates', '000000', NULL, '971554567890', false, 'active');

INSERT INTO  users (user_id, user_date_created_at, user_first_name, user_last_name, user_password, user_email, user_dob, user_role, user_address_room_no, user_address_building, user_address_street, user_address_city, user_address_admin_division, user_address_country, user_address_post_code, outlet_id, user_mobile_no, user_is_moderator, user_status) VALUES (6, NOW(), 'MNOFname', 'MNOLname', 'mno@401pwd31', 'mno@server.com', '1995-05-07', 'restaurant_manager', '27', 'Al Muwaiji', 'Al Muwaiji', 'Al-Ain', 'Al-Ain', 'United Arab Emirates', '000000', NULL, '971565678901', false, 'active');

INSERT INTO  users (user_id, user_date_created_at, user_first_name, user_last_name, user_password, user_email, user_dob, user_role, user_address_room_no, user_address_building, user_address_street, user_address_city, user_address_admin_division, user_address_country, user_address_post_code, outlet_id, user_mobile_no, user_is_moderator, user_status) VALUES (7, NOW(), 'STUFname', 'STULname', 'stu@114pwd06', 'stu@server.com', '1994-05-08', 'restaurant_manager', '', '2847', 'King Abdul Aziz Road', 'Riyadh', 'Eastern Province', 'Saudi Arabia', '12836', 1, '966501234567', false, 'active');

INSERT INTO  users (user_id, user_date_created_at, user_first_name, user_last_name, user_password, user_email, user_dob, user_role, user_address_room_no, user_address_building, user_address_street, user_address_city, user_address_admin_division, user_address_country, user_address_post_code, outlet_id, user_mobile_no, user_is_moderator, user_status) VALUES (8, NOW(), 'PQRSFname', 'PQRSLname', 'pqrs@206pwd09', 'pqrs@server.com', '1993-10-06', 'restaurant_employee', '', '2847', 'King Abdul Aziz Road', 'Riyadh', 'Eastern Province', 'Saudi Arabia', '12836', 1, '966503486264', false, 'active');

INSERT INTO  users (user_id, user_date_created_at, user_first_name, user_last_name, user_password, user_email, user_dob, user_role, user_address_room_no, user_address_building, user_address_street, user_address_city, user_address_admin_division, user_address_country, user_address_post_code, outlet_id, user_mobile_no, user_is_moderator, user_status) VALUES (9, NOW(), 'JULFFname', 'JULFLname', 'julf@217pwd08', 'julf@server.com', '1993-10-01', 'restaurant_manager', '', '2847', 'King Abdul Aziz Road', 'Riyadh', 'Eastern Province', 'Saudi Arabia', '12836', 2, '966508349380', false, 'active');

INSERT INTO  users (user_id, user_date_created_at, user_first_name, user_last_name, user_password, user_email, user_dob, user_role, user_address_room_no, user_address_building, user_address_street, user_address_city, user_address_admin_division, user_address_country, user_address_post_code, outlet_id, user_mobile_no, user_is_moderator, user_status) VALUES (10, NOW(), 'ALSAFname', 'ALSALname', 'alsa@318pwd08', 'alsa@server.com', '1993-10-02', 'restaurant_employee', '', '4192', 'Prince Sultan Road', 'Jeddah', 'Makkah Governorate', 'Saudi Arabia', '23522', 2, '96650834939', false, 'active');

INSERT INTO  users (user_id, user_date_created_at, user_first_name, user_last_name, user_password, user_email, user_dob, user_role, user_address_room_no, user_address_building, user_address_street, user_address_city, user_address_admin_division, user_address_country, user_address_post_code, outlet_id, user_mobile_no, user_is_moderator, user_status) VALUES (11, NOW(), 'SDPFname', 'SDPLname', 'sdp@060pwd05', 'sdp@server.com', '1996-01-09', 'restaurant_manager', '', '4192', 'Prince Sultan Road', 'Jeddah', 'Makkah Governorate', 'Saudi Arabia', '23522', 3, '966506298458', false, 'active');

INSERT INTO  users (user_id, user_date_created_at, user_first_name, user_last_name, user_password, user_email, user_dob, user_role, user_address_room_no, user_address_building, user_address_street, user_address_city, user_address_admin_division, user_address_country, user_address_post_code, outlet_id, user_mobile_no, user_is_moderator, user_status) VALUES (12, NOW(), 'RSOFname', 'RSOLname', 'rso@050pwd05', 'rso@server.com', '1993-10-09', 'restaurant_employee', '', '4192', 'Prince Sultan Road', 'Jeddah', 'Makkah Governorate', 'Saudi Arabia', '23522', 3, '966506187347', false, 'active');

INSERT INTO  users (user_id, user_date_created_at, user_first_name, user_last_name, user_password, user_email, user_dob, user_role, user_address_room_no, user_address_building, user_address_street, user_address_city, user_address_admin_division, user_address_country, user_address_post_code, outlet_id, user_mobile_no, user_is_moderator, user_status) VALUES (13, NOW(), 'PSLFname', 'PSLLname', 'psl@090pwd07', 'psl@server.com', '1993-04-09', 'restaurant_manager', '', '1736', 'King Fahd Road', 'Dammam', 'Eastern Province', 'Saudi Arabia', '32271', 4, '966543456789', false, 'active');

INSERT INTO  users (user_id, user_date_created_at, user_first_name, user_last_name, user_password, user_email, user_dob, user_role, user_address_room_no, user_address_building, user_address_street, user_address_city, user_address_admin_division, user_address_country, user_address_post_code, outlet_id, user_mobile_no, user_is_moderator, user_status) VALUES (14, NOW(), 'SLVFname', 'SLVLname', 'slv@210pwd02', 'slv@server.com', '1996-04-09', 'restaurant_employee', '', '1736', 'King Fahd Road', 'Dammam', 'Eastern Province', 'Saudi Arabia', '32271', 4, '966542567328', false, 'active');

INSERT INTO  users (user_id, user_date_created_at, user_first_name, user_last_name, user_password, user_email, user_dob, user_role, user_address_room_no, user_address_building, user_address_street, user_address_city, user_address_admin_division, user_address_country, user_address_post_code, outlet_id, user_mobile_no, user_is_moderator, user_status) VALUES (15, NOW(), 'SVLFname', 'SVLLname', 'svl@210pwd02', 'svl@server.com', '1996-05-09', 'restaurant_manager', '', '1736', 'King Fahd Road', 'Dammam', 'Eastern Province', 'Saudi Arabia', '32271', 5, '966541456217', false, 'active');

INSERT INTO  users (user_id, user_date_created_at, user_first_name, user_last_name, user_password, user_email, user_dob, user_role, user_address_room_no, user_address_building, user_address_street, user_address_city, user_address_admin_division, user_address_country, user_address_post_code, outlet_id, user_mobile_no, user_is_moderator, user_status) VALUES (16, NOW(), 'TRSFname', 'TRSLname', 'trs@321pwd03', 'trs@server.com', '1991-03-08', 'restaurant_employee', '', '3258', 'Dhahran Street', 'Al Khobar', 'Eastern Province', 'Saudi Arabia', '34446', 5, '966554567890', false, 'active');

INSERT INTO  users (user_id, user_date_created_at, user_first_name, user_last_name, user_password, user_email, user_dob, user_role, user_address_room_no, user_address_building, user_address_street, user_address_city, user_address_admin_division, user_address_country, user_address_post_code, outlet_id, user_mobile_no, user_is_moderator, user_status) VALUES (17, NOW(), 'TSRFname', 'TSRLname', 'tsr@108pwd01', 'tsr@server.com', '1992-04-10', 'restaurant_manager', '', '3258', 'Dhahran Street', 'Al Khobar', 'Eastern Province', 'Saudi Arabia', '34446', 6, '966554456790', false, 'active');

INSERT INTO  users (user_id, user_date_created_at, user_first_name, user_last_name, user_password, user_email, user_dob, user_role, user_address_room_no, user_address_building, user_address_street, user_address_city, user_address_admin_division, user_address_country, user_address_post_code, outlet_id, user_mobile_no, user_is_moderator) VALUES (18, NOW(), 'PSRFname', 'PSRLname', 'psr@108pwd01', 'psr@server.com', '1991-03-08', 'restaurant_employee', '', '3258', 'Dhahran Street', 'Al Khobar', 'Eastern Province', 'Saudi Arabia', '34446', 6, '966554123456', false);
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO chains (chain_id, chain_date_created_at, chain_name, chain_headquarters_address_room_no, chain_headquarters_address_building, chain_headquarters_address_street, chain_headquarters_address_city, chain_headquarters_address_admin_division, chain_headquarters_address_country, chain_headquarters_address_post_code) VALUES (1, NOW(), 'Tim Hortons', '', 'Apparel Group Building', 'Jebel Ali Free Zone South', 'Dubai', 'Dubai', 'United Arab Emirates', '000000');

INSERT INTO chains (chain_id, chain_date_created_at, chain_name, chain_headquarters_address_room_no, chain_headquarters_address_building, chain_headquarters_address_street, chain_headquarters_address_city, chain_headquarters_address_admin_division, chain_headquarters_address_country, chain_headquarters_address_post_code) VALUES (2, NOW(), 'Graph Cafe', '', '', 'Dhahran Jubail Branch Rd', 'Dammam', 'Eastern Province', 'Saudi Arabia', '32272');

INSERT INTO chains (chain_id, chain_date_created_at, chain_name, chain_headquarters_address_room_no, chain_headquarters_address_building, chain_headquarters_address_street, chain_headquarters_address_city, chain_headquarters_address_admin_division, chain_headquarters_address_country, chain_headquarters_address_post_code) VALUES (3, NOW(), 'Road Cafe', '3130', '1st Floor Aldahna Building', '', 'Riyadh', 'Eastern Province', 'Saudi Arabia', '12815');

INSERT INTO chains (chain_id, chain_date_created_at, chain_name, chain_headquarters_address_room_no, chain_headquarters_address_building, chain_headquarters_address_street, chain_headquarters_address_city, chain_headquarters_address_admin_division, chain_headquarters_address_country, chain_headquarters_address_post_code) VALUES (4, NOW(), 'Test Chain', '12', 'Test Building', 'Test Street', 'Test City', 'Test Division', 'India', '560001');
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO outlets (outlet_id, outlet_date_created_at, outlet_name, outlet_address_room_no, outlet_address_building, outlet_address_street, outlet_address_city, outlet_address_admin_division, outlet_address_country, outlet_address_post_code, chain_id) VALUES (1, NOW(), 'Tim Hortons #1', '', 'Petromin', 'Eastern Ring Road', 'Riyadh', 'Eastern Province', 'Saudi Arabia', '12824', 1);

INSERT INTO outlets (outlet_id, outlet_date_created_at, outlet_name, outlet_address_room_no, outlet_address_building, outlet_address_street, outlet_address_city, outlet_address_admin_division, outlet_address_country, outlet_address_post_code, chain_id) VALUES (2, NOW(), 'Tim Hortons #2', '', 'Red Sea Mall', 'King Abdulaziz Branch Road', 'Jeddah', 'Makkah Governorate', 'Saudi Arabia', '23612', 1);

INSERT INTO outlets (outlet_id, outlet_date_created_at, outlet_name, outlet_address_room_no, outlet_address_building, outlet_address_street, outlet_address_city, outlet_address_admin_division, outlet_address_country, outlet_address_post_code, chain_id) VALUES (3, NOW(), 'Road Cafe #1', '', '', '6686 Al Urubah Road', 'Riyadh', 'Eastern Province', 'Saudi Arabia', '12341', 3);

INSERT INTO outlets (outlet_id, outlet_date_created_at, outlet_name, outlet_address_room_no, outlet_address_building, outlet_address_street, outlet_address_city, outlet_address_admin_division, outlet_address_country, outlet_address_post_code, chain_id) VALUES (4, NOW(), 'Road Cafe #2', '', '', '4116 Prince Sultan Road', 'Riyadh', 'Eastern Province', 'Saudi Arabia', '34235', 3);

INSERT INTO outlets (outlet_id, outlet_date_created_at, outlet_name, outlet_address_room_no, outlet_address_building, outlet_address_street, outlet_address_city, outlet_address_admin_division, outlet_address_country, outlet_address_post_code, chain_id) VALUES (5, NOW(), 'Graph Cafe #1', '', '', 'Dhahran–Jubail Branch Road', 'Dammam', 'Eastern Province', 'Saudi Arabia', '32272', 2);

INSERT INTO outlets (outlet_id, outlet_date_created_at, outlet_name, outlet_address_room_no, outlet_address_building, outlet_address_street, outlet_address_city, outlet_address_admin_division, outlet_address_country, outlet_address_post_code, chain_id) VALUES (6, NOW(), 'Graph Cafe #2', '', '', 'Alnuman Ibn Harithah Street', 'Al-Khobar', 'Eastern Province', 'Saudi Arabia', '34714', 2);
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO posts (post_id, post_date_created_at, post_content, user_id, post_status) VALUES (1, NOW(), 'ABC Post One', 1, 'open');
INSERT INTO posts (post_id, post_date_created_at, post_content, user_id, post_status) VALUES (2, NOW(), 'ABC Post Two', 1, 'open');
INSERT INTO posts (post_id, post_date_created_at, post_content, user_id, post_status) VALUES (3, NOW(), 'ABC Post Three', 1, 'open');
INSERT INTO posts (post_id, post_date_created_at, post_content, user_id, post_status) VALUES (4, NOW(), 'STU Post One', 7, 'open');
INSERT INTO posts (post_id, post_date_created_at, post_content, user_id, post_status) VALUES (5, NOW(), 'STU Post Two', 7, 'open');
INSERT INTO posts (post_id, post_date_created_at, post_content, user_id) VALUES (6, NOW(), 'JULF Post One', 9);
INSERT INTO posts (post_id, post_date_created_at, post_content, user_id) VALUES (7, NOW(), 'JULF Post Two', 9);
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO comments (comment_id, comment_date_created_at, comment_content, comment_is_deleted, post_id, user_id, reply_id) VALUES (1, NOW(), 'ABC Post One Comment One', false, 1, 1, NULL);
INSERT INTO comments (comment_id, comment_date_created_at, comment_content, comment_is_deleted, post_id, user_id, reply_id) VALUES (2, NOW(), 'ABC Post One Comment One Reply One', false, 1, 1, 1);
INSERT INTO comments (comment_id, comment_date_created_at, comment_content, comment_is_deleted, post_id, user_id, reply_id) VALUES (3, NOW(), 'ABC Post One Comment One Reply Two', false, 1, 1, 1);
INSERT INTO comments (comment_id, comment_date_created_at, comment_content, comment_is_deleted, post_id, user_id, reply_id) VALUES (4, NOW(), 'ABC Post One Comment Two', false, 1, 1, NULL);
INSERT INTO comments (comment_id, comment_date_created_at, comment_content, comment_is_deleted, post_id, user_id, reply_id) VALUES (5, NOW(), 'ABC Post One Comment Two Reply One', false, 1, 1, 4);
INSERT INTO comments (comment_id, comment_date_created_at, comment_content, comment_is_deleted, post_id, user_id, reply_id) VALUES (6, NOW(), 'ABC Post One Comment Two Reply Two', false, 1, 1, 4);
INSERT INTO comments (comment_id, comment_date_created_at, comment_content, comment_is_deleted, post_id, user_id, reply_id) VALUES (7, NOW(), 'STU Post One Comment One', false, 4, 7, NULL);
INSERT INTO comments (comment_id, comment_date_created_at, comment_content, comment_is_deleted, post_id, user_id, reply_id) VALUES (8, NOW(), 'STU Post One Comment Two', false, 4, 7, NULL);
INSERT INTO comments (comment_id, comment_date_created_at, comment_content, comment_is_deleted, post_id, user_id, reply_id) VALUES (9, NOW(), 'STU Post One Comment Two Reply One', false, 4, 7, 8);
INSERT INTO comments (comment_id, comment_date_created_at, comment_content, comment_is_deleted, post_id, user_id, reply_id) VALUES (10, NOW(), 'STU Post One Comment Two Reply Two', false, 4, 7, 8);
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO images (image_id, image_date_created_at, image_path, image_tag, post_id) VALUES (1, NOW(), '/images/stu_post_1_image_1', NULL, 4);
INSERT INTO images (image_id, image_date_created_at, image_path, image_tag, post_id) VALUES (2, NOW(), '/images/stu_post_1_image_2', NULL, 4);
INSERT INTO images (image_id, image_date_created_at, image_path, image_tag, post_id) VALUES (3, NOW(), '/images/stu_post_2_image_1', NULL, 5);
INSERT INTO images (image_id, image_date_created_at, image_path, image_tag, post_id) VALUES (4, NOW(), '/images/stu_post_2_image_2', NULL, 5);
------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Use \d to see all the constraints of a table in postgres.
-- \d <table_name>

-- Backing up the database
-- pg_dump -U postgres -d my_database -f backup.sql

-- Restoring the database
-- psql -U postgres -d my_database -f backup.sql

/**
Delete a USER that has no OUTLET assigned to it. -> Only that USER is deleted. -> DONE
Delete an OUTLET which has USER(s) -> The respective outlet_id(s) of the respective USER(s) should become NULL. -> DONE
Delete a COMMENT without replies -> Only that COMMENT should be deleted. -> DONE
Delete a COMMENT with replies -> Replies should remain. Their reply_id should become NULL. -> DONE
Delete a COMMENT that is a reply -> Only that COMMENT should be deleted. -> DONE
Soft-delete a COMMENT, i.e., set comment_is_deleted to true -> The comment_content should change to "This comment has been deleted".  -> DONE

Delete an IMAGE. -> Only that IMAGE should be deleted. -> DONE
Delete a POST. All the corresponding COMMENT(s) and IMAGE(s) of that POST should be deleted. -> DONE
Delete a CHAIN. -> Shouldn't be possible to delete it. -> DONE
Delete a CHAIN after deleting all OUTLETS. -> DONE

**/

/**
OUTLETS - USERS (0:1 - 1:N) A given outlet may have 1 or N users. A given user can belong to only 1 outlet or no outlet. When we delete an OUTLET, then the outlet_id in the respective USER should be made NULL.

CHAINS - OUTLETS (0:1 - 1:N) A given chain can have 1 or N outlets. Each outlet can belong to 1 chain or no chain. We are not allowed to delete a CHAIN. We can only delete a chain when we delete all of its OUTLETS.

USERS - POSTS  (1:1 - 0:N) A given user can have 0 or N POST. Each POST belongs to only 1 USER. When a USER is deleted, then all his POST will be deleted.

COMMENTS - COMMENTS (1:1 - 0:N) Each parent comment can have 0 or N child comments (replies). Each child comment belongs to only 1 parent. This is a 1:0 or N unary relationship. When a parent COMMENT is deleted, then all of its replies will not be deleted.
NOTE: The reply_id is a FK that denotes the presence of the child comment in this 1:M Unary relationship doesn't need to be introduced at the conceptual stage.

USERS - COMMENTS (1:1 - 0:N) A given user can have 0 or N comments. Each comment belongs to only 1 user. When we delete a USER, then all his COMMENT will be deleted. 

POSTS - COMMENTS  (1:1 - 0:N) A post can have 0 or N comments. Each comment belongs to only 1 post. When a POST is deleted, then all of its COMMENT will also be deleted.

POSTS - IMAGES    (1:1 - 0:4) A post can have 0 or up to 4 images. Each image belongs to only 1 post. When a POST is deleted, then all of its IMAGE will also be deleted.

**/ 
