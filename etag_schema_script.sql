--
-- PostgreSQL database dump
--

-- Dumped from database version 10.0
-- Dumped by pg_dump version 10.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: animal_hit_reader; Type: TABLE; Schema: public; Owner: etag_master
--

CREATE TABLE animal_hit_reader (
    id integer NOT NULL,
    reader_id character varying(10) NOT NULL,
    animal_id integer NOT NULL,
    tag_id_id character varying(10) NOT NULL
);


ALTER TABLE animal_hit_reader OWNER TO etag_master;

--
-- Name: animal_hit_reader_id_seq; Type: SEQUENCE; Schema: public; Owner: etag_master
--

CREATE SEQUENCE animal_hit_reader_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE animal_hit_reader_id_seq OWNER TO etag_master;

--
-- Name: animal_hit_reader_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: etag_master
--

ALTER SEQUENCE animal_hit_reader_id_seq OWNED BY animal_hit_reader.id;


--
-- Name: animals; Type: TABLE; Schema: public; Owner: etag_master
--

CREATE TABLE animals (
    animal_id integer NOT NULL,
    species character varying(255) NOT NULL,
    field_data text NOT NULL
);


ALTER TABLE animals OWNER TO etag_master;

--
-- Name: animals_animal_id_seq; Type: SEQUENCE; Schema: public; Owner: etag_master
--

CREATE SEQUENCE animals_animal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE animals_animal_id_seq OWNER TO etag_master;

--
-- Name: animals_animal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: etag_master
--

ALTER SEQUENCE animals_animal_id_seq OWNED BY animals.animal_id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: etag_master
--

CREATE TABLE locations (
    location_id integer NOT NULL,
    name character varying(255) NOT NULL,
    latitude double precision,
    longitude double precision,
    active boolean
);


ALTER TABLE locations OWNER TO etag_master;

--
-- Name: locations_location_id_seq; Type: SEQUENCE; Schema: public; Owner: etag_master
--

CREATE SEQUENCE locations_location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE locations_location_id_seq OWNER TO etag_master;

--
-- Name: locations_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: etag_master
--

ALTER SEQUENCE locations_location_id_seq OWNED BY locations.location_id;


--
-- Name: reader_location; Type: TABLE; Schema: public; Owner: etag_master
--

CREATE TABLE reader_location (
    reader_id character varying(10) NOT NULL,
    location_id integer NOT NULL,
    start_timestamp timestamp with time zone,
    end_timestamp timestamp with time zone
);


ALTER TABLE reader_location OWNER TO etag_master;

--
-- Name: readers; Type: TABLE; Schema: public; Owner: etag_master
--

CREATE TABLE readers (
    reader_id character varying(10) NOT NULL,
    description character varying(255) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE readers OWNER TO etag_master;

--
-- Name: tag_owner; Type: TABLE; Schema: public; Owner: etag_master
--

CREATE TABLE tag_owner (
    user_id integer NOT NULL,
    tag_id character varying(10) NOT NULL,
    start_time timestamp with time zone,
    end_time timestamp with time zone
);


ALTER TABLE tag_owner OWNER TO etag_master;

--
-- Name: tag_reads; Type: TABLE; Schema: public; Owner: etag_master
--

CREATE TABLE tag_reads (
    tag_reads_id integer NOT NULL,
    reader_id character varying(10) NOT NULL,
    tag_id character varying(10) NOT NULL,
    user_id integer NOT NULL,
    tag_read_time timestamp with time zone NOT NULL,
    field_data text NOT NULL,
    public boolean NOT NULL
);


ALTER TABLE tag_reads OWNER TO etag_master;

--
-- Name: tag_reads_tag_reads_id_seq; Type: SEQUENCE; Schema: public; Owner: etag_master
--

CREATE SEQUENCE tag_reads_tag_reads_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tag_reads_tag_reads_id_seq OWNER TO etag_master;

--
-- Name: tag_reads_tag_reads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: etag_master
--

ALTER SEQUENCE tag_reads_tag_reads_id_seq OWNED BY tag_reads.tag_reads_id;


--
-- Name: tagged_animal; Type: TABLE; Schema: public; Owner: etag_master
--

CREATE TABLE tagged_animal (
    tag_id character varying(10) NOT NULL,
    animal_id integer NOT NULL,
    start_time timestamp with time zone,
    end_time timestamp with time zone,
    field_data text NOT NULL
);


ALTER TABLE tagged_animal OWNER TO etag_master;

--
-- Name: tags; Type: TABLE; Schema: public; Owner: etag_master
--

CREATE TABLE tags (
    tag_id character varying(10) NOT NULL,
    description character varying(500) NOT NULL
);


ALTER TABLE tags OWNER TO etag_master;

--
-- Name: upload_location; Type: TABLE; Schema: public; Owner: etag_master
--

CREATE TABLE upload_location (
    id integer NOT NULL,
    user_id integer NOT NULL,
    location_id integer NOT NULL
);


ALTER TABLE upload_location OWNER TO etag_master;

--
-- Name: upload_location_id_seq; Type: SEQUENCE; Schema: public; Owner: etag_master
--

CREATE SEQUENCE upload_location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE upload_location_id_seq OWNER TO etag_master;

--
-- Name: upload_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: etag_master
--

ALTER SEQUENCE upload_location_id_seq OWNED BY upload_location.id;


--
-- Name: animal_hit_reader id; Type: DEFAULT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY animal_hit_reader ALTER COLUMN id SET DEFAULT nextval('animal_hit_reader_id_seq'::regclass);


--
-- Name: animals animal_id; Type: DEFAULT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY animals ALTER COLUMN animal_id SET DEFAULT nextval('animals_animal_id_seq'::regclass);


--
-- Name: locations location_id; Type: DEFAULT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY locations ALTER COLUMN location_id SET DEFAULT nextval('locations_location_id_seq'::regclass);


--
-- Name: tag_reads tag_reads_id; Type: DEFAULT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY tag_reads ALTER COLUMN tag_reads_id SET DEFAULT nextval('tag_reads_tag_reads_id_seq'::regclass);


--
-- Name: upload_location id; Type: DEFAULT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY upload_location ALTER COLUMN id SET DEFAULT nextval('upload_location_id_seq'::regclass);


--
-- Data for Name: animal_hit_reader; Type: TABLE DATA; Schema: public; Owner: etag_master
--

COPY animal_hit_reader (id, reader_id, animal_id, tag_id_id) FROM stdin;
\.


--
-- Data for Name: animals; Type: TABLE DATA; Schema: public; Owner: etag_master
--

COPY animals (animal_id, species, field_data) FROM stdin;
1	pigeon	{ "name": "Book the Second", "author": { "first_name": "Charles", "last_name": "Xavier" } }
2	test_sp1	{ "name": "Book the Second", "author": { "first_name": "Charles", "last_name": "Xavier" } }
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: etag_master
--

COPY locations (location_id, name, latitude, longitude, active) FROM stdin;
1	loc_1	35.1774929999999983	-89.9876299999999958	t
2	loc_2	35.114130000000003	-90.0918070000000029	f
3	loc_3	35.1109089999999995	-90.0949930000000023	t
\.


--
-- Data for Name: reader_location; Type: TABLE DATA; Schema: public; Owner: etag_master
--

COPY reader_location (reader_id, location_id, start_timestamp, end_timestamp) FROM stdin;
r_1	1	2004-08-01 00:00:00+00	\N
r_2	2	2012-05-01 00:00:00+00	2012-06-01 00:00:00+00
r_3	3	2000-08-01 00:00:00+00	2001-08-01 00:00:00+00
r_7	3	\N	\N
r_8	3	\N	\N
r_9	2	\N	\N
\.


--
-- Data for Name: readers; Type: TABLE DATA; Schema: public; Owner: etag_master
--

COPY readers (reader_id, description, user_id) FROM stdin;
r_2	test2	6
r_3	test3	6
r_4	test4	3
r_6	test6	6
r_7	test7	6
r_8	test8	6
r_9	test9	6
r_10	test_10	6
r_11	test_11	6
r_1	test	6
r_12	test12	6
r_13	test_13	6
\.


--
-- Data for Name: tag_owner; Type: TABLE DATA; Schema: public; Owner: etag_master
--

COPY tag_owner (user_id, tag_id, start_time, end_time) FROM stdin;
5	tag_4	\N	\N
6	tag_3	\N	\N
6	tag_1	\N	\N
6	tag_5	\N	\N
6	tag_7	\N	\N
6	tag_10	\N	\N
\.


--
-- Data for Name: tag_reads; Type: TABLE DATA; Schema: public; Owner: etag_master
--

COPY tag_reads (tag_reads_id, reader_id, tag_id, user_id, tag_read_time, field_data, public) FROM stdin;
3	r_1	tag_1	6	2012-05-26 17:29:26+00	"{ \\"customer\\": \\"Lily Bush\\", \\"items\\": {\\"product\\": \\"Diaper\\",\\"qty\\": 24}}"	f
4	r_9	tag_1	6	2012-04-29 08:12:36+00	"{ \\"customer\\": \\"Lily Bush\\", \\"items\\": {\\"product\\": \\"Diaper\\",\\"qty\\": 24}}"	f
5	r_6	tag_5	6	2012-05-26 17:29:26+00	"{ \\"customer\\": \\"Lily Bush\\", \\"items\\": {\\"product\\": \\"Diaper\\",\\"qty\\": 24}}"	t
6	r_1	tag_10	6	2012-04-29 08:12:36+00	"{ \\"name\\": \\"Book the Fourth\\", \\"author\\": { \\"first_name\\": \\"Charles\\", \\"last_name\\": \\"Davis\\" } }"	f
\.


--
-- Data for Name: tagged_animal; Type: TABLE DATA; Schema: public; Owner: etag_master
--

COPY tagged_animal (tag_id, animal_id, start_time, end_time, field_data) FROM stdin;
tag_1	1	\N	\N	{ "name": "Book the Second", "author": { "first_name": "Charles", "last_name": "Xavier" } }
tag_4	1	\N	\N	{"customer":"Lily Bush","items":{"product":"Diaper","qty":24}}
tag_2	1	\N	\N	{"customer":"Lily Bush","items":{"product":"Diaper","qty":24}}
tag_5	2	\N	\N	{"name":"Book the Fourth","author":{"first_name":"Charles","last_name":"Davis"}}
tag_3	1	\N	\N	{"customer":"Lily Bush","items":{"product":"Diaper","qty":24}}
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: etag_master
--

COPY tags (tag_id, description) FROM stdin;
tag_1	test1
tag_2	test2
tag_3	test3
tag_4	test4
tag_5	test5
tag_7	test_7
tag_10	test_10
\.


--
-- Data for Name: upload_location; Type: TABLE DATA; Schema: public; Owner: etag_master
--

COPY upload_location (id, user_id, location_id) FROM stdin;
\.


--
-- Name: animal_hit_reader_id_seq; Type: SEQUENCE SET; Schema: public; Owner: etag_master
--

SELECT pg_catalog.setval('animal_hit_reader_id_seq', 1, false);


--
-- Name: animals_animal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: etag_master
--

SELECT pg_catalog.setval('animals_animal_id_seq', 1, false);


--
-- Name: locations_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: etag_master
--

SELECT pg_catalog.setval('locations_location_id_seq', 1, false);


--
-- Name: tag_reads_tag_reads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: etag_master
--

SELECT pg_catalog.setval('tag_reads_tag_reads_id_seq', 6, true);


--
-- Name: upload_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: etag_master
--

SELECT pg_catalog.setval('upload_location_id_seq', 1, false);


--
-- Name: animal_hit_reader animal_hit_reader_pkey; Type: CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY animal_hit_reader
    ADD CONSTRAINT animal_hit_reader_pkey PRIMARY KEY (id);


--
-- Name: animal_hit_reader animal_hit_reader_reader_id_animal_id_tag_id_id_key; Type: CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY animal_hit_reader
    ADD CONSTRAINT animal_hit_reader_reader_id_animal_id_tag_id_id_key UNIQUE (reader_id, animal_id, tag_id_id);


--
-- Name: animals animals_pkey; Type: CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY animals
    ADD CONSTRAINT animals_pkey PRIMARY KEY (animal_id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (location_id);


--
-- Name: reader_location reader_location_pkey; Type: CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY reader_location
    ADD CONSTRAINT reader_location_pkey PRIMARY KEY (reader_id);


--
-- Name: readers readers_pkey; Type: CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY readers
    ADD CONSTRAINT readers_pkey PRIMARY KEY (reader_id);


--
-- Name: tag_owner tag_owner_pkey; Type: CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY tag_owner
    ADD CONSTRAINT tag_owner_pkey PRIMARY KEY (tag_id);


--
-- Name: tag_reads tag_reads_pkey; Type: CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY tag_reads
    ADD CONSTRAINT tag_reads_pkey PRIMARY KEY (tag_reads_id);


--
-- Name: tag_reads tag_reads_tag_reads_id_reader_id_tag_id_tag_read_time_key; Type: CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY tag_reads
    ADD CONSTRAINT tag_reads_tag_reads_id_reader_id_tag_id_tag_read_time_key UNIQUE (tag_reads_id, reader_id, tag_id, tag_read_time);


--
-- Name: tagged_animal tagged_animal_pkey; Type: CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY tagged_animal
    ADD CONSTRAINT tagged_animal_pkey PRIMARY KEY (tag_id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (tag_id);


--
-- Name: upload_location upload_location_pkey; Type: CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY upload_location
    ADD CONSTRAINT upload_location_pkey PRIMARY KEY (id);


--
-- Name: upload_location upload_location_user_id_location_id_key; Type: CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY upload_location
    ADD CONSTRAINT upload_location_user_id_location_id_key UNIQUE (user_id, location_id);


--
-- Name: animal_hit_reader_animal_id; Type: INDEX; Schema: public; Owner: etag_master
--

CREATE INDEX animal_hit_reader_animal_id ON animal_hit_reader USING btree (animal_id);


--
-- Name: animal_hit_reader_reader_id; Type: INDEX; Schema: public; Owner: etag_master
--

CREATE INDEX animal_hit_reader_reader_id ON animal_hit_reader USING btree (reader_id);


--
-- Name: animal_hit_reader_reader_id_like; Type: INDEX; Schema: public; Owner: etag_master
--

CREATE INDEX animal_hit_reader_reader_id_like ON animal_hit_reader USING btree (reader_id varchar_pattern_ops);


--
-- Name: animal_hit_reader_tag_id_id; Type: INDEX; Schema: public; Owner: etag_master
--

CREATE INDEX animal_hit_reader_tag_id_id ON animal_hit_reader USING btree (tag_id_id);


--
-- Name: animal_hit_reader_tag_id_id_like; Type: INDEX; Schema: public; Owner: etag_master
--

CREATE INDEX animal_hit_reader_tag_id_id_like ON animal_hit_reader USING btree (tag_id_id varchar_pattern_ops);


--
-- Name: reader_location_location_id; Type: INDEX; Schema: public; Owner: etag_master
--

CREATE INDEX reader_location_location_id ON reader_location USING btree (location_id);


--
-- Name: reader_location_reader_id_like; Type: INDEX; Schema: public; Owner: etag_master
--

CREATE INDEX reader_location_reader_id_like ON reader_location USING btree (reader_id varchar_pattern_ops);


--
-- Name: readers_reader_id_like; Type: INDEX; Schema: public; Owner: etag_master
--

CREATE INDEX readers_reader_id_like ON readers USING btree (reader_id varchar_pattern_ops);


--
-- Name: readers_user_id; Type: INDEX; Schema: public; Owner: etag_master
--

CREATE INDEX readers_user_id ON readers USING btree (user_id);


--
-- Name: tag_owner_tag_id_like; Type: INDEX; Schema: public; Owner: etag_master
--

CREATE INDEX tag_owner_tag_id_like ON tag_owner USING btree (tag_id varchar_pattern_ops);


--
-- Name: tag_owner_user_id; Type: INDEX; Schema: public; Owner: etag_master
--

CREATE INDEX tag_owner_user_id ON tag_owner USING btree (user_id);


--
-- Name: tag_reads_reader_id; Type: INDEX; Schema: public; Owner: etag_master
--

CREATE INDEX tag_reads_reader_id ON tag_reads USING btree (reader_id);


--
-- Name: tag_reads_reader_id_like; Type: INDEX; Schema: public; Owner: etag_master
--

CREATE INDEX tag_reads_reader_id_like ON tag_reads USING btree (reader_id varchar_pattern_ops);


--
-- Name: tag_reads_tag_id; Type: INDEX; Schema: public; Owner: etag_master
--

CREATE INDEX tag_reads_tag_id ON tag_reads USING btree (tag_id);


--
-- Name: tag_reads_tag_id_like; Type: INDEX; Schema: public; Owner: etag_master
--

CREATE INDEX tag_reads_tag_id_like ON tag_reads USING btree (tag_id varchar_pattern_ops);


--
-- Name: tag_reads_user_id; Type: INDEX; Schema: public; Owner: etag_master
--

CREATE INDEX tag_reads_user_id ON tag_reads USING btree (user_id);


--
-- Name: tagged_animal_animal_id; Type: INDEX; Schema: public; Owner: etag_master
--

CREATE INDEX tagged_animal_animal_id ON tagged_animal USING btree (animal_id);


--
-- Name: tagged_animal_tag_id_like; Type: INDEX; Schema: public; Owner: etag_master
--

CREATE INDEX tagged_animal_tag_id_like ON tagged_animal USING btree (tag_id varchar_pattern_ops);


--
-- Name: tags_tag_id_like; Type: INDEX; Schema: public; Owner: etag_master
--

CREATE INDEX tags_tag_id_like ON tags USING btree (tag_id varchar_pattern_ops);


--
-- Name: upload_location_location_id; Type: INDEX; Schema: public; Owner: etag_master
--

CREATE INDEX upload_location_location_id ON upload_location USING btree (location_id);


--
-- Name: upload_location_user_id; Type: INDEX; Schema: public; Owner: etag_master
--

CREATE INDEX upload_location_user_id ON upload_location USING btree (user_id);


--
-- Name: animal_hit_reader animal_hit_reader_animal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY animal_hit_reader
    ADD CONSTRAINT animal_hit_reader_animal_id_fkey FOREIGN KEY (animal_id) REFERENCES animals(animal_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: animal_hit_reader animal_hit_reader_reader_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY animal_hit_reader
    ADD CONSTRAINT animal_hit_reader_reader_id_fkey FOREIGN KEY (reader_id) REFERENCES readers(reader_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: animal_hit_reader animal_hit_reader_tag_id_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY animal_hit_reader
    ADD CONSTRAINT animal_hit_reader_tag_id_id_fkey FOREIGN KEY (tag_id_id) REFERENCES tags(tag_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reader_location reader_location_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY reader_location
    ADD CONSTRAINT reader_location_location_id_fkey FOREIGN KEY (location_id) REFERENCES locations(location_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reader_location reader_location_reader_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY reader_location
    ADD CONSTRAINT reader_location_reader_id_fkey FOREIGN KEY (reader_id) REFERENCES readers(reader_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tag_owner tag_owner_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY tag_owner
    ADD CONSTRAINT tag_owner_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES tags(tag_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tag_reads tag_reads_reader_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY tag_reads
    ADD CONSTRAINT tag_reads_reader_id_fkey FOREIGN KEY (reader_id) REFERENCES readers(reader_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tag_reads tag_reads_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY tag_reads
    ADD CONSTRAINT tag_reads_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES tags(tag_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tagged_animal tagged_animal_animal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY tagged_animal
    ADD CONSTRAINT tagged_animal_animal_id_fkey FOREIGN KEY (animal_id) REFERENCES animals(animal_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tagged_animal tagged_animal_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY tagged_animal
    ADD CONSTRAINT tagged_animal_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES tags(tag_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: upload_location upload_location_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY upload_location
    ADD CONSTRAINT upload_location_location_id_fkey FOREIGN KEY (location_id) REFERENCES locations(location_id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

