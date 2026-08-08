CREATE DATABASE my_database;

-- Connect to the Database
\connect my_database

-- See all tables in the "public" schema
\dt public.*

-- INSERT INTO products (product_id, name) VALUES (100, 'Laptop'); 

CREATE TABLE users (
	user_id BIGINT  GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	user_date_created_at TIMESTAMPTZ NOT NULL,
	user_first_name VARCHAR(100) NOT NULL,
	user_last_name  VARCHAR(100),
	user_password VARCHAR(100) NOT NULL,
	user_email VARCHAR(100) NOT NULL UNIQUE,
	user_dob DATE NOT NULL,
	user_role VARCHAR(50) NOT NULL,
	user_address_room_no VARCHAR(5),
	user_address_building VARCHAR(50),
	user_address_street VARCHAR(100) NOT NULL,
	user_address_city VARCHAR(100) NOT NULL,
	user_address_admin_division VARCHAR(100),
	user_address_country VARCHAR(100) NOT NULL,
	user_address_post_code VARCHAR(12) NOT NULL,
	outlet_id BIGINT,
	user_mobile_no VARCHAR(12) NOT NULL UNIQUE,
	user_is_moderator BOOLEAN NOT NULL

);

CREATE TABLE posts (
	post_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	post_date_created_at TIMESTAMPTZ NOT NULL,
	post_content VARCHAR(20000) NOT NULL,
	user_id BIGINT NOT NULL
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
	chain_name VARCHAR(100) NOT NULL,
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
	outlet_name VARCHAR(100) NOT NULL,
	outlet_address_room_no VARCHAR(5),
	outlet_address_building VARCHAR(50),
	outlet_address_street VARCHAR(100) NOT NULL,
	outlet_address_city VARCHAR(100) NOT NULL,
	outlet_address_admin_division VARCHAR(100),
	outlet_address_country VARCHAR(100) NOT NULL,
	outlet_address_post_code VARCHAR(12) NOT NULL,
	chain_id BIGINT
);

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

ALTER TABLE users
ADD CONSTRAINT fk_user_outlet
FOREIGN KEY(outlet_id) REFERENCES outlets(outlet_id)
ON DELETE SET NULL;

-- user_id, user_date_created_at, user_first_name, user_last_name, user_password, user_email, user_dob, user_role, user_address_room_no, user_address_building, user_address_street, user_address_city, user_address_admin_division, user_address_country, user_address_post_code, user_mobile_no, user_is_moderator

INSERT INTO  users (user_date_created_at, user_first_name, user_last_name, user_password, user_email, user_dob, user_role, user_address_room_no, user_address_building, user_address_street, user_address_city, user_address_admin_division, user_address_country, user_address_post_code, user_mobile_no, user_is_moderator) (NOW(), "ABCFname", "ABCLname", "abc@123pwd00", "abc@server.com", "restaurant_employee", "Apartment 1204", "Marina Heights", "Dubai Marina", "Dubai", "Dubai", "United Arab Emirates", "000000", "971501234567");

INSERT INTO  users (user_date_created_at, user_first_name, user_last_name, user_password, user_email, user_dob, user_role, user_address_room_no, user_address_building, user_address_street, user_address_city, user_address_admin_division, user_address_country, user_address_post_code, user_mobile_no, user_is_moderator) (NOW(), "DEFFname", "DEFLname", "defc@256pwd11", "def@server.com", "restaurant_manager", "Villa 18", "Al Bateen", "Al Khaleej Al Arabi Street", "Abu Dhabi", "Abu Dhabi", "United Arab Emirates", "000000", "971522345678");

INSERT INTO  users (user_date_created_at, user_first_name, user_last_name, user_password, user_email, user_dob, user_role, user_address_room_no, user_address_building, user_address_street, user_address_city, user_address_admin_division, user_address_country, user_address_post_code, user_mobile_no, user_is_moderator) (NOW(), "GHIFname", "GHILname", "ghi@267pwd00", "ghi@server.com", "company_employee", "Apartment 704", "Al Qasimia Tower", "Al Qasimia", "Sharjah", "Sharjah", "United Arab Emirates", "000000", "971543456789");

INSERT INTO  users (user_date_created_at, user_first_name, user_last_name, user_password, user_email, user_dob, user_role, user_address_room_no, user_address_building, user_address_street, user_address_city, user_address_admin_division, user_address_country, user_address_post_code, user_mobile_no, user_is_moderator) (NOW(), "GHIFname", "GHILname", "ghi@267pwd00", "ghi@server.com", "company_manager", "Apartment 704", "Al Qasimia Tower", "Al Qasimia", "Sharjah", "Sharjah", "United Arab Emirates", "000000", "971543456789");

INSERT INTO  users (user_date_created_at, user_first_name, user_last_name, user_password, user_email, user_dob, user_role, user_address_room_no, user_address_building, user_address_street, user_address_city, user_address_admin_division, user_address_country, user_address_post_code, user_mobile_no, user_is_moderator) (NOW(), "JKLFname", "JKLLname", "jkl@193pwdn1", "jkl@server.com", "restaurant_employee", "Apartment 305", "Al Nuaimiya Tower", "Al Nuaimiya", "Ajman", "Ajman", "United Arab Emirates", "000000", "971554567890");

INSERT INTO  users (user_date_created_at, user_first_name, user_last_name, user_password, user_email, user_dob, user_role, user_address_room_no, user_address_building, user_address_street, user_address_city, user_address_admin_division, user_address_country, user_address_post_code, user_mobile_no, user_is_moderator) (NOW(), "MNOFname", "MNOLname", "mno@401pwd31", "mno@server.com", "restaurant_manager", "Villa 27", "Al Muwaiji", "Al Muwaiji", "Al-Ain", "Al-Ain", "United Arab Emirates", "000000", "971565678901");

INSERT INTO  users (user_date_created_at, user_first_name, user_last_name, user_password, user_email, user_dob, user_role, user_address_room_no, user_address_building, user_address_street, user_address_city, user_address_admin_division, user_address_country, user_address_post_code, user_mobile_no, user_is_moderator) (NOW(), "STUFname", "STULname", "stu@114pwd06", "stu@server.com", "restaurant_employee", "", "Building 2847", "King Abdul Aziz Road", "Riyadh", "Al-Malaz District", "Saudi Arabia", "12836", "966501234567");


INSERT INTO chains (chain_date_created_at, chain_name, chain_headquarters_address_room_no, chain_headquarters_address_building, chain_headquarters_address_street, chain_headquarters_address_city, chain_headquarters_address_admin_division, chain_headquarters_address_country, chain_headquarters_address_post_code) 

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
