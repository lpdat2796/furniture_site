--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: pat
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO pat;

--
-- Name: banners; Type: TABLE; Schema: public; Owner: pat
--

CREATE TABLE public.banners (
    id bigint NOT NULL,
    name character varying,
    image character varying,
    is_public boolean DEFAULT false,
    sort_order integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT '2021-04-10 04:54:23.565492'::timestamp without time zone NOT NULL,
    updated_at timestamp without time zone DEFAULT '2021-04-10 04:54:23.565492'::timestamp without time zone NOT NULL
);


ALTER TABLE public.banners OWNER TO pat;

--
-- Name: banners_id_seq; Type: SEQUENCE; Schema: public; Owner: pat
--

CREATE SEQUENCE public.banners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.banners_id_seq OWNER TO pat;

--
-- Name: banners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pat
--

ALTER SEQUENCE public.banners_id_seq OWNED BY public.banners.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: pat
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    name character varying,
    parent_id character varying DEFAULT '0'::character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    is_public boolean DEFAULT false,
    is_selected boolean DEFAULT false
);


ALTER TABLE public.categories OWNER TO pat;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: pat
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO pat;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pat
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: category_products; Type: TABLE; Schema: public; Owner: pat
--

CREATE TABLE public.category_products (
    id bigint NOT NULL,
    category_id bigint,
    product_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.category_products OWNER TO pat;

--
-- Name: category_products_id_seq; Type: SEQUENCE; Schema: public; Owner: pat
--

CREATE SEQUENCE public.category_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_products_id_seq OWNER TO pat;

--
-- Name: category_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pat
--

ALTER SEQUENCE public.category_products_id_seq OWNED BY public.category_products.id;


--
-- Name: order_deliveries; Type: TABLE; Schema: public; Owner: pat
--

CREATE TABLE public.order_deliveries (
    id bigint NOT NULL,
    order_id bigint,
    address character varying,
    full_name character varying,
    phone character varying,
    created_at timestamp without time zone DEFAULT '2021-04-10 04:54:23.567465'::timestamp without time zone NOT NULL,
    updated_at timestamp without time zone DEFAULT '2021-04-10 04:54:23.567465'::timestamp without time zone NOT NULL
);


ALTER TABLE public.order_deliveries OWNER TO pat;

--
-- Name: order_deliveries_id_seq; Type: SEQUENCE; Schema: public; Owner: pat
--

CREATE SEQUENCE public.order_deliveries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_deliveries_id_seq OWNER TO pat;

--
-- Name: order_deliveries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pat
--

ALTER SEQUENCE public.order_deliveries_id_seq OWNED BY public.order_deliveries.id;


--
-- Name: order_details; Type: TABLE; Schema: public; Owner: pat
--

CREATE TABLE public.order_details (
    id bigint NOT NULL,
    order_id bigint,
    product_id bigint,
    amount integer DEFAULT 1,
    created_at timestamp without time zone DEFAULT '2021-04-10 04:54:23.568879'::timestamp without time zone NOT NULL,
    updated_at timestamp without time zone DEFAULT '2021-04-10 04:54:23.568879'::timestamp without time zone NOT NULL
);


ALTER TABLE public.order_details OWNER TO pat;

--
-- Name: order_details_id_seq; Type: SEQUENCE; Schema: public; Owner: pat
--

CREATE SEQUENCE public.order_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_details_id_seq OWNER TO pat;

--
-- Name: order_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pat
--

ALTER SEQUENCE public.order_details_id_seq OWNED BY public.order_details.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: pat
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    user_id bigint,
    status character varying,
    total_amount character varying,
    uuid character varying,
    created_at timestamp without time zone DEFAULT '2021-04-10 04:54:23.570453'::timestamp without time zone NOT NULL,
    updated_at timestamp without time zone DEFAULT '2021-04-10 04:54:23.570453'::timestamp without time zone NOT NULL,
    reject_comment character varying,
    expected_shipment_date date,
    shipment_date date,
    rejected_at date,
    whodunit integer
);


ALTER TABLE public.orders OWNER TO pat;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: pat
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO pat;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pat
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: product_images; Type: TABLE; Schema: public; Owner: pat
--

CREATE TABLE public.product_images (
    id bigint NOT NULL,
    product_id bigint,
    file_data character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    sort_order integer DEFAULT 0
);


ALTER TABLE public.product_images OWNER TO pat;

--
-- Name: product_images_id_seq; Type: SEQUENCE; Schema: public; Owner: pat
--

CREATE SEQUENCE public.product_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_images_id_seq OWNER TO pat;

--
-- Name: product_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pat
--

ALTER SEQUENCE public.product_images_id_seq OWNED BY public.product_images.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: pat
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    name character varying,
    is_public boolean,
    price character varying,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    dimension_x integer,
    dimension_y integer,
    dimension_z integer,
    amount bigint DEFAULT 0,
    card_image character varying,
    color character varying,
    material character varying
);


ALTER TABLE public.products OWNER TO pat;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: pat
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO pat;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pat
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: pat
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO pat;

--
-- Name: users; Type: TABLE; Schema: public; Owner: pat
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying,
    password character varying,
    full_name character varying,
    address character varying,
    phone character varying,
    age character varying,
    role integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    gender character varying,
    password_digest character varying
);


ALTER TABLE public.users OWNER TO pat;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: pat
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO pat;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pat
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: banners id; Type: DEFAULT; Schema: public; Owner: pat
--

ALTER TABLE ONLY public.banners ALTER COLUMN id SET DEFAULT nextval('public.banners_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: pat
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: category_products id; Type: DEFAULT; Schema: public; Owner: pat
--

ALTER TABLE ONLY public.category_products ALTER COLUMN id SET DEFAULT nextval('public.category_products_id_seq'::regclass);


--
-- Name: order_deliveries id; Type: DEFAULT; Schema: public; Owner: pat
--

ALTER TABLE ONLY public.order_deliveries ALTER COLUMN id SET DEFAULT nextval('public.order_deliveries_id_seq'::regclass);


--
-- Name: order_details id; Type: DEFAULT; Schema: public; Owner: pat
--

ALTER TABLE ONLY public.order_details ALTER COLUMN id SET DEFAULT nextval('public.order_details_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: pat
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: product_images id; Type: DEFAULT; Schema: public; Owner: pat
--

ALTER TABLE ONLY public.product_images ALTER COLUMN id SET DEFAULT nextval('public.product_images_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: pat
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: pat
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: pat
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2021-04-10 04:54:24.329117	2021-04-10 04:54:24.329117
\.


--
-- Data for Name: banners; Type: TABLE DATA; Schema: public; Owner: pat
--

COPY public.banners (id, name, image, is_public, sort_order, created_at, updated_at) FROM stdin;
1	Sideboards	11.png	t	3	2021-04-10 04:54:23.565492	2021-04-10 04:54:23.565492
2	Beds	Dining_Tables.png	t	2	2021-04-10 04:54:23.565492	2021-04-10 04:54:23.565492
3	Bookcases	Dining_Tables__8_.png	t	0	2021-04-10 04:54:23.565492	2021-04-10 04:54:23.565492
4	Children's Furniture	Dining_Tables__7_.png	t	2	2021-04-10 04:54:23.565492	2021-04-10 04:54:23.565492
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: pat
--

COPY public.categories (id, name, parent_id, created_at, updated_at, is_public, is_selected) FROM stdin;
1	Furniture	0	2021-04-10 05:55:32.460653	2021-04-10 05:55:32.460653	t	t
2	Baby furniture	0	2021-04-10 05:55:32.507491	2021-04-10 05:55:32.507491	t	t
3	Decoration	0	2021-04-10 05:55:32.510485	2021-04-10 05:55:32.510485	t	t
4	Living Room	0,1	2021-04-10 05:55:32.514446	2021-04-10 05:55:32.514446	t	f
5	Dinning Room	0,1	2021-04-10 05:55:32.558316	2021-04-10 05:55:32.558316	t	f
6	Bedroom	0,1	2021-04-10 05:55:32.560865	2021-04-10 05:55:32.560865	t	f
7	Bathroom	0,1	2021-04-10 05:55:32.563383	2021-04-10 05:55:32.563383	t	f
8	Kitchen	0,1	2021-04-10 05:55:32.565925	2021-04-10 05:55:32.565925	t	f
9	Office	0,1	2021-04-10 05:55:32.568306	2021-04-10 05:55:32.568306	t	f
10	Baby Furniture	0,2	2021-04-10 05:55:32.570541	2021-04-10 05:55:32.570541	t	f
11	Children`s Furniture	0,2	2021-04-10 05:55:32.57282	2021-04-10 05:55:32.57282	t	f
12	Teen Furniture	0,2	2021-04-10 05:55:32.575554	2021-04-10 05:55:32.575554	t	f
13	Decor	0,3	2021-04-10 05:55:32.578075	2021-04-10 05:55:32.578075	t	f
14	Lighting	0,3	2021-04-10 05:55:32.580311	2021-04-10 05:55:32.580311	t	f
15	Walldecor	0,3	2021-04-10 05:55:32.582416	2021-04-10 05:55:32.582416	t	f
16	Tableware	0,3	2021-04-10 05:55:32.584895	2021-04-10 05:55:32.584895	t	f
17	Sofas & Armchairs	0,1,4	2021-04-10 05:55:32.587237	2021-04-10 05:55:32.587237	t	f
18	Shelves & Shelving units	0,1,4	2021-04-10 05:55:32.589485	2021-04-10 05:55:32.589485	t	f
19	Bookcases	0,1,4	2021-04-10 05:55:32.591809	2021-04-10 05:55:32.591809	t	f
20	Bars & Counters	0,1,5	2021-04-10 05:55:32.594177	2021-04-10 05:55:32.594177	t	f
21	Benches	0,1,5	2021-04-10 05:55:32.596543	2021-04-10 05:55:32.596543	t	f
22	Chairs	0,1,5	2021-04-10 05:55:32.59913	2021-04-10 05:55:32.59913	t	f
23	Beds	0,1,6	2021-04-10 05:55:32.601713	2021-04-10 05:55:32.601713	t	f
24	Chests of drawers	0,1,6	2021-04-10 05:55:32.603968	2021-04-10 05:55:32.603968	t	f
25	Dressing tables	0,1,6	2021-04-10 05:55:32.606573	2021-04-10 05:55:32.606573	t	f
26	Bathroom Shelves	0,1,7	2021-04-10 05:55:32.609051	2021-04-10 05:55:32.609051	t	f
27	Laundry baskets	0,1,7	2021-04-10 05:55:32.611427	2021-04-10 05:55:32.611427	t	f
28	Towel hangers	0,1,7	2021-04-10 05:55:32.613816	2021-04-10 05:55:32.613816	t	f
29	Kitchen Shelves	0,1,8	2021-04-10 05:55:32.617564	2021-04-10 05:55:32.617564	t	f
30	Kitchen units & Islands	0,1,8	2021-04-10 05:55:32.649046	2021-04-10 05:55:32.649046	t	f
31	Desks	0,1,9	2021-04-10 05:55:32.693952	2021-04-10 05:55:32.693952	t	f
32	Baby Tables & Chairs	0,2,10	2021-04-10 05:55:32.696542	2021-04-10 05:55:32.696542	t	f
33	Baby Changing tables & Closets	0,2,10	2021-04-10 05:55:32.69884	2021-04-10 05:55:32.69884	t	f
34	Baby Cots & Beds	0,2,10	2021-04-10 05:55:32.70114	2021-04-10 05:55:32.70114	t	f
35	Children Beds	0,2,11	2021-04-10 05:55:32.7035	2021-04-10 05:55:32.7035	t	f
36	Children Bookcases & Shelves	0,2,11	2021-04-10 05:55:32.705843	2021-04-10 05:55:32.705843	t	f
37	Children Outdoor furniture	0,2,11	2021-04-10 05:55:32.708192	2021-04-10 05:55:32.708192	t	f
38	Teen Beds	0,2,12	2021-04-10 05:55:32.710516	2021-04-10 05:55:32.710516	t	f
39	Teen Bookcases & Shelves	0,2,12	2021-04-10 05:55:32.71263	2021-04-10 05:55:32.71263	t	f
40	Teen Drawers & Closets	0,2,12	2021-04-10 05:55:32.718411	2021-04-10 05:55:32.718411	t	f
41	Bathroom accessories	0,3,13	2021-04-10 05:55:32.734612	2021-04-10 05:55:32.734612	t	f
42	Candles & Home fragances	0,3,13	2021-04-10 05:55:32.736995	2021-04-10 05:55:32.736995	t	f
43	Lanterns	0,3,13	2021-04-10 05:55:32.739636	2021-04-10 05:55:32.739636	t	f
44	Magazine racks	0,3,13	2021-04-10 05:55:32.741997	2021-04-10 05:55:32.741997	t	f
45	Rugs & Mats	0,3,13	2021-04-10 05:55:32.744363	2021-04-10 05:55:32.744363	t	f
46	Pendant Lamps	0,3,14	2021-04-10 05:55:32.746677	2021-04-10 05:55:32.746677	t	f
47	Decorative lights & Fairy lights	0,3,14	2021-04-10 05:55:32.748829	2021-04-10 05:55:32.748829	t	f
48	Clocks	0,3,15	2021-04-10 05:55:32.751057	2021-04-10 05:55:32.751057	t	f
49	Mirrors	0,3,15	2021-04-10 05:55:32.753377	2021-04-10 05:55:32.753377	t	f
50	Photo memo boards	0,3,15	2021-04-10 05:55:32.755673	2021-04-10 05:55:32.755673	t	f
51	Wall Art & Prints	0,3,15	2021-04-10 05:55:32.757998	2021-04-10 05:55:32.757998	t	f
52	Trays	0,3,16	2021-04-10 05:55:32.760161	2021-04-10 05:55:32.760161	t	f
53	Racks & Baskets	0,3,16	2021-04-10 05:55:32.763328	2021-04-10 05:55:32.763328	t	f
54	Glasses & Carafes	0,3,16	2021-04-10 05:55:32.765667	2021-04-10 05:55:32.765667	t	f
55	Trendy	0	2021-04-10 05:55:32.767807	2021-04-10 05:55:32.767807	t	f
56	New furniture	0	2021-04-10 05:55:32.770186	2021-04-10 05:55:32.770186	t	f
58	Office units	0,1,9	2021-04-10 05:58:18.12512	2021-04-10 05:58:18.12512	t	f
\.


--
-- Data for Name: category_products; Type: TABLE DATA; Schema: public; Owner: pat
--

COPY public.category_products (id, category_id, product_id, created_at, updated_at) FROM stdin;
1	17	1	2021-04-10 06:11:25.145393	2021-04-10 06:11:25.145393
2	17	2	2021-04-10 06:17:11.01582	2021-04-10 06:17:11.01582
3	18	3	2021-04-10 06:20:00.466578	2021-04-10 06:20:00.466578
4	18	4	2021-04-10 06:22:08.092339	2021-04-10 06:22:08.092339
5	19	5	2021-04-10 06:48:36.739867	2021-04-10 06:48:36.739867
6	19	6	2021-04-10 06:52:10.016021	2021-04-10 06:52:10.016021
7	20	8	2021-04-10 07:21:47.01602	2021-04-10 07:21:47.01602
9	20	9	2021-04-10 07:24:33.491514	2021-04-10 07:24:33.491514
10	19	7	2021-04-10 07:25:00.542057	2021-04-10 07:25:00.542057
11	18	9	2021-04-10 07:26:11.806936	2021-04-10 07:26:11.806936
12	20	10	2021-04-10 07:27:47.741282	2021-04-10 07:27:47.741282
13	21	11	2021-04-10 07:30:47.396672	2021-04-10 07:30:47.396672
16	21	12	2021-04-10 07:36:26.835331	2021-04-10 07:36:26.835331
17	21	13	2021-04-10 07:36:32.007056	2021-04-10 07:36:32.007056
18	22	14	2021-04-10 07:38:03.653748	2021-04-10 07:38:03.653748
19	22	15	2021-04-10 07:40:10.053277	2021-04-10 07:40:10.053277
22	23	17	2021-04-10 07:46:37.538179	2021-04-10 07:46:37.538179
23	24	18	2021-04-10 07:48:31.471442	2021-04-10 07:48:31.471442
24	24	19	2021-04-10 07:50:41.365746	2021-04-10 07:50:41.365746
25	25	20	2021-04-10 07:53:20.271345	2021-04-10 07:53:20.271345
26	25	21	2021-04-10 07:55:41.938213	2021-04-10 07:55:41.938213
27	26	3	2021-04-10 07:56:47.002497	2021-04-10 07:56:47.002497
28	26	4	2021-04-10 07:56:51.482307	2021-04-10 07:56:51.482307
29	26	22	2021-04-10 07:58:41.015255	2021-04-10 07:58:41.015255
30	18	23	2021-04-10 08:00:36.705628	2021-04-10 08:00:36.705628
31	26	23	2021-04-10 08:00:36.790505	2021-04-10 08:00:36.790505
32	27	24	2021-04-10 08:02:34.816356	2021-04-10 08:02:34.816356
33	27	25	2021-04-10 08:03:59.295248	2021-04-10 08:03:59.295248
34	28	26	2021-04-10 08:06:00.548687	2021-04-10 08:06:00.548687
35	28	27	2021-04-10 08:07:44.472265	2021-04-10 08:07:44.472265
36	29	3	2021-04-10 08:08:54.596294	2021-04-10 08:08:54.596294
37	29	9	2021-04-10 08:09:15.675631	2021-04-10 08:09:15.675631
38	29	22	2021-04-10 08:09:28.251656	2021-04-10 08:09:28.251656
39	30	28	2021-04-10 08:11:27.18859	2021-04-10 08:11:27.18859
40	30	29	2021-04-10 08:13:00.239131	2021-04-10 08:13:00.239131
41	31	30	2021-04-10 08:15:11.642484	2021-04-10 08:15:11.642484
42	31	31	2021-04-10 08:16:45.000949	2021-04-10 08:16:45.000949
43	58	32	2021-04-10 08:18:24.241281	2021-04-10 08:18:24.241281
44	58	33	2021-04-10 08:19:47.1127	2021-04-10 08:19:47.1127
45	32	34	2021-04-10 08:23:31.005615	2021-04-10 08:23:31.005615
46	22	35	2021-04-10 08:25:26.403244	2021-04-10 08:25:26.403244
47	32	35	2021-04-10 08:25:26.603723	2021-04-10 08:25:26.603723
48	33	36	2021-04-10 08:27:21.257301	2021-04-10 08:27:21.257301
49	33	37	2021-04-10 08:28:26.190071	2021-04-10 08:28:26.190071
50	36	3	2021-04-10 08:30:15.564622	2021-04-10 08:30:15.564622
51	35	38	2021-04-10 08:31:34.828074	2021-04-10 08:31:34.828074
52	35	39	2021-04-10 08:32:55.987972	2021-04-10 08:32:55.987972
53	18	40	2021-04-10 08:34:14.164366	2021-04-10 08:34:14.164366
54	36	40	2021-04-10 08:34:14.222239	2021-04-10 08:34:14.222239
55	22	41	2021-04-10 08:36:52.120081	2021-04-10 08:36:52.120081
56	37	41	2021-04-10 08:36:52.210297	2021-04-10 08:36:52.210297
57	22	42	2021-04-10 08:38:34.369292	2021-04-10 08:38:34.369292
58	37	42	2021-04-10 08:38:34.400264	2021-04-10 08:38:34.400264
59	23	43	2021-04-10 08:40:07.78511	2021-04-10 08:40:07.78511
60	38	43	2021-04-10 08:40:07.96259	2021-04-10 08:40:07.96259
61	23	44	2021-04-10 08:41:25.570628	2021-04-10 08:41:25.570628
62	38	44	2021-04-10 08:41:25.60942	2021-04-10 08:41:25.60942
63	39	3	2021-04-10 08:41:55.011631	2021-04-10 08:41:55.011631
64	39	22	2021-04-10 08:42:00.32185	2021-04-10 08:42:00.32185
65	40	45	2021-04-10 08:46:51.547022	2021-04-10 08:46:51.547022
98	41	25	2021-04-10 09:02:35.312498	2021-04-10 09:02:35.312498
99	41	24	2021-04-10 09:02:40.069422	2021-04-10 09:02:40.069422
100	42	78	2021-04-10 09:05:18.055747	2021-04-10 09:05:18.055747
101	42	79	2021-04-10 09:07:03.450321	2021-04-10 09:07:03.450321
102	43	80	2021-04-10 09:09:29.960221	2021-04-10 09:09:29.960221
103	43	81	2021-04-10 09:10:42.685481	2021-04-10 09:10:42.685481
104	44	82	2021-04-10 09:12:09.766575	2021-04-10 09:12:09.766575
105	44	83	2021-04-10 09:13:26.416303	2021-04-10 09:13:26.416303
106	45	84	2021-04-10 09:15:18.674019	2021-04-10 09:15:18.674019
107	45	85	2021-04-10 09:16:21.854614	2021-04-10 09:16:21.854614
108	46	86	2021-04-10 09:17:46.430064	2021-04-10 09:17:46.430064
109	46	87	2021-04-10 09:18:59.996171	2021-04-10 09:18:59.996171
110	47	88	2021-04-10 09:20:48.970162	2021-04-10 09:20:48.970162
111	47	89	2021-04-10 09:21:58.172391	2021-04-10 09:21:58.172391
112	48	90	2021-04-10 09:24:03.950258	2021-04-10 09:24:03.950258
113	48	91	2021-04-10 09:25:17.606942	2021-04-10 09:25:17.606942
114	49	92	2021-04-10 09:27:19.579124	2021-04-10 09:27:19.579124
115	49	93	2021-04-10 09:29:07.305186	2021-04-10 09:29:07.305186
118	51	94	2021-04-10 09:35:29.868002	2021-04-10 09:35:29.868002
119	51	95	2021-04-10 09:35:36.337236	2021-04-10 09:35:36.337236
120	50	96	2021-04-10 09:37:14.020557	2021-04-10 09:37:14.020557
121	50	97	2021-04-10 09:38:18.970571	2021-04-10 09:38:18.970571
122	52	98	2021-04-10 09:40:10.275443	2021-04-10 09:40:10.275443
123	52	99	2021-04-10 09:41:46.570279	2021-04-10 09:41:46.570279
124	53	100	2021-04-10 09:43:25.825999	2021-04-10 09:43:25.825999
125	53	101	2021-04-10 09:45:06.36765	2021-04-10 09:45:06.36765
126	54	102	2021-04-10 09:46:35.863792	2021-04-10 09:46:35.863792
127	54	103	2021-04-10 09:48:20.919802	2021-04-10 09:48:20.919802
129	55	1	2021-04-10 10:04:32.667317	2021-04-10 10:04:32.667317
131	55	15	2021-04-10 10:04:42.340085	2021-04-10 10:04:42.340085
133	56	94	2021-04-10 10:04:59.646751	2021-04-10 10:04:59.646751
134	56	95	2021-04-10 10:05:05.033229	2021-04-10 10:05:05.033229
135	56	31	2021-04-10 10:05:14.416909	2021-04-10 10:05:14.416909
136	55	19	2021-04-10 10:06:41.592825	2021-04-10 10:06:41.592825
\.


--
-- Data for Name: order_deliveries; Type: TABLE DATA; Schema: public; Owner: pat
--

COPY public.order_deliveries (id, order_id, address, full_name, phone, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: order_details; Type: TABLE DATA; Schema: public; Owner: pat
--

COPY public.order_details (id, order_id, product_id, amount, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: pat
--

COPY public.orders (id, user_id, status, total_amount, uuid, created_at, updated_at, reject_comment, expected_shipment_date, shipment_date, rejected_at, whodunit) FROM stdin;
\.


--
-- Data for Name: product_images; Type: TABLE DATA; Schema: public; Owner: pat
--

COPY public.product_images (id, product_id, file_data, created_at, updated_at, sort_order) FROM stdin;
1	1	image__1_.png	2021-04-10 06:11:25.360032	2021-04-10 06:11:25.360032	0
2	1	image.jpeg	2021-04-10 06:11:25.655459	2021-04-10 06:11:25.655459	0
3	1	image.png	2021-04-10 06:11:25.916065	2021-04-10 06:11:25.916065	0
4	2	image__1_.png	2021-04-10 06:17:11.252268	2021-04-10 06:17:11.252268	0
5	2	image__2_.png	2021-04-10 06:17:11.45315	2021-04-10 06:17:11.45315	0
6	2	image.jpeg	2021-04-10 06:17:11.745364	2021-04-10 06:17:11.745364	0
7	3	image.jpeg	2021-04-10 06:20:00.736133	2021-04-10 06:20:00.736133	0
8	4	image__1_.jpeg	2021-04-10 06:22:08.313611	2021-04-10 06:22:08.313611	0
9	4	image__2_.png	2021-04-10 06:22:09.124499	2021-04-10 06:22:09.124499	0
10	5	image__1_.png	2021-04-10 06:48:36.974077	2021-04-10 06:48:36.974077	0
11	6	image__1_.png	2021-04-10 06:51:59.038843	2021-04-10 06:51:59.038843	0
12	6	image__2_.png	2021-04-10 06:51:59.884009	2021-04-10 06:51:59.884009	0
13	6	image__3_.png	2021-04-10 06:52:00.779193	2021-04-10 06:52:00.779193	0
14	6	image.jpeg	2021-04-10 06:52:01.16089	2021-04-10 06:52:01.16089	0
15	7	90x90.png	2021-04-10 07:19:29.154491	2021-04-10 07:19:29.154491	0
16	8	image__1_.png	2021-04-10 07:21:48.031267	2021-04-10 07:21:48.031267	0
17	8	image__2_.png	2021-04-10 07:21:48.801026	2021-04-10 07:21:48.801026	0
18	9	image.jpeg	2021-04-10 07:24:34.410926	2021-04-10 07:24:34.410926	0
19	10	image__1_.png	2021-04-10 07:27:49.008762	2021-04-10 07:27:49.008762	0
20	11	image__1_.png	2021-04-10 07:30:48.375878	2021-04-10 07:30:48.375878	0
21	12	image__1_.png	2021-04-10 07:32:58.158084	2021-04-10 07:32:58.158084	0
22	13	image__1_.png	2021-04-10 07:35:05.047198	2021-04-10 07:35:05.047198	0
23	13	image.jpeg	2021-04-10 07:35:06.127381	2021-04-10 07:35:06.127381	0
24	14	image__1_.png	2021-04-10 07:38:04.76196	2021-04-10 07:38:04.76196	0
25	14	image__2_.png	2021-04-10 07:38:05.536684	2021-04-10 07:38:05.536684	0
26	14	image__3_.png	2021-04-10 07:38:06.210152	2021-04-10 07:38:06.210152	0
27	15	image__1_.png	2021-04-10 07:40:10.80656	2021-04-10 07:40:10.80656	0
28	15	image__2_.png	2021-04-10 07:40:11.757467	2021-04-10 07:40:11.757467	0
29	15	image__3_.png	2021-04-10 07:40:12.95505	2021-04-10 07:40:12.95505	0
31	17	image__1_.png	2021-04-10 07:46:38.341436	2021-04-10 07:46:38.341436	0
32	18	image__1_.png	2021-04-10 07:48:32.639517	2021-04-10 07:48:32.639517	0
33	19	image__1_.png	2021-04-10 07:50:42.244812	2021-04-10 07:50:42.244812	0
34	20	image__1_.png	2021-04-10 07:53:21.103443	2021-04-10 07:53:21.103443	0
35	20	image__2_.png	2021-04-10 07:53:22.005296	2021-04-10 07:53:22.005296	0
36	21	image__1_.png	2021-04-10 07:55:43.629475	2021-04-10 07:55:43.629475	0
37	21	image__2_.png	2021-04-10 07:55:45.109729	2021-04-10 07:55:45.109729	0
38	21	image__3_.png	2021-04-10 07:55:46.354338	2021-04-10 07:55:46.354338	0
39	22	image__1_.jpeg	2021-04-10 07:58:41.769018	2021-04-10 07:58:41.769018	0
40	22	image.jpeg	2021-04-10 07:58:43.128748	2021-04-10 07:58:43.128748	0
41	23	image__1_.png	2021-04-10 08:00:37.762575	2021-04-10 08:00:37.762575	0
42	23	image.jpeg	2021-04-10 08:00:38.522277	2021-04-10 08:00:38.522277	0
43	24	image__1_.png	2021-04-10 08:02:36.480425	2021-04-10 08:02:36.480425	0
44	24	image.jpeg	2021-04-10 08:02:37.192774	2021-04-10 08:02:37.192774	0
45	25	image__1_.png	2021-04-10 08:04:00.397166	2021-04-10 08:04:00.397166	0
46	26	image__1_.png	2021-04-10 08:06:01.618648	2021-04-10 08:06:01.618648	0
47	27	image__1_.png	2021-04-10 08:07:45.61712	2021-04-10 08:07:45.61712	0
48	28	image__1_.png	2021-04-10 08:11:28.184145	2021-04-10 08:11:28.184145	0
49	28	image.jpeg	2021-04-10 08:11:28.785907	2021-04-10 08:11:28.785907	0
50	29	image__1_.png	2021-04-10 08:13:01.892687	2021-04-10 08:13:01.892687	0
51	29	image.jpeg	2021-04-10 08:13:03.130151	2021-04-10 08:13:03.130151	0
52	30	image__1_.png	2021-04-10 08:15:12.457918	2021-04-10 08:15:12.457918	0
53	30	image.jpeg	2021-04-10 08:15:13.900827	2021-04-10 08:15:13.900827	0
54	31	image__1_.png	2021-04-10 08:16:45.896721	2021-04-10 08:16:45.896721	0
55	31	image.jpeg	2021-04-10 08:16:47.084443	2021-04-10 08:16:47.084443	0
56	32	image.png	2021-04-10 08:18:25.103624	2021-04-10 08:18:25.103624	0
57	33	image.png	2021-04-10 08:19:48.17048	2021-04-10 08:19:48.17048	0
58	34	image__1_.jpeg	2021-04-10 08:23:33.388725	2021-04-10 08:23:33.388725	0
59	34	image__2_.jpeg	2021-04-10 08:23:35.233737	2021-04-10 08:23:35.233737	0
60	34	image.jpeg	2021-04-10 08:23:36.058332	2021-04-10 08:23:36.058332	0
61	35	image__1_.jpeg	2021-04-10 08:25:27.945523	2021-04-10 08:25:27.945523	0
62	35	image__2_.jpeg	2021-04-10 08:25:29.517723	2021-04-10 08:25:29.517723	0
63	35	image.jpeg	2021-04-10 08:25:32.049275	2021-04-10 08:25:32.049275	0
64	36	image.png	2021-04-10 08:27:22.018932	2021-04-10 08:27:22.018932	0
65	37	image.png	2021-04-10 08:28:26.637648	2021-04-10 08:28:26.637648	0
66	38	image.jpeg	2021-04-10 08:31:35.249401	2021-04-10 08:31:35.249401	0
67	39	image__1_.png	2021-04-10 08:32:56.494801	2021-04-10 08:32:56.494801	0
68	40	image.jpeg	2021-04-10 08:34:14.772244	2021-04-10 08:34:14.772244	0
69	41	image__1_.jpeg	2021-04-10 08:36:52.994726	2021-04-10 08:36:52.994726	0
70	41	image__2_.jpeg	2021-04-10 08:36:53.951659	2021-04-10 08:36:53.951659	0
71	41	image.jpeg	2021-04-10 08:36:55.890099	2021-04-10 08:36:55.890099	0
72	42	image__1_.jpeg	2021-04-10 08:38:35.042631	2021-04-10 08:38:35.042631	0
73	42	image.jpeg	2021-04-10 08:38:35.607352	2021-04-10 08:38:35.607352	0
74	43	image__1_.png	2021-04-10 08:40:08.959801	2021-04-10 08:40:08.959801	0
75	44	image__1_.png	2021-04-10 08:41:26.185651	2021-04-10 08:41:26.185651	0
76	45	image__1_.jpeg	2021-04-10 08:46:52.111787	2021-04-10 08:46:52.111787	0
77	45	image.jpeg	2021-04-10 08:46:57.648186	2021-04-10 08:46:57.648186	0
109	78	image__1_.png	2021-04-10 09:05:18.448821	2021-04-10 09:05:18.448821	0
110	79	image.png	2021-04-10 09:07:03.78992	2021-04-10 09:07:03.78992	0
111	80	image__1_.png	2021-04-10 09:09:30.426387	2021-04-10 09:09:30.426387	0
112	81	image__2_.png	2021-04-10 09:10:43.382132	2021-04-10 09:10:43.382132	0
113	82	image.png	2021-04-10 09:12:10.114979	2021-04-10 09:12:10.114979	0
114	83	image__1_.png	2021-04-10 09:13:26.948135	2021-04-10 09:13:26.948135	0
115	84	image__1_.png	2021-04-10 09:15:19.003357	2021-04-10 09:15:19.003357	0
116	85	image__1_.png	2021-04-10 09:16:22.219054	2021-04-10 09:16:22.219054	0
117	86	image__1_.png	2021-04-10 09:17:46.806718	2021-04-10 09:17:46.806718	0
118	87	image__1_.png	2021-04-10 09:19:00.483121	2021-04-10 09:19:00.483121	0
119	88	image__1_.png	2021-04-10 09:20:49.459029	2021-04-10 09:20:49.459029	0
120	89	image__1_.png	2021-04-10 09:21:58.731273	2021-04-10 09:21:58.731273	0
121	90	image__2_.png	2021-04-10 09:24:04.230814	2021-04-10 09:24:04.230814	0
122	91	image__1_.png	2021-04-10 09:25:23.677872	2021-04-10 09:25:23.677872	0
123	92	image__1_.png	2021-04-10 09:27:21.19905	2021-04-10 09:27:21.19905	0
124	93	image__3_.png	2021-04-10 09:29:07.729091	2021-04-10 09:29:07.729091	0
125	94	image__1_.png	2021-04-10 09:31:13.608603	2021-04-10 09:31:13.608603	0
126	94	image__2_.png	2021-04-10 09:31:14.278173	2021-04-10 09:31:14.278173	0
127	94	image__3_.png	2021-04-10 09:31:15.121566	2021-04-10 09:31:15.121566	0
128	94	image__4_.png	2021-04-10 09:31:15.624347	2021-04-10 09:31:15.624347	0
129	95	image__6_.png	2021-04-10 09:34:30.335263	2021-04-10 09:34:30.335263	0
130	95	image__7_.png	2021-04-10 09:34:30.81923	2021-04-10 09:34:30.81923	0
131	95	image__8_.png	2021-04-10 09:34:31.333567	2021-04-10 09:34:31.333567	0
132	95	image__9_.png	2021-04-10 09:34:31.835302	2021-04-10 09:34:31.835302	0
133	95	image__10_.png	2021-04-10 09:34:32.362627	2021-04-10 09:34:32.362627	0
134	95	image__11_.png	2021-04-10 09:34:32.762727	2021-04-10 09:34:32.762727	0
135	95	image__12_.png	2021-04-10 09:34:33.237928	2021-04-10 09:34:33.237928	0
136	95	image__13_.png	2021-04-10 09:34:33.615369	2021-04-10 09:34:33.615369	0
137	95	image__14_.png	2021-04-10 09:34:34.025882	2021-04-10 09:34:34.025882	0
138	96	image__1_.png	2021-04-10 09:37:14.405417	2021-04-10 09:37:14.405417	0
139	96	image.jpeg	2021-04-10 09:37:14.744352	2021-04-10 09:37:14.744352	0
141	98	image__1_.jpeg	2021-04-10 09:40:10.482658	2021-04-10 09:40:10.482658	0
142	98	image__2_.jpeg	2021-04-10 09:40:10.798493	2021-04-10 09:40:10.798493	0
146	100	image__1_.png	2021-04-10 09:43:26.126306	2021-04-10 09:43:26.126306	0
150	102	image__1_.jpeg	2021-04-10 09:46:39.030116	2021-04-10 09:46:39.030116	0
151	102	image__4_.png	2021-04-10 09:46:39.502568	2021-04-10 09:46:39.502568	0
140	97	image.jpeg	2021-04-10 09:38:19.186594	2021-04-10 09:38:19.186594	0
143	99	image__1_.jpeg	2021-04-10 09:41:46.799788	2021-04-10 09:41:46.799788	0
144	99	image__2_.jpeg	2021-04-10 09:41:47.018696	2021-04-10 09:41:47.018696	0
145	99	image.jpeg	2021-04-10 09:41:47.25863	2021-04-10 09:41:47.25863	0
147	101	image__1_.png	2021-04-10 09:45:06.642358	2021-04-10 09:45:06.642358	0
148	101	image__2_.png	2021-04-10 09:45:07.000924	2021-04-10 09:45:07.000924	0
149	101	image.jpeg	2021-04-10 09:45:07.243623	2021-04-10 09:45:07.243623	0
152	103	image__1_.png	2021-04-10 09:48:22.740113	2021-04-10 09:48:22.740113	0
153	103	image__2_.png	2021-04-10 09:48:23.285354	2021-04-10 09:48:23.285354	0
154	103	image.jpeg	2021-04-10 09:48:24.485025	2021-04-10 09:48:24.485025	0
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: pat
--

COPY public.products (id, name, is_public, price, description, created_at, updated_at, dimension_x, dimension_y, dimension_z, amount, card_image, color, material) FROM stdin;
15	WIRE - Chair - Matt black and black leather	t	55	The WIRE metal dining chair is giving us all the coolest vibes. It features a geometric pattern on the backrest to elevate this design and make this dining chair anything but basic. Strong and sturdy, the metal frame will last through endless nights of gossiping with your squad over a few bia Saigon. And we added a seat cushion for you to get comfy. What more could you want?	2021-04-10 07:40:09.982203	2021-04-10 07:40:09.982203	44	57	75	11	image.png	Black, Matt black	Metal, Textile leather cushion
18	JOHNSON - Chest of drawers L100xH85 - Matt black metal and washed antic	t	800	Style and storage all in one. Give your bedroom a stylish new upgrade while adding the convenient storage space that you need with this 6-drawer chest from the JOHNSON Collection. This industrial-inspired dresser features six spacious drawers that open and closes on smooth metal runners. These large drawers are ideal for stowing away a variety of different items like stacks of denim jeans and button-up shirts to cozy sweatpants and your collection of t-shirts. You can find a place for all your things!	2021-04-10 07:48:31.36871	2021-04-10 07:48:31.36871	100	45	85	2	image.png	Matt black, Washed antic	Acacia, Meta
20	HELSINKI - Dressing table L115xH75 - Natural oak and white lacquer	t	300	Who hasn't dreamed of giving their bedroom that boudoir feel with a pretty dressing table? You'll be amazed by the HElSINKI Collection dressing table with its drawer! Ideal for a feminine and modern bedroom, this wooden dressing table reinvents the notion of modern furniture in the most subtle and refined of ways. Featuring an impressive round mirror on top, it also has a niche for subtly storing your jewellery or cosmetics tidily away.	2021-04-10 07:53:20.181246	2021-04-10 07:53:20.181246	115	48	75	2	image.png	Natural oak, White lacquer	Oak
22	MESH - Wall Shelf L50xH60 - Mint metal	t	45	Make your home feel like an Art Deco masterpiece with the MESH Collection Shelving Unit. Its geometric prints and rounded edges will bring a pleasingly original retro note to your living room. We have played around with contemporary lines and vintage style to create an all-metal piece that will awaken your curiosity and steal your heart. This shelving unit has been made for your kitchen or bathroom. Available in Gold, Mint, Black and White finish. We're big fans of multi-functional designs, what about you?	2021-04-10 07:58:40.904487	2021-04-10 07:58:40.904487	50	25	60	22	image.png	Mint	50Metal
21	HELSINKI - Dressing table L115xH75 - Washed antic and white lacquer	t	360	Who hasn't dreamed of giving their bedroom that boudoir feel with a pretty dressing table? You'll be amazed by the HElSINKI Collection dressing table with its drawer! Ideal for a feminine and modern bedroom, this wooden dressing table reinvents the notion of modern furniture in the most subtle and refined of ways. Featuring an impressive round mirror on top, it also has a niche for subtly storing your jewellery or cosmetics tidily away.	2021-04-10 07:55:41.706568	2021-04-10 07:55:41.706568	115	48	75	13	image.png	Washed antic, White lacquer	Acacia
23	KEANE - Shelf L60xH82 - Vintage anthracite and whitened acacia	t	150	Staying organized has never been easier with the 3 Tier Vintage Anthracite Shelf. This tiny open shelf unit on cast simplifies your living space giving you easy access to storage. This storage unit is perfect for the kitchen, basement, garage, office or anywhere that extra storage space is needed. You can move it easily with its cast, it does not get more convenient than this!	2021-04-10 08:00:36.608011	2021-04-10 08:00:36.608011	60	28	82	12	image.png	Vintage anthracite, Whitened acacia	Acacia, Metal
27	PIA - Wall Towel bar L50 - Natural acacia	t	23	The PIA Towel Bar is decorative and functional, making it perfect for your home. Made of natural acacia, this brown towel bar is built to last, helping you with your everyday household activities.	2021-04-10 08:07:44.33902	2021-04-10 08:07:44.33902	50	13	5	40	image.png	Natural acacia	Acacia
31	YANIS - Desk L120xH60 - White and black metal	t	680	With its sleek lines, this desk in wood and metal will fit right into your bedroom or living room. For storage, this industrial style desk is fitted with three drawers. Design detail: the elevated work definiely gives some unique style to this desk. Our tip: complete your storage with some compartments.	2021-04-10 08:16:44.806659	2021-04-10 08:16:44.806659	120	60	76	15	image.png	Black, White	Acacia, Meta
35	STAR - Kids Chair - Seat H30 - Pearl grey	t	50	A fan of MONTESSORI Education ? This STAR Kids Chair is unique and playful, it becomes an icon in every kid’s space whether indoor or outdoor. It is a safe and comfortable friend as well. Its singularity is based on its shape, far away from any type of excess that seeks simplicity and resistance as time goes by.	2021-04-10 08:25:26.061083	2021-04-10 08:25:26.061083	28	35	58	15	image.png	Pearl grey, White	Acacia
17	ALES - Double Bed - 160x200 - Brocante grey	t	700	There's nothing better than a comfy bed for a good night's sleep! This double bed is fitted with a high headboard to properly rest against. Strength and beauty is guaranteed with a wood frame and reinforced legs. Offered in three sizes to fit your preference: 140cm, 160cm and 180 cm.\r\n\r\nBed comes disassembled so it can be conveniently shipped right to your door, and it comes with simple instructions to easily assemble with the help of a partner.	2021-04-10 07:46:37.458986	2021-04-10 07:46:37.458986	218	174	127	3	image.png	Brocante white	Acacia
19	VALERIAN - Chest of drawers L112xH128 - White	t	450	Simple, sleek, and stylish, the VALERIAN Collection chest will provide the storage space you need in your room. The chest is crafted from acacia wood, available in a different finishes, and includes a total of six storage drawers that are ideal for storing your essentials. The classical look that will add timeless flair to your space.	2021-04-10 07:50:41.217191	2021-04-10 07:50:41.217191	112	47	128	3	image.png	White	Acacia
25	TAIS - Laundry basket DIAM35xH50 - Gold and cream canvas bag	t	45	This TAIS Collection Laundry Basket brings style to your dirtiest days. When its time to do your laundry, the durable steel frame with golden finish hold up to the task with his round shape and geometrical design. And while its unlikely you'll ever really adore your chores, at least the look of this hamper brings a smile to your face while you fluff and fold your clothes.	2021-04-10 08:03:59.18735	2021-04-10 08:03:59.18735	35	35	35	22	image.png	Cream, Gold	Acacia, Canvas bag 
29	SPRING - Sideboard L90 - Whitened acacia, natural cane and metal legs	t	340	Casual, bohemian, with a lot of global influence. Vintage-style doors, whitened acacia finish and a handy, compact size. SPRING Collection's ticking all our boxes. This sideboard perfect for keeping all your stuff in one place. We love it, don't you ?\r\n\r\n	2021-04-10 08:13:00.156281	2021-04-10 08:13:00.156281	90	45	75	6	image.png	Natural cane, Vintage brass, Whitened acacia	Acacia, Metal
33	OSLO - Office storage W70xH79 - White	t	480	A drawer unit you will be proud of. With a clean look that’s easy to like and mix with other styles, either supporting a desk or standing alone. The back is finished so you can place it in the middle of the room – all sides are just as beautiful. And plenty of storage indside to make your home office days as if it was in your real office, but without your colleagues!\r\n\r\n	2021-04-10 08:19:47.031315	2021-04-10 08:19:47.031315	70	40	79	20	image.png	Natural oak, White lacquer	Oak
42	ENZO - Kids Table H50 - Pearl grey metal	t	120	The ENZO Collection Outdoor Table is ideal for enjoying a picnic, playing games or simply visiting on beautiful days. Perfectly kid-sized and constructed from weather-resistant coated metal with a beautiful color finish, this table will look good for years to come. Birthday parties, outdoor activities or summer camp will be a success thans to this beautiful looking table! ❤️💚💛	2021-04-10 08:38:34.300388	2021-04-10 08:38:34.300388	50	50	53	22	image.png	Pearl grey	Metal
78	CHAMONIX - Drift wood tea-light candle holder H5	t	2		2021-04-10 09:05:18.049622	2021-04-10 09:05:18.049622	5	5	5	50	image.png	Drift wood	Wood
79	SALTILLO - Wrought iron candle holder H36 - Burnish	t	15		2021-04-10 09:07:03.448015	2021-04-10 09:07:03.448015	36	23	36	40	image.png	Burnish	Metal
98	DALLAS - Rectangular Tray 55x35 - Brocante white	t	25	When decorating your home, it’s always considered a touchdown when something is both fashionable and functional – like this decorative tray for example! Two handles offer easy mobility, and give you a hand when carrying various household items on this piece. Its solid wood offers a natural look to your arrangement, while his color gives it a dash of contemporary appeal. It’s the perfect addition to any room in your home	2021-04-10 09:40:10.262631	2021-04-10 09:40:10.262631	55	35	6	22	image__1_.png	Brocante white, Burnish	Acacia, Metal
100	RIELLEY - Rectangular basket L35xW23 - Mint	t	29		2021-04-10 09:43:25.824169	2021-04-10 09:43:25.824169	35	23	17	21	image.png	Mint	Metal
102	HOTEL - Glass wine glass	t	4		2021-04-10 09:46:35.856374	2021-04-10 09:46:35.856374	8	8	22	66	image__3_.png	Transparent	Glass
1	LOHJA - Armchair L110 - Natural oak and light grey cushions	t	800	This LOHJA Collection 3 Seater Sofa Set is a beautiful addition to your home. This sofa set is a fantastic way to enjoy drinks with friends and family. It is made from natural oak wood ensuring durability and a charming, warm finish, with a reclined backrest guaranteeing a comforting, relaxing feel when seated. Whether it's for occasional or everyday use, this 3 Seater Sofa is perfect for inviting a guest to your home. Our tips : pair it with the LOHJA 1-seater sofa for a full set!	2021-04-10 06:11:25.098589	2021-04-10 06:11:25.098589	190	78	83	5	asd.png	Light grey, Natural oak	Fabric cushion, Oak
2	LOHJA - Armchair L110 - Natural oak and light grey cushions	t	250	Add instant design credibility to your space with this armchair from the LOHJA Collection. Built on a sturdy natural oak base, this unique chair combines the natural beauty of rattan-effect chair with a curved back and arms designed for maximum comfort.	2021-04-10 06:17:11.01399	2021-04-10 06:17:11.01399	110	78	83	10	image.png	Light grey, Natural oak	Fabric cushion, Oak
3	DOME - Shelf H150 - Gold metal	t	200	Make your home feel like an Art Deco masterpiece with the DOME Collection Shelving Unit. Its rounded edges will bring a pleasingly original retro note to your living room. We have played around with contemporary lines and vintage style to create an all-metal piece that will awaken your curiosity and steal your heart. This shelving unit would be perfect for your kitchen or for storing your favourite items. It'd also work beautifully in a dining room, but also in a bedroom or right in your hallway. Available in Gold, Mint or White finish. We're big fans of multi-functional designs, what about you?	2021-04-10 06:20:00.46482	2021-04-10 06:20:00.46482	40	40	150	4	image.png	Gold	Metal
4	AMELIA - Shelf L60xH70 - Gold metal	t	230	Make your home feel like an Art Deco masterpiece with the AMELIA Collection Shelving Unit. Its geometric prints and rounded edges will bring a pleasingly original retro note to your living room. We have played around with contemporary lines and vintage style to create an all-metal piece that will awaken your curiosity and steal your heart. This shelving unit would be perfect for displaying collectables or storing your favourite books. It'd work beautifully in a dining room, but also in a bedroom or right in your hallway. Available in Gold, Mint or White finish. We're big fans of multi-functional designs, what about you?	2021-04-10 06:22:08.090506	2021-04-10 06:22:08.090506	60	30	70	4	image__1_.png	Gold	Metal
5	JOHNSON - Bookcase L60xH200 - Matt black metal and washed antic	t	380	Keep essential reading material at the ready on this bookcase or use it to display collectibles and other beloved treasures. Construction from wood and metal makes it tough enough for everyday use, and the industrial black-solid wood finishes create an elegant look ideal for bedrooms and living rooms alike.	2021-04-10 06:48:36.737668	2021-04-10 06:48:36.737668	60	38	200	3	image.png	Matt black, Washed antic	Acacia, Metal
6	SPRING - Bookcase L100xH190 - Whitened acacia, natural cane and metal legs	t	450	Looking for a practical yet attractive way to store your things? Then you're sure to love the SPRING natural cane Bookcase. Sophisticated yet inviting, it'll win you over with its vintage look and generous storage space. The golden colour of the whitened acacia will create a cosy atmosphere and make the room feel peaceful.	2021-04-10 06:51:58.323766	2021-04-10 06:51:58.323766	100	35	190	2	image.png	Natural cane, Vintage brass, Whitened acacia	Acacia, Metal
7	JOHNSON - Bookcase L110xH150 - Matt black metal and washed antic	t	500	Keep essential reading material at the ready on this bookcase or use it to display collectibles and other beloved treasures. Construction from wood and metal makes it tough enough for everyday use, and the industrial black-solid wood finishes create an elegant look ideal for bedrooms and living rooms alike.	2021-04-10 07:19:27.937155	2021-04-10 07:19:27.937155	110	44	150	3	image.png	Matt black, Washed anti	Acacia, Metal
8	MARTY - Bar unit H110 - White and washed antic	t	850	This elegant midcentury wooden bar unit has room for all your bottles and glasses, offering both open display space and closed cabinets. Made from the highest quality materials. You'll love this piece as much as we do.	2021-04-10 07:21:46.89971	2021-04-10 07:21:46.89971	183	54	110	2	image.png	Washed antic, White	Acacia
9	JUDITH - Bar cage H170 - Burnish metal and patina white	t	499	The JUDITH iron bar is a must have and multi-functional piece. Combining the beautiful modern design with a metal frame and burnish finish. The Bar cage houses large glass storage rack above with a six bottle rack for wine or liquor in the middle. Below you'll find countless storage for bottles to serve all of your guests.	2021-04-10 07:24:33.355967	2021-04-10 07:24:33.355967	50	50	170	3	image.png	Burnish, Patina white	Acacia, Metal
10	ISLAND - Counter H110 - Whitened acacia and vintage anthracite	t	1000	Dashing, bold design and an abundance of storage options give this bar unit a welcome presence in any space. The rich finish on a sleek, stunning frame is perfectly suited to a dining room or serving area, and the open cupboards allow you to show off your finest china and bottles.	2021-04-10 07:27:47.635895	2021-04-10 07:27:47.635895	220	70	110	2	image.png	Vintage anthracite, Whitened acacia	Acacia, Metal
11	ELTON - Bench L116 - Matt black metal	t	999	The most perfect little bench in a gorgeous matt black metal finish. A must have for that farmhouse look that will never go out of style. Versatile size for multi-uses.	2021-04-10 07:30:47.182002	2021-04-10 07:30:47.182002	116	36	45	3	image.png	Matt black	Metal
99	DALLAS - Rectangular Tray 55x35 - Brocante pearl grey	t	30	When decorating your home, it’s always considered a touchdown when something is both fashionable and functional – like this decorative tray for example! Two handles offer easy mobility, and give you a hand when carrying various household items on this piece. Its solid wood offers a natural look to your arrangement, while his color gives it a dash of contemporary appeal. It’s the perfect addition to any room in your home 	2021-04-10 09:41:46.568339	2021-04-10 09:41:46.568339	55	35	6	15	image.png	Brocante pearl grey, Burnish	Acacia, Metal
12	TIKO - Bench L165 - White and natural acacia	t	1100	The cozy, farmhouse vibe can be easily achieved with this rustic, country style dining bench in your dining area. This bench brings incredible aesthetics to your space as it showcases a natural tone finish and beautiful wood knot details for an authentic appearance.\r\n\r\n	2021-04-10 07:32:57.169283	2021-04-10 07:32:57.169283	165	32	46	3	image.png	Natural acacia, White	Acacia
13	ORLEANS - Bench L110 - Brocante white and dark grey fabric	t	1500	Add some decorative seating to your home with this desert bench. The bench is constructed with one shelf and is made with solid acacia wood. The padded seat gives you all of the cushion and support you could want.	2021-04-10 07:35:04.058653	2021-04-10 07:35:04.058653	110	37	45	3	image.png	Brocante white, Dark Grey	Acacia, Fabric
14	SENS - Chair - Walnut stain	t	2100	Seat yourself around your dining room table with chairs of impressive style and comfortable durability. Featuring elegant curves and iconic mid-century modern splayed legs, our dining chairs are a great addition to any home beautifully finished walnut wood frames. Whether you are inviting guests over for a friendly meal or just settling down with your family, these chairs bring a simple yet stunning atmosphere to your dining set so that you can enjoy every meal in impeccable style.	2021-04-10 07:38:03.469953	2021-04-10 07:38:03.469953	43	55	80	3	image.png	Walnut stain	Oak
24	DECK - Laundry basket L45xH65 - Washed antic and cream canvas bag	t	80	Built with a simple and classic design, this wood-finished clothes basket includes an internal bag for easy dirty clothes transporting. The hamper constructed with natural acacia and finished in washed antic color for a durable build and long-lasting life. Resist to humidity and has a large clothing capacity.	2021-04-10 08:02:34.641497	2021-04-10 08:02:34.641497	45	45	65	18	image.png	Cream, Washed antic	Acacia, Canvas bag
26	ARONDE - Towel Stand L76 - Patina white	t	35	This sleek old white towel rack makes towel storage so simple and stylish. Its rust-resistant finish makes this pedestal towelrack a piece you will have for many years to come and because the towel rack has a handy size, you have great versatility when deciding where to place it.	2021-04-10 08:06:00.438168	2021-04-10 08:06:00.438168	76	38	92	33	image.png	Patina white	Metal
30	LISANDRO - Desk L120xW60 - Brocante white and washed antic	t	360	The LISANDRO Collection Desk is a chic and comfortable spot for productivity. It features clean lines in a sleek Mid-Century inspired design. Drawer fronts and legs feature a great and unique storage design. Two drawers provide ample room for a tablet, pens, paper and other home office essentials. What else do we need ?	2021-04-10 08:15:11.548611	2021-04-10 08:15:11.548611	120	60	75	8	image.png	Brocante white, Washed antic	Acacia
34	STAR - Kids Table H50 - Pearl grey	t	120	Art projects, tea parties, and snack time are all the more fun with the STAR Kids Table and Chair Set. Stylishly simple,and featuring a sturdy wood construction, your kids will love to play on this table and chair set for years to come. For all parents who home school their children, we think you just found your new best friend! The ideal solution for kids’ playrooms, nursery rooms or even in the living room. Available in multiple color, the Ramona is both a fun piece for your children and a functional solution for you!	2021-04-10 08:23:30.80868	2021-04-10 08:23:30.80868	60	60	50	14	image.png	Pearl grey	Acacia
38	TIPI - Single bed 100x200 - White and natural beech	t	380	It's a teepee, a tent and a bed all in one. Our Teepee Collection Bed combines all the comfiness of an actual kids bed with the playful adventure of a teepee. With a two-tone construction that highlights the wood's natural grain, it's the perfect blend of function and fun. The cutout side panels keep everything open and fun. He'll love it, you have our word on that!	2021-04-10 08:31:34.770482	2021-04-10 08:31:34.770482	226	115	177	6	image.png	Natural beech, White	Beech wood 
43	ELLIOT - Double bed 180x200 - Washed antic	t	900	There's nothing better than a comfy bed for a good night's sleep! This double bed is fitted with a high headboard to properly rest against. Strength and beauty is guaranteed with a wood frame and reinforced legs. Offered in three sizes to fit your preference: 140cm, 160cm and 180 cm.\r\n\r\nBed comes disassembled so it can be conveniently shipped right to your door, and it comes with simple instructions to easily assemble with the help of a partner.\r\n	2021-04-10 08:40:07.698312	2021-04-10 08:40:07.698312	220	190	110	6	image.png	Washed antic	Acacia
36	PEAR - Chest of drawer/Changing table L100 - White	t	350	Our PEAR 3-Drawer Dresser has made it easier than ever to create the right look right away for any room in your home. The stunning, white finish allows the dresser to coordinate with your other furniture and decor, while still standing out on its own. It features three spacious drawers, so it's as practical as it is stylish.	2021-04-10 08:27:21.165024	2021-04-10 08:27:21.165024	100	75	100	23	image__1_.png	White	Acacia
39	JOHNSON - Single Bed 100x200 - Matt black metal and washed antic	t	350	Our JOHNSOON Bed might have a simple design, but that doesn't mean it lacks style. This elegant metal bed features an wood headboard with a low footboard. And it comes in one black striking finishes, so it will lend the perfect touch of style to any bedroom.	2021-04-10 08:32:55.858676	2021-04-10 08:32:55.858676	210	106	100	8	image.png	Matt black, Washed antic	Acacia, Metal 
44	ALES - Twin Bed 120x200 - White	t	350	Designed with versatility and value in mind, this refreshingly simple white bed is defined by clean lines and effortless style. Its transitional design allows it to work well with decor that's contemporary, classic or eclectic. Plus, it can be accessorized with neutral bedding or more colorful designs. To put it simply, it makes furnishing kids rooms a real no-brainer. We love it, don't you ?	2021-04-10 08:41:25.493767	2021-04-10 08:41:25.493767	215	133	110	9	image.png	White	Acacia
45	MERRYL - Closet L90xH192 - Chinese Mint	t	900	Let yourself be won over by the classic lines of the MERRYL Collection 1-Door Wardrobe. Its mint colour modernises a timeless design for a look inspired by the boho chic trend. Inside, many shelves will allow you to stack your jumpers and trousers. This wardrobe is perfect for compulsive organisers!	2021-04-10 08:46:51.492517	2021-04-10 08:46:51.492517	195	55	200	8	image.png	Vintage anthracite, Washed antic	Acacia
28	ALEX - Pantry L50 - Brocante white	t	350	The ALEX Collection is a stylish way to stay on top of your kitchen organization. The rustic barn style design features a metal mesh door for a unique look and modern touch. Open up the door to 1 spacious shelve to store things you want out of sight! Great little addition to your kitchen, don't you think ?\r\n\r\n	2021-04-10 08:11:26.966511	2021-04-10 08:11:26.966511	50	38	85	6	image.png	Brocante white	Acacia
32	OSLO - Office unit L40xH66 - Natural oak	t	280	The OSLO Collection Office Pedestral is the perfect organizational tool for your home office, craft corner, or college dorm. Enjoy easy mobility on optional-casters add-on. The Cabinet is made of sturdy natural oak wood in a clean finish that will brighten any space.	2021-04-10 08:18:24.153012	2021-04-10 08:18:24.153012	40	40	66	22	image.png	Natural oak	Oak
37	PEAR - Changing board L55xW75 - White	t	35	Add the LAURA Changing Table Topper to any dresser and you'll instantly have a fully functional changing table for your nursery. Best of all, when it's time to say goodbye to diaper days, it simply removes to convert back to a kids dresser. Practical, right ?	2021-04-10 08:28:26.131943	2021-04-10 08:28:26.131943	55	75	10	23	image.png	White	Acacia
40	DOME - Wall Shelf H90 - Gold metal	t	55	Make your home feel like an Art Deco masterpiece with the DOME Collection Shelving Unit. Its rounded edges will bring a pleasingly original retro note to your living room. We have played around with contemporary lines and vintage style to create an all-metal piece that will awaken your curiosity and steal your heart. This shelving unit would be perfect for your bathroom or storing your favourite items. It'd also work beautifully in a dining room, but also in a bedroom or right in your hallway. Available in Gold, Mint or White finish. We're big fans of multi-functional designs, what about you?	2021-04-10 08:34:14.102633	2021-04-10 08:34:14.102633	40	20	90	12	image.png	Gold	Metal
41	ENZO - Kids Chair - Seat H30 - Pearl grey metal	t	50	Perfect for pulling up to a desk or craft table, a chair like this is a great option for giving your little one's playroom a touch of what's trending while also giving them a handy perch. Crafted from metal with a solid-color finish. Designed for the outdoor with its rust-resistant finish, it's a great option for indoor use as well. Your child will love the colorful and confortable seat this chair provides - guaranteed !	2021-04-10 08:36:52.017519	2021-04-10 08:36:52.017519	40	40	59	22	image.png	Pearl grey	Metal
80	ORENBURG - Metal candle holder H37 - White	t	25		2021-04-10 09:09:29.958421	2021-04-10 09:09:29.958421	14	14	37	40	image__1_.png	White	Glass, Metal 
81	KINGSTON - Rectangular lantern H23 - Rose gold	t	40		2021-04-10 09:10:42.683116	2021-04-10 09:10:42.683116	10	10	23	60	image__2_.png	Rose gold	Glass, Metal
82	AUTUMN - Wrought iron magasine rack - Burnish	t	30		2021-04-10 09:12:09.763916	2021-04-10 09:12:09.763916	50	40	53	20	image.png	Burnish	Metal
83	NOD - Wooden magasine rack - Washed antic	t	28		2021-04-10 09:13:26.414452	2021-04-10 09:13:26.414452	30	26	41	20	image__1_.png	Washed antic	Acacia
84	ALVORD - Rug in polyesther 160x230 - Grey	t	420		2021-04-10 09:15:18.67188	2021-04-10 09:15:18.67188	160	230	1	10	image.png	Grey	PET
85	PARCIA - Rug in viscose 120x180 - Steel color	t	380		2021-04-10 09:16:21.852815	2021-04-10 09:16:21.852815	120	180	1	10	image.png	Steel	Viscose
86	REDWOOD - Green pendant lamp Diam35	t	50		2021-04-10 09:17:46.426991	2021-04-10 09:17:46.426991	35	35	30	10	image.png	Blue	Iron
87	YEN - Golden star pendant lamp H152	t	25		2021-04-10 09:18:59.994485	2021-04-10 09:18:59.994485	32	32	35	23	image.png	Gold	Iron
88	BERENICE - Star balls light 4m long with 220V plug - Warm LED lights	t	15		2021-04-10 09:20:48.965732	2021-04-10 09:20:48.965732	400	0	0	45	image.png	Gold	Metal
89	LUCERNE - White fairy light 16m long - 200 warm LED lights	t	20		2021-04-10 09:21:58.170709	2021-04-10 09:21:58.170709	1600	0	0	33	image.png	White	Plastic
90	FAN - Table clock H44 - Black or White	t	45	Featuring a distressed finish, this antiqued clock is an affordable alternative to restoring an old time-teller. A perfect accent piece in any ensemble, this tabletop clock offers a touch of old-world style with its broken-in look and rustic qualities. With large black numbers that are easy to read, this analog clock is both functional and decorative. It will fit nicely on your mantel, desk, or bookshelf.	2021-04-10 09:24:03.948194	2021-04-10 09:24:03.948194	35	14	44	12	image.png	Multicolor	Metal
91	SEDAN - Petrol table clock H37 - Red and black	t	45	Featuring a distressed finish, this antiqued clock is an affordable alternative to restoring an old time-teller. A perfect accent piece in any ensemble, this tabletop clock offers a touch of old-world style with its broken-in look and rustic qualities. With large black numbers that are easy to read, this analog clock is both functional and decorative. It will fit nicely on your mantel, desk, or bookshelf.	2021-04-10 09:25:17.603763	2021-04-10 09:25:17.603763	2	11	37	25	image.png	Multicolor	Metal
92	ZEI - Table mirror H30 - Gold and black marble	t	38	This table mirror is sleek and understated in design, giving you a beautifully crafted looking glass that you can use every day. Bordered by a thin, bevelled edge, this attractive mirror will is perfect for standing neatly atop your dressing table or desk to open up the room and help you get ready for the day ahead.	2021-04-10 09:27:19.573284	2021-04-10 09:27:19.573284	18	17	17	22	image.png	Black, Gold	Marble, Metal Colors: Black, Gold
93	DIANE - Mirror with shelf L76xH89 - Patina mint	t	1200	Perfect to greet you in an entryway, placed above a mantle, or on any wall in your home this mirror will add just the right amount of character to your home. The attention to detail on the wooden frame will catch your eye at every glance.	2021-04-10 09:29:07.303713	2021-04-10 09:29:07.303713	76	13	89	8	image__2_.png	Patina mint	Acacia
94	CHO - Printed canvas L57xH62 - Various designs, select the one you like	t	35		2021-04-10 09:31:13.027257	2021-04-10 09:31:13.027257	57	2	62	32	image.png	Multicolor	Fabric
95	ETHNIC - Printed canvas with ethnics women L90xH95	t	600		2021-04-10 09:34:29.850511	2021-04-10 09:34:29.850511	90	2	95	8	image__5_.png	Multicolor	90Fabric
96	LIFE - Memo board L40xH50 - Black metal	t	35	Keep your home clean and organised in a beautiful way with this memo board wall shelve. Contemporary mesh design adds style, efficiency and productivity to your desktop.	2021-04-10 09:37:14.018888	2021-04-10 09:37:14.018888	30	6	50	9	image.png	Black	Metal
97	CUBE - Cube frame L67xH45 - Black metal	t	15	Keep your home stylish and modern montage metal frame. Contemporary metal design adds style, efficiency and productivity to your walls.\r\n\r\n	2021-04-10 09:38:18.966974	2021-04-10 09:38:18.966974	67	1	45	13	image.png	Black	Metal
101	BRION - Stackable wine rack L46 - Black	t	35	If you like modern look, don't hesitate to introduce this metal stackable wine to your house! The funcationality and design of this wine rack will match almost any decor and look great on any wall in your home. Perfect to store a lot of wine bottles, also an awesome organization system when it comes to something bottled.	2021-04-10 09:45:06.365942	2021-04-10 09:45:06.365942	46	18	14	23	image.png	Black	Metal
103	VICTOR - Glass carafe with spout H16	t	10		2021-04-10 09:48:20.917891	2021-04-10 09:48:20.917891	10	10	16	80	image.png	Transparent	Glass
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: pat
--

COPY public.schema_migrations (version) FROM stdin;
20210323113740
20210323114205
20210323133159
20210323133233
20210323133710
20210325033049
20210325063047
20210325063152
20210326022831
20210326022850
20210326022936
20210326022943
20210326023055
20210326063116
20210327050814
20210329150930
20210329151001
20210331135910
20210331140512
20210402025701
20210402043138
20210402143517
20210402144920
20210403095104
20210403114029
20210404055958
20210404062643
20210404070921
20210404112248
20210404131711
20210407134819
20210410045852
20210410095554
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: pat
--

COPY public.users (id, email, password, full_name, address, phone, age, role, created_at, updated_at, gender, password_digest) FROM stdin;
1	datlp2796@gmail.com	\N	Lê Phước Đạt	39 Nguyễn Thị Diệu P6 Q3	0987654321	25	0	2021-04-10 04:55:43.502314	2021-04-10 04:55:43.502314	\N	$2a$12$Y031oK28W1RkgpwwhO.T7Oidu9F7YEr5ljyHxp7hE61qG7dG2ZdB2
2	admin@example.com	\N	Admin	\N	\N	\N	\N	2021-04-10 04:56:13.207189	2021-04-10 04:56:13.207189	\N	$2a$12$TkVOgqJ3GiKP3HfoyzTak./33jF09qiq9vPox0MfiUpQ6sIWbTMuW
\.


--
-- Name: banners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pat
--

SELECT pg_catalog.setval('public.banners_id_seq', 4, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pat
--

SELECT pg_catalog.setval('public.categories_id_seq', 58, true);


--
-- Name: category_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pat
--

SELECT pg_catalog.setval('public.category_products_id_seq', 136, true);


--
-- Name: order_deliveries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pat
--

SELECT pg_catalog.setval('public.order_deliveries_id_seq', 1, false);


--
-- Name: order_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pat
--

SELECT pg_catalog.setval('public.order_details_id_seq', 1, false);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pat
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- Name: product_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pat
--

SELECT pg_catalog.setval('public.product_images_id_seq', 154, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pat
--

SELECT pg_catalog.setval('public.products_id_seq', 103, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pat
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: pat
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: banners banners_pkey; Type: CONSTRAINT; Schema: public; Owner: pat
--

ALTER TABLE ONLY public.banners
    ADD CONSTRAINT banners_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: pat
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: category_products category_products_pkey; Type: CONSTRAINT; Schema: public; Owner: pat
--

ALTER TABLE ONLY public.category_products
    ADD CONSTRAINT category_products_pkey PRIMARY KEY (id);


--
-- Name: order_deliveries order_deliveries_pkey; Type: CONSTRAINT; Schema: public; Owner: pat
--

ALTER TABLE ONLY public.order_deliveries
    ADD CONSTRAINT order_deliveries_pkey PRIMARY KEY (id);


--
-- Name: order_details order_details_pkey; Type: CONSTRAINT; Schema: public; Owner: pat
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: pat
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: product_images product_images_pkey; Type: CONSTRAINT; Schema: public; Owner: pat
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT product_images_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: pat
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: pat
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: pat
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_category_products_on_category_id; Type: INDEX; Schema: public; Owner: pat
--

CREATE INDEX index_category_products_on_category_id ON public.category_products USING btree (category_id);


--
-- Name: index_category_products_on_product_id; Type: INDEX; Schema: public; Owner: pat
--

CREATE INDEX index_category_products_on_product_id ON public.category_products USING btree (product_id);


--
-- Name: index_order_deliveries_on_order_id; Type: INDEX; Schema: public; Owner: pat
--

CREATE INDEX index_order_deliveries_on_order_id ON public.order_deliveries USING btree (order_id);


--
-- Name: index_order_details_on_order_id; Type: INDEX; Schema: public; Owner: pat
--

CREATE INDEX index_order_details_on_order_id ON public.order_details USING btree (order_id);


--
-- Name: index_order_details_on_product_id; Type: INDEX; Schema: public; Owner: pat
--

CREATE INDEX index_order_details_on_product_id ON public.order_details USING btree (product_id);


--
-- Name: index_orders_on_user_id; Type: INDEX; Schema: public; Owner: pat
--

CREATE INDEX index_orders_on_user_id ON public.orders USING btree (user_id);


--
-- Name: index_product_images_on_product_id; Type: INDEX; Schema: public; Owner: pat
--

CREATE INDEX index_product_images_on_product_id ON public.product_images USING btree (product_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: pat
--

CREATE INDEX index_users_on_email ON public.users USING btree (email);


--
-- PostgreSQL database dump complete
--

