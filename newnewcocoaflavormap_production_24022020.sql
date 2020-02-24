--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO postgres;

--
-- Name: blogs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE blogs (
    id bigint NOT NULL,
    title character varying,
    body text,
    autor character varying,
    presentation character varying,
    status integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    slug character varying
);


ALTER TABLE public.blogs OWNER TO postgres;

--
-- Name: blogs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE blogs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blogs_id_seq OWNER TO postgres;

--
-- Name: blogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE blogs_id_seq OWNED BY blogs.id;


--
-- Name: ckeditor_assets; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ckeditor_assets (
    id integer NOT NULL,
    data_file_name character varying NOT NULL,
    data_content_type character varying,
    data_file_size integer,
    data_fingerprint character varying,
    type character varying(30),
    width integer,
    height integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ckeditor_assets OWNER TO postgres;

--
-- Name: contacts; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE contacts (
    id bigint NOT NULL,
    name character varying,
    email character varying,
    phone character varying,
    country character varying,
    subject character varying,
    message text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.contacts OWNER TO postgres;

--
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_id_seq OWNER TO postgres;

--
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE contacts_id_seq OWNED BY contacts.id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE countries (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- Name: flavor_items; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE flavor_items (
    id bigint NOT NULL,
    position_x integer,
    position_y integer,
    flavor_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "order" integer
);


ALTER TABLE public.flavor_items OWNER TO postgres;

--
-- Name: flavor_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE flavor_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.flavor_items_id_seq OWNER TO postgres;

--
-- Name: flavor_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE flavor_items_id_seq OWNED BY flavor_items.id;


--
-- Name: flavors; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE flavors (
    id bigint NOT NULL,
    name character varying,
    description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    flavor_type character varying,
    color character varying,
    is_visible boolean DEFAULT true,
    position_x character varying,
    position_y character varying,
    position_z character varying,
    "order" integer
);


ALTER TABLE public.flavors OWNER TO postgres;

--
-- Name: flavors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE flavors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.flavors_id_seq OWNER TO postgres;

--
-- Name: flavors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE flavors_id_seq OWNED BY flavors.id;


--
-- Name: friendly_id_slugs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE friendly_id_slugs (
    id bigint NOT NULL,
    slug character varying NOT NULL,
    sluggable_id integer NOT NULL,
    sluggable_type character varying(50),
    scope character varying,
    created_at timestamp without time zone
);


ALTER TABLE public.friendly_id_slugs OWNER TO postgres;

--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE friendly_id_slugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendly_id_slugs_id_seq OWNER TO postgres;

--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE friendly_id_slugs_id_seq OWNED BY friendly_id_slugs.id;


--
-- Name: pages; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pages (
    id integer NOT NULL,
    title character varying,
    objective text,
    general text,
    description text,
    youtube_url character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    objective_eng text,
    general_eng text
);


ALTER TABLE public.pages OWNER TO postgres;

--
-- Name: pages_pictures; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pages_pictures (
    id integer NOT NULL,
    page_id integer,
    title character varying,
    picture_file_name character varying,
    picture_content_type character varying,
    picture_file_size integer,
    picture_updated_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.pages_pictures OWNER TO postgres;

--
-- Name: places; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE places (
    id integer NOT NULL,
    country_id integer,
    producer_id integer,
    name character varying,
    long_name character varying,
    description character varying,
    latitude character varying,
    longitude character varying,
    content_left text,
    content_right text,
    main_image_file_name character varying,
    main_image_content_type character varying,
    main_image_file_size integer,
    main_image_updated_at timestamp without time zone,
    youtube_url character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    x_axis double precision,
    y_axis double precision,
    fermentation_type integer,
    slug character varying,
    quality_flavors text,
    harvest text,
    scheme text,
    flavor_id integer,
    description_eng text,
    quality_flavors_eng text,
    content_right_eng text,
    harvest_eng text,
    content_left_eng text,
    scheme_eng text,
    featured character varying,
    bean_size character varying DEFAULT ''::character varying,
    well_fermented character varying DEFAULT ''::character varying,
    semi_fermented character varying DEFAULT ''::character varying,
    defects character varying DEFAULT ''::character varying,
    toast_conditions character varying DEFAULT ''::character varying,
    licor character varying DEFAULT ''::character varying,
    chocolate character varying DEFAULT ''::character varying,
    graphic_one_file_name character varying,
    graphic_one_content_type character varying,
    graphic_one_file_size integer,
    graphic_one_updated_at timestamp without time zone,
    graphic_two_file_name character varying,
    graphic_two_content_type character varying,
    graphic_two_file_size integer,
    graphic_two_updated_at timestamp without time zone,
    liquor_eng character varying,
    chocolate_eng character varying,
    award_desc_es text,
    award_desc_en text,
    is_featured boolean DEFAULT false
);


ALTER TABLE public.places OWNER TO postgres;

--
-- Name: producers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE producers (
    id integer NOT NULL,
    country_id integer,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.producers OWNER TO postgres;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE roles (
    id integer NOT NULL,
    name character varying,
    resource_type character varying,
    resource_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    active boolean DEFAULT true,
    name character varying,
    lastname character varying,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_roles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users_roles (
    user_id integer,
    role_id integer
);


ALTER TABLE public.users_roles OWNER TO postgres;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blogs ALTER COLUMN id SET DEFAULT nextval('blogs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contacts ALTER COLUMN id SET DEFAULT nextval('contacts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY flavor_items ALTER COLUMN id SET DEFAULT nextval('flavor_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY flavors ALTER COLUMN id SET DEFAULT nextval('flavors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY friendly_id_slugs ALTER COLUMN id SET DEFAULT nextval('friendly_id_slugs_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	production	2019-04-24 21:11:54.441881	2019-04-24 21:11:54.441881
\.


--
-- Data for Name: blogs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY blogs (id, title, body, autor, presentation, status, created_at, updated_at, slug) FROM stdin;
\.


--
-- Name: blogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('blogs_id_seq', 1, false);


--
-- Data for Name: ckeditor_assets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ckeditor_assets (id, data_file_name, data_content_type, data_file_size, data_fingerprint, type, width, height, created_at, updated_at) FROM stdin;
1	IMG_ejemplo_harverst.PNG	image/png	16769	b7ec51ea38af49c3811d75c7fb57881b	Ckeditor::Picture	301	297	2019-04-24 21:11:57.236026	2019-04-24 21:11:57.236026
2	IMG_Sello_PPCJ_.png	image/png	6048	e5ead4000609a9b211c6c422d7d89f7e	Ckeditor::Picture	225	224	2019-04-24 21:11:57.23927	2019-04-24 21:11:57.23927
3	IMG_harvest_EDUZAC.png	image/png	23297	d2d76aef06d0ac85f34fd9c8ef5b5d30	Ckeditor::Picture	300	300	2019-04-24 21:11:57.24179	2019-04-24 21:11:57.24179
4	El_Castillero.png	image/png	261375	36ab37f1d17192d640cb410b6440fa15	Ckeditor::Picture	960	960	2019-04-24 21:11:57.244305	2019-04-24 21:11:57.244305
5	El-Castillero.png	image/png	18377	75035e1c29830d2e4e33c8bb2b29da31	Ckeditor::Picture	676	456	2019-04-24 21:11:57.246787	2019-04-24 21:11:57.246787
6	ivaya_araña.png	image/png	256691	d2872f3c6c03c0a973a5f9fffcba02dd	Ckeditor::Picture	960	960	2019-04-24 21:11:57.249257	2019-04-24 21:11:57.249257
7	IVaya.png	image/png	19843	ba2d6cbd72558a1b82758b7b4d11d1ef	Ckeditor::Picture	679	455	2019-04-24 21:11:57.251748	2019-04-24 21:11:57.251748
8	Cuyamel.png	image/png	258851	cf5852bfc7cd1905125f8900c6cf0886	Ckeditor::Picture	960	960	2019-04-24 21:11:57.254185	2019-04-24 21:11:57.254185
9	Carrera_Real.png	image/png	261221	a6942a464dd5c94342afb76161e8a720	Ckeditor::Picture	960	960	2019-04-24 21:11:57.256617	2019-04-24 21:11:57.256617
10	Eduzac.png	image/png	262927	7523069585af69144dacea9d4fe9ac72	Ckeditor::Picture	960	960	2019-04-24 21:11:57.259085	2019-04-24 21:11:57.259085
11	Eduzac1.png	image/png	18602	ffef20272985927b52e6cdb3b823d653	Ckeditor::Picture	672	453	2019-04-24 21:11:57.261538	2019-04-24 21:11:57.261538
12	Itzalku.png	image/png	23297	d2d76aef06d0ac85f34fd9c8ef5b5d30	Ckeditor::Picture	300	300	2019-04-24 21:11:57.263981	2019-04-24 21:11:57.263981
13	Itzalku2png.png	image/png	263000	bc044f52b66bdeafa8a6dd3e2eeb49b2	Ckeditor::Picture	960	960	2019-04-24 21:11:57.266448	2019-04-24 21:11:57.266448
14	Itzalku1.png	image/png	37809	5b8356262108e2aa9ee66711aa3265c6	Ckeditor::Picture	792	612	2019-04-24 21:11:57.268909	2019-04-24 21:11:57.268909
15	SanFran.png	image/png	258674	af85d3427b81250ba17a2c5f85302f4e	Ckeditor::Picture	960	960	2019-04-24 21:11:57.271391	2019-04-24 21:11:57.271391
16	SanFran1.png	image/png	33307	371a75369e869e3197337994b70e8088	Ckeditor::Picture	792	612	2019-04-24 21:11:57.273798	2019-04-24 21:11:57.273798
17	lochi.png	image/png	253599	9da923a3d95cd20bd3ccbc3848b39073	Ckeditor::Picture	960	960	2019-04-24 21:11:57.276293	2019-04-24 21:11:57.276293
18	IMG_ejemplo_harverst.PNG	image/png	16769	b7ec51ea38af49c3811d75c7fb57881b	Ckeditor::Picture	301	297	2019-04-24 21:11:57.46439	2019-04-24 21:11:57.46439
19	IMG_Sello_PPCJ_.png	image/png	6048	e5ead4000609a9b211c6c422d7d89f7e	Ckeditor::Picture	225	224	2019-04-24 21:11:57.466859	2019-04-24 21:11:57.466859
20	IMG_harvest_EDUZAC.png	image/png	23297	d2d76aef06d0ac85f34fd9c8ef5b5d30	Ckeditor::Picture	300	300	2019-04-24 21:11:57.469231	2019-04-24 21:11:57.469231
21	El_Castillero.png	image/png	261375	36ab37f1d17192d640cb410b6440fa15	Ckeditor::Picture	960	960	2019-04-24 21:11:57.471599	2019-04-24 21:11:57.471599
22	El-Castillero.png	image/png	18377	75035e1c29830d2e4e33c8bb2b29da31	Ckeditor::Picture	676	456	2019-04-24 21:11:57.473939	2019-04-24 21:11:57.473939
23	ivaya_araña.png	image/png	256691	d2872f3c6c03c0a973a5f9fffcba02dd	Ckeditor::Picture	960	960	2019-04-24 21:11:57.47628	2019-04-24 21:11:57.47628
24	IVaya.png	image/png	19843	ba2d6cbd72558a1b82758b7b4d11d1ef	Ckeditor::Picture	679	455	2019-04-24 21:11:57.478653	2019-04-24 21:11:57.478653
25	Cuyamel.png	image/png	258851	cf5852bfc7cd1905125f8900c6cf0886	Ckeditor::Picture	960	960	2019-04-24 21:11:57.48107	2019-04-24 21:11:57.48107
26	Carrera_Real.png	image/png	261221	a6942a464dd5c94342afb76161e8a720	Ckeditor::Picture	960	960	2019-04-24 21:11:57.483414	2019-04-24 21:11:57.483414
27	Eduzac.png	image/png	262927	7523069585af69144dacea9d4fe9ac72	Ckeditor::Picture	960	960	2019-04-24 21:11:57.48584	2019-04-24 21:11:57.48584
28	Eduzac1.png	image/png	18602	ffef20272985927b52e6cdb3b823d653	Ckeditor::Picture	672	453	2019-04-24 21:11:57.488192	2019-04-24 21:11:57.488192
29	Itzalku.png	image/png	23297	d2d76aef06d0ac85f34fd9c8ef5b5d30	Ckeditor::Picture	300	300	2019-04-24 21:11:57.490527	2019-04-24 21:11:57.490527
30	Itzalku2png.png	image/png	263000	bc044f52b66bdeafa8a6dd3e2eeb49b2	Ckeditor::Picture	960	960	2019-04-24 21:11:57.492886	2019-04-24 21:11:57.492886
31	Itzalku1.png	image/png	37809	5b8356262108e2aa9ee66711aa3265c6	Ckeditor::Picture	792	612	2019-04-24 21:11:57.495274	2019-04-24 21:11:57.495274
32	SanFran.png	image/png	258674	af85d3427b81250ba17a2c5f85302f4e	Ckeditor::Picture	960	960	2019-04-24 21:11:57.497661	2019-04-24 21:11:57.497661
33	SanFran1.png	image/png	33307	371a75369e869e3197337994b70e8088	Ckeditor::Picture	792	612	2019-04-24 21:11:57.500039	2019-04-24 21:11:57.500039
34	lochi.png	image/png	253599	9da923a3d95cd20bd3ccbc3848b39073	Ckeditor::Picture	960	960	2019-04-24 21:11:57.502373	2019-04-24 21:11:57.502373
35	48386066_750442011991020_998568407282483200_o-1-768x597-1.jpg	image/jpeg	39923	f66542f28cfb217f063cbbeca3a64789	Ckeditor::Picture	\N	\N	2019-06-08 21:40:12.504837	2019-06-08 21:40:12.504837
36	vaina-cacao.png	image/png	4846	55835cd53bcf7aebf75be81f2a9e04e2	Ckeditor::Picture	\N	\N	2019-06-08 21:47:39.72377	2019-06-08 21:47:39.72377
37	edgar.png	image/png	10055	f505e5ca5c245d85632db22a0eb73c79	Ckeditor::Picture	\N	\N	2019-06-10 15:17:09.008012	2019-06-10 15:17:09.008012
38	harvest_izalku.png	image/png	23297	d2d76aef06d0ac85f34fd9c8ef5b5d30	Ckeditor::Picture	\N	\N	2019-06-17 17:43:04.243289	2019-06-17 17:43:04.243289
39	tmp_cuyamel_-_9786-choc.png	image/png	246484	34fcdf4731ac9967fe9862e1202a9542	Ckeditor::Picture	\N	\N	2019-06-17 18:14:09.870791	2019-06-17 18:14:09.870791
40	lochi_-_9451.png	image/png	242891	e69a6c4fbaf9005bf992242a14bcb156	Ckeditor::Picture	\N	\N	2019-06-25 22:42:54.90374	2019-06-25 22:42:54.90374
41	carrera_real_-_9781.png	image/png	248095	8c655db33871a426dad6e40e970cc27a	Ckeditor::Picture	\N	\N	2019-06-25 22:57:20.150071	2019-06-25 22:57:20.150071
42	i_vaya_-_9453.png	image/png	244093	c310c60f1c8974b60fc12d85c7ab5b8e	Ckeditor::Picture	\N	\N	2019-06-26 20:16:48.895582	2019-06-26 20:16:48.895582
43	v_vaya_-_9452.png	image/png	245319	14f68fbbb696f5fca000643049e1f07c	Ckeditor::Picture	\N	\N	2019-06-26 20:16:56.078975	2019-06-26 20:16:56.078975
44	IVaya__1506433541947__w792.png	image/png	36877	d2021560d94321131d9015f178182ad5	Ckeditor::Picture	\N	\N	2019-06-26 20:33:33.837469	2019-06-26 20:33:33.837469
45	kubaly_-_9454.png	image/png	245802	ca4196b9b0fa130922901684c827f457	Ckeditor::Picture	\N	\N	2019-06-26 22:32:23.655112	2019-06-26 22:32:23.655112
46	KUBALY__1506433819499__w792.png	image/png	39078	2daaadc85d5a5f02311183a72e02e021	Ckeditor::Picture	\N	\N	2019-06-26 22:35:18.281276	2019-06-26 22:35:18.281276
47	mwas_-_9807.png	image/png	246555	66d394f2af0df24efc17e6e5414d036c	Ckeditor::Picture	\N	\N	2019-06-26 22:46:04.615915	2019-06-26 22:46:04.615915
48	eduzac_-_9782.png	image/png	247125	d390741624b0fa7dbb7f141403f76c93	Ckeditor::Picture	\N	\N	2019-06-27 20:34:58.969703	2019-06-27 20:34:58.969703
49	NueQue__1506441394509__w792.png	image/png	39028	afc2eddc178d269dc3becdcd9e2298e3	Ckeditor::Picture	\N	\N	2019-06-27 22:48:32.904085	2019-06-27 22:48:32.904085
50	nueque_-_9842.png	image/png	245134	d523fe7c45933e855b94ffdff8a88bc4	Ckeditor::Picture	\N	\N	2019-06-27 22:49:56.095755	2019-06-27 22:49:56.095755
51	o_oco_-_9455.png	image/png	243675	e4f2ce96ab47169e004f118129e9d70f	Ckeditor::Picture	\N	\N	2019-06-27 23:04:35.782847	2019-06-27 23:04:35.782847
52	sjm_-_9860.png	image/png	242710	cfcf8c9db46918bfe5fdfe6b7b157389	Ckeditor::Picture	1200	1200	2019-08-02 03:11:13.60841	2019-08-02 03:11:13.60841
53	Harvest_SJM.png	image/png	9793	68159efa76949efb2531994cfc3cea24	Ckeditor::Picture	300	300	2019-08-02 03:12:08.157363	2019-08-02 03:12:08.157363
54	SJM.png	image/png	12705	c7242215600398e3dd9b72636e09b309	Ckeditor::Picture	792	612	2019-08-02 03:14:52.49183	2019-08-02 03:14:52.49183
55	sjm_-_9860-choc.png	image/png	243323	1938cefbe70ae43b15180feef2b1b62f	Ckeditor::Picture	1200	1200	2019-08-02 03:17:22.147406	2019-08-02 03:17:22.147406
56	Harvest_KUBALY.png	image/png	9841	8aaee6408abf2e55c596624e15dd0ea6	Ckeditor::Picture	300	300	2019-08-02 03:40:53.020349	2019-08-02 03:40:53.020349
57	selva_yoro_-_9839.png	image/png	249846	a575c108e3ced957c06af148511befb6	Ckeditor::Picture	1200	1200	2019-08-02 03:57:50.097075	2019-08-02 03:57:50.097075
58	selva_yoro_-_9839-choc.png	image/png	248634	2be953a4553da4769e9680bc747b7a94	Ckeditor::Picture	1200	1200	2019-08-02 03:58:42.662665	2019-08-02 03:58:42.662665
59	cacao_itzalku_-_9784-choc.png	image/png	248505	79c6339edc81fb6c83d8e99235507cab	Ckeditor::Picture	1200	1200	2019-08-02 14:58:55.189568	2019-08-02 14:58:55.189568
60	chopo_-_9841.png	image/png	243852	779ed422dafb25c16a1bbe7938edba66	Ckeditor::Picture	1200	1200	2019-08-07 17:45:07.397163	2019-08-07 17:45:07.397163
61	chopo_-_9841-choc.png	image/png	246749	ae36e60fb468eef852324e8231717121	Ckeditor::Picture	1200	1200	2019-08-07 17:45:35.870462	2019-08-07 17:45:35.870462
63	Harvest_Jacawitz.png	image/png	9731	cff9743ba5491fb4b80b559e2f436690	Ckeditor::Picture	300	300	2019-08-07 18:17:21.065961	2019-08-07 18:17:21.065961
65	omosh_-_9840.png	image/png	244009	60057a57f5689ef296df26e383c8fce9	Ckeditor::Picture	1200	1200	2019-08-07 20:38:32.035002	2019-08-07 20:38:32.035002
62	Harvest_Chopo.png	image/png	9814	4adb5c644106bb5cbf1ea4393cda9872	Ckeditor::Picture	300	300	2019-08-07 17:48:46.111827	2019-08-07 17:48:46.111827
64	Harvest_Omosh.png	image/png	9831	5e901b5218e6e0d1efc2b70b0dad6c52	Ckeditor::Picture	300	300	2019-08-07 20:37:30.798155	2019-08-07 20:37:30.798155
66	omosh_-_9840-choc.png	image/png	247313	288634a71e99cb7907650bc53f669c8e	Ckeditor::Picture	1200	1200	2019-08-07 20:38:53.581437	2019-08-07 20:38:53.581437
68	Harvest_YoJo.png	image/png	9731	cb80ae28d6083e1e6524378c7cfc3e7a	Ckeditor::Picture	300	300	2019-08-07 22:31:51.11473	2019-08-07 22:31:51.11473
69	Harvest_Selva-Caribe.png	image/png	9708	71bd04d2cd19528a4e5f59f721c6b61b	Ckeditor::Picture	300	300	2019-08-08 20:34:22.564156	2019-08-08 20:34:22.564156
70	selva_yoro_-_9839.png	image/png	249846	a575c108e3ced957c06af148511befb6	Ckeditor::Picture	1200	1200	2019-08-08 20:36:19.679983	2019-08-08 20:36:19.679983
71	Harvest_JeruAntiguo.png	image/png	9488	1ccde1954ad970c7a01652ab92e2e514	Ckeditor::Picture	300	300	2019-08-08 21:14:31.79769	2019-08-08 21:14:31.79769
72	jeru_antiguo_-_9858.png	image/png	246238	c9308e782334c50158ceb64e3127b662	Ckeditor::Picture	1200	1200	2019-08-08 21:15:46.074978	2019-08-08 21:15:46.074978
73	Harvest_Arauzco.png	image/png	9736	3905e9cf848444ea0522da93784befbc	Ckeditor::Picture	300	300	2019-08-08 22:58:50.69751	2019-08-08 22:58:50.69751
74	Harvest_RiverView.png	image/png	9681	8a694c376bfd902347354e9cea447547	Ckeditor::Picture	300	300	2019-08-08 23:01:17.052344	2019-08-08 23:01:17.052344
75	Harvest_LasMinas.png	image/png	9704	4fb5451ae0eb1728c52b977cd14c7117	Ckeditor::Picture	300	300	2019-08-08 23:09:21.730278	2019-08-08 23:09:21.730278
76	Harvest_PuertodeMontana.png	image/png	9768	1e21689b5b4b1430cf6bcfa5bdfe6c23	Ckeditor::Picture	300	300	2019-08-13 14:35:27.204333	2019-08-13 14:35:27.204333
77	puerto_de_montaña_-_9856.png	image/png	248068	c4a20367012cbd109c128f0b6870cede	Ckeditor::Picture	1200	1200	2019-08-13 14:38:52.246182	2019-08-13 14:38:52.246182
78	puerto_de_montaña_-_9856-choc.png	image/png	251353	328e9a17431b4506530a547a7470d1d6	Ckeditor::Picture	1200	1200	2019-08-13 14:39:03.242758	2019-08-13 14:39:03.242758
\.


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY contacts (id, name, email, phone, country, subject, message, created_at, updated_at) FROM stdin;
1	Williams Gonzalez	info@codecastle.com.sv	25435422	El Salvador	\N	Test del recaptcha	2019-04-24 21:11:57.295967	2019-04-24 21:11:57.295967
2	Gabriela	gabby.lagos@gmail.com	89276002	Nicaragua	\N	Hola esta es una prueba	2019-04-24 21:11:57.29865	2019-04-24 21:11:57.29865
3	Gabriela	gabby.lagos@gmail.com		Nicaragua	\N	Hola esta es una prueba	2019-04-24 21:11:57.300721	2019-04-24 21:11:57.300721
\.


--
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('contacts_id_seq', 3, true);


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY countries (id, name, created_at, updated_at) FROM stdin;
1	El Salvador	2019-04-24 21:11:57.312902	2019-04-24 21:11:57.312902
2	Nicaragua	2019-04-24 21:11:57.315379	2019-04-24 21:11:57.315379
3	Honduras	2019-04-24 21:11:57.317331	2019-04-24 21:11:57.317331
\.


--
-- Data for Name: flavor_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY flavor_items (id, position_x, position_y, flavor_id, created_at, updated_at, "order") FROM stdin;
\.


--
-- Name: flavor_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('flavor_items_id_seq', 1, false);


--
-- Data for Name: flavors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY flavors (id, name, description, created_at, updated_at, flavor_type, color, is_visible, position_x, position_y, position_z, "order") FROM stdin;
2	Nutty	\N	2019-04-24 21:11:57.337343	2019-08-08 23:23:57.084152	\N	87522F	t	-25	-50	100	1
1	Fruity-Fresh	\N	2019-04-24 21:11:57.334717	2019-08-08 23:27:24.340483	\N	0DDFFF	t	50	30	100	0
3	Complex	\N	2019-04-24 21:11:57.339499	2019-08-08 23:33:22.084877	\N	38FF38	t	10	40	100	2
\.


--
-- Name: flavors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('flavors_id_seq', 3, true);


--
-- Data for Name: friendly_id_slugs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY friendly_id_slugs (id, slug, sluggable_id, sluggable_type, scope, created_at) FROM stdin;
\.


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('friendly_id_slugs_id_seq', 1, false);


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pages (id, title, objective, general, description, youtube_url, created_at, updated_at, objective_eng, general_eng) FROM stdin;
1	Nosotros	<p style="text-align: justify;"><span style="font-size:14px;">Lutheran World Relief (LWR), ZOTO y GUITTARD CHOCOLATE se asociaron con el Programa de Cacao de Excelencia para explorar la diversidad de sabores del cacao de 3 pa&iacute;ses de Centroam&eacute;rica: Honduras, Nicaragua y El Salvador. Presentado en Salon du Chocolat 2017 en Par&iacute;s, el Mapa Regional de Sabores del Cacao ayuda a los productores de cacao a conectarse mejor con los compradores de cacao fino o de especialidad, quienes podr&aacute;n identificar r&aacute;pidamente las fuentes de sabores, perfiles y caracter&iacute;sticas del cacao que buscan.</span></p>\r\n	<p style="text-align: justify;">La idea del Mapa de Sabores ten&iacute;a como principal objetivo crear una herramienta visual que muestre los or&iacute;genes y las caracter&iacute;sticas organol&eacute;pticas de cada producto de cacao que se expone. Esto ayudar&aacute; a los productores a acceder a nuevos mercados y crear conciencia sobre la riqueza de sabor del cacao centroamericano para los fabricantes de chocolate que buscan productos especiales.&nbsp;</p>\r\n\r\n<p style="text-align: justify;">Con la&nbsp;iniciativa Mapa Regional de Sabores del Cacao se realiz&oacute;:</p>\r\n\r\n<p style="text-align: justify;">&bull; Investigaci&oacute;n de la calidad actual disponible en las fincas y las cooperativas<br />\r\n&bull; Una aplicaci&oacute;n&nbsp;de protocolos post cosecha modificados, con supervisi&oacute;n cercana para la expresi&oacute;n &oacute;ptima del sabor<br />\r\n&bull; An&aacute;lisis sensorial y qu&iacute;mico de las muestras obtenidas<br />\r\n&bull; Mapeo geogr&aacute;fico y estad&iacute;stico de todo el conjunto de datos recolectado</p>\r\n		https://www.youtube.com/watch?time_continue=6&v=b5LkBpRtDY8	2019-04-24 21:11:57.353719	2019-08-02 02:37:30.419731	<p>Lutheran World Relief (LWR), ZOTO and GUITTARD CHOCOLATE teamed up with the Cocoa of Excellence Program to explore the flavor diversity of cocoa from 3 countries in Central America: Honduras, Nicaragua, and El Salvador. Unveiled at the Salon du Chocolat 2017 exhibition in Paris, the Regional Cocoa Flavor Map helps cocoa producers better connect with buyers of fine-specialty cocoa, who will be able to quickly identify the sources for the cocoa flavors, profiles and characteristics they are seeking.</p>\r\n	<p>To create a visual tool illustrating the origins and the organoleptic characteristics of their new products. This will assist farmers in accessing new markets and raise awareness of the flavor richness of Central American cocoa for chocolate makers who are looking for special products.</p>\r\n\r\n<p>The Regional Cocoa Flavor Map initiative carried out:</p>\r\n\r\n<p>&bull; Investigation of current quality available at the farms and coops<br />\r\n&bull; A&nbsp;two-time application of modified post-harvest protocols, with close supervision for optimal flavor expression<br />\r\n&bull; Sensory and chemical analysis of the samples obtained<br />\r\n&bull; Geographical and statistical mapping of the whole dataset collected</p>\r\n
\.


--
-- Data for Name: pages_pictures; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pages_pictures (id, page_id, title, picture_file_name, picture_content_type, picture_file_size, picture_updated_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: places; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY places (id, country_id, producer_id, name, long_name, description, latitude, longitude, content_left, content_right, main_image_file_name, main_image_content_type, main_image_file_size, main_image_updated_at, youtube_url, created_at, updated_at, x_axis, y_axis, fermentation_type, slug, quality_flavors, harvest, scheme, flavor_id, description_eng, quality_flavors_eng, content_right_eng, harvest_eng, content_left_eng, scheme_eng, featured, bean_size, well_fermented, semi_fermented, defects, toast_conditions, licor, chocolate, graphic_one_file_name, graphic_one_content_type, graphic_one_file_size, graphic_one_updated_at, graphic_two_file_name, graphic_two_content_type, graphic_two_file_size, graphic_two_updated_at, liquor_eng, chocolate_eng, award_desc_es, award_desc_en, is_featured) FROM stdin;
4	2	6	El Castillero	\N	El Castillo, Nicaragua	11.016444	-84.399167	<p tabindex="0"><strong>Productor:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Cooperativa Multisectorial de Desarrollo Productivo del San Juan COODEPROSA R.L.</p>\r\n\r\n<p tabindex="0"><strong>Coordenadas:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;11&deg;00&#39;59.2&quot;N 84&deg;23&#39;57.0&quot;W</p>\r\n\r\n<p tabindex="0"><strong>Disponibilidad:&nbsp; &nbsp; &nbsp; &nbsp;</strong>~8 - 10 MT/year</p>\r\n\r\n<p tabindex="0"><strong>Contacto:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</strong><a href="mailto:coodeprosarl@gmail.com" target="_blank">coodeprosarl@gmail.com</a></p>\r\n\r\n<p tabindex="0"><strong>Tel&eacute;fono:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</strong>(505) 8431-2389</p>\r\n	<p tabindex="0"><strong>Composici&oacute;n varietal: </strong>mezcla trinitaria (30% lila; 6% blanco)</p>\r\n\r\n<p><strong>Acondicionamiento previo de pulpa: </strong>/</p>\r\n\r\n<p><strong>M&eacute;todo de fermentaci&oacute;n: </strong>cajas de madera tipo cascada (650 kg)</p>\r\n\r\n<p><strong>Pre-secado: </strong>48h; 10 cm; t&uacute;nel solar</p>\r\n\r\n<p><strong>Secado: </strong>secado al sol durante 7 d&iacute;as; t&uacute;nel solar madera</p>\r\n\r\n<p tabindex="0">&nbsp;</p>\r\n	el_castillero.jpg	image/jpeg	229858	2020-02-24 02:57:39.464218		2019-04-24 21:11:57.409344	2020-02-24 02:59:49.219015	10	70	0	el-castillero		<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt="" src="https://www.arcgis.com/sharing/rest/content/items/ff5ead0883be4b6a881eac5617a7a3f1/resources/Castillero__1506432812174__w300.png" style="width: 300px; height: 300px;" />&nbsp;</strong></p>\r\n	<p>Este cacao que se produce en una regi&oacute;n hist&oacute;rica de Nicaragua puede impresionar por su balance entre sabores dulces y frutales. El sabor intenso de chocolate esta cubierto en harmonia con notas de miel, fruta amarilla y melaza y termina con notas del caramelo de regaliz. &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p>\r\n	3	El Castillo, Nicaragua	<p tabindex="0">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>\r\n	<p tabindex="0"><strong>Varietal composition:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</strong>&nbsp;Trinitario blend (30% lilac; 6% white)</p>\r\n\r\n<p tabindex="0"><strong>Pulp pre-conditioning:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong>&nbsp;/</p>\r\n\r\n<p tabindex="0"><strong>Fermentation method:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</strong>Cascade-type wooden boxes (650kg)</p>\r\n\r\n<p tabindex="0"><strong>Pre-drying:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</strong>48h; 10 cm; solar tunnel</p>\r\n\r\n<p tabindex="0"><strong>Drying:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 7-day sun-drying; solar tunnel; wood</p>\r\n\r\n<p tabindex="0">&nbsp;</p>\r\n	<p><strong><img alt="" src="https://www.arcgis.com/sharing/rest/content/items/ff5ead0883be4b6a881eac5617a7a3f1/resources/Castillero__1506432812174__w300.png" style="width: 300px; height: 300px;" /></strong></p>\r\n	<p tabindex="0"><strong>Producer:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Cooperativa Multisectorial de Desarrollo Productivo del San Juan COODEPROSA R.L.</p>\r\n\r\n<p tabindex="0"><strong>Coordinates:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;11&deg;00&#39;59.2&quot;N 84&deg;23&#39;57.0&quot;W</p>\r\n\r\n<p tabindex="0"><strong>Availability:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</strong>~8 - 10 MT/year</p>\r\n\r\n<p tabindex="0"><strong>Contact:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</strong><a href="mailto:coodeprosarl@gmail.com" target="_blank">coodeprosarl@gmail.com</a></p>\r\n\r\n<p tabindex="0"><strong>Phone:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</strong>(505) 8431-2389</p>\r\n	<p>This cocoa grown in a historic region of Nicaragua can impress with the balance of sweet and subtle fruity notes. A fulsome chocolaty taste is harmonically covered by honey, yellow fruit, and molasses notes and has a pleasant licorice, palm date finish.</p>\r\n	kindpng_559593.png	1.24	80%	14%	0.1%	120 ° C; 25 ’; 12 μm	miel, fruta amarilla, melaza, regaliz, fecha	cacao, dátiles, melaza, fruta marrón, manzana verde, maní	\N	\N	\N	\N	\N	\N	\N	\N	honey, yellow fruit, molasses, licorice, date	cocoa, date, molasses, brown fruit, green apple, peanut	<p style="text-align: center;"><span style="font-size:12px;"><strong>Competencia Nacional de Cacao:</strong> Nicaragua 2016</span></p>\r\n	<p style="text-align: center;"><span style="font-size:12px;"><strong>National Competition of Cocoa: </strong>Nicaragua 2016</span></p>\r\n	t
25	2	22	Las Minas	\N	RAAN; Nicaragua	13.927167	-84.403500	<p><strong>Productor: </strong>Cooperativa Multisectorial De Cacaoteros Org&aacute;nicos</p>\r\n\r\n<p>COMUCOR R.L.</p>\r\n\r\n<p><strong>Coordenadas: </strong>13 &deg; 55&#39;37.8 &quot;N 84 &deg; 24&#39;12.6&quot; W</p>\r\n\r\n<p><strong>Disponibilidad: </strong>~ 5 MT / a&ntilde;o</p>\r\n\r\n<p><strong>Contacto: </strong>comucor@gmail.com</p>\r\n\r\n<p><strong>Tel&eacute;fono: </strong>(505) 7877-2822</p>\r\n	<p tabindex="0"><strong>Varietal composition:</strong>&nbsp;Trinitario blend (24% lilac; 8% white)</p>\r\n\r\n<p tabindex="0"><strong>Pulp pre-conditioning:</strong>&nbsp;/</p>\r\n\r\n<p tabindex="0"><strong>Fermentation method:&nbsp;</strong>Horizontal wooden boxes (250 kg)</p>\r\n\r\n<p tabindex="0"><strong>Pre-drying:&nbsp;</strong>48h; 8 cm; solar tunnel</p>\r\n\r\n<p tabindex="0"><strong>Drying:</strong>&nbsp;7-day sun-drying; solar tunnel; wooden trays</p>\r\n	las_minas.jpg	image/jpeg	217868	2020-02-24 03:50:43.172125		2019-08-08 23:10:06.508261	2020-02-24 03:50:46.065684	\N	\N	0	las-minas		<p><img alt="" src="http://cocoaflavormap.cacaomovil.com/ckeditor_assets/pictures/75/content_Harvest_LasMinas.png" style="width: 300px; height: 300px;" /></p>\r\n	<p>Un cacao con sabor a pimienta negra</p>\r\n	\N	RAAN; Nicaragua		<p tabindex="0"><strong>Varietal composition:</strong>&nbsp;Trinitario blend (24% lilac; 8% white)</p>\r\n\r\n<p tabindex="0"><strong>Pulp pre-conditioning:</strong>&nbsp;/</p>\r\n\r\n<p tabindex="0"><strong>Fermentation method:&nbsp;</strong>Horizontal wooden boxes (250 kg)</p>\r\n\r\n<p tabindex="0"><strong>Pre-drying:&nbsp;</strong>48h; 8 cm; solar tunnel</p>\r\n\r\n<p tabindex="0"><strong>Drying:</strong>&nbsp;7-day sun-drying; solar tunnel; wooden trays</p>\r\n	<p><img alt="" src="http://cocoaflavormap.cacaomovil.com/ckeditor_assets/pictures/75/content_Harvest_LasMinas.png" style="width: 300px; height: 300px;" /></p>\r\n	<p tabindex="0"><strong>Producer:</strong>&nbsp;Cooperativa Multisectorial De Cacaoteros Org&aacute;nicos</p>\r\n\r\n<p tabindex="0">COMUCOR R.L.</p>\r\n\r\n<p tabindex="0"><strong>Coordinates:</strong>&nbsp;13&deg;55&#39;37.8&quot;N 84&deg;24&#39;12.6&quot;W</p>\r\n\r\n<p tabindex="0"><strong>Availability:&nbsp;</strong>~5 MT/year</p>\r\n\r\n<p tabindex="0"><strong>Contact:&nbsp;</strong><a href="mailto:comucor@gmail.com" target="_blank">comucor@gmail.com</a></p>\r\n\r\n<p tabindex="0"><strong>Phone:&nbsp;</strong>(505) 7877-2822</p>\r\n	<p>You can have Las Minas, the black pepper-flavor cocoa</p>\r\n	\N	1.63	60	20	0%	120 ° C; 25 ’; 12 μm	yogurt, espresso, salado, uvas blancas, cacao, pimienta, geranio	pan de especias, rosa, menta, espumoso, pimiento verde, leche condensada	las_minas_-_9853-choc.png	image/png	236259	2020-02-24 03:50:43.71249	las_minas_-_9853.png	image/png	234793	2020-02-24 03:50:44.990991	yogurt, espresso, salty, white grapes, cocoa, pepper, geranium	spice bread, rose, peppermint, sparkling, green bell pepper, condensed milk			f
2	1	1	Itzalku	\N	Sonsotate, El Salvador	13.733611	-89.681583	<p><strong>Productor:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Cooperativa&nbsp;los Izalkos</p>\r\n\r\n<p><strong>Coordenadas:</strong>&nbsp; &nbsp; &nbsp; &nbsp; 13&deg;44&#39;05.8&quot;N 89&deg;40&#39;40.4&quot;W</p>\r\n\r\n<p><strong>Disponibilidad:</strong>&nbsp; &nbsp; &nbsp; ~0.5 MT/year</p>\r\n\r\n<p><strong>Contacto:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</strong>&nbsp; &nbsp;<a href="mailto:chocolates.izalco@gmail.com" target="_blank">chocolates.izalco@gmail.com</a></p>\r\n\r\n<p><strong>Tel&eacute;fono:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</strong>&nbsp;(503) 6156-1618</p>\r\n	<p>&nbsp;</p>\r\n\r\n<p><strong>Composicion varietal:&nbsp; </strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Trinitario blend (32% lilac; 8% blanco)</p>\r\n\r\n<p><strong>M&eacute;todo de fermento:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</strong>Caja de madera peque&ntilde;a&nbsp;(50kg)</p>\r\n\r\n<p><strong>Secado:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 8-dias&nbsp;secado al sol; aire libre; canasto de mimbre</p>\r\n	Cacao_Itzalku_web.jpg	image/jpeg	293813	2020-02-24 03:18:19.992804		2019-04-24 21:11:57.400903	2020-02-24 03:18:22.752165	70	35	1	cacao-itzalku		<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="http://cocoaflavormap.cacaomovil.com/ckeditor_assets/pictures/38/content_harvest_izalku.png" style="width: 300px; height: 300px;" /></p>\r\n	<p>El procesamiento de este cacao a nivel de finca en mini cajas permite un desarrollo de sabores &uacute;nicos. La mezcla refrescante de frutas c&iacute;tricas con menta y hierba de lim&oacute;n esta cubierta con una brisa suave de madera. Convertido en chocolate, libera la dulzura de la manzana roja desmoronada, espolvoreada con nuez moscada y canela.&nbsp;</p>\r\n	1			<p>&nbsp;</p>\r\n\r\n<p><strong>Varietal composition:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Trinitario blend (32% lilac; 8% white)</p>\r\n\r\n<p><strong>Fermentation method:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</strong>Small-sized wooden box (50kg)</p>\r\n\r\n<p><strong>Drying:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;8-day sun-drying; open air; wicker basket</p>\r\n	<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="http://cocoaflavormap.cacaomovil.com/ckeditor_assets/pictures/38/content_harvest_izalku.png" style="width: 300px; height: 300px;" /></p>\r\n	<p><strong>Producer:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Cooperativa&nbsp;los Izalkos</p>\r\n\r\n<p><strong>Coordinates:</strong>&nbsp; &nbsp; &nbsp; &nbsp;13&deg;44&#39;05.8&quot;N 89&deg;40&#39;40.4&quot;W</p>\r\n\r\n<p><strong>Availability:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;~0.5 MT/year</p>\r\n\r\n<p><strong>Contact:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</strong>&nbsp;&nbsp;<a href="mailto:chocolates.izalco@gmail.com" target="_blank">chocolates.izalco@gmail.com</a></p>\r\n\r\n<p><strong>Phone:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</strong>&nbsp;(503) 6156-1618</p>\r\n	<p>Processing this cacao at farm level in mini boxes allows for unique flavor development. The refreshing blend of citrus fruits and mint &amp; lemongrass is pleasantly covered by a soft woody breeze. Converted into chocolate, it releases the sweetness of red apple crumble strewed with sprinkles of nutmeg and cinnamon.</p>\r\n	\N	1.02	52%	24%	0%	120°C; 25’; 12 μm	anacardo manzana, cítricos, frambuesa, menta, hierba de limón, leñoso, ahumado	Cacao, melaza, fruta marrón, manzana verde, maní	cacao_itzalku_-_9784-choc.png	image/png	238787	2020-02-24 03:18:20.637924	cacao_itzalku_-_9784.png	image/png	239806	2020-02-24 03:18:21.573742	cashew apple, citrus, raspberry, mint, lemongrass, woody, smoky	cocoa, date, molasses, brown fruit, green apple, peanut			f
6	3	7	Cuyamel	\N	Catacamas, Honduras	14.795667	-85.627444	<p tabindex="0"><strong>Productor:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Asociaci&oacute;n de Productores de Sistemas Agroforestales de Cacao Org&aacute;nico de Olancho APROSACAO</p>\r\n\r\n<p tabindex="0"><strong>Coordenadas:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;14&deg;47&#39;44.4&quot;N 85&deg;37&#39;38.8&quot;W</p>\r\n\r\n<p tabindex="0"><strong>Disponibilidad:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong>~5-8 MT/year</p>\r\n\r\n<p tabindex="0"><strong>Contacto:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</strong><a href="mailto:aprosacao@aprocacaho.com" target="_blank">aprosacao@aprocacaho.com</a>,&nbsp;<a href="mailto:aprosacaohn@yahoo.com" target="_blank">aprosacaohn@yahoo.com</a></p>\r\n\r\n<p tabindex="0"><strong>Tel&eacute;fono:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</strong>(504) 9435-1355</p>\r\n	<p tabindex="0">&nbsp;</p>\r\n\r\n<p><strong>Composici&oacute;n varietal: </strong>mezcla trinitaria (20% lila; 0% blanco)</p>\r\n\r\n<p><strong>Acondicionamiento previo de pulpa: </strong>/</p>\r\n\r\n<p><strong>M&eacute;todo de fermentaci&oacute;n: </strong>cajas de madera tipo cascada (330 kg)</p>\r\n\r\n<p><strong>Pre-secado: </strong>48h; 8 cm; t&uacute;nel solar</p>\r\n\r\n<p><strong>Secado: </strong>secado al sol de 9 d&iacute;as; aire libre; madera</p>\r\n	cuyamel_web.jpg	image/jpeg	179101	2020-02-24 01:28:18.40787		2019-04-24 21:11:57.417677	2020-02-24 01:33:47.753782	-25	35	0	cuyamel		<p style="text-align: center;"><strong><img alt="" src="https://www.arcgis.com/sharing/rest/content/items/ff5ead0883be4b6a881eac5617a7a3f1/resources/Harvest_Cuyamel__1506428972638__w300.png" style="float: left;" /></strong></p>\r\n	<p>Este picante cacao Trinitario presenta principalmente notas verdes y de cuero. Una vez ya transformado en chocolate, su perfil se pone mas complejo con un caracter picante y de lupulo cubierto con notas de vainilla y higo maduro.</p>\r\n	2	Catacamas, Honduras		<p tabindex="0"><strong>Varietal composition:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Trinitario blend (20% lilac; 0% white)</p>\r\n\r\n<p tabindex="0"><strong>Pulp pre-conditioning:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/</p>\r\n\r\n<p tabindex="0"><strong>Fermentation method:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</strong>Cascade-type wooden boxes (330kg)</p>\r\n\r\n<p tabindex="0"><strong>Pre-drying:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</strong>48h; 8 cm; solar tunnel</p>\r\n\r\n<p tabindex="0"><strong>Drying:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;9-day sun-drying; open air; wood</p>\r\n	<p style="text-align: center;"><strong><img alt="" src="https://www.arcgis.com/sharing/rest/content/items/ff5ead0883be4b6a881eac5617a7a3f1/resources/Harvest_Cuyamel__1506428972638__w300.png" style="float: left;" /></strong></p>\r\n	<p tabindex="0"><strong>Producer:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Asociaci&oacute;n de Productores de Sistemas Agroforestales de&nbsp;Cacao Org&aacute;nico de Olancho APROSACAO</p>\r\n\r\n<p tabindex="0"><strong>Coordinates:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;14&deg;47&#39;44.4&quot;N 85&deg;37&#39;38.8&quot;W</p>\r\n\r\n<p tabindex="0"><strong>Availability:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</strong>~5-8 MT/year</p>\r\n\r\n<p tabindex="0"><strong>Contact:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</strong><a href="mailto:aprosacao@aprocacaho.com" target="_blank">aprosacao@aprocacaho.com</a>,&nbsp;<a href="mailto:aprosacaohn@yahoo.com" target="_blank">aprosacaohn@yahoo.com</a></p>\r\n\r\n<p tabindex="0"><strong>Phone:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</strong>(504) 9435-1355</p>\r\n	<p>This spicy Trinitario cocoa expresses mainly green and leather notes. Once converted into chocolate, the profile gets more complex with a very hoppy spicy character rounded by vanilla and ripe fig notes.</p>\r\n	\N	1.40	64%	20%	0%	120°C; 25’; 12 μm	picante, verde, notas de cuero, terroso, madera oscura, chocolate	cerveza lupulada, higo maduro, notas de cereza oscura / ciruela, vainilla, champiñones	cuyamel_-_9786-choc.png	image/png	235752	2020-02-24 01:28:18.861036	cuyamel_-_9786.png	image/png	235671	2020-02-24 01:28:20.291634	spicy, green, leather notes, earthy, dark wood, chocolate	hoppy beer, ripe fig, dark cherry/plum notes, vanilla, mushroom			f
10	2	10	MWas	\N	Waslala, Nicaragua	13.328972	-85.375667	<p tabindex="0">&nbsp;</p>\r\n\r\n<p tabindex="0"><strong>Productor:</strong>&nbsp;Asociaci&oacute;n para la Promoci&oacute;n de las Mujeres de Waslala APROMUWA R.L.</p>\r\n\r\n<p tabindex="0"><strong>Coordenadas:</strong>&nbsp;13&deg;19&#39;44.3&quot;N 85&deg;22&#39;32.4&quot;W</p>\r\n\r\n<p tabindex="0"><strong>Disponibilidad:&nbsp;</strong>~12 MT/year</p>\r\n\r\n<p tabindex="0"><strong>Contacto:&nbsp;</strong><a href="mailto:apromuwas@gmail.com" target="_blank">apromuwas@gmail.com</a></p>\r\n\r\n<p tabindex="0"><strong>Tel&eacute;fono:&nbsp;</strong>(505) 8920-2933&nbsp;</p>\r\n	<p tabindex="0">&nbsp;</p>\r\n\r\n<p><strong>Composici&oacute;n varietal: </strong>Mezcla Forastero (6% lila; 0% blanco)</p>\r\n\r\n<p><strong>Acondicionamiento previo de pulpa:</strong> /</p>\r\n\r\n<p><strong>M&eacute;todo de fermentaci&oacute;n: </strong>cajas de madera horizontales (50-100 kg)</p>\r\n\r\n<p><strong>Pre-secado: </strong>48h; 10 cm; t&uacute;nel solar</p>\r\n\r\n<p><strong>Secado: </strong>12 d&iacute;as de secado al sol; t&uacute;nel solar madera</p>\r\n	mwas_web.jpg	image/jpeg	256577	2020-02-24 04:07:23.553014		2019-06-26 22:46:35.457927	2020-02-24 04:07:26.758963	-8	5	0	mwas			<p>Cacao cultivado y procesado por mujeres de la zona de Waslala</p>\r\n	3	Waslala, Nicaragua		<p tabindex="0">&nbsp;</p>\r\n\r\n<p tabindex="0"><strong>Varietal composition:</strong>&nbsp;Forastero blend (6% lilac; 0% white)</p>\r\n\r\n<p tabindex="0"><strong>Pulp pre-conditioning:</strong>&nbsp;/</p>\r\n\r\n<p tabindex="0"><strong>Fermentation method:&nbsp;</strong>Horizontal wooden boxes (50-100kg)</p>\r\n\r\n<p tabindex="0"><strong>Pre-drying:&nbsp;</strong>48h; 10 cm; solar tunnel</p>\r\n\r\n<p tabindex="0"><strong>Drying:</strong>&nbsp;12-day sun-drying; solar tunnel; wood</p>\r\n		<p tabindex="0">&nbsp;</p>\r\n\r\n<p tabindex="0"><strong>Producer:</strong>&nbsp;Asociaci&oacute;n para la Promoci&oacute;n de las Mujeres de Waslala APROMUWA R.L.</p>\r\n\r\n<p tabindex="0"><strong>Coordinates:</strong>&nbsp;13&deg;19&#39;44.3&quot;N 85&deg;22&#39;32.4&quot;W</p>\r\n\r\n<p tabindex="0"><strong>Availability:&nbsp;</strong>~12 MT/year</p>\r\n\r\n<p tabindex="0"><strong>Contact:&nbsp;</strong><a href="mailto:apromuwas@gmail.com" target="_blank">apromuwas@gmail.com</a></p>\r\n\r\n<p tabindex="0"><strong>Phone:&nbsp;</strong>(505) 8920-2933&nbsp;</p>\r\n	<pre data-placeholder="Traducción" dir="ltr" id="tw-target-text">\r\n<span style="font-family:Arial,Helvetica,sans-serif;">This Cocoa is cultivated and processed by women from the Waslala</span></pre>\r\n	\N	1.36	42%	28%	0%	120 ° C; 25 ’; 12 μm	plátano verde, aceitunas verdes, cuero, castaño	nueces pecanas, melón maduro / kiwi, hierbas	mwas_-_9807-choc.png	image/png	237197	2020-02-24 04:07:24.017353	mwas_-_9807.png	image/png	235072	2020-02-24 04:07:25.407405	green banana, green olives, leather, chestnut	pecan nuts, overipe melon/kiwi, herbs			f
14	2	12	River View	\N	Río San Juan, Nicaragua	11.165361	-84.433083	<p tabindex="0"><strong>Productor:</strong>&nbsp;Asociaci&oacute;n de Iniciativas y Hermanamientos de<br />\r\nEl Castillo ASHIERCA</p>\r\n\r\n<p tabindex="0"><strong>Coordenadas:</strong>&nbsp;11&deg;09&#39;55.3&quot;N 84&deg;25&#39;59.1&quot;W</p>\r\n\r\n<p tabindex="0"><strong>Disponibilidad:&nbsp;</strong>~5 MT/year</p>\r\n	<p><strong>Composici&oacute;n varietal:</strong> mezcla trinitaria (48% lila; 4% blanco)</p>\r\n\r\n<p><strong>Acondicionamiento previo de pulpa:</strong> /</p>\r\n\r\n<p><strong>M&eacute;todo de fermentaci&oacute;n: </strong>cajas de madera tipo cascada (360 kg)</p>\r\n\r\n<p><strong>Pre-secado: </strong>24horas; 10 cm; t&uacute;nel solar</p>\r\n\r\n<p><strong>Secado: </strong>secado al sol de 9 d&iacute;as; t&uacute;nel solar acero inoxidable</p>\r\n	river_view_-_copia.jpg	image/jpeg	216132	2020-02-24 04:36:56.943687		2019-07-30 06:17:14.663523	2020-02-24 04:37:00.1442	0	0	1	river-view		<p><img alt="" src="http://cocoaflavormap.cacaomovil.com/ckeditor_assets/pictures/74/content_Harvest_RiverView.png" style="width: 300px; height: 300px;" /></p>\r\n	<p>El indicado si busca una experiencia b&aacute;sica chocolatosa.</p>\r\n	2	Río San Juan, Nicaragua		<p tabindex="0"><strong>Varietal composition:</strong>&nbsp;Trinitario blend (48% lilac; 4% white)</p>\r\n\r\n<p tabindex="0"><strong>Pulp pre-conditioning:</strong>&nbsp;/</p>\r\n\r\n<p tabindex="0"><strong>Fermentation method:&nbsp;</strong>Cascade-type wooden boxes (360 kg)</p>\r\n\r\n<p tabindex="0"><strong>Pre-drying:&nbsp;</strong>24h; 10 cm; solar tunnel</p>\r\n\r\n<p tabindex="0"><strong>Drying:</strong>&nbsp;9-day sun-drying; solar tunnel; stainless steel</p>\r\n	<p><img alt="" src="http://cocoaflavormap.cacaomovil.com/ckeditor_assets/pictures/74/content_Harvest_RiverView.png" style="width: 300px; height: 300px;" /></p>\r\n	<p tabindex="0"><strong>Producer:</strong>&nbsp;Asociaci&oacute;n de Iniciativas y Hermanamientos de<br />\r\nEl Castillo ASHIERCA</p>\r\n\r\n<p tabindex="0"><strong>Coordinates:</strong>&nbsp;11&deg;09&#39;55.3&quot;N 84&deg;25&#39;59.1&quot;W</p>\r\n\r\n<p tabindex="0"><strong>Availability:&nbsp;</strong>~5 MT/year</p>\r\n	<p>This is the one if you seek for a straightforward chocolate experience.</p>\r\n	\N	1.51	40%	32%	0%	120 ° C; 25 ’; 12 μm	chocolate, tánico, terroso.	cacao, champiñones, terroso	river_view_-_9861-choc.png	image/png	232725	2020-02-24 04:36:57.403975	river_view_-_9861.png	image/png	234505	2020-02-24 04:36:58.736587	chocolate, tannic, earthy	cacao, mushroom, earthy			f
11	2	8	NueQue	\N	Rio San Juan, Nicaragua	11.239528	-84.309306	<p tabindex="0"><strong>Productor:</strong>&nbsp;Cooperativa de Servicios M&uacute;ltiples Productores de Cacao Familias Unidas de El Castillo COOPROCAFUC R.L.</p>\r\n\r\n<p tabindex="0"><strong>Coordenadas:</strong>&nbsp;11&deg;14&#39;22.3&quot;N 84&deg;18&#39;33.5&quot;W</p>\r\n\r\n<p tabindex="0"><strong>Disponibilidad:&nbsp;</strong>~15 - 18 MT/year</p>\r\n\r\n<p tabindex="0"><strong>Contacto:&nbsp;</strong><a href="mailto:cooprocafuc@yahoo.es" target="_blank">cooprocafuc@yahoo.es</a></p>\r\n\r\n<p tabindex="0"><strong>Tel&eacute;fono:&nbsp;&nbsp;</strong>(505) 8441-1612&nbsp;</p>\r\n	<p><strong>Composici&oacute;n varietal: </strong>mezcla trinitaria (12% lila; 2% blanco)</p>\r\n\r\n<p><strong>Acondicionamiento previo de pulpa: </strong>/</p>\r\n\r\n<p><strong>M&eacute;todo de fermentaci&oacute;n: </strong>bandeja (m&iacute;n. 220 kg)</p>\r\n\r\n<p><strong>Pre-secado: </strong>48h; 10 cm; t&uacute;nel solar</p>\r\n\r\n<p><strong>Secado: </strong>11 d&iacute;as de secado al sol; t&uacute;nel solar acero perforado</p>\r\n	NueQue_web_-_copia.jpg	image/jpeg	414208	2020-02-24 04:10:18.143474		2019-06-27 22:51:23.230696	2020-02-24 04:10:21.700575	0	0	1	nueque			<p>Fermentado en torres de cajillas Rohan, esta mezcla Trinitario es una &ldquo;bomba de sabores&rdquo;. Fruta madura y pasas mezcladas con nuez moscada y clavo dan un sabor largo y complejo de chocolate con notas de madera al final.</p>\r\n	3	Rio San Juan, Nicaragua		<p tabindex="0"><strong>Varietal composition:</strong>&nbsp;Trinitario blend (12% lilac; 2% white)</p>\r\n\r\n<p tabindex="0"><strong>Pulp pre-conditioning:</strong>&nbsp;/</p>\r\n\r\n<p tabindex="0"><strong>Fermentation method:&nbsp;</strong>Tray (min. 220kg)</p>\r\n\r\n<p tabindex="0"><strong>Pre-drying:&nbsp;</strong>48h; 10 cm; solar tunnel</p>\r\n\r\n<p tabindex="0"><strong>Drying:</strong>&nbsp;11-day sun-drying; solar tunnel; perforated steel</p>\r\n		<p tabindex="0"><strong>Producer:</strong>&nbsp;Cooperativa de Servicios M&uacute;ltiples Productores de Cacao Familias Unidas de El Castillo COOPROCAFUC R.L.</p>\r\n\r\n<p tabindex="0"><strong>Coordinates:</strong>&nbsp;11&deg;14&#39;22.3&quot;N 84&deg;18&#39;33.5&quot;W</p>\r\n\r\n<p tabindex="0"><strong>Availability:&nbsp;</strong>~15 - 18 MT/year</p>\r\n\r\n<p tabindex="0"><strong>Contact:&nbsp;</strong><a href="mailto:cooprocafuc@yahoo.es" target="_blank">cooprocafuc@yahoo.es</a></p>\r\n\r\n<p tabindex="0"><strong>Phone:&nbsp;</strong>(505) 8441-1612&nbsp;</p>\r\n	<p>Fermented in towers of wooden Rohan trays, this Trinitario blend is a &ldquo;flavor bomb&rdquo;. Brown fruits and raisins blended with clove and nutmeg give a long complex chocolate taste with a woody finish.</p>\r\n	\N	1.35	15%	10%	0%		frutas marrones, pasas, clavo, nuez moscada, chocolate con un final amaderado.	cerezas secas, fresa, espumosos, ron, almendras, arroz, cremoso	nueque_-_9842-choc.png	image/png	235646	2020-02-24 04:10:18.888606	nueque_-_9842.png	image/png	232831	2020-02-24 04:10:20.338425	 brown fruits, raisins, clove, nutmeg, chocolate with a woody finish	dried cherries, strawberry, sparkling, rhum, almonds, rice, creamy			f
12	2	9	O'OCO	\N	Waslala, Nicaragua	13.316139	-85.382333	<p tabindex="0"><strong>Productor:</strong>&nbsp;Cooperativa de Servicio Agroforestal y de Comercializaci&oacute;n de Cacao CACAONICA R.L.</p>\r\n\r\n<p tabindex="0"><strong>Coordenadas:</strong>&nbsp;13&deg;18&#39;58.1&quot;N 85&deg;22&#39;56.4&quot;W</p>\r\n\r\n<p tabindex="0"><strong>Disponibilidad:&nbsp;</strong>~50 MT/year</p>\r\n\r\n<p tabindex="0"><strong>Contacto:&nbsp;</strong><a href="mailto:cacaonica.organico@yahoo.com" target="_blank">cacaonica.organico@yahoo.com</a>,&nbsp;<a href="http://cacaonica.com.ni/" target="_blank">cacaonica.com.ni</a></p>\r\n\r\n<p tabindex="0"><strong>Tel&eacute;fono:&nbsp;</strong>(505) 5768-8495</p>\r\n	<p><strong>Composici&oacute;n varietal: </strong>mezcla de Forastero (4% lila; 2% blanco)</p>\r\n\r\n<p><strong>Acondicionamiento previo de pulpa: </strong>/</p>\r\n\r\n<p><strong>M&eacute;todo de fermentaci&oacute;n: </strong>cajas horizontales de madera (1.200 kg)</p>\r\n\r\n<p><strong>Pre-secado: </strong>48h; 10 cm; t&uacute;nel solar</p>\r\n\r\n<p><strong>Secado:</strong> 6 d&iacute;as de secado al sol; t&uacute;nel solar madera</p>\r\n	O'OCO_web.jpg	image/jpeg	102972	2020-02-24 04:17:27.9427		2019-06-27 23:01:42.547196	2020-02-24 04:17:29.34683	-25	70	0	o-oco			<p>Se caracteriza por su sabor a dona</p>\r\n	2	Waslala, Nicaragua		<p tabindex="0"><strong>Varietal composition:</strong>&nbsp;Forastero blend (4% lilac; 2% white)</p>\r\n\r\n<p tabindex="0"><strong>Pulp pre-conditioning:</strong>&nbsp;/</p>\r\n\r\n<p tabindex="0"><strong>Fermentation method:&nbsp;</strong>Horizontal wooden boxes (1,200kg)</p>\r\n\r\n<p tabindex="0"><strong>Pre-drying:&nbsp;</strong>48h; 10 cm; solar tunnel</p>\r\n\r\n<p tabindex="0"><strong>Drying:</strong>&nbsp;6-day sun-drying; solar tunnel; wood</p>\r\n		<p tabindex="0"><strong>Producer:</strong>&nbsp;Cooperativa de Servicio Agroforestal y de Comercializaci&oacute;n de Cacao CACAONICA R.L.</p>\r\n\r\n<p tabindex="0"><strong>Coordinates:</strong>&nbsp;13&deg;18&#39;58.1&quot;N 85&deg;22&#39;56.4&quot;W</p>\r\n\r\n<p tabindex="0"><strong>Availability:&nbsp;</strong>~50 MT/year</p>\r\n\r\n<p tabindex="0"><strong>Contact:&nbsp;</strong><a href="mailto:cacaonica.organico@yahoo.com" target="_blank">cacaonica.organico@yahoo.com</a>,&nbsp;<a href="http://cacaonica.com.ni/" target="_blank">cacaonica.com.ni</a></p>\r\n\r\n<p tabindex="0"><strong>Phone:&nbsp;</strong>(505) 5768-8495</p>\r\n	<p>&nbsp;</p>\r\n\r\n<p>It has a donut flavor</p>\r\n	\N	1.34	84%	10%	0%		pinol, ciruelas pasas, pasas oscuras, aceitunas, agua de rosas, ginebra, ahumado (tabaco)	dona de chocolate, coñac, levadura, fruta fresca y brillante	o_oco_-_9455-choc.png	image/png	234615	2020-02-24 04:17:28.096024	o_oco_-_9455.png	image/png	232409	2020-02-24 04:17:28.725271	pinol, prunes, dark raisins, olives, rosewater, gin, smoky (tobacco)	chocolate doughnut, cognac, yeast, fresh and bright fruit			f
1	2	8	LoChi	\N	Río San Juan, Nicaragua	11.237556 	-84.560944	<p tabindex="0"><strong>Productor:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</strong>Cooperativa de Servicios M&uacute;ltiples Productores de Cacao Familias Unidas de El Castillo COOPROCAFUC R.L.</p>\r\n\r\n<p tabindex="0"><strong>Disponibilidad:&nbsp; &nbsp; &nbsp; </strong>~10 MT/a&ntilde;o</p>\r\n\r\n<p tabindex="0"><strong>Contacto:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</strong><a href="mailto:cooprocafuc@yahoo.es" target="_blank">cooprocafuc@yahoo.es</a></p>\r\n\r\n<p tabindex="0"><strong>Tel&eacute;fono:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</strong>(505) 8441-1612</p>\r\n\r\n<p tabindex="0">&nbsp;</p>\r\n\r\n<p tabindex="0">&nbsp;</p>\r\n	<p><strong>Composici&oacute;n varietal: </strong>Mezcla Acriollado (45% lila; 14% blanco)</p>\r\n\r\n<p><strong>M&eacute;todo de fermentaci&oacute;n:</strong> cajas horizontales de madera (350 kg)</p>\r\n\r\n<p><strong>Presecado: </strong>24 horas; 13 cm; t&uacute;nel solar</p>\r\n\r\n<p><strong>Secado: </strong>10 d&iacute;as de secado al sol; t&uacute;nel solar; acero perforado y 4-h&nbsp;secado artificial; Samoa; 35 &deg;C; energia: madera</p>\r\n	LoChi_web_.jpg	image/jpeg	299245	2020-02-24 03:56:33.863787		2019-04-24 21:11:57.39375	2020-02-24 03:56:37.450213	0	0	0	lochi	<p tabindex="0"><strong>T</strong></p>\r\n	<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img alt="" src="https://www.arcgis.com/sharing/rest/content/items/ff5ead0883be4b6a881eac5617a7a3f1/resources/Harvest_LoChi__1506438896054__w300.png" style="height: 300px; width: 300px;" /></strong></p>\r\n	<p>Fermentado en cajas, con sabor a cerveza</p>\r\n	3	Río San Juan, Nicaragua		<p tabindex="0"><strong>Varietal composition:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Acriollado blend (45% lilac; 14% white)</p>\r\n\r\n<p tabindex="0"><strong>Fermentation method:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</strong>Horizontal wooden boxes (350kg)</p>\r\n\r\n<p tabindex="0"><strong>Pre-drying:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</strong>24h; 13 cm; solar tunnel</p>\r\n\r\n<p tabindex="0"><strong>Drying:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;10-day sun-drying; solar tunnel; perforated steel &amp; 4-h artificial drying; Samoa; 35 &deg;C; energy: wood</p>\r\n	<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img alt="" src="https://www.arcgis.com/sharing/rest/content/items/ff5ead0883be4b6a881eac5617a7a3f1/resources/Harvest_LoChi__1506438896054__w300.png" style="height: 300px; width: 300px;" /></strong></p>\r\n	<p tabindex="0"><strong>Producer:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Cooperativa de Servicios M&uacute;ltiples Productores de Cacao Familias Unidas de El Castillo COOPROCAFUC R.L.</p>\r\n\r\n<p tabindex="0"><strong>Availability:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</strong>~10 MT/year</p>\r\n\r\n<p tabindex="0"><strong>Contact:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</strong><a href="mailto:cooprocafuc@yahoo.es" target="_blank">cooprocafuc@yahoo.es</a></p>\r\n\r\n<p tabindex="0"><strong>Phone:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong>(505) 8441-1612</p>\r\n	<p>Fermented in wooden boxes with the beer-like taste.</p>\r\n	\N	1.1	76%	16%	0%	120°C; 25’; 12 μm	Especias suaves y notas de nuez, cerveza (malta), fruta de la estrella.	Resina, menta, mahleb, yogur, whisky, baileys	lochi_-_9451-choc.png	image/png	234569	2020-02-24 03:56:34.611405	lochi_-_9451.png	image/png	231218	2020-02-24 03:56:36.040537	mild spice and nutty notes, beer (malt), starfruit	resin, peppermint, mahleb, yogurt, whiskey, baileys			f
5	3	4	SanFran	\N	Atlántida, Honduras	15.687389	-86.981444	<p><strong>Productor:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</strong>Asociaci&oacute;n de Productores de Pico Bonito ASOPROPIB</p>\r\n\r\n<p><strong>Coordenadas:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;15 &deg; 41&#39;14.6 &quot;N 86 &deg; 58&#39;53.2&quot; W</p>\r\n\r\n<p><strong>Disponibilidad:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;8 - 10 MT / a&ntilde;o (apr&oacute;x.)</p>\r\n\r\n<p><strong>Contacto:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; asopropib@gmail.com</p>\r\n\r\n<p><strong>Tel&eacute;fono:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(504) 9441-6911</p>\r\n\r\n<p><strong>Certificaci&oacute;n:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</strong>S&iacute;mbolo PPC</p>\r\n	<p><strong>Composici&oacute;n varietal:</strong> Mezcla trinitaria (36% lila; 142 blanco)</p>\r\n\r\n<p><strong>Acondicionamiento previo de pulpa: /</strong></p>\r\n\r\n<p><strong>M&eacute;todo de fermentaci&oacute;n: </strong>cajas horizontales de madera (270 kg)</p>\r\n\r\n<p><strong>Pre-secado: </strong>48h (d&iacute;a1 2h sol; d&iacute;a2 4h sol); 8 cm; aire libre</p>\r\n\r\n<p><strong>Secado: </strong>secado al sol de 9 d&iacute;as; aire libre; madera</p>\r\n	IMG_SANFRAN.jpg	image/jpeg	190826	2020-02-24 04:31:54.119724		2019-04-24 21:11:57.413419	2020-02-24 04:31:57.118987	-11.5	2.5	0	sanfran			<p>Un cacao fuerte con notas intensas de aceitunas negras y tabaco est&aacute; hecho para ocasiones especiales. La acidez y astringencia de carambola es el elemento especial de este cacao y se puede detectar todav&iacute;a cuando ya este convertido en chocolate. Arroz basmati y canela se sienten tambi&eacute;n en el chocolate.</p>\r\n	1	Atlántida, Honduras		<p tabindex="0"><strong>Varietal composition:</strong>&nbsp; &nbsp; &nbsp; &nbsp;Trinitario blend (36% lilac; 142 white)</p>\r\n\r\n<p tabindex="0"><strong>Pulp pre-conditioning:</strong>&nbsp; &nbsp; &nbsp; /</p>\r\n\r\n<p tabindex="0"><strong>Fermentation method:&nbsp; &nbsp; &nbsp;&nbsp;</strong>Horizontal wooden boxes (270kg)</p>\r\n\r\n<p tabindex="0"><strong>Pre-drying:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</strong>48h (Day1 2h sun; Day2 4h sun); 8 cm; open air</p>\r\n\r\n<p tabindex="0"><strong>Drying:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 9-day sun-drying; open air; wood</p>\r\n		<p><strong>Productor:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</strong>Asociaci&oacute;n de Productores de Pico Bonito ASOPROPIB</p>\r\n\r\n<p><strong>Coordenadas:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;15 &deg; 41&#39;14.6 &quot;N 86 &deg; 58&#39;53.2&quot; W</p>\r\n\r\n<p><strong>Disponibilidad:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;8 - 10 MT / a&ntilde;o (apr&oacute;x.)</p>\r\n\r\n<p><strong>Contacto:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; asopropib@gmail.com</p>\r\n\r\n<p><strong>Tel&eacute;fono:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(504) 9441-6911</p>\r\n\r\n<p><strong>Certificaci&oacute;n:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</strong>S&iacute;mbolo PPC</p>\r\n	<p>A strong light-colored cocoa with intense black olive and tobacco notes made for special occasions. The star fruit acidity and astringency are the special sensory elements of this cocoa which can still be detected when converted into chocolate. Basmati rice and cinnamon add on character in the chocolate form.</p>\r\n	\N	1.14	76%	14%	0%	120 ° C; 25 ’; 12 μm	carambola, aceituna negra, terroso suave, floral	suave, chocolate, pera, arroz basmati	sanfran_-_9787-choc.png	image/png	235684	2020-02-24 04:31:54.36769	sanfran_-_9787.png	image/png	235114	2020-02-24 04:31:55.774131	carambola, black olive, mild earthy, floral	 mild, chocolate, pear, basmati rice			f
18	3	17	Yellow Stone	\N	Atlántida, Honduras	15.740333	-86.512500	<p tabindex="0"><strong>Productor:</strong>&nbsp;Cooperativa De Productores Agr&iacute;colas de San Viator Limitada</p>\r\n\r\n<p tabindex="0"><strong>Coordenadas:</strong>&nbsp;15&deg;44&#39;25.2&quot;N 86&deg;30&#39;45.0&quot;W</p>\r\n\r\n<p tabindex="0"><strong>Disponibilidad:&nbsp;</strong>~25 - 35 MT/a&ntilde;o</p>\r\n\r\n<p tabindex="0"><strong>Contacto:&nbsp;</strong><a href="mailto:coproaserso.sanviator@yahoo.es" target="_blank">coproaserso.sanviator@yahoo.es</a></p>\r\n\r\n<p tabindex="0"><strong>Tel&eacute;fono:&nbsp;</strong>(504) 9435-1338</p>\r\n\r\n<p tabindex="0"><strong>Certificaciones:</strong></p>\r\n\r\n<p><strong><img alt="" src="https://www.arcgis.com/sharing/rest/content/items/ff5ead0883be4b6a881eac5617a7a3f1/resources/spp__1508501353636__w100.png" /> </strong></p>\r\n	<p><strong>Composici&oacute;n varietal: </strong>mezcla Acriollado (38% lila; 28% blanco)</p>\r\n\r\n<p><strong>Acondicionamiento previo de pulpa: </strong>/</p>\r\n\r\n<p><strong>M&eacute;todo de fermentaci&oacute;n:</strong> cajas horizontales de madera (240 kg)</p>\r\n\r\n<p><strong>Pre-secado:</strong> 48h (d&iacute;a1 2h sol; d&iacute;a2 4h sol); 10 cm; aire libre</p>\r\n\r\n<p><strong>Secado: </strong>secado al sol durante 7 d&iacute;as; aire libre; madera</p>\r\n	Yellow_Stone_web.jpg	image/jpeg	245352	2020-02-24 04:50:44.072803		2019-08-02 15:23:17.013275	2020-02-24 04:50:47.407298	0	0	0	yellow-stone			<p>Este perfil din&aacute;mico est&aacute; lleno de car&aacute;cter; maracuy&aacute;, ar&aacute;ndanos, uvas, albaricoque y moca son algunos de los sabores finos que caracterizan este cacao Acriollado. El toque citrico esta abrazado de pimiento rojo y notas de te negro. La experiencia sensorial termina con sabor a nuez y alcohol.</p>\r\n	1	Atlántida, Honduras		<p tabindex="0"><strong>Varietal composition:</strong>&nbsp;Acriollado blend (38% lilac; 28% white)</p>\r\n\r\n<p tabindex="0"><strong>Pulp pre-conditioning:</strong>&nbsp;/</p>\r\n\r\n<p tabindex="0"><strong>Fermentation method:&nbsp;</strong>Horizontal wooden boxes (240kg)</p>\r\n\r\n<p tabindex="0"><strong>Pre-drying:&nbsp;</strong>48h (Day1 2h sun; Day2 4h sun); 10 cm; open air</p>\r\n\r\n<p tabindex="0"><strong>Drying:</strong>&nbsp;7-day sun-drying; open air; wood</p>\r\n		<p tabindex="0"><strong>Producer:</strong>&nbsp;Cooperativa De Productores Agr&iacute;colas de San Viator Limitada</p>\r\n\r\n<p tabindex="0"><strong>Coordinates:</strong>&nbsp;15&deg;44&#39;25.2&quot;N 86&deg;30&#39;45.0&quot;W</p>\r\n\r\n<p tabindex="0"><strong>Availability:&nbsp;</strong>~25 - 35 MT/year</p>\r\n\r\n<p tabindex="0"><strong>Contact:&nbsp;</strong><a href="mailto:coproaserso.sanviator@yahoo.es" target="_blank">coproaserso.sanviator@yahoo.es</a></p>\r\n\r\n<p tabindex="0"><strong>Phone:&nbsp;</strong>(504) 9435-1338</p>\r\n\r\n<p tabindex="0"><strong>Certification:</strong></p>\r\n\r\n<p><strong><img alt="" src="https://www.arcgis.com/sharing/rest/content/items/ff5ead0883be4b6a881eac5617a7a3f1/resources/spp__1508501353636__w100.png" /> </strong></p>\r\n	<p>A very dynamic profile full of character; passion fruit, bilberries, grapes, apricot and mocha are some of the fine flavors that characterize this Acriollado cocoa. A citric touch is hugged by red pepper and black tea notes. The sensory experience is eventually ended with some alcoholic nutty flavors.</p>\r\n	\N	1.15	54%	16%	0 - 1 %	120 ° C; 25 ’; 12 μm	maracuyá, arándanos, uvas, albaricoque, moca, alcohol, té negro y notas cítricas.	sésamo y miel, masilla (resina), mango, licor de albaricoque, flan, vino dulce	yellow_stone_-_9788-choc.png	image/png	239271	2020-02-24 04:50:44.64056	yellow_stone_-_9788.png	image/png	236312	2020-02-24 04:50:46.06338	passion fruit, bilberries, grapes, apricot, mocha, alcoholic, black tea and citrus notes	sesame & honey, mastic (resin), mango, apricot liqueur, flan, sweet wine			f
20	3	19	Omosh	\N	Omoa, Cortés	15.778444	-88.000000	<p tabindex="0"><strong>Productor:</strong>&nbsp;Cooperativa Agr&iacute;cola de Cacaoteeros de Omoa San Fernando Limitada CACAOSAFER</p>\r\n\r\n<p tabindex="0"><strong>Coordenadas:</strong>&nbsp;15&deg;46&#39;42.4&quot;N 88&deg;00&#39;00.0&quot;W</p>\r\n\r\n<p tabindex="0"><strong>Disponibilidad:&nbsp;</strong>~40 MT/a&ntilde;o</p>\r\n\r\n<p tabindex="0"><strong>Contacto:&nbsp;</strong><a href="mailto:cacaosafer@aprocacaho.com" target="_blank">cacaosafer@aprocacaho.com</a></p>\r\n\r\n<p tabindex="0"><strong>Tel&eacute;fono:&nbsp;</strong>(504) 9435-1366</p>\r\n\r\n<p tabindex="0"><strong>Certificaciones:</strong></p>\r\n\r\n<p><strong><img alt="" src="https://www.arcgis.com/sharing/rest/content/items/ff5ead0883be4b6a881eac5617a7a3f1/resources/omoshlogos__1508502953648__w300.png" /> </strong></p>\r\n	<p><strong>Composici&oacute;n varietal:</strong> mezcla trinitaria (30% lila; 8% blanco)</p>\r\n\r\n<p><strong>Acondicionamiento previo de pulpa:</strong> /</p>\r\n\r\n<p><strong>M&eacute;todo de fermentaci&oacute;n: </strong>cajas de madera tipo cascada (385 kg)</p>\r\n\r\n<p><strong>Pre-secado: </strong>24h (d&iacute;a1 2h sol); 10 cm; t&uacute;nel solar</p>\r\n\r\n<p><strong>Secado: </strong>6 d&iacute;as de secado al sol; t&uacute;nel solar acero perforado</p>\r\n	Omosh_-_copia.JPG	image/jpeg	292381	2020-02-24 04:29:26.250164		2019-08-07 22:17:45.923045	2020-02-24 04:55:15.093331	0	0	0	omosh		<p><img alt="" src="http://cocoaflavormap.cacaomovil.com/ckeditor_assets/pictures/64/content_Harvest_Omosh.png" style="width: 300px; height: 300px;" /></p>\r\n	<p>Una mezcla de Trinitarios de la costa norte de Honduras da un sabor a chocolate dulce con toque de or&eacute;gano, fruta seca, y n&eacute;ctar de flores. Sabor a nuez y madera de cedro aparecen y el sabor final es de resina y dulce de leche.</p>\r\n	\N	Omoa, Cortés		<p tabindex="0"><strong>Varietal composition:</strong>&nbsp;Trinitario blend (30% lilac; 8% white)</p>\r\n\r\n<p tabindex="0"><strong>Pulp pre-conditioning:</strong>&nbsp;/</p>\r\n\r\n<p tabindex="0"><strong>Fermentation method:&nbsp;</strong>Cascade-type wooden boxes (385kg)</p>\r\n\r\n<p tabindex="0"><strong>Pre-drying:&nbsp;</strong>24h (Day1 2h sun); 10 cm; solar tunnel</p>\r\n\r\n<p tabindex="0"><strong>Drying:</strong>&nbsp;6-day sun-drying; solar tunnel; perforated steel</p>\r\n	<p><img alt="" src="http://cocoaflavormap.cacaomovil.com/ckeditor_assets/pictures/64/content_Harvest_Omosh.png" style="width: 300px; height: 300px;" /></p>\r\n	<p tabindex="0"><strong>Producer:</strong>&nbsp;Cooperativa Agr&iacute;cola de Cacaoteeros de Omoa San Fernando Limitada CACAOSAFER</p>\r\n\r\n<p tabindex="0"><strong>Coordinates:</strong>&nbsp;15&deg;46&#39;42.4&quot;N 88&deg;00&#39;00.0&quot;W</p>\r\n\r\n<p tabindex="0"><strong>Availability:&nbsp;</strong>~40 MT/year</p>\r\n\r\n<p tabindex="0"><strong>Contact:&nbsp;</strong><a href="mailto:cacaosafer@aprocacaho.com" target="_blank">cacaosafer@aprocacaho.com</a></p>\r\n\r\n<p tabindex="0"><strong>Phone:&nbsp;</strong>(504) 9435-1366</p>\r\n\r\n<p tabindex="0"><strong>Certification:</strong></p>\r\n\r\n<p><strong><img alt="" src="https://www.arcgis.com/sharing/rest/content/items/ff5ead0883be4b6a881eac5617a7a3f1/resources/omoshlogos__1508502953648__w300.png" /> </strong></p>\r\n	<p>A Trinitario blend from the Northern coast of Honduras releases a flavorsome sweet chocolate taste with hints of oregano, dried fruit, and flower nectar. Intense nutty (walnut, chestnut) and cider wood notes follow ending up in a resin, butterscotch flavor.</p>\r\n	\N	1.43	62%	26%	0%	120°C; 25’; 12 μm	orégano, notas de frutos secos y néctar de flores, nuez, castaño, notas de madera de sidra, resina, caramelo	 potente, especias, guanábana, laurel, mole mexicano	omosh_-_9840-choc.png	image/png	236371	2020-02-24 04:29:28.034901	omosh_-_9840.png	image/png	232526	2020-02-24 04:29:28.63568	oregano, hints of dried fruit, and flower nectar, walnut, chestnut, cider wood notes, resin, butterscotch	powerfull, spice, guanabana, laurel, mexican mole			f
24	2	21	ArauzCo	\N	Jinotega, Nicaragua	13.366694	-85.724167	<p tabindex="0"><strong>Productor:</strong>&nbsp;Uni&oacute;n De Cooperativas Agropecuarias SOPPEXCCA R.L. UCA SOPPEXCA R.L.</p>\r\n\r\n<p tabindex="0"><strong>Coordenadas:</strong>&nbsp;13&deg;22&#39;00.1&quot;N 85&deg;43&#39;27.0&quot;W</p>\r\n\r\n<p tabindex="0"><strong>Disponibilidad:&nbsp;</strong>~5 MT/a&ntilde;o</p>\r\n\r\n<p tabindex="0"><strong>Contacto:&nbsp;</strong><a href="mailto:soppexcc@tmx.com" target="_blank">soppexcc@tmx.com</a>,&nbsp;<a href="http://soppexcca.org/es/" target="_blank">soppexcca.org/es/</a></p>\r\n\r\n<p tabindex="0"><strong>Tel&eacute;fono:&nbsp;</strong>(505) 2782-2617</p>\r\n	<p tabindex="0"><strong>Composici&oacute;n varietal:</strong>&nbsp;Mezcla de trinitarios (10% lila; 0% blanco)</p>\r\n\r\n<p tabindex="0"><b>Acondicionamiento previo de pulpa: </b>/</p>\r\n\r\n<p tabindex="0"><strong>M&eacute;todo de fermentaci&oacute;n:&nbsp;</strong>Cajas horizontales de madera (454 kg)</p>\r\n\r\n<p><strong>Pre-secado: /</strong></p>\r\n\r\n<p><strong>Secado: </strong>secado al sol&nbsp;9 d&iacute;as; aire libre; bandejas de madera</p>\r\n\r\n<p tabindex="0">&nbsp;</p>\r\n	Arauzco_web.jpg	image/jpeg	276062	2020-02-24 00:17:18.590343		2019-08-08 22:59:11.789349	2020-02-24 00:17:19.513821	\N	\N	0	arauzco		<p><img alt="" src="http://cocoaflavormap.cacaomovil.com/ckeditor_assets/pictures/73/content_Harvest_Arauzco.png" style="width: 300px; height: 300px;" /></p>\r\n		\N	Jinotega, Nicaragua		<p tabindex="0"><strong>Varietal composition:</strong>&nbsp;Trinitario blend (10% lilac; 0% white)</p>\r\n\r\n<p tabindex="0"><strong>Pulp pre-conditioning:</strong>&nbsp;/</p>\r\n\r\n<p tabindex="0"><strong>Fermentation method:&nbsp;</strong>Horizontal wooden boxes (454 kg)</p>\r\n\r\n<p tabindex="0"><strong>Pre-drying:&nbsp;</strong>/</p>\r\n\r\n<p tabindex="0"><strong>Drying:</strong>&nbsp;9-day sun-drying; open air; wooden trays</p>\r\n	<p><img alt="" src="http://cocoaflavormap.cacaomovil.com/ckeditor_assets/pictures/73/content_Harvest_Arauzco.png" style="width: 300px; height: 300px;" /></p>\r\n	<p tabindex="0"><strong>Producer:</strong>&nbsp;Uni&oacute;n De Cooperativas Agropecuarias SOPPEXCCA R.L. UCA SOPPEXCA R.L.</p>\r\n\r\n<p tabindex="0"><strong>Coordinates:</strong>&nbsp;13&deg;22&#39;00.1&quot;N 85&deg;43&#39;27.0&quot;W</p>\r\n\r\n<p tabindex="0"><strong>Availability:&nbsp;</strong>~5 MT/year</p>\r\n\r\n<p tabindex="0"><strong>Contact:&nbsp;</strong><a href="mailto:soppexcc@tmx.com" target="_blank">soppexcc@tmx.com</a>,&nbsp;<a href="http://soppexcca.org/es/" target="_blank">soppexcca.org/es/</a></p>\r\n\r\n<p tabindex="0"><strong>Phone:&nbsp;</strong>(505) 2782-2617</p>\r\n		\N	1.40	56%	22%	0%	120 ° C; 25 ’; 12 μm	cacao, café expreso, cáscara de nuez; un pan	chocolate, notas de frutas doradas, toques florales y vegetales	\N	\N	\N	\N	\N	\N	\N	\N	cocoa, espresso coffee, nut skins; bread	chocolate, browned fruit notes, floral veggy hints			f
21	3	14	Yojo	\N	Cortés, Honduras	15.127028	-88.669944	<p tabindex="0"><strong>Productor:</strong>&nbsp;Cooperativa Agr&iacute;cola Cafetalera San Antonio Limitada<br />\r\nCOAGRICSAL</p>\r\n\r\n<p tabindex="0"><strong>Coordenadas:</strong>&nbsp;15&deg;07&#39;37.3&quot;N 88&deg;40&#39;11.8&quot;W</p>\r\n\r\n<p tabindex="0"><strong>Disponibilidad:&nbsp;</strong>~10 MT/a&ntilde;o</p>\r\n\r\n<p tabindex="0"><strong>Contacto:&nbsp;</strong><a href="mailto:proyectocacao@coagricsal.hn" target="_blank">proyectocacao@coagricsal.hn</a>,&nbsp;<a href="http://www.coagricsal.hn/" target="_blank">coagricsal.hn</a></p>\r\n\r\n<p tabindex="0"><strong>Tel&eacute;fono:&nbsp;</strong>(504) 2617-6423</p>\r\n\r\n<p tabindex="0"><strong>Certificaci&oacute;n:</strong></p>\r\n\r\n<figure tabindex="0">\r\n<p><strong><img alt="" src="https://www.arcgis.com/sharing/rest/content/items/ff5ead0883be4b6a881eac5617a7a3f1/resources/spp__1508501353636__w100.png" /> </strong></p>\r\n</figure>\r\n	<p><strong>Composici&oacute;n varietal:</strong> mezcla trinitaria (20% lila; 2% blanco)</p>\r\n\r\n<p><strong>Acondicionamiento previo de pulpa:</strong> /</p>\r\n\r\n<p><strong>M&eacute;todo de fermentaci&oacute;n: </strong>cajas tipo cascada (350 kg)</p>\r\n\r\n<p><strong>Pre-secado:</strong> 24h (d&iacute;a1 2h sol); 12 cm; aire libre</p>\r\n\r\n<p><strong>Secado: </strong>secado al sol de 9 d&iacute;as; aire libre; madera</p>\r\n	YoJo_web.jpg	image/jpeg	272502	2020-02-24 04:53:49.751391		2019-08-07 22:32:31.901313	2020-02-24 04:53:51.44824	\N	-1	0	yojo		<p><img alt="" src="http://cocoaflavormap.cacaomovil.com/ckeditor_assets/pictures/68/content_Harvest_YoJo.png" style="width: 300px; height: 300px;" /></p>\r\n	<p>Complementa con un sabor balanceado entre licor Napoleon y moka</p>\r\n	3	Cortés, Honduras		<p tabindex="0"><strong>Varietal composition:</strong>&nbsp;Trinitario blend (20% lilac; 2% white)</p>\r\n\r\n<p tabindex="0"><strong>Pulp pre-conditioning:</strong>&nbsp;/</p>\r\n\r\n<p tabindex="0"><strong>Fermentation method:&nbsp;</strong>Cascade-type boxes (350kg)</p>\r\n\r\n<p tabindex="0"><strong>Pre-drying:&nbsp;</strong>24h (Day1 2h sun); 12 cm; open air</p>\r\n\r\n<p tabindex="0"><strong>Drying:</strong>&nbsp;9-day sun-drying; open air; wood</p>\r\n	<p><img alt="" src="http://cocoaflavormap.cacaomovil.com/ckeditor_assets/pictures/68/content_Harvest_YoJo.png" style="width: 300px; height: 300px;" /></p>\r\n	<p tabindex="0"><strong>Producer:</strong>&nbsp;Cooperativa Agr&iacute;cola Cafetalera San Antonio Limitada<br />\r\nCOAGRICSAL</p>\r\n\r\n<p tabindex="0"><strong>Coordinates:</strong>&nbsp;15&deg;07&#39;37.3&quot;N 88&deg;40&#39;11.8&quot;W</p>\r\n\r\n<p tabindex="0"><strong>Availability:&nbsp;</strong>~10 MT/year</p>\r\n\r\n<p tabindex="0"><strong>Contact:&nbsp;</strong><a href="mailto:proyectocacao@coagricsal.hn" target="_blank">proyectocacao@coagricsal.hn</a>,&nbsp;<a href="http://www.coagricsal.hn/" target="_blank">coagricsal.hn</a></p>\r\n\r\n<p tabindex="0"><strong>Phone:&nbsp;</strong>(504) 2617-6423</p>\r\n\r\n<p tabindex="0"><strong>Certification:</strong></p>\r\n\r\n<figure tabindex="0">\r\n<p><strong><img alt="" src="https://www.arcgis.com/sharing/rest/content/items/ff5ead0883be4b6a881eac5617a7a3f1/resources/spp__1508501353636__w100.png" /> </strong></p>\r\n</figure>\r\n	<p>Look for the complementary YoJo with balanced Napoleon liqueur and mocha flavor.</p>\r\n	\N	1.52	58%	16%	0%	120 ° C; 25 ’; 12 μm	tánico, licor de napoleón, mantequilla de maní, moca, masa	almendras, tabaco, harina, azúcar, mermelada de frutas rojas	yojo_-_9844-choc.png	image/png	233450	2020-02-24 04:53:50.24628	yojo_-_9844.png	image/png	233247	2020-02-24 04:53:50.843737	tannic, napoleon liqueur, peanut butter, mocha, dough	 almonds, tobacco, flour, sugar, red fruit marmalade			f
16	3	14	Cacao Jacawitz	\N	Santa Bárbara, Honduras	15.127028	-88.669944	<p tabindex="0"><strong>Productor:</strong>&nbsp;Cooperativa Agr&iacute;cola Cafetalera San Antonio Limitada<br />\r\nCOAGRICSAL</p>\r\n\r\n<p tabindex="0"><strong>Coordinates:</strong>&nbsp;15&deg;07&#39;37.3&quot;N 88&deg;40&#39;11.8&quot;W</p>\r\n\r\n<p tabindex="0"><strong>Disponibilidad:&nbsp;</strong>~10 MT/a&ntilde;o</p>\r\n\r\n<p tabindex="0"><strong>Contact:&nbsp;</strong><a href="mailto:proyectocacao@coagricsal.hn" target="_blank">proyectocacao@coagricsal.hn</a>,&nbsp;<a href="http://www.coagricsal.hn/" target="_blank">coagricsal.hn</a></p>\r\n\r\n<p tabindex="0"><strong>Tel&eacute;fono:&nbsp;</strong>(504) 2617-6423</p>\r\n\r\n<p tabindex="0"><strong>Certificaciones:</strong></p>\r\n\r\n<p><strong><img alt="" src="https://www.arcgis.com/sharing/rest/content/items/ff5ead0883be4b6a881eac5617a7a3f1/resources/spp__1508501353636__w100.png" /> </strong></p>\r\n	<p><strong>Composici&oacute;n varietal: </strong>mezcla trinitaria (38% lila; 2% blanco)</p>\r\n\r\n<p><strong>Acondicionamiento previo de pulpa:</strong> /</p>\r\n\r\n<p><strong>M&eacute;todo de fermentaci&oacute;n:</strong> cajas tipo cascada (350 kg)</p>\r\n\r\n<p><strong>Pre-secado: </strong>24h (d&iacute;a1 2h sol); 12 cm; aire libre</p>\r\n\r\n<p><strong>Secado: </strong>secado al sol de 9 d&iacute;as; aire libre; madera</p>\r\n	Cacao_Jacawitz_web.jpg	image/jpeg	404606	2020-02-24 00:39:29.496255		2019-07-30 13:08:30.672722	2020-02-24 00:41:32.576204	0	0	0	cacao-jacawitz		<p><img alt="" src="http://cocoaflavormap.cacaomovil.com/ckeditor_assets/pictures/63/content_Harvest_Jacawitz.png" style="width: 300px; height: 300px;" /></p>\r\n	<p>Un cacao hondure&ntilde;o muy complejo con picos din&aacute;micos de sabor y aroma; pasas y fresas verdes se mezclan con notas de tabaco y pino. Con una astringencia de taninos moderada, frutas c&iacute;tricas y hierba de lim&oacute;n aparecen mas adelante dejando un sabor de licor al final.</p>\r\n	3	Santa Bárbara, Honduras		<p tabindex="0"><strong>Varietal composition:</strong>&nbsp;Trinitario blend (38% lilac; 2% white)</p>\r\n\r\n<p tabindex="0"><strong>Pulp pre-conditioning:</strong>&nbsp;/</p>\r\n\r\n<p tabindex="0"><strong>Fermentation method:&nbsp;</strong>Cascade-type boxes (350kg)</p>\r\n\r\n<p tabindex="0"><strong>Pre-drying:&nbsp;</strong>24h (Day1 2h sun); 12 cm; open air</p>\r\n\r\n<p tabindex="0"><strong>Drying:</strong>&nbsp;9-day sun-drying; open air; wood</p>\r\n	<p><img alt="" src="http://cocoaflavormap.cacaomovil.com/ckeditor_assets/pictures/63/content_Harvest_Jacawitz.png" style="width: 300px; height: 300px;" /></p>\r\n	<p tabindex="0"><strong>Producer:</strong>&nbsp;Cooperativa Agr&iacute;cola Cafetalera San Antonio Limitada<br />\r\nCOAGRICSAL</p>\r\n\r\n<p tabindex="0"><strong>Coordinates:</strong>&nbsp;15&deg;07&#39;37.3&quot;N 88&deg;40&#39;11.8&quot;W</p>\r\n\r\n<p tabindex="0"><strong>Availability:&nbsp;</strong>~10 MT/year</p>\r\n\r\n<p tabindex="0"><strong>Contact:&nbsp;</strong><a href="mailto:proyectocacao@coagricsal.hn" target="_blank">proyectocacao@coagricsal.hn</a>,&nbsp;<a href="http://www.coagricsal.hn/" target="_blank">coagricsal.hn</a></p>\r\n\r\n<p tabindex="0"><strong>Phone:&nbsp;</strong>(504) 2617-6423</p>\r\n\r\n<p tabindex="0"><strong>Certification:</strong></p>\r\n\r\n<p><strong><img alt="" src="https://www.arcgis.com/sharing/rest/content/items/ff5ead0883be4b6a881eac5617a7a3f1/resources/spp__1508501353636__w100.png" /> </strong></p>\r\n	<p>A complex Honduran cocoa with dynamic flavor and aroma peaks; raisins and sour strawberries blend with tobacco and pine notes. With mild tannic astringency, the citrus and lemongrass are expressed later leaving a moderate licorice aftertaste.</p>\r\n	\N	1.46	30%	24%	0%	120 ° C; 25 ’; 12 μm	pasas, fresas agrias, tabaco, notas de pino, astringencia tánica suave, cítricos, regaliz	anís, naranja, ciruela seca, final de pimienta negra	cacao_jacawitz_-_9843-choc.png	image/png	239259	2020-02-24 00:39:30.470503	cacao_jacawitz_-_9843.png	image/png	237885	2020-02-24 00:39:31.594073	raisins, sour strawberries,tobacco, pine notes, mild tannic astringency, citrus, licorice	anise, orange, dried plum, black pepper end			f
17	3	15	Cajut	\N	Atlántida, Honduras	15.742417	-86.499667	<p tabindex="0"><strong>Productor:</strong>&nbsp;Cooperativa de Producci&oacute;n Agr&iacute;cola Cacaoteros de Limitada COPRACAJUL&nbsp;</p>\r\n\r\n<p tabindex="0"><strong>Coordenadas:</strong>&nbsp;15&deg;44&#39;32.7&quot;N 86&deg;29&#39;58.8&quot;W</p>\r\n\r\n<p tabindex="0"><strong>DIsponibilidad:&nbsp;</strong>~15 - 20 MT/a&ntilde;o</p>\r\n\r\n<p tabindex="0"><strong>Contacto:&nbsp;</strong><a href="mailto:ccopracajul@yahoo.com" target="_blank">ccopracajul@yahoo.com</a>,&nbsp;<a href="mailto:coprocajul@aprocacaho.com" target="_blank">coprocajul@aprocacaho.com</a></p>\r\n\r\n<p tabindex="0"><strong>Tel&eacute;fono:&nbsp;</strong>(504) 9441-6732</p>\r\n	<p><strong>Composici&oacute;n varietal: </strong>mezcla trinitaria (30% lila; 2% blanco)</p>\r\n\r\n<p><strong>Acondicionamiento previo de pulpa: </strong>/</p>\r\n\r\n<p><strong>M&eacute;todo de fermentaci&oacute;n: </strong>cajas tipo cascada (300 kg)</p>\r\n\r\n<p><strong>Pre-secado: </strong>48h (d&iacute;a1 2h sol; d&iacute;a2 4h sol); 13 cm; aire libre</p>\r\n\r\n<p><strong>Secado: </strong>4 d&iacute;as de secado al sol; aire libre; madera y secado artificial de 4 h; OGO; 50 &deg; C; energ&iacute;a: madera</p>\r\n	cajut.jpg	image/jpeg	94493	2020-02-24 00:48:13.926049		2019-07-30 13:11:29.760301	2020-02-24 00:48:15.369773	0	0	2	cajut			<p>Una mezcla Trinitario con sabor a ciruela y casta&ntilde;a que presenta notas de resina y humo cambia a jalea de kumquat y malvavisco cuando convertido en chocolate. Vino de cerezas efervescente con toque de amargura son las notas que se sienten en la parte posterior de la boca.</p>\r\n	2	Atlántida, Honduras		<p tabindex="0"><strong>Varietal composition:</strong>&nbsp;Trinitario blend (30% lilac; 2% white)</p>\r\n\r\n<p tabindex="0"><strong>Pulp pre-conditioning:</strong>&nbsp;/</p>\r\n\r\n<p tabindex="0"><strong>Fermentation method:&nbsp;</strong>Cascade-type boxes (300kg)</p>\r\n\r\n<p tabindex="0"><strong>Pre-drying:&nbsp;</strong>48h (Day1 2h sun; Day2 4h sun); 13 cm; open air</p>\r\n\r\n<p tabindex="0"><strong>Drying:</strong>&nbsp;4-day sun-drying; open air; wood&amp; 4-h artificial drying; OGO; 50 &deg;C; energy: wood</p>\r\n		<p tabindex="0"><strong>Producer:</strong>&nbsp;Cooperativa de Producci&oacute;n Agr&iacute;cola Cacaoteros de Limitada COPRACAJUL&nbsp;</p>\r\n\r\n<p tabindex="0"><strong>Coordinates:</strong>&nbsp;15&deg;44&#39;32.7&quot;N 86&deg;29&#39;58.8&quot;W</p>\r\n\r\n<p tabindex="0"><strong>Availability:&nbsp;</strong>~15 - 20 MT/year</p>\r\n\r\n<p tabindex="0"><strong>Contact:&nbsp;</strong><a href="mailto:ccopracajul@yahoo.com" target="_blank">ccopracajul@yahoo.com</a>,&nbsp;<a href="mailto:coprocajul@aprocacaho.com" target="_blank">coprocajul@aprocacaho.com</a></p>\r\n\r\n<p tabindex="0"><strong>Phone:&nbsp;</strong>(504) 9441-6732</p>\r\n	<p>A Trinitario blend with plum and chestnut flavor that releases resin and smoky notes changes into kumquat (naranja enana) confit and marshmallow when converted into chocolate. Sparkling cherry wine with slight bitterness are the notes found at the back of the mouth.</p>\r\n	\N	1.05	52%	24%	0%	120 ° C; 25 ’; 12 μm	ciruela, castaño, resina, notas ahumadas, vino espumoso de cereza, jazmín	caramelo de caramelo, naranja / kumquat, avellana, malvavisco	cajut_-_9785-choc.png	image/png	233732	2020-02-24 00:48:14.066267	cajut_-_9785.png	image/png	236250	2020-02-24 00:48:14.677655	 plum, chestnut, resin, smoky notes, sparkling cherry wine, jasmine	caramel toffee, orange/kumquat, hazelnut, marshmallow			f
7	1	2	Carrera Real	\N	Jiquilisco, El Salvador	13.289583	-88.501500	<p tabindex="0"><strong>Productor:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Hacienda San Jos&eacute; de Real de La Carrera</p>\r\n\r\n<p tabindex="0"><strong>Coordenadas:</strong>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;13&deg;17&#39;22.5&quot;N 88&deg;30&#39;05.4&quot;W</p>\r\n\r\n<p tabindex="0"><strong>Disponibilidad:</strong>&nbsp; &nbsp; &nbsp; ~5-10 MT/year</p>\r\n\r\n<p tabindex="0"><strong>Contacto:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a href="mailto:felipe.lagos@ingenioelangel.com.sv" target="_blank">felipe.lagos@ingenioelangel.com.sv</a></p>\r\n\r\n<p tabindex="0"><strong>Tel&eacute;fono:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (503) 2610-5338</p>\r\n	<p tabindex="0">&nbsp;</p>\r\n\r\n<p tabindex="0"><strong>Composici&oacute;n varietal:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Mezcla de acriollado (74% morado; 16% blanco)</p>\r\n\r\n<p tabindex="0"><strong>M&eacute;todo de Fermento:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</strong>Cajas tipo cascada (400kg)</p>\r\n\r\n<p tabindex="0"><strong>Pre-drying:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong>48h;&nbsp;(Day1 2hrs de sol ; Day2 4hrs de sol); 8 cm; al aire libre)</p>\r\n\r\n<p tabindex="0"><strong>Secado:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;6to. d&iacute;a&nbsp;secado al sol; al aire ,libre; madera</p>\r\n	Carrera-Real_web.jpg	image/jpeg	349478	2020-02-24 01:00:12.710496		2019-04-24 21:11:57.421904	2020-02-24 01:06:26.992704	-2	45	0	carrera-real	<p tabindex="0">&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n	<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img src="http://www.arcgis.com/sharing/rest/content/items/ff5ead0883be4b6a881eac5617a7a3f1/resources/Harvest_Carrera_Real__1505922534521__w300.png" style="height: 300px; width: 300px;" /></p>\r\n	<p>Una mezcla acriollada &uacute;nica con car&aacute;cter complejo. El sabor intenso a chocolate relleno de pasas es lindamente cubierto de notas de bals&aacute;mico de frambuesas. La notas c&iacute;tricas est&aacute;n expresadas tanto en el licor como en el chocolate finalizando con una sensaci&oacute;n dulce de licor de naranja.</p>\r\n	3	Jiquilisco, El Salvador		<p tabindex="0">&nbsp;</p>\r\n\r\n<p tabindex="0"><strong>Varietal composition:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Acriollado blend (74% lilac; 16% white)</p>\r\n\r\n<p tabindex="0"><strong>Fermentation method:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</strong>Cascade-type boxes (400kg)</p>\r\n\r\n<p tabindex="0"><strong>Pre-drying:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</strong>48h;&nbsp;(Day1 2h sun; Day2 4h sun); 8 cm; open air)</p>\r\n\r\n<p tabindex="0"><strong>Drying:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;6-day sun-drying; open air; wood</p>\r\n	<p><img src="http://www.arcgis.com/sharing/rest/content/items/ff5ead0883be4b6a881eac5617a7a3f1/resources/Harvest_Carrera_Real__1505922534521__w300.png" style="height: 300px; width: 300px;" /></p>\r\n	<p tabindex="0"><strong>Producer:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Hacienda San Jos&eacute; de Real de La Carrera</p>\r\n\r\n<p tabindex="0"><strong>Coordinates:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 13&deg;17&#39;22.5&quot;N 88&deg;30&#39;05.4&quot;W</p>\r\n\r\n<p tabindex="0"><strong>Availability:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ~5-10 MT/year</p>\r\n\r\n<p tabindex="0"><strong>Contact:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a href="mailto:felipe.lagos@ingenioelangel.com.sv" target="_blank">felipe.lagos@ingenioelangel.com.sv</a></p>\r\n\r\n<p tabindex="0"><strong>Phone:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(503) 2610-5338</p>\r\n	<p>A unique acriollado blend with complex character. The intense raisin-filled chocolate taste is nicely rounded by a raspberry balsamic note. The citric notes are expressed both in liquor and chocolate form giving a sweet finish of orange-flavored liqueur.</p>\r\n	\N	1.18 	 64%	26%	0%	120°C; 25’; 12 μm	Pasas, balsámico de frambuesa, dulce, sabor a naranja, licor, pino.	Dulce de mandarina, ciruela, grosella, nuez, lechosa, gran marnier	carrera_real_-_9781-choc.png	image/png	239745	2020-02-24 01:00:13.294386	carrera_real_-_9781.png	image/png	238003	2020-02-24 01:00:14.673691	Raisins, raspberry balsamic, sweet, orange-flavored liqueur, pine	Sweet mandarine confit, plum, currant, walnut, milky, gran marnier			f
19	3	18	Chopo	\N	Choloma, Honduras	15.562611	-87.919306	<p tabindex="0"><strong>Productor:</strong>&nbsp;Asociaci&oacute;n de Productores Agroforestales de la Cuenca Rio Choloma APACH</p>\r\n\r\n<p tabindex="0"><strong>Coordenadas:</strong>&nbsp;15&deg;33&#39;45.4&quot;N 87&deg;55&#39;09.5&quot;W</p>\r\n\r\n<p tabindex="0"><strong>DIsponibilidad:&nbsp;</strong>~20 MT/a&ntilde;o</p>\r\n\r\n<p tabindex="0"><strong>Correo:&nbsp;</strong><a href="mailto:apach@aprocacaho.com" target="_blank">apach@aprocacaho.com</a></p>\r\n\r\n<p tabindex="0"><strong>Tel&eacute;fono:&nbsp;</strong>(504) 9638-7359</p>\r\n	<p><strong>Composici&oacute;n varietal: </strong>mezcla trinitaria (28% lila; 12% blanco)</p>\r\n\r\n<p><strong>Acondicionamiento previo de pulpa:</strong> /</p>\r\n\r\n<p><strong>M&eacute;todo de fermentaci&oacute;n: </strong>cajas horizontales de madera (360 g)</p>\r\n\r\n<p><strong>Pre-secado: </strong>48h (d&iacute;a1 2h sol; d&iacute;a2 4h sol); 10 cm; t&uacute;nel solar</p>\r\n\r\n<p><strong>Secado: </strong>secado al sol durante 7 d&iacute;as; t&uacute;nel solar madera</p>\r\n	Chopo_web.jpg	image/jpeg	169284	2020-02-24 01:15:00.420402		2019-08-07 17:47:01.982416	2020-02-24 01:17:18.072006	-6	2	0	chopo		<p><img alt="" src="http://cocoaflavormap.cacaomovil.com/ckeditor_assets/pictures/62/content_Harvest_Chopo.png" style="width: 300px; height: 300px;" /></p>\r\n	<p>A trav&eacute;s de un manejo post-cosecha largo, se obtiene este cacao agridulce con sabor intenso a pi&ntilde;&oacute;n. Su car&aacute;cter especial se relaciona al sabor largo de ra&iacute;ces dulces. Con un toque picante, el sabor a chocolate de leche persiste tambi&eacute;n.</p>\r\n	2	Choloma, Honduras		<p tabindex="0"><strong>Varietal composition:</strong>&nbsp;Trinitario blend (28% lilac; 12% white)</p>\r\n\r\n<p tabindex="0"><strong>Pulp pre-conditioning:</strong>&nbsp;/</p>\r\n\r\n<p tabindex="0"><strong>Fermentation method:&nbsp;</strong>Horizontal wooden boxes (360g)</p>\r\n\r\n<p tabindex="0"><strong>Pre-drying:&nbsp;</strong>48h (Day1 2h sun; Day2 4h sun); 10 cm; solar tunnel</p>\r\n\r\n<p tabindex="0"><strong>Drying:</strong>&nbsp;7-day sun-drying; solar tunnel; wood</p>\r\n	<p><img alt="" src="http://cocoaflavormap.cacaomovil.com/ckeditor_assets/pictures/62/content_Harvest_Chopo.png" style="width: 300px; height: 300px;" /></p>\r\n	<p tabindex="0"><strong>Producer:</strong>&nbsp;Asociaci&oacute;n de Productores Agroforestales de la Cuenca Rio Choloma APACH</p>\r\n\r\n<p tabindex="0"><strong>Coordinates:</strong>&nbsp;15&deg;33&#39;45.4&quot;N 87&deg;55&#39;09.5&quot;W</p>\r\n\r\n<p tabindex="0"><strong>Availability:&nbsp;</strong>~20 MT/year</p>\r\n\r\n<p tabindex="0"><strong>Email:&nbsp;</strong><a href="mailto:apach@aprocacaho.com" target="_blank">apach@aprocacaho.com</a></p>\r\n\r\n<p tabindex="0"><strong>Phone:&nbsp;</strong>(504) 9638-7359</p>\r\n	<p>Through a long post-harvest processing we obtain this sweet-sour cocoa with intense pine nut flavor. Its special character is related to the sweet roots&rsquo; long-lasting taste. With a hint of spice, the milky chocolate flavor persists as well.</p>\r\n	\N	1.40	76%	18%	0%	120 ° C; 25 ’; 12 μm	chocolate, lechoso, piñón, toque de especias y limoncillo, raíces dulces	nuez, dulce, chocolate con leche, toques de fruta	chopo_-_9841-choc.png	image/png	234832	2020-02-24 01:15:01.03847	chopo_-_9841.png	image/png	232637	2020-02-24 01:15:02.392834	chocolate, milky, pine nut, hint of spice and lemongrass, sweet roots	nutty, sweet, milk chocolate, hints of fruit			f
13	2	11	SJM	\N	Matiguás, Nicaragua	12.964722	-85.565944	<p tabindex="0"><strong>Productor:</strong>&nbsp;Cooperativa de Servicios Multiples Flor De Pancasan R.L.</p>\r\n\r\n<p tabindex="0"><strong>Coordenadas:</strong>&nbsp;12&deg;57&#39;53.0&quot;N 85&deg;33&#39;57.4&quot;W</p>\r\n\r\n<p tabindex="0"><strong>Disponibilidad:&nbsp;</strong>~60 MT/a&ntilde;o</p>\r\n\r\n<p tabindex="0"><strong>Contacto:&nbsp;</strong><a href="mailto:coop.fdpancasan@gmail.com" target="_blank">coop.fdpancasan@gmail.com</a>&nbsp;</p>\r\n\r\n<p tabindex="0"><strong>Tel&eacute;fono:&nbsp;</strong>(505) 8669-5428&nbsp;</p>\r\n\r\n<p tabindex="0"><strong>Certificaciones:</strong></p>\r\n\r\n<p><strong><img alt="" src="https://www.arcgis.com/sharing/rest/content/items/ff5ead0883be4b6a881eac5617a7a3f1/resources/UTZ__1508510369209__w125.png" /></strong></p>\r\n	<p><strong>Composici&oacute;n varietal: </strong>mezcla trinitaria (8% lila; 2% blanco)</p>\r\n\r\n<p><strong>Acondicionamiento previo de la pulpa: </strong>24 h en bolsas de pl&aacute;stico.</p>\r\n\r\n<p><strong>M&eacute;todo de fermentaci&oacute;n: bandeja </strong>(500 kg)</p>\r\n\r\n<p><strong>Pre-secado: </strong>/</p>\r\n\r\n<p><strong>Secado:</strong> 8 d&iacute;as de secado al sol; t&uacute;nel solar acero perforado</p>\r\n	SJM.jpg	image/jpeg	190826	2020-02-24 02:11:39.089056		2019-07-30 06:11:18.32742	2020-02-24 03:11:12.991392	0	0	0	sjm		<p><img alt="" src="http://cocoaflavormap.cacaomovil.com/ckeditor_assets/pictures/53/content_Harvest_SJM.png" style="width: 250px; height: 250px;" /></p>\r\n	<p>Tiene la suavidad de un vino tinto con un intenso aroma a flores desde el primer momento; este cacao combina una frutalidad suave de melon y melocoton con la acidez de sidra de manzana. Las notas saladas al final est&aacute;n bien mezcladas con notas alcoh&oacute;licas de ginebra arom&aacute;tica a base de hierbas.</p>\r\n\r\n<p><span style="color:#e67e22;"><strong>Ganador del Primer Lugar en la competencia nacional COEX Nicaragua 2019</strong></span></p>\r\n	1	Matiguás, Nicaragua		<p tabindex="0"><strong>Varietal composition:</strong>&nbsp;Trinitario blend (8% lilac; 2% white)</p>\r\n\r\n<p tabindex="0"><strong>Pulp pre-conditioning:</strong>&nbsp;24h in plastic bags</p>\r\n\r\n<p tabindex="0"><strong>Fermentation method:&nbsp;</strong>Tray (500 kg)</p>\r\n\r\n<p tabindex="0"><strong>Pre-drying:&nbsp;</strong>/</p>\r\n\r\n<p tabindex="0"><strong>Drying:</strong>&nbsp;8-day sun-drying; solar tunnel; perforated steel</p>\r\n	<p><img alt="" src="http://cocoaflavormap.cacaomovil.com/ckeditor_assets/pictures/53/content_Harvest_SJM.png" style="width: 250px; height: 250px;" /></p>\r\n	<p tabindex="0"><strong>Producer:</strong>&nbsp;Cooperativa de Servicios Multiples Flor De Pancasan R.L.</p>\r\n\r\n<p tabindex="0"><strong>Coordinates:</strong>&nbsp;12&deg;57&#39;53.0&quot;N 85&deg;33&#39;57.4&quot;W</p>\r\n\r\n<p tabindex="0"><strong>Availability:&nbsp;</strong>~60 MT/year</p>\r\n\r\n<p tabindex="0"><strong>Contact:&nbsp;</strong><a href="mailto:coop.fdpancasan@gmail.com" target="_blank">coop.fdpancasan@gmail.com</a>&nbsp;</p>\r\n\r\n<p tabindex="0"><strong>Phone:&nbsp;</strong>(505) 8669-5428&nbsp;</p>\r\n\r\n<p tabindex="0"><strong>Certification:</strong></p>\r\n\r\n<p><strong><img alt="" src="https://www.arcgis.com/sharing/rest/content/items/ff5ead0883be4b6a881eac5617a7a3f1/resources/UTZ__1508510369209__w125.png" /></strong></p>\r\n	<p>It has the smoothness of a red wine with an intense floral bouquet from the first moment; this cocoa combines sweet fruitiness of melon and peach with the acidity of apple cider. The salty notes at the finish are nicely mixed with alcoholic notes of aromatic herbal genever.</p>\r\n\r\n<pre data-placeholder="Traducción" dir="ltr" id="tw-target-text">\r\n<span style="color:#e67e22;"><strong><span style="font-family:Arial,Helvetica,sans-serif;">First Place winner in the national competition COEX Nicaragua 2019</span></strong></span></pre>\r\n	grano-de-cacao-saco.jpg	1.36	38%	22%	0%	120 ° C; 25 ’; 12 μm	bouquet floral de vino tinto, melocotón, melón, sidra de manzana, genero de hierbas	vino moscatel, regaliz, uvas dulces, clavo, cereza, aromático	sjm_-_9860-choc.png	image/png	234050	2020-02-24 02:11:39.333731	sjm_-_9860.png	image/png	231928	2020-02-24 02:11:40.136115	floral bouquet of red wine, peach, melon, apple cider, herbal genever	muscat wine, licorice, sweet grapes, clove, cherry, aromatic	<p style="text-align: center;"><span style="font-family:Arial,Helvetica,sans-serif;"><span style="font-size:12px;"><strong>Competencia Nacional de Cacao: </strong>Nicaragua 2019</span></span></p>\r\n	<p style="text-align: center;"><span style="font-family:Arial,Helvetica,sans-serif;"><span style="font-size:12px;"><strong>National Competition of Cocoa: </strong>Nicaragua 2019</span></span></p>\r\n	t
8	2	3	V’vaya	\N	Waslala, Nicaragua	13.343000	-85.380556	<p><strong>Productor: </strong>Coop. de Servicio Agroforestal y de Comercializaci&oacute;n de Cacao CACAONICA R.L.</p>\r\n\r\n<p><strong>Disponibilidad: </strong>50 MT / a&ntilde;o (Apr&oacute;x.)</p>\r\n\r\n<p><strong>Contacto: </strong>cacaonica.organico@yahoo.com, cacaonica.com.ni</p>\r\n\r\n<p><strong>Tel&eacute;fono: </strong>(505) 5768-8495</p>\r\n\r\n<p><strong>Certificaci&oacute;n: </strong>S&iacute;mbolo de Peque&ntilde;os Productores de Comercio Justo (SPP)</p>\r\n	<p tabindex="0"><strong>Composici&oacute;n varietal: </strong>mezcla trinitaria (10% lila; 2% blanco)</p>\r\n\r\n<p><strong>M&eacute;todo de fermentaci&oacute;n: </strong>cajas horizontales de madera (1.200 kg)</p>\r\n\r\n<p><strong>Pre-secado: </strong>48h; 10 cm; bajo s&aacute;banas transparentes</p>\r\n\r\n<p><strong>Secado: </strong>6 d&iacute;as de secado al sol; t&uacute;nel solar acero perforado</p>\r\n	vvaya_web.jpg	image/jpeg	117114	2020-02-24 02:32:19.027485		2019-04-24 21:11:57.426066	2020-02-24 03:09:42.211484	-30	-12	0	ivaya		<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img alt="" src="https://www.arcgis.com/sharing/rest/content/items/ff5ead0883be4b6a881eac5617a7a3f1/resources/Harvest_lVaya__1506433465390__w300.png" style="width: 300px; height: 300px;" /></strong></p>\r\n	<p>Disponible en vol&uacute;menes grandes, esta mezcla Trinitario sale en 2 versiones, expresando el impacto de un solo par&aacute;metro post-cosecha: duraci&oacute;n de secado. Cuando este cacao se procesa durante la temporada seca (V&rsquo;Vaya) se siente una frutalidad intensa de frutas de bosque con notas c&iacute;tricas y taninos fuertes, mientras secado alargado (I&rsquo;Vaya) permite permite sabores a base de nuez y hierbas de an&iacute;s y t&eacute; (earl grey) con frutas maduras y notas de madera.&nbsp;</p>\r\n	2	Waslala, Nicaragua		<p tabindex="0"><strong>Varietal composition:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Trinitario blend (10% lilac; 2% white)</p>\r\n\r\n<p tabindex="0"><strong>Fermentation method:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</strong>Horizontal wooden boxes (1,200kg)</p>\r\n\r\n<p tabindex="0"><strong>Pre-drying:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</strong>48h; 10 cm;&nbsp;under transparent sheets</p>\r\n\r\n<p tabindex="0"><strong>Drying:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</strong>&nbsp; 6-day sun-drying; solar tunnel; perforated steel</p>\r\n	<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img alt="" src="https://www.arcgis.com/sharing/rest/content/items/ff5ead0883be4b6a881eac5617a7a3f1/resources/Harvest_lVaya__1506433465390__w300.png" style="width: 300px; height: 300px;" /></strong></p>\r\n	<p tabindex="0"><strong>Producer:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Coop.&nbsp;de Servicio Agroforestal y de Comercializaci&oacute;n de Cacao CACAONICA R.L.</p>\r\n\r\n<p tabindex="0"><strong>Availability:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</strong>50 MT/year (Apr&oacute;x.)</p>\r\n\r\n<p tabindex="0"><strong>Contact:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong><a href="mailto:cacaonica.organico@yahoo.com" target="_blank">cacaonica.organico@yahoo.com</a>,&nbsp;<a href="http://cacaonica.com.ni/" target="_blank">cacaonica.com.ni</a></p>\r\n\r\n<p tabindex="0"><strong>Phone:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</strong>(505) 5768-8495</p>\r\n\r\n<p tabindex="0"><strong>Certification:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong>S&iacute;mbolo de Peque&ntilde;os Productores de Comercio Justo (SPP)<strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</strong></p>\r\n	<p>Available in big volumes, this organic Trinitario blend comes in 2 versions, expressing the impact of a single different post-harvest parameter: drying duration. When this cocoa is processed during the dry season (V&rsquo;Vaya) it releases sharp fruitiness of forest berries with citric notes and powerful tannins, while long drying (I&rsquo;Vaya) allows for nutty and herbal flavors of anise and earl grey tea with mature berry and woody notes.&nbsp;</p>\r\n	kindpng_756513.png	1.40	48%	22%	0%	120 ° C; 25 ’; 12 μm	bayas del bosque con notas cítricas, taninos, piña	vino tinto, azúcar de coco, naranja, pasas, cereza, toques herbales.	v_vaya_-_9452-choc.png	image/png	234607	2020-02-24 02:32:19.290558	v_vaya_-_9452.png	image/png	234636	2020-02-24 02:32:20.886024	forest berries with citric notes, tannins, pineapple	red wine, coconut sugar, orange, raisins, cherry, herbal hints 	<p style="text-align: center;"><span style="font-size:12px;"><span style="font-family:Arial,Helvetica,sans-serif;"><strong>50 Mejores del Mundo: </strong>Cacao&nbsp;Excelencia 2017<br />\r\n<strong>Competencia Nacional de Cacao:</strong>&nbsp;Nicaragua&nbsp;2017</span></span></p>\r\n\r\n<p style="text-align: center;">&nbsp;</p>\r\n	<p style="text-align: center;"><span style="font-size:12px;"><span style="font-family:Arial,Helvetica,sans-serif;"><strong>50 Best in the World: </strong>Cocoa of Excellence&nbsp;2017<br />\r\n<strong>National Competition of CocoaCompeteC:</strong>&nbsp;Nicaragua&nbsp;2017</span></span></p>\r\n	t
23	2	20	Jeru Antiguo	\N	RAAS, Nicaragua	13.725500	-84.939722	<p tabindex="0"><strong>Productor:</strong>&nbsp;Uni&oacute;n de Cooperativas Agropecuarias Ahmed Campos Corea R.L. (UCA)</p>\r\n\r\n<p tabindex="0"><strong>Coordenadas:</strong>&nbsp;11&deg;41&#39;18.8&quot;N 84&deg;27&#39;23.3&quot;W</p>\r\n\r\n<p tabindex="0"><strong>Disponibilidad:&nbsp;</strong>~12 - 15 MT/year</p>\r\n\r\n<p tabindex="0"><strong>Contacto:&nbsp;</strong><a href="mailto:ucahmedcampo@yahoo.com" target="_blank">ucahmedcampo@yahoo.com</a></p>\r\n\r\n<p tabindex="0"><strong>Tel&eacute;fono:&nbsp;</strong>(505) 8435-9538</p>\r\n	<p><strong>Composici&oacute;n varietal: </strong>mezcla trinitaria (28% lila; 14% blanco)</p>\r\n\r\n<p><strong>Acondicionamiento previo de pulpa: </strong>/</p>\r\n\r\n<p><strong>M&eacute;todo de fermentaci&oacute;n: </strong>bandeja (500 kg)</p>\r\n\r\n<p><strong>Pre-secado: </strong>/</p>\r\n\r\n<p><strong>Secado: </strong>8 d&iacute;as de secado al sol; t&uacute;nel solar;&nbsp;acero perforado</p>\r\n	Jeru_Antiguo_web.jpg	image/jpeg	141497	2020-02-24 03:30:35.823513		2019-08-08 21:16:08.560423	2020-02-24 03:30:39.111033	3	-6	1	jeru-antinguo		<p><img alt="" src="http://cocoaflavormap.cacaomovil.com/ckeditor_assets/pictures/71/content_Harvest_JeruAntiguo.png" style="width: 300px; height: 300px;" /></p>\r\n	<p>Una fermentaci&oacute;n en cajillas Rohan con cacao de gen&eacute;tica vieja de la zona de Nuvea Guinea desarrolla un ramo de aromas y sabores; un cacao balanceado con notas maravillosas de vainilla y una acidez suave de bals&aacute;mico de frambuesa. Su car&aacute;cter din&aacute;mico expresa despu&eacute;s sabor a almendras caramelizadas con la dulzura de mostaza de miel terminando a sabor de ron anejo/whiskey Jack Daniels.</p>\r\n	\N	RAAS, Nicaragua		<p tabindex="0"><strong>Varietal composition:</strong>&nbsp;Trinitario blend (28% lilac; 14% white)</p>\r\n\r\n<p tabindex="0"><strong>Pulp pre-conditioning:</strong>&nbsp;/</p>\r\n\r\n<p tabindex="0"><strong>Fermentation method:&nbsp;</strong>Tray (500 kg)</p>\r\n\r\n<p tabindex="0"><strong>Pre-drying:&nbsp;</strong>/</p>\r\n\r\n<p tabindex="0"><strong>Drying:</strong>&nbsp;8-day sun-drying; solar tunnel; perforated steel</p>\r\n	<p><img alt="" src="http://cocoaflavormap.cacaomovil.com/ckeditor_assets/pictures/71/content_Harvest_JeruAntiguo.png" style="width: 300px; height: 300px;" /></p>\r\n	<p tabindex="0"><strong>Producer:</strong>&nbsp;Uni&oacute;n de Cooperativas Agropecuarias Ahmed Campos Corea R.L. (UCA)</p>\r\n\r\n<p tabindex="0"><strong>Coordinates:</strong>&nbsp;11&deg;41&#39;18.8&quot;N 84&deg;27&#39;23.3&quot;W</p>\r\n\r\n<p tabindex="0"><strong>Availability:&nbsp;</strong>~12 - 15 MT/year</p>\r\n\r\n<p tabindex="0"><strong>Contact:&nbsp;</strong><a href="mailto:ucahmedcampo@yahoo.com" target="_blank">ucahmedcampo@yahoo.com</a></p>\r\n\r\n<p tabindex="0"><strong>Phone:&nbsp;</strong>(505) 8435-9538</p>\r\n	<p>A tray fermentation of a blend of old genetics from the region of Nueva Guinea brings out a bouquet of aromas and flavors; a cocoa with a balanced profile with beautiful notes of vanilla and a soft raspberry balsamic acidity. Its dynamic character expresses afterwards strong nutty flavor of caramelized almonds with the sweetness of honey mustard and with an end of aged rum/Jack Daniels whiskey.</p>\r\n	\N	1.21	70%	20%	0%	120 ° C; 25 ’; 12 μm	vainilla, acidez balsámica de frambuesa suave, almendras caramelizadas, mostaza con miel, ron añejo / whisky Jack Daniels	melocotón, taninos, caramelo, dátiles dulces, bayas rojas	jeru_antiguo_-_9858-choc.png	image/png	238368	2020-02-24 03:30:36.362464	jeru_antiguo_-_9858.png	image/png	236934	2020-02-24 03:30:37.746849	vanilla, soft raspberry balsamic acidity, caramelized almonds, honey mustard, aged rum/Jack Daniels whiskey	peach, tannins, caramel, sweet date, red berries			f
3	1	5	Eduzac	\N	Berlín, El Salvador	13.493194	-88.526333	<p tabindex="0"><strong>Productor:</strong><span style="color:#d35400;">&nbsp; </span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Finca la Concepci&oacute;n</p>\r\n\r\n<p tabindex="0"><strong>Coordenadas:</strong><span style="color:#16a085;">&nbsp; </span>&nbsp; &nbsp; &nbsp; &nbsp;13&deg;29&#39;35.5&quot;N 88&deg;31&#39;34.8&quot;W</p>\r\n\r\n<p tabindex="0"><strong>Disponibilidad:</strong>&nbsp; &nbsp; &nbsp; &nbsp;~1-1.5 MT/year</p>\r\n\r\n<p tabindex="0"><strong>Contacto:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a href="mailto:ezacapa@hotmail.com" target="_blank">ezacapa@hotmail.com</a></p>\r\n\r\n<p tabindex="0"><strong>Tel&eacute;fono:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (503) 7841-7870</p>\r\n	<p tabindex="0">&nbsp;</p>\r\n\r\n<p><strong>Composici&oacute;n Varietal: </strong>mezcla trinitaria (16% lila; 2% blanco)</p>\r\n\r\n<p><strong>Acondicionamiento previo a la pulpa: </strong>24 horas; drenaje de pulpa</p>\r\n\r\n<p><strong>M&eacute;todo de fermentaci&oacute;n: </strong>cajas de madera horizontales (400 kg)</p>\r\n\r\n<p><strong>Secado: </strong>secado al sol durante 20 d&iacute;as; aire libre; acero perforado</p>\r\n	IMG_EDUZAC.jpg	image/jpeg	315497	2020-02-24 01:44:18.437604		2019-04-24 21:11:57.405203	2020-02-24 03:10:11.541279	0	30	0	eduzac			<p>Una mezcla de Trinitarios procesada bajo un protocolo post-cosecha personalizado. Su car&aacute;cter supremo se relaciona a las notas florales intensas de n&eacute;ctar de flores, jazm&iacute;n, y flores de naranja. Las hierbas secas sazonan su cuerpo dulce chocolatoso y almendrado dando un retrogusto largo y agradable.</p>\r\n	3	Berlín, El Salvador		<p tabindex="0"><strong>Varietal composition:</strong>&nbsp; &nbsp;<span style="color:#16a085;"> &nbsp;</span> &nbsp; &nbsp;Trinitario blend (16% lilac; 2% white)</p>\r\n\r\n<p tabindex="0"><strong>Pulp pre-conditioning:</strong>&nbsp; &nbsp; &nbsp; &nbsp; 24h; pulp drainage</p>\r\n\r\n<p tabindex="0"><strong>Fermentation method:&nbsp;<span style="color:#16a085;"> </span>&nbsp; &nbsp; &nbsp; </strong>Horizontal wooden boxes (400kg)</p>\r\n\r\n<p tabindex="0"><strong>Drying:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 20-day sun-drying; open air; perforated steel</p>\r\n		<p tabindex="0"><strong>Producer:</strong><span style="color:#d35400;">&nbsp; </span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Finca la Concepci&oacute;n</p>\r\n\r\n<p tabindex="0"><strong>Coordinates:</strong><span style="color:#16a085;">&nbsp; </span>&nbsp; &nbsp; &nbsp; &nbsp;13&deg;29&#39;35.5&quot;N 88&deg;31&#39;34.8&quot;W</p>\r\n\r\n<p tabindex="0"><strong>Availability:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;~1-1.5 MT/year</p>\r\n\r\n<p tabindex="0"><strong>Contact:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a href="mailto:ezacapa@hotmail.com" target="_blank">ezacapa@hotmail.com</a></p>\r\n\r\n<p tabindex="0"><strong>Phone:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (503) 7841-7870</p>\r\n	<p>A Trinitario blend processed under a tailored post-harvest protocol. Its supreme character lays on the intense floral notes of nectar, jasmine, and orange blossoms. The dry herb notes spice up the nutty, honey sweet chocolaty body leaving a pleasant long aftertaste.</p>\r\n	Granos.jpg	0.96	92%	2%	0%	120 ° C; 25 ’; 12 μm	néctar, jazmín, azahar, notas de hierba seca, nuez, miel	brownie, cereales, flores, pasta de fresa, acidez equilibrada	eduzac_-_9782-choc.png	image/png	238472	2020-02-24 01:44:18.860677	eduzac_-_9782.png	image/png	238416	2020-02-24 01:44:19.537229	nectar, jasmine, orange blossoms, dry herb notes, nutty, honey​	brownie, cereals, blossoms, strawberry paste, balancedn acidity	<p style="text-align: center;"><font face="Arial, Helvetica, sans-serif"><span style="font-size: 12px;"><strong>50 Mejores del Mundo:</strong> Cacao de la Excelencia<br />\r\n<strong>Competencia Nacional de Cacao: </strong>El Salvador 2017</span></font></p>\r\n\r\n<p style="text-align: center;">&nbsp;</p>\r\n<br>\r\n<br>\r\n	<p style="text-align: center;"><font face="Arial, Helvetica, sans-serif"><span style="font-size:12px"><strong>50 Best of the World:</strong> Cocoa&nbsp;of&nbsp;Excellence<br />\r\n<strong>National Competition of Cocoa: </strong>El Salvador 2017</span></font></p>\r\n\r\n<p style="text-align: center;">&nbsp;</p>\r\n<br>\r\n<br>\r\n	t
9	2	9	Kubaly	\N	Waslala, Nicaragua	13.333000	-85.370556	<p tabindex="0">&nbsp;</p>\r\n\r\n<p tabindex="0"><strong>Productor:</strong>&nbsp;Cooperativa de Servicio Agroforestal y de Comercializaci&oacute;n De Cacao CACAONICA R.L.</p>\r\n\r\n<p tabindex="0"><strong>Coordenadas:</strong>&nbsp;13&deg;19&#39;58.8&quot;N 85&deg;22&#39;14.0&quot;W</p>\r\n\r\n<p tabindex="0"><strong>Disponibildad:&nbsp;</strong>~20 MT/year</p>\r\n\r\n<p tabindex="0"><strong>Contacto:&nbsp;</strong><a href="mailto:cacaonica.organico@yahoo.com" target="_blank">cacaonica.organico@yahoo.com</a>,&nbsp;<a href="http://cacaonica.com.ni/" target="_blank">cacaonica.com.ni</a></p>\r\n\r\n<p tabindex="0"><strong>Tel&eacute;fono:&nbsp;</strong>(505) 5768-8495</p>\r\n\r\n<p tabindex="0"><strong>Certificaci&oacute;n: </strong>Sello peque&ntilde;os productores de comercio justo</p>\r\n\r\n<p tabindex="0"><strong><img alt="" src="https://www.arcgis.com/sharing/rest/content/items/ff5ead0883be4b6a881eac5617a7a3f1/resources/spp__1508501353636__w100.png" /></strong></p>\r\n	<p tabindex="0">&nbsp;</p>\r\n\r\n<p><strong>Composici&oacute;n varietal: </strong>mezcla trinitaria (22% lila; 6% blanco)</p>\r\n\r\n<p><strong>Acondicionamiento previo de pulpa:</strong> /</p>\r\n\r\n<p><strong>M&eacute;todo de fermentaci&oacute;n:</strong> cajas horizontales de madera (1.200 kg)</p>\r\n\r\n<p><strong>Pre-secado: </strong>48h; 13 cm; bajo s&aacute;banas transparentes</p>\r\n\r\n<p><strong>Secado:</strong> 8 d&iacute;as de secado al sol; t&uacute;nel solar madera</p>\r\n	RS20216_IMG_1309-scr.jpg	image/jpeg	195125	2020-02-24 03:44:40.310318		2019-06-26 22:35:51.633849	2020-02-24 03:47:35.769761	-23	5	0	kubaly		<p><img alt="" src="http://cocoaflavormap.cacaomovil.com/ckeditor_assets/pictures/56/content_Harvest_KUBALY.png" style="width: 300px; height: 300px;" /></p>\r\n	<p tabindex="0">Es una experiencia picante</p>\r\n	1	Waslala, Nicaragua		<p tabindex="0">&nbsp;</p>\r\n\r\n<p tabindex="0"><strong>Varietal composition:</strong>&nbsp;Trinitario blend (22% lilac; 6% white)</p>\r\n\r\n<p tabindex="0"><strong>Pulp pre-conditioning:</strong>&nbsp;/</p>\r\n\r\n<p tabindex="0"><strong>Fermentation method:&nbsp;</strong>Horizontal wooden boxes (1,200kg)</p>\r\n\r\n<p tabindex="0"><strong>Pre-drying:&nbsp;</strong>48h; 13 cm; under transparent sheets</p>\r\n\r\n<p tabindex="0"><strong>Drying:</strong>&nbsp;8-day sun-drying; solar tunnel; wood</p>\r\n	<p><img alt="" src="http://cocoaflavormap.cacaomovil.com/ckeditor_assets/pictures/56/content_Harvest_KUBALY.png" style="width: 300px; height: 300px;" /></p>\r\n	<p tabindex="0">&nbsp;</p>\r\n\r\n<p tabindex="0"><strong>Producer:</strong>&nbsp;Cooperativa de Servicio Agroforestal y de Comercializaci&oacute;n De Cacao CACAONICA R.L.</p>\r\n\r\n<p tabindex="0"><strong>Coordinates:</strong>&nbsp;13&deg;19&#39;58.8&quot;N 85&deg;22&#39;14.0&quot;W</p>\r\n\r\n<p tabindex="0"><strong>Availability:&nbsp;</strong>~20 MT/year</p>\r\n\r\n<p tabindex="0"><strong>Contact:&nbsp;</strong><a href="mailto:cacaonica.organico@yahoo.com" target="_blank">cacaonica.organico@yahoo.com</a>,&nbsp;<a href="http://cacaonica.com.ni/" target="_blank">cacaonica.com.ni</a></p>\r\n\r\n<p tabindex="0"><strong>Phone:&nbsp;</strong>(505) 5768-8495</p>\r\n\r\n<p tabindex="0"><strong>Certification: </strong>Sello peque&ntilde;os productores de comercio justo</p>\r\n\r\n<p tabindex="0"><strong><img alt="" src="https://www.arcgis.com/sharing/rest/content/items/ff5ead0883be4b6a881eac5617a7a3f1/resources/spp__1508501353636__w100.png" /></strong></p>\r\n	<p tabindex="0">It&acute;s a spicy experience</p>\r\n	\N	1.10	72%	20%	0 - 2 %	120 ° C; 25 ’; 12 μm	nuez, pimienta, cereales, notas de frutos secos, amaderado	chocolate, cacao en polvo instantáneo, notas de frutos secos marrones, vainilla	kubaly_-_9454-choc.png	image/png	234770	2020-02-24 03:44:40.612523	kubaly_-_9454.png	image/png	234668	2020-02-24 03:44:41.957618	 nutty, pepper, cereals, dried fruit hints, woody	chocomouse, instant cocoa powder, brown dried fruit hints, vanilla			f
22	3	16	Selva Yoro	\N	Yoro, Honduras	15.291250	-87.702083	<p style="text-align:start; text-indent:0px; -webkit-text-stroke-width:0px" tabindex="0"><span style="font-size:14px;"><span style="font-family:Arial,Helvetica,sans-serif;"><span style="box-sizing:border-box"><span style="color:#000000"><span style="font-style:normal"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-weight:400"><span style="letter-spacing:normal"><span style="orphans:2"><span style="text-transform:none"><span style="white-space:normal"><span style="widows:2"><span style="word-spacing:0px"><span style="background-color:#ffffff"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><span style="outline:none"><strong style="box-sizing:border-box; font-family:&quot;trebuchet ms&quot;, helvetica, sans-serif; font-weight:bold"><span style="box-sizing:border-box"><span style="color:#daa520"><span style="outline:none">Productor:</span></span></span></strong>&nbsp;<font color="#696969"><font style="box-sizing: border-box;">Asociaci&oacute;n de Producci&oacute;n Agr&iacute;cola &quot;Cacheteros de Guaymas&quot; Limitada APROCAGUAL</font></font></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p style="text-align:start; text-indent:0px; -webkit-text-stroke-width:0px" tabindex="0"><span style="font-size:14px;"><span style="font-family:Arial,Helvetica,sans-serif;"><span style="box-sizing:border-box"><span style="color:#000000"><span style="font-style:normal"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-weight:400"><span style="letter-spacing:normal"><span style="orphans:2"><span style="text-transform:none"><span style="white-space:normal"><span style="widows:2"><span style="word-spacing:0px"><span style="background-color:#ffffff"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><strong style="box-sizing:border-box; font-family:&quot;trebuchet ms&quot;, helvetica, sans-serif; font-weight:bold"><span style="box-sizing:border-box"><span style="color:#daa520">Coordinenadas:</span></span></strong>&nbsp;<span style="box-sizing:border-box"><span style="color:#696969">15&deg;17&#39;28.5&quot;N 87&deg;42&#39;07.5&quot;W</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p style="text-align:start; text-indent:0px; -webkit-text-stroke-width:0px" tabindex="0"><span style="font-size:14px;"><span style="font-family:Arial,Helvetica,sans-serif;"><span style="box-sizing:border-box"><span style="color:#000000"><span style="font-style:normal"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-weight:400"><span style="letter-spacing:normal"><span style="orphans:2"><span style="text-transform:none"><span style="white-space:normal"><span style="widows:2"><span style="word-spacing:0px"><span style="background-color:#ffffff"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><strong style="box-sizing:border-box; font-family:&quot;trebuchet ms&quot;, helvetica, sans-serif; font-weight:bold"><span style="box-sizing:border-box"><span style="color:#daa520">Disponibilidad:</span></span>&nbsp;</strong><span style="box-sizing:border-box"><span style="color:#696969">~0.5 - 1.0 MT/a&ntilde;o</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p style="text-align:start; text-indent:0px; -webkit-text-stroke-width:0px" tabindex="0"><span style="font-size:14px;"><span style="font-family:Arial,Helvetica,sans-serif;"><span style="box-sizing:border-box"><span style="color:#000000"><span style="font-style:normal"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-weight:400"><span style="letter-spacing:normal"><span style="orphans:2"><span style="text-transform:none"><span style="white-space:normal"><span style="widows:2"><span style="word-spacing:0px"><span style="background-color:#ffffff"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><strong style="box-sizing:border-box; font-family:&quot;trebuchet ms&quot;, helvetica, sans-serif; font-weight:bold"><span style="box-sizing:border-box"><span style="color:#daa520">Contacto:</span></span>&nbsp;</strong><span style="box-sizing:border-box"><span style="color:#696969"><a href="mailto:aprocagual.guaymas@gmail.com" style="box-sizing:border-box; color:#555555; font-weight:700; text-decoration:underline; cursor:pointer" target="_blank">aprocagual.guaymas@gmail.com</a></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p style="text-align:start; text-indent:0px; -webkit-text-stroke-width:0px" tabindex="0"><span style="font-size:14px;"><span style="font-family:Arial,Helvetica,sans-serif;"><span style="box-sizing:border-box"><span style="color:#000000"><span style="font-style:normal"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-weight:400"><span style="letter-spacing:normal"><span style="orphans:2"><span style="text-transform:none"><span style="white-space:normal"><span style="widows:2"><span style="word-spacing:0px"><span style="background-color:#ffffff"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><strong style="box-sizing:border-box; font-family:&quot;trebuchet ms&quot;, helvetica, sans-serif; font-weight:bold"><span style="box-sizing:border-box"><span style="color:#daa520">Tel&eacute;fono:</span></span>&nbsp;</strong><span style="box-sizing:border-box"><span style="color:#696969">(504) 9708-4015</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n	<p><strong>Composici&oacute;n varietal: </strong>mezcla trinitaria (30% lila; 2% blanco)</p>\r\n\r\n<p><strong>Acondicionamiento previo de pulpa:</strong> /</p>\r\n\r\n<p><strong>M&eacute;todo de fermentaci&oacute;n: </strong>cesta de mimbre de la tradici&oacute;n maya en t&uacute;nel solar (50 kg)</p>\r\n\r\n<p><strong>Pre-secado: </strong>72h; 8 cm; t&uacute;nel solar</p>\r\n\r\n<p><strong>Secado: </strong>15 d&iacute;as de secado al sol; t&uacute;nel solar petate</p>\r\n	Selva_Yoro_-_copia.jpg	image/jpeg	294324	2020-02-24 04:40:28.277769		2019-08-07 22:58:29.519033	2020-02-24 04:41:36.002964	2	-11	2	selva-yoro		<p><img alt="" src="http://cocoaflavormap.cacaomovil.com/ckeditor_assets/pictures/69/content_Harvest_Selva-Caribe.png" style="width: 300px; height: 300px;" /></p>\r\n	<p>Los esp&iacute;ritu Maya se juntan y transforman el cacao crudo a trav&eacute;s de una metodolog&iacute;a tradicional; un proceso muy especial durante el cual los granos deben absorber los l&iacute;quidos de la baba en lugar de dejarlos drenar. Un proceso lento con supervisi&oacute;n cercana en un t&uacute;nel solar cerrado da un cacao arom&aacute;tico con notas intensas de flores del valle y tomillo, leche de coco/almendra y aceite de ajonjol&iacute;.</p>\r\n	\N	Yoro, Honduras		<p tabindex="0"><strong>Varietal composition:</strong>&nbsp;Trinitario blend (30% lilac; 2% white)</p>\r\n\r\n<p tabindex="0"><strong>Pulp pre-conditioning:</strong>&nbsp;/</p>\r\n\r\n<p tabindex="0"><strong>Fermentation method:&nbsp;</strong>Mayan Tradition wicker basket in solar tunnel (50kg)</p>\r\n\r\n<p tabindex="0"><strong>Pre-drying:&nbsp;</strong>72h; 8 cm; solar tunnel</p>\r\n\r\n<p tabindex="0"><strong>Drying:</strong>&nbsp;15-day sun-drying; solar tunnel; petate</p>\r\n	<p><img alt="" src="http://cocoaflavormap.cacaomovil.com/ckeditor_assets/pictures/69/content_Harvest_Selva-Caribe.png" style="width: 300px; height: 300px;" /></p>\r\n	<p style="text-align:start; text-indent:0px; -webkit-text-stroke-width:0px" tabindex="0"><span style="font-size:14px;"><span style="font-family:Arial,Helvetica,sans-serif;"><span style="box-sizing:border-box"><span style="color:#000000"><span style="font-style:normal"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-weight:400"><span style="letter-spacing:normal"><span style="orphans:2"><span style="text-transform:none"><span style="white-space:normal"><span style="widows:2"><span style="word-spacing:0px"><span style="background-color:#ffffff"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><span style="outline:none"><strong style="box-sizing:border-box; font-family:&quot;trebuchet ms&quot;, helvetica, sans-serif; font-weight:bold"><span style="box-sizing:border-box"><span style="color:#daa520"><span style="outline:none">Producer:</span></span></span></strong>&nbsp;<font color="#696969"><font style="box-sizing: border-box;">Asociaci&oacute;n de Producci&oacute;n Agr&iacute;cola &quot;Cacheteros de Guaymas&quot; Limitada APROCAGUAL</font></font></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p style="text-align:start; text-indent:0px; -webkit-text-stroke-width:0px" tabindex="0"><span style="font-size:14px;"><span style="font-family:Arial,Helvetica,sans-serif;"><span style="box-sizing:border-box"><span style="color:#000000"><span style="font-style:normal"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-weight:400"><span style="letter-spacing:normal"><span style="orphans:2"><span style="text-transform:none"><span style="white-space:normal"><span style="widows:2"><span style="word-spacing:0px"><span style="background-color:#ffffff"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><strong style="box-sizing:border-box; font-family:&quot;trebuchet ms&quot;, helvetica, sans-serif; font-weight:bold"><span style="box-sizing:border-box"><span style="color:#daa520">Coordinates:</span></span></strong>&nbsp;<span style="box-sizing:border-box"><span style="color:#696969">15&deg;17&#39;28.5&quot;N 87&deg;42&#39;07.5&quot;W</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p style="text-align:start; text-indent:0px; -webkit-text-stroke-width:0px" tabindex="0"><span style="font-size:14px;"><span style="font-family:Arial,Helvetica,sans-serif;"><span style="box-sizing:border-box"><span style="color:#000000"><span style="font-style:normal"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-weight:400"><span style="letter-spacing:normal"><span style="orphans:2"><span style="text-transform:none"><span style="white-space:normal"><span style="widows:2"><span style="word-spacing:0px"><span style="background-color:#ffffff"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><strong style="box-sizing:border-box; font-family:&quot;trebuchet ms&quot;, helvetica, sans-serif; font-weight:bold"><span style="box-sizing:border-box"><span style="color:#daa520">Availability:</span></span>&nbsp;</strong><span style="box-sizing:border-box"><span style="color:#696969">~0.5 - 1.0 MT/year</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p style="text-align:start; text-indent:0px; -webkit-text-stroke-width:0px" tabindex="0"><span style="font-size:14px;"><span style="font-family:Arial,Helvetica,sans-serif;"><span style="box-sizing:border-box"><span style="color:#000000"><span style="font-style:normal"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-weight:400"><span style="letter-spacing:normal"><span style="orphans:2"><span style="text-transform:none"><span style="white-space:normal"><span style="widows:2"><span style="word-spacing:0px"><span style="background-color:#ffffff"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><strong style="box-sizing:border-box; font-family:&quot;trebuchet ms&quot;, helvetica, sans-serif; font-weight:bold"><span style="box-sizing:border-box"><span style="color:#daa520">Contact:</span></span>&nbsp;</strong><span style="box-sizing:border-box"><span style="color:#696969"><a href="mailto:aprocagual.guaymas@gmail.com" style="box-sizing:border-box; color:#555555; font-weight:700; text-decoration:underline; cursor:pointer" target="_blank">aprocagual.guaymas@gmail.com</a></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n\r\n<p style="text-align:start; text-indent:0px; -webkit-text-stroke-width:0px" tabindex="0"><span style="font-size:14px;"><span style="font-family:Arial,Helvetica,sans-serif;"><span style="box-sizing:border-box"><span style="color:#000000"><span style="font-style:normal"><span style="font-variant-ligatures:normal"><span style="font-variant-caps:normal"><span style="font-weight:400"><span style="letter-spacing:normal"><span style="orphans:2"><span style="text-transform:none"><span style="white-space:normal"><span style="widows:2"><span style="word-spacing:0px"><span style="background-color:#ffffff"><span style="text-decoration-style:initial"><span style="text-decoration-color:initial"><strong style="box-sizing:border-box; font-family:&quot;trebuchet ms&quot;, helvetica, sans-serif; font-weight:bold"><span style="box-sizing:border-box"><span style="color:#daa520">Phone:</span></span>&nbsp;</strong><span style="box-sizing:border-box"><span style="color:#696969">(504) 9708-4015</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n	<p>The Mayan spirits gather together and transform raw cocoa through a traditional method; a special processing when the beans have to absorb the liquids of the fresh pulp instead of letting them drain away. A slow process with close supervision in a closed solar tunnel leads to an aromatic cocoa with intense notes of wild valley flowers and thyme, coconut/almond milk, and sesame oil.</p>\r\n	\N	1.53	52%	24%	1 - 3 %	120°C; 25’; 12 μm	flores silvestres del valle, tomillo, verde, pimienta rosa, leche de coco / almendras, aceite de sésamo, champiñones	pan tostado, perfume floral a base de hierbas, pulpa de café, notas de fruta amarilla, pimienta rosa, ginebra, sabor a nuez	selva_yoro_-_9839-choc.png	image/png	238603	2020-02-24 04:40:28.921498	selva_yoro_-_9839.png	image/png	239555	2020-02-24 04:40:30.380296	wild valley flowers, thyme, green, pink pepper, coconut/almond milk, sesame oil, mushroom	toasted bread, flowery herbal perfum, coffee pulp, yellow fruit notes, pink pepper, gin, nutty aftertaste			f
26	2	23	Puerto de Montaña	\N	RACN; Nicaragua	13.725500	-84.939722	<p tabindex="0"><strong>Productor:</strong>&nbsp;Cooperativa Multisectorial Saslaya COOMUSASC R.L.</p>\r\n\r\n<p tabindex="0"><strong>Coordenadas:</strong>&nbsp;13&deg;43&#39;31.8&quot;N 84&deg;56&#39;23.0&quot;W</p>\r\n\r\n<p tabindex="0"><strong>Disponibilidad:&nbsp;</strong>~10 - 15 MT/a&ntilde;o</p>\r\n\r\n<p tabindex="0"><strong>Tel&eacute;fono:&nbsp;</strong>(505) 7542-4672</p>\r\n	<p><strong>Composici&oacute;n varietal: </strong>mezcla trinitaria (44% lila; 8% blanco)</p>\r\n\r\n<p><strong>Acondicionamiento previo de pulpa:</strong> /</p>\r\n\r\n<p><strong>M&eacute;todo de fermentaci&oacute;n:</strong> bandeja (min. 480 kg)</p>\r\n\r\n<p><strong>Pre-secado:</strong> 48h; 8 cm; aire libre</p>\r\n\r\n<p><strong>Secado:</strong> 10 d&iacute;as de secado al sol; aire libre; bandejas de madera</p>\r\n	Puerto_de_Montana_web.jpg	image/jpeg	570701	2020-02-24 04:44:39.319707		2019-08-13 14:39:48.072708	2020-02-24 04:44:43.076816	\N	\N	1	puerto-de-montana		<p><img alt="" src="http://cocoaflavormap.cacaomovil.com/ckeditor_assets/pictures/76/content_Harvest_PuertodeMontana.png" style="width: 300px; height: 300px;" /></p>\r\n	<p>Gen&eacute;tica excepcional de una zona poco explorada presenta los aspectos herbales del cacao del norte del pa&iacute;s. Granos de color ligero con textura cremosa expresa notas de te verde, tomillo y comino con un toque picante/dulce de paprika. Las hierbas secas se mantienen por largo tiempo terminando a sabor de pasta de avellanas.</p>\r\n	\N	RACN; Nicaragua		<p tabindex="0"><strong>Varietal composition:</strong>&nbsp;Trinitario blend (44% lilac; 8% white)</p>\r\n\r\n<p tabindex="0"><strong>Pulp pre-conditioning:</strong>&nbsp;/</p>\r\n\r\n<p tabindex="0"><strong>Fermentation method:&nbsp;</strong>Tray (min. 480 kg)</p>\r\n\r\n<p tabindex="0"><strong>Pre-drying:&nbsp;</strong>48h; 8 cm; open air</p>\r\n\r\n<p tabindex="0"><strong>Drying:</strong>&nbsp;10-day sun-drying; open air; wooden trays</p>\r\n	<p><img alt="" src="http://cocoaflavormap.cacaomovil.com/ckeditor_assets/pictures/76/content_Harvest_PuertodeMontana.png" style="width: 300px; height: 300px;" /></p>\r\n	<p tabindex="0"><strong>Producer:</strong>&nbsp;Cooperativa Multisectorial Saslaya COOMUSASC R.L.</p>\r\n\r\n<p tabindex="0"><strong>Coordinates:</strong>&nbsp;13&deg;43&#39;31.8&quot;N 84&deg;56&#39;23.0&quot;W</p>\r\n\r\n<p tabindex="0"><strong>Availability:&nbsp;</strong>~10 - 15 MT/year</p>\r\n\r\n<p tabindex="0"><strong>Phone:&nbsp;</strong>(505) 7542-4672</p>\r\n	<p>Exceptional genetics in an under-explored region reveal the herbal aspects of the cacao of the north. Light-colored beans with creamy texture express green tea notes, thyme and cumin with a sweet spicy touch of red paprika. The dried herbs stay long in the mouth ending up to hazelnut paste aftertaste</p>\r\n	\N	1.49	56%	28%	0%	120 ° C; 25 ’; 12 μm	cremoso, té verde, tomillo, comino, pimentón rojo, pasta de avellanas	orégano, tomillo, pimienta, espumosos, resina, madera oscura, mazapán	puerto_de_montaña_-_9856-choc.png	image/png	242337	2020-02-24 04:44:40.381941	puerto_de_montaña_-_9856.png	image/png	239718	2020-02-24 04:44:41.723738	creamy, green tea, thyme, cumin, red paprika, hazelnut paste	oregano, thyme, pepper, sparkling, resin, dark wood, marzipan			f
15	1	13	Sierra Julián	\N	Sonsonate, El Salvador	13.679083	-89.550528	<p tabindex="0"><strong>Productor:</strong>&nbsp;Finca La Sierra</p>\r\n\r\n<p tabindex="0"><strong>Coordenadas:</strong>&nbsp;13&deg;40&#39;44.7&quot;N 89&deg;33&#39;01.9&quot;W</p>\r\n\r\n<p tabindex="0"><strong>Disponibilidad:&nbsp;</strong>~0.5 - 1.0 MT/year</p>\r\n\r\n<p tabindex="0"><strong>Contacto:&nbsp;</strong><a href="mailto:borisportillo@yahoo.com" target="_blank">borisportillo@yahoo.com</a></p>\r\n\r\n<p tabindex="0"><strong>Tel&eacute;fono:&nbsp;</strong>(503) 7318-2296</p>\r\n	<p><strong>Composici&oacute;n varietal:</strong> mezcla trinitaria (28% lila; 14% blanco)</p>\r\n\r\n<p><strong>Acondicionamiento previo de pulpa:</strong> /</p>\r\n\r\n<p><strong>M&eacute;todo de fermentaci&oacute;n: </strong>caja de madera en cascada de tama&ntilde;o peque&ntilde;o (50 kg)</p>\r\n\r\n<p><strong>Pre-secado: </strong>/</p>\r\n\r\n<p><strong>Secado: </strong>10 d&iacute;as de secado al sol; aire libre; cesta de mimbre</p>\r\n	Sierra_Julian_web.jpg	image/jpeg	287106	2020-02-24 04:47:37.717319		2019-07-30 12:53:27.826961	2020-02-24 04:47:39.586429	0	0	1	sierra-julian			<p>Preparado a trav&eacute;s de procesamiento a peque&ntilde;a escala, esta mezcla de Trinitarios trae nuevos sabores en el mapa. Lo que describa este cacao es un quiche de ruibarbo con pedazos de nueces y eneldo. La mezcla de hierbas y de remolacha, zanahoria, y piment&oacute;n rojo agrega dulzura terrosa a su sabor a caf&eacute;.</p>\r\n	3	Sonsonate, El Salvador		<p tabindex="0"><strong>Varietal composition:</strong>&nbsp;Trinitario blend (28% lilac; 14% white)</p>\r\n\r\n<p tabindex="0"><strong>Pulp pre-conditioning:</strong>&nbsp;/</p>\r\n\r\n<p tabindex="0"><strong>Fermentation method:&nbsp;</strong>Small-sized cascade wooden box (50kg)</p>\r\n\r\n<p tabindex="0"><strong>Pre-drying:&nbsp;/</strong></p>\r\n\r\n<p tabindex="0"><strong>Drying:</strong>&nbsp;10-day sun-drying; open air; wicker basket</p>\r\n		<p tabindex="0"><strong>Producer:</strong>&nbsp;Finca La Sierra</p>\r\n\r\n<p tabindex="0"><strong>Coordinates:</strong>&nbsp;13&deg;40&#39;44.7&quot;N 89&deg;33&#39;01.9&quot;W</p>\r\n\r\n<p tabindex="0"><strong>Availability:&nbsp;</strong>~0.5 - 1.0 MT/year</p>\r\n\r\n<p tabindex="0"><strong>Contact:&nbsp;</strong><a href="mailto:borisportillo@yahoo.com" target="_blank">borisportillo@yahoo.com</a></p>\r\n\r\n<p tabindex="0"><strong>Phone:&nbsp;</strong>(503) 7318-2296</p>\r\n	<p>Prepared through small-scale processing this Trinitario blend brings new flavors in the map. Fresh rhubarb quiche with pieces of wallnuts and dill is what describes this cacao. The herbal &amp; veggy mix of beetroot, carrot, and red pepper add sweet earthiness to its coffee flavor.</p>\r\n	\N	1.37	72%	18%	0%	120 ° C; 25 ’; 12 μm	ruibarbo, caqui, nueces, eneldo, remolacha, zanahoria, quingombó, terroso, notas de pulpa de café	corteza de caña de azúcar verde, higo maduro, eneldo, hierbas, quiche, ácido, frío	sierra_julian_-_9783-choc.png	image/png	239204	2020-02-24 04:47:38.352208	sierra_julian_-_9783.png	image/png	237366	2020-02-24 04:47:38.962199	rhubarb, persimmon, walnuts, dill, beetroot, carrot, okra, earthy, coffee pulp notes​	green sugar cane bark, ripe fig, dill, herbs, quiche,acidic, chill			f
\.


--
-- Data for Name: producers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY producers (id, country_id, name, created_at, updated_at) FROM stdin;
1	1	Cacao Itzalku	2019-04-24 21:11:57.445175	2019-04-24 21:11:57.445175
2	1	Hacienda San José de Real de La Carrera	2019-04-24 21:11:57.447774	2019-04-24 21:11:57.447774
3	2	Berenda Manzanarez 	2019-04-24 21:11:57.449768	2019-04-24 21:11:57.449768
4	3	Asociación de Productores de Pico Bonito ASOPROPIB	2019-04-24 21:11:57.451832	2019-04-24 21:11:57.451832
5	1	Finca la Concepción	2019-04-24 21:11:57.453764	2019-04-24 21:11:57.453764
6	2	CODEPROSA	2019-04-24 21:11:57.455723	2019-04-24 21:11:57.455723
7	3	APROSACAO	2019-04-24 21:11:57.457775	2019-04-24 21:11:57.457775
8	2	COOPROCAFUC	2019-04-24 21:11:57.459773	2019-04-24 21:11:57.459773
9	2	Cooperativa de servicio agroforestal y de comercialización de cacao CACAONICA R.L.	2019-06-26 22:03:56.472719	2019-06-26 22:03:56.472719
10	2	Asociación para la Promoción de las Mujeres de Waslala APROMUWA R.L.	2019-06-26 22:40:54.800048	2019-06-26 22:40:54.800048
11	2	Cooperativa de Servicios Multiples Flor De Pancasan R.L.	2019-07-30 06:07:31.094599	2019-07-30 06:07:31.094599
12	2	Asociación de Iniciativas y Hermanamientos de El Castillo ASHIERCA	2019-07-30 06:14:58.825244	2019-07-30 06:14:58.825244
13	1	Finca La Sierra	2019-07-30 12:50:56.40023	2019-07-30 12:50:56.40023
14	3	Cooperativa Agrícola Cafetalera San Antonio Limitada COAGRICSAL	2019-07-30 12:58:10.591775	2019-07-30 12:58:10.591775
15	3	Cooperativa de Producción Agrícola Cacaoteros de Limitada COPRACAJUL 	2019-07-30 13:09:34.099002	2019-07-30 13:09:34.099002
16	3	Asociación de Producción Agrícola "Cacheteros de Guaymas" Limitada APROCAGUAL	2019-08-02 03:53:22.637933	2019-08-02 03:53:22.637933
17	3	Cooperativa De Productores Agrícolas de San Viator Limitada	2019-08-02 15:20:19.045048	2019-08-02 15:20:19.045048
18	3	Asociación de Productores Agroforestales de la Cuenca Rio  Choloma APACH	2019-08-07 17:38:20.07095	2019-08-07 17:38:20.07095
19	3	Cooperativa Agrícola de Cacaoteeros de Omoa San Fernando Limitada CACAOSAFER	2019-08-07 20:31:47.652405	2019-08-07 20:31:47.652405
20	2	Unión de Cooperativas Agropecuarias Ahmed Campos Corea R.L. (UCA)	2019-08-08 21:07:27.842026	2019-08-08 21:07:27.842026
21	2	Unión De Cooperativas Agropecuarias SOPPEXCCA R.L. UCA SOPPEXCA R.L.	2019-08-08 21:20:16.450434	2019-08-08 21:20:16.450434
22	2	Cooperativa Multisectorial De Cacaoteros Orgánicos  COMUCOR R.L.	2019-08-08 23:05:08.028568	2019-08-08 23:05:08.028568
23	2	Cooperativa Multisectorial Saslaya COOMUSASC R.L.	2019-08-13 14:18:36.601374	2019-08-13 14:18:36.601374
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY roles (id, name, resource_type, resource_id, created_at, updated_at) FROM stdin;
1	admin	\N	\N	2019-04-24 21:11:57.181376	2019-04-24 21:11:57.181376
2	admin	\N	\N	2019-04-24 21:11:57.461879	2019-04-24 21:11:57.461879
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY schema_migrations (version) FROM stdin;
20180703195234
20180706220931
20180707033127
20180903213816
20180903214212
20180903214858
20180923035629
20180923051846
20181003045758
20181005002453
20181005020614
20181005042323
20181016025839
20181122215044
20181130011030
20181218200131
20181218200304
20190115205537
20190115213736
20190116144715
20190116144738
20190228214629
20190314125539
20190314132500
20190731192523
20191024170228
20191029015709
20191029032139
20200122163115
20200131043303
20200217072222
20200217231049
20200221203741
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, email, encrypted_password, active, name, lastname, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at) FROM stdin;
1	admin@codecastle.com.sv	$2a$11$uK5mtMa/CI6tae9qcy/1n.UR7up8XyNFl15b01QPBH8xPNjZyCNtm	t	Admin MS		\N	\N	\N	34	2020-02-24 00:08:41.11215	2020-02-23 23:59:01.469297	179.51.58.72	190.212.255.2	2019-04-24 21:11:57.157508	2020-02-24 00:08:41.114204
\.


--
-- Data for Name: users_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users_roles (user_id, role_id) FROM stdin;
1	1
\.


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: blogs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY blogs
    ADD CONSTRAINT blogs_pkey PRIMARY KEY (id);


--
-- Name: ckeditor_assets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ckeditor_assets
    ADD CONSTRAINT ckeditor_assets_pkey PRIMARY KEY (id);


--
-- Name: contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: flavor_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY flavor_items
    ADD CONSTRAINT flavor_items_pkey PRIMARY KEY (id);


--
-- Name: flavors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY flavors
    ADD CONSTRAINT flavors_pkey PRIMARY KEY (id);


--
-- Name: friendly_id_slugs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY friendly_id_slugs
    ADD CONSTRAINT friendly_id_slugs_pkey PRIMARY KEY (id);


--
-- Name: pages_pictures_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pages_pictures
    ADD CONSTRAINT pages_pictures_pkey PRIMARY KEY (id);


--
-- Name: pages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: places_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY places
    ADD CONSTRAINT places_pkey PRIMARY KEY (id);


--
-- Name: producers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY producers
    ADD CONSTRAINT producers_pkey PRIMARY KEY (id);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_blogs_on_slug; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_blogs_on_slug ON blogs USING btree (slug);


--
-- Name: index_ckeditor_assets_on_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_ckeditor_assets_on_type ON ckeditor_assets USING btree (type);


--
-- Name: index_flavor_items_on_flavor_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_flavor_items_on_flavor_id ON flavor_items USING btree (flavor_id);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type ON friendly_id_slugs USING btree (slug, sluggable_type);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope ON friendly_id_slugs USING btree (slug, sluggable_type, scope);


--
-- Name: index_friendly_id_slugs_on_sluggable_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_id ON friendly_id_slugs USING btree (sluggable_id);


--
-- Name: index_friendly_id_slugs_on_sluggable_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_type ON friendly_id_slugs USING btree (sluggable_type);


--
-- Name: index_pages_pictures_on_page_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_pages_pictures_on_page_id ON pages_pictures USING btree (page_id);


--
-- Name: index_places_on_country_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_places_on_country_id ON places USING btree (country_id);


--
-- Name: index_places_on_producer_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_places_on_producer_id ON places USING btree (producer_id);


--
-- Name: index_places_on_slug; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_places_on_slug ON places USING btree (slug);


--
-- Name: index_producers_on_country_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_producers_on_country_id ON producers USING btree (country_id);


--
-- Name: index_roles_on_name_and_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_roles_on_name_and_resource_type_and_resource_id ON roles USING btree (name, resource_type, resource_id);


--
-- Name: index_roles_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_roles_on_resource_type_and_resource_id ON roles USING btree (resource_type, resource_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_users_roles_on_role_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_users_roles_on_role_id ON users_roles USING btree (role_id);


--
-- Name: index_users_roles_on_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_users_roles_on_user_id ON users_roles USING btree (user_id);


--
-- Name: index_users_roles_on_user_id_and_role_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_users_roles_on_user_id_and_role_id ON users_roles USING btree (user_id, role_id);


--
-- Name: fk_rails_80e552fd42; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY flavor_items
    ADD CONSTRAINT fk_rails_80e552fd42 FOREIGN KEY (flavor_id) REFERENCES flavors(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

