--
-- PostgreSQL database dump
--

\restrict GkN9KmdocH19EqnTslSFcwmVrl3Ev7MSfMJk5Ak4RvXsSXrFqVaocHUtSNOmdMW

-- Dumped from database version 16.14
-- Dumped by pg_dump version 16.14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: post_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.post_status_enum AS ENUM (
    'open',
    'locked',
    'resolved',
    'suspended',
    'archived'
);


ALTER TYPE public.post_status_enum OWNER TO postgres;

--
-- Name: user_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.user_status_enum AS ENUM (
    'active',
    'suspended'
);


ALTER TYPE public.user_status_enum OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: chains; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chains (
    chain_id bigint NOT NULL,
    chain_date_created_at timestamp with time zone NOT NULL,
    chain_name character varying(100) NOT NULL,
    chain_headquarters_address_room_no character varying(5),
    chain_headquarters_address_building character varying(50),
    chain_headquarters_address_street character varying(100) NOT NULL,
    chain_headquarters_address_city character varying(100) NOT NULL,
    chain_headquarters_address_admin_division character varying(100),
    chain_headquarters_address_country character varying(100) NOT NULL,
    chain_headquarters_address_post_code character varying(12) NOT NULL
);


ALTER TABLE public.chains OWNER TO postgres;

--
-- Name: chains_chain_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.chains ALTER COLUMN chain_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.chains_chain_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments (
    comment_id bigint NOT NULL,
    comment_date_created_at timestamp with time zone NOT NULL,
    comment_content character varying(20000) NOT NULL,
    comment_is_deleted boolean NOT NULL,
    post_id bigint NOT NULL,
    user_id bigint NOT NULL,
    reply_id bigint
);


ALTER TABLE public.comments OWNER TO postgres;

--
-- Name: comments_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.comments ALTER COLUMN comment_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.comments_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.images (
    image_id bigint NOT NULL,
    image_date_created_at timestamp with time zone NOT NULL,
    image_path character varying(256) NOT NULL,
    image_tag character varying(1000),
    post_id bigint NOT NULL
);


ALTER TABLE public.images OWNER TO postgres;

--
-- Name: images_image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.images ALTER COLUMN image_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.images_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: outlets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.outlets (
    outlet_id bigint NOT NULL,
    outlet_date_created_at timestamp with time zone NOT NULL,
    outlet_name character varying(100) NOT NULL,
    outlet_address_room_no character varying(5),
    outlet_address_building character varying(50),
    outlet_address_street character varying(100) NOT NULL,
    outlet_address_city character varying(100) NOT NULL,
    outlet_address_admin_division character varying(100),
    outlet_address_country character varying(100) NOT NULL,
    outlet_address_post_code character varying(12) NOT NULL,
    chain_id bigint
);


ALTER TABLE public.outlets OWNER TO postgres;

--
-- Name: outlets_outlet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.outlets ALTER COLUMN outlet_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.outlets_outlet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts (
    post_id bigint NOT NULL,
    post_date_created_at timestamp with time zone NOT NULL,
    post_content character varying(20000) NOT NULL,
    user_id bigint NOT NULL,
    post_status public.post_status_enum DEFAULT 'open'::public.post_status_enum NOT NULL
);


ALTER TABLE public.posts OWNER TO postgres;

--
-- Name: posts_post_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.posts ALTER COLUMN post_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.posts_post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id bigint NOT NULL,
    user_date_created_at timestamp with time zone NOT NULL,
    user_first_name character varying(100) NOT NULL,
    user_last_name character varying(100),
    user_password character varying(100) NOT NULL,
    user_email character varying(100) NOT NULL,
    user_dob date NOT NULL,
    user_role character varying(50) NOT NULL,
    user_address_room_no character varying(5),
    user_address_building character varying(50),
    user_address_street character varying(100) NOT NULL,
    user_address_city character varying(100) NOT NULL,
    user_address_admin_division character varying(100),
    user_address_country character varying(100) NOT NULL,
    user_address_post_code character varying(12) NOT NULL,
    outlet_id bigint,
    user_mobile_no character varying(12) NOT NULL,
    user_is_moderator boolean NOT NULL,
    user_status public.user_status_enum DEFAULT 'active'::public.user_status_enum NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN user_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: chains; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chains (chain_id, chain_date_created_at, chain_name, chain_headquarters_address_room_no, chain_headquarters_address_building, chain_headquarters_address_street, chain_headquarters_address_city, chain_headquarters_address_admin_division, chain_headquarters_address_country, chain_headquarters_address_post_code) FROM stdin;
1	2026-08-09 12:35:16.941354+05:30	Tim Hortons		Apparel Group Building	Jebel Ali Free Zone South	Dubai	Dubai	United Arab Emirates	000000
2	2026-08-09 12:36:44.558027+05:30	Graph Cafe			Dhahran Jubail Branch Rd	Dammam	Eastern Province	Saudi Arabia	32272
3	2026-08-09 12:36:59.196312+05:30	Road Cafe	3130	1st Floor Aldahna Building		Riyadh	Eastern Province	Saudi Arabia	12815
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comments (comment_id, comment_date_created_at, comment_content, comment_is_deleted, post_id, user_id, reply_id) FROM stdin;
3	2026-08-10 00:06:07.631642+05:30	ABC Post One Comment One	f	1	17	\N
4	2026-08-10 00:08:17.578966+05:30	ABC Post One Comment One Reply Two	f	1	17	3
5	2026-08-10 00:08:36.773736+05:30	ABC Post One Comment One Reply One	f	1	17	3
6	2026-08-10 00:09:41.812143+05:30	ABC Post One Comment Two	f	1	17	\N
7	2026-08-10 00:10:51.710327+05:30	ABC Post One Comment Two Reply One	f	1	17	6
8	2026-08-10 00:11:07.485233+05:30	ABC Post One Comment Two Reply Two	f	1	17	6
9	2026-08-10 00:43:47.739256+05:30	STU Post One Comment One	f	4	23	\N
10	2026-08-10 00:44:00.267051+05:30	STU Post One Comment Two	f	4	23	\N
11	2026-08-10 00:44:44.162108+05:30	STU Post One Comment Two Reply One	f	4	23	10
12	2026-08-10 00:44:53.188282+05:30	STU Post One Comment Two Reply Two	f	4	23	10
\.


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.images (image_id, image_date_created_at, image_path, image_tag, post_id) FROM stdin;
1	2026-08-10 00:46:45.14192+05:30	/images/stu_post_1_image_1	\N	4
2	2026-08-10 00:46:53.265503+05:30	/images/stu_post_1_image_2	\N	4
\.


--
-- Data for Name: outlets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.outlets (outlet_id, outlet_date_created_at, outlet_name, outlet_address_room_no, outlet_address_building, outlet_address_street, outlet_address_city, outlet_address_admin_division, outlet_address_country, outlet_address_post_code, chain_id) FROM stdin;
1	2026-08-09 12:47:46.281841+05:30	Tim Hortons #1		Petromin	Eastern Ring Road	Riyadh	Eastern Province	Saudi Arabia	12824	1
3	2026-08-09 12:50:47.371352+05:30	Tim Hortons #2		Red Sea Mall	King Abdulaziz Branch Road	Jeddah	Makkah Governorate	Saudi Arabia	23612	1
4	2026-08-09 12:51:54.607306+05:30	Road Cafe #1			6686 Al Urubah Road	Riyadh	Eastern Province	Saudi Arabia	12341	3
5	2026-08-09 12:52:08.815117+05:30	Road Cafe #2			4116 Prince Sultan Road	Riyadh	Eastern Province	Saudi Arabia	34235	3
6	2026-08-09 12:52:19.113806+05:30	Graph Cafe #1			Dhahran-Jubail Branch Road	Dammam	Eastern Province	Saudi Arabia	32272	2
7	2026-08-09 12:52:39.789747+05:30	Graph Cafe #2			Alnuman Ibn Harithah Street	Al-Khobar	Eastern Province	Saudi Arabia	34714	2
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posts (post_id, post_date_created_at, post_content, user_id, post_status) FROM stdin;
1	2026-08-09 23:45:32.45574+05:30	ABC Post One	17	open
2	2026-08-09 23:45:43.818548+05:30	ABC Post Two	17	open
3	2026-08-09 23:45:55.478614+05:30	ABC Post Three	17	open
4	2026-08-09 23:46:08.535157+05:30	STU Post One	23	open
5	2026-08-09 23:46:21.573578+05:30	STU Post Two	23	open
6	2026-08-09 23:46:31.482025+05:30	JULF Post One	25	open
7	2026-08-09 23:46:44.011019+05:30	JULF Post Two	25	open
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, user_date_created_at, user_first_name, user_last_name, user_password, user_email, user_dob, user_role, user_address_room_no, user_address_building, user_address_street, user_address_city, user_address_admin_division, user_address_country, user_address_post_code, outlet_id, user_mobile_no, user_is_moderator, user_status) FROM stdin;
17	2026-08-09 22:55:02.048594+05:30	ABCFname	ABCLname	abc@123pwd00	abc@server.com	1998-04-06	restaurant_employee	1204	Marina Heights	Dubai Marina	Dubai	Dubai	United Arab Emirates	000000	\N	971501234567	f	active
18	2026-08-09 22:57:22.921066+05:30	DEFFname	DEFLname	defc@256pwd11	def@server.com	1999-04-06	restaurant_manager	18	Al Bateen	Al Khaleej Al Arabi Street	Abu Dhabi	Abu Dhabi	United Arab Emirates	000000	\N	971522345678	f	active
19	2026-08-09 22:57:51.200677+05:30	GHIFname	GHILname	ghi@267pwd00	ghi@server.com	1998-05-06	company_employee	704	Al Qasimia Tower	Al Qasimia	Sharjah	Sharjah	United Arab Emirates	000000	\N	971543456789	t	active
21	2026-08-09 22:58:36.530471+05:30	JKLFname	JKLLname	jkl@193pwdn1	jkl@server.com	1994-05-06	restaurant_employee	305	Al Nuaimiya Tower	Al Nuaimiya	Ajman	Ajman	United Arab Emirates	000000	\N	971554567890	f	active
22	2026-08-09 22:59:05.749638+05:30	MNOFname	MNOLname	mno@401pwd31	mno@server.com	1995-05-07	restaurant_manager	27	Al Muwaiji	Al Muwaiji	Al-Ain	Al-Ain	United Arab Emirates	000000	\N	971565678901	f	active
23	2026-08-09 22:59:40.481159+05:30	STUFname	STULname	stu@114pwd06	stu@server.com	1994-05-08	restaurant_manager		2847	King Abdul Aziz Road	Riyadh	Eastern Province	Saudi Arabia	12836	1	966501234567	f	active
24	2026-08-09 23:18:03.342166+05:30	PQRSFname	PQRSLname	pqrs@206pwd09	pqrs@server.com	1993-10-06	restaurant_employee		2847	King Abdul Aziz Road	Riyadh	Eastern Province	Saudi Arabia	12836	1	966503486264	f	active
25	2026-08-09 23:18:30.240114+05:30	JULFFname	JULFLname	julf@217pwd08	julf@server.com	1993-10-01	restaurant_manager		2847	King Abdul Aziz Road	Riyadh	Eastern Province	Saudi Arabia	12836	3	966508349380	f	active
26	2026-08-09 23:18:44.887401+05:30	ALSAFname	ALSALname	alsa@318pwd08	alsa@server.com	1993-10-02	restaurant_employee		4192	Prince Sultan Road	Jeddah	Makkah Governorate	Saudi Arabia	23522	3	96650834939	f	active
27	2026-08-09 23:19:05.74529+05:30	SDPFname	SDPLname	sdp@060pwd05	sdp@server.com	1996-01-09	restaurant_manager		4192	Prince Sultan Road	Jeddah	Makkah Governorate	Saudi Arabia	23522	4	966506298458	f	active
28	2026-08-09 23:19:21.482863+05:30	RSOFname	RSOLname	rso@050pwd05	rso@server.com	1993-10-09	restaurant_employee		4192	Prince Sultan Road	Jeddah	Makkah Governorate	Saudi Arabia	23522	4	966506187347	f	active
29	2026-08-09 23:21:11.355594+05:30	PSLFname	PSLLname	psl@090pwd07	psl@server.com	1993-04-09	restaurant_manager		1736	King Fahd Road	Dammam	Eastern Province	Saudi Arabia	32271	5	966543456789	f	active
30	2026-08-09 23:21:25.268384+05:30	SLVFname	SLVLname	slv@210pwd02	slv@server.com	1996-04-09	restaurant_employee		1736	King Fahd Road	Dammam	Eastern Province	Saudi Arabia	32271	5	966542567328	f	active
31	2026-08-09 23:21:40.328345+05:30	SVLFname	SVLLname	svl@210pwd02	svl@server.com	1996-05-09	restaurant_manager		1736	King Fahd Road	Dammam	Eastern Province	Saudi Arabia	32271	6	966541456217	f	active
32	2026-08-09 23:22:03.921577+05:30	TRSFname	TRSLname	trs@321pwd03	trs@server.com	1991-03-08	restaurant_employee		3258	Dhahran Street	Al Khobar	Eastern Province	Saudi Arabia	34446	6	966554567890	f	active
33	2026-08-09 23:22:15.395116+05:30	TSRFname	TSRLname	tsr@108pwd01	tsr@server.com	1992-04-10	restaurant_manager		3258	Dhahran Street	Al Khobar	Eastern Province	Saudi Arabia	34446	7	966554456790	f	active
35	2026-08-09 23:30:02.849365+05:30	PSRFname	PSRLname	psr@108pwd01	psr@server.com	1991-03-08	restaurant_employee		3258	Dhahran Street	Al Khobar	Eastern Province	Saudi Arabia	34446	7	966554123456	f	active
36	2026-08-09 23:34:03.128789+05:30	GHSFname	GHSLname	ghs@107pwd00	ghs@server.com	1996-05-06	company_manager	714	Al Qasimia Tower	Al Qasimia	Sharjah	Sharjah	United Arab Emirates	000000	\N	971542345678	t	active
\.


--
-- Name: chains_chain_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chains_chain_id_seq', 5, true);


--
-- Name: comments_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comments_comment_id_seq', 12, true);


--
-- Name: images_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.images_image_id_seq', 2, true);


--
-- Name: outlets_outlet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.outlets_outlet_id_seq', 7, true);


--
-- Name: posts_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.posts_post_id_seq', 7, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 36, true);


--
-- Name: chains chains_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chains
    ADD CONSTRAINT chains_pkey PRIMARY KEY (chain_id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (comment_id);


--
-- Name: images images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_pkey PRIMARY KEY (image_id);


--
-- Name: outlets outlets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.outlets
    ADD CONSTRAINT outlets_pkey PRIMARY KEY (outlet_id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (post_id);


--
-- Name: chains uq_chain_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chains
    ADD CONSTRAINT uq_chain_name UNIQUE (chain_name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_email_key UNIQUE (user_email);


--
-- Name: users users_user_mobile_no_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_mobile_no_key UNIQUE (user_mobile_no);


--
-- Name: comments fk_comment_post; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_comment_post FOREIGN KEY (post_id) REFERENCES public.posts(post_id) ON DELETE CASCADE;


--
-- Name: comments fk_comment_reply; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_comment_reply FOREIGN KEY (reply_id) REFERENCES public.comments(comment_id) ON DELETE SET NULL;


--
-- Name: comments fk_comment_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_comment_user FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: images fk_image_post; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT fk_image_post FOREIGN KEY (post_id) REFERENCES public.posts(post_id) ON DELETE CASCADE;


--
-- Name: outlets fk_outlet_chain; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.outlets
    ADD CONSTRAINT fk_outlet_chain FOREIGN KEY (chain_id) REFERENCES public.chains(chain_id) ON DELETE RESTRICT;


--
-- Name: posts fk_post_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT fk_post_user FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: users fk_user_outlet; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_user_outlet FOREIGN KEY (outlet_id) REFERENCES public.outlets(outlet_id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

\unrestrict GkN9KmdocH19EqnTslSFcwmVrl3Ev7MSfMJk5Ak4RvXsSXrFqVaocHUtSNOmdMW

