--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Debian 10.6-1.pgdg90+1)
-- Dumped by pg_dump version 10.6 (Debian 10.6-1.pgdg90+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
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


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: animal_hit_reader; Type: TABLE; Schema: public; Owner: etag_master
--

CREATE TABLE public.animal_hit_reader (
    id integer NOT NULL,
    reader_id character varying(10) NOT NULL,
    animal_id integer,
    tag_id_id character varying(10) NOT NULL
);


ALTER TABLE public.animal_hit_reader OWNER TO etag_master;

--
-- Name: animal_hit_reader_id_seq; Type: SEQUENCE; Schema: public; Owner: etag_master
--

CREATE SEQUENCE public.animal_hit_reader_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.animal_hit_reader_id_seq OWNER TO etag_master;

--
-- Name: animal_hit_reader_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: etag_master
--

ALTER SEQUENCE public.animal_hit_reader_id_seq OWNED BY public.animal_hit_reader.id;


--
-- Name: animals; Type: TABLE; Schema: public; Owner: etag_master
--

CREATE TABLE public.animals (
    animal_id integer NOT NULL,
    species character varying(255) NOT NULL,
    field_data jsonb NOT NULL
);


ALTER TABLE public.animals OWNER TO etag_master;

--
-- Name: animals_animal_id_seq; Type: SEQUENCE; Schema: public; Owner: etag_master
--

CREATE SEQUENCE public.animals_animal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.animals_animal_id_seq OWNER TO etag_master;

--
-- Name: animals_animal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: etag_master
--

ALTER SEQUENCE public.animals_animal_id_seq OWNED BY public.animals.animal_id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: etag_master
--

CREATE TABLE public.locations (
    location_id integer NOT NULL,
    name character varying(255) NOT NULL,
    latitude double precision,
    longitude double precision,
    active boolean
);


ALTER TABLE public.locations OWNER TO etag_master;

--
-- Name: locations_location_id_seq; Type: SEQUENCE; Schema: public; Owner: etag_master
--

CREATE SEQUENCE public.locations_location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locations_location_id_seq OWNER TO etag_master;

--
-- Name: locations_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: etag_master
--

ALTER SEQUENCE public.locations_location_id_seq OWNED BY public.locations.location_id;


--
-- Name: reader_location; Type: TABLE; Schema: public; Owner: etag_master
--

CREATE TABLE public.reader_location (
    reader_id character varying(10) NOT NULL,
    location_id integer NOT NULL,
    start_timestamp timestamp with time zone,
    end_timestamp timestamp with time zone
);


ALTER TABLE public.reader_location OWNER TO etag_master;

--
-- Name: readers; Type: TABLE; Schema: public; Owner: etag_master
--

CREATE TABLE public.readers (
    reader_id character varying(10) NOT NULL,
    description character varying(255) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.readers OWNER TO etag_master;

--
-- Name: tag_owner; Type: TABLE; Schema: public; Owner: etag_master
--

CREATE TABLE public.tag_owner (
    user_id integer NOT NULL,
    tag_id character varying(10) NOT NULL,
    start_time timestamp with time zone,
    end_time timestamp with time zone
);


ALTER TABLE public.tag_owner OWNER TO etag_master;

--
-- Name: tag_reads; Type: TABLE; Schema: public; Owner: etag_master
--

CREATE TABLE public.tag_reads (
    tag_reads_id integer NOT NULL,
    reader_id character varying(10) NOT NULL,
    tag_id character varying(10) NOT NULL,
    user_id integer NOT NULL,
    tag_read_time timestamp with time zone NOT NULL,
    accessory_data jsonb,
    public boolean NOT NULL
);


ALTER TABLE public.tag_reads OWNER TO etag_master;

--
-- Name: tag_reads_tag_reads_id_seq; Type: SEQUENCE; Schema: public; Owner: etag_master
--

CREATE SEQUENCE public.tag_reads_tag_reads_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tag_reads_tag_reads_id_seq OWNER TO etag_master;

--
-- Name: tag_reads_tag_reads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: etag_master
--

ALTER SEQUENCE public.tag_reads_tag_reads_id_seq OWNED BY public.tag_reads.tag_reads_id;


--
-- Name: tagged_animal; Type: TABLE; Schema: public; Owner: etag_master
--

CREATE TABLE public.tagged_animal (
    tag_id character varying(10) NOT NULL,
    animal_id integer NOT NULL,
    start_time timestamp with time zone,
    end_time timestamp with time zone,
    field_data jsonb NOT NULL
);


ALTER TABLE public.tagged_animal OWNER TO etag_master;

--
-- Name: tags; Type: TABLE; Schema: public; Owner: etag_master
--

CREATE TABLE public.tags (
    tag_id character varying(10) NOT NULL,
    description character varying(500) NOT NULL
);


ALTER TABLE public.tags OWNER TO etag_master;

--
-- Name: upload_location; Type: TABLE; Schema: public; Owner: etag_master
--

CREATE TABLE public.upload_location (
    id integer NOT NULL,
    user_id integer NOT NULL,
    location_id integer NOT NULL
);


ALTER TABLE public.upload_location OWNER TO etag_master;

--
-- Name: upload_location_id_seq; Type: SEQUENCE; Schema: public; Owner: etag_master
--

CREATE SEQUENCE public.upload_location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.upload_location_id_seq OWNER TO etag_master;

--
-- Name: upload_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: etag_master
--

ALTER SEQUENCE public.upload_location_id_seq OWNED BY public.upload_location.id;


--
-- Name: animal_hit_reader id; Type: DEFAULT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY public.animal_hit_reader ALTER COLUMN id SET DEFAULT nextval('public.animal_hit_reader_id_seq'::regclass);


--
-- Name: animals animal_id; Type: DEFAULT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY public.animals ALTER COLUMN animal_id SET DEFAULT nextval('public.animals_animal_id_seq'::regclass);


--
-- Name: locations location_id; Type: DEFAULT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY public.locations ALTER COLUMN location_id SET DEFAULT nextval('public.locations_location_id_seq'::regclass);


--
-- Name: tag_reads tag_reads_id; Type: DEFAULT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY public.tag_reads ALTER COLUMN tag_reads_id SET DEFAULT nextval('public.tag_reads_tag_reads_id_seq'::regclass);


--
-- Name: upload_location id; Type: DEFAULT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY public.upload_location ALTER COLUMN id SET DEFAULT nextval('public.upload_location_id_seq'::regclass);


--
-- Name: animal_hit_reader animal_hit_reader_pkey; Type: CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY public.animal_hit_reader
    ADD CONSTRAINT animal_hit_reader_pkey PRIMARY KEY (id);


--
-- Name: animal_hit_reader animal_hit_reader_reader_id_animal_id_tag_id_id_key; Type: CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY public.animal_hit_reader
    ADD CONSTRAINT animal_hit_reader_reader_id_animal_id_tag_id_id_key UNIQUE (reader_id, animal_id, tag_id_id);


--
-- Name: animals animals_pkey; Type: CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY public.animals
    ADD CONSTRAINT animals_pkey PRIMARY KEY (animal_id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (location_id);


--
-- Name: reader_location reader_location_pkey; Type: CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY public.reader_location
    ADD CONSTRAINT reader_location_pkey PRIMARY KEY (reader_id);


--
-- Name: readers readers_pkey; Type: CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY public.readers
    ADD CONSTRAINT readers_pkey PRIMARY KEY (reader_id);


--
-- Name: tag_owner tag_owner_pkey; Type: CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY public.tag_owner
    ADD CONSTRAINT tag_owner_pkey PRIMARY KEY (tag_id);


--
-- Name: tag_reads tag_reads_pkey; Type: CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY public.tag_reads
    ADD CONSTRAINT tag_reads_pkey PRIMARY KEY (tag_reads_id);


--
-- Name: tag_reads tag_reads_tag_reads_id_reader_id_tag_id_tag_read_time_key; Type: CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY public.tag_reads
    ADD CONSTRAINT tag_reads_tag_reads_id_reader_id_tag_id_tag_read_time_key UNIQUE (tag_reads_id, reader_id, tag_id, tag_read_time);


--
-- Name: tagged_animal tagged_animal_pkey; Type: CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY public.tagged_animal
    ADD CONSTRAINT tagged_animal_pkey PRIMARY KEY (tag_id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (tag_id);


--
-- Name: upload_location upload_location_pkey; Type: CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY public.upload_location
    ADD CONSTRAINT upload_location_pkey PRIMARY KEY (id);


--
-- Name: upload_location upload_location_user_id_location_id_key; Type: CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY public.upload_location
    ADD CONSTRAINT upload_location_user_id_location_id_key UNIQUE (user_id, location_id);


--
-- Name: animal_hit_reader_animal_id; Type: INDEX; Schema: public; Owner: etag_master
--

CREATE INDEX animal_hit_reader_animal_id ON public.animal_hit_reader USING btree (animal_id);


--
-- Name: animal_hit_reader_reader_id; Type: INDEX; Schema: public; Owner: etag_master
--

CREATE INDEX animal_hit_reader_reader_id ON public.animal_hit_reader USING btree (reader_id);


--
-- Name: animal_hit_reader_reader_id_like; Type: INDEX; Schema: public; Owner: etag_master
--

CREATE INDEX animal_hit_reader_reader_id_like ON public.animal_hit_reader USING btree (reader_id varchar_pattern_ops);


--
-- Name: animal_hit_reader_tag_id_id; Type: INDEX; Schema: public; Owner: etag_master
--

CREATE INDEX animal_hit_reader_tag_id_id ON public.animal_hit_reader USING btree (tag_id_id);


--
-- Name: animal_hit_reader_tag_id_id_like; Type: INDEX; Schema: public; Owner: etag_master
--

CREATE INDEX animal_hit_reader_tag_id_id_like ON public.animal_hit_reader USING btree (tag_id_id varchar_pattern_ops);


--
-- Name: reader_location_location_id; Type: INDEX; Schema: public; Owner: etag_master
--

CREATE INDEX reader_location_location_id ON public.reader_location USING btree (location_id);


--
-- Name: reader_location_reader_id_like; Type: INDEX; Schema: public; Owner: etag_master
--

CREATE INDEX reader_location_reader_id_like ON public.reader_location USING btree (reader_id varchar_pattern_ops);


--
-- Name: readers_reader_id_like; Type: INDEX; Schema: public; Owner: etag_master
--

CREATE INDEX readers_reader_id_like ON public.readers USING btree (reader_id varchar_pattern_ops);


--
-- Name: readers_user_id; Type: INDEX; Schema: public; Owner: etag_master
--

CREATE INDEX readers_user_id ON public.readers USING btree (user_id);


--
-- Name: tag_owner_tag_id_like; Type: INDEX; Schema: public; Owner: etag_master
--

CREATE INDEX tag_owner_tag_id_like ON public.tag_owner USING btree (tag_id varchar_pattern_ops);


--
-- Name: tag_owner_user_id; Type: INDEX; Schema: public; Owner: etag_master
--

CREATE INDEX tag_owner_user_id ON public.tag_owner USING btree (user_id);


--
-- Name: tag_reads_reader_id; Type: INDEX; Schema: public; Owner: etag_master
--

CREATE INDEX tag_reads_reader_id ON public.tag_reads USING btree (reader_id);


--
-- Name: tag_reads_reader_id_like; Type: INDEX; Schema: public; Owner: etag_master
--

CREATE INDEX tag_reads_reader_id_like ON public.tag_reads USING btree (reader_id varchar_pattern_ops);


--
-- Name: tag_reads_tag_id; Type: INDEX; Schema: public; Owner: etag_master
--

CREATE INDEX tag_reads_tag_id ON public.tag_reads USING btree (tag_id);


--
-- Name: tag_reads_tag_id_like; Type: INDEX; Schema: public; Owner: etag_master
--

CREATE INDEX tag_reads_tag_id_like ON public.tag_reads USING btree (tag_id varchar_pattern_ops);


--
-- Name: tag_reads_user_id; Type: INDEX; Schema: public; Owner: etag_master
--

CREATE INDEX tag_reads_user_id ON public.tag_reads USING btree (user_id);


--
-- Name: tagged_animal_animal_id; Type: INDEX; Schema: public; Owner: etag_master
--

CREATE INDEX tagged_animal_animal_id ON public.tagged_animal USING btree (animal_id);


--
-- Name: tagged_animal_tag_id_like; Type: INDEX; Schema: public; Owner: etag_master
--

CREATE INDEX tagged_animal_tag_id_like ON public.tagged_animal USING btree (tag_id varchar_pattern_ops);


--
-- Name: tags_tag_id_like; Type: INDEX; Schema: public; Owner: etag_master
--

CREATE INDEX tags_tag_id_like ON public.tags USING btree (tag_id varchar_pattern_ops);


--
-- Name: upload_location_location_id; Type: INDEX; Schema: public; Owner: etag_master
--

CREATE INDEX upload_location_location_id ON public.upload_location USING btree (location_id);


--
-- Name: upload_location_user_id; Type: INDEX; Schema: public; Owner: etag_master
--

CREATE INDEX upload_location_user_id ON public.upload_location USING btree (user_id);


--
-- Name: animal_hit_reader animal_hit_reader_animal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY public.animal_hit_reader
    ADD CONSTRAINT animal_hit_reader_animal_id_fkey FOREIGN KEY (animal_id) REFERENCES public.animals(animal_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: animal_hit_reader animal_hit_reader_reader_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY public.animal_hit_reader
    ADD CONSTRAINT animal_hit_reader_reader_id_fkey FOREIGN KEY (reader_id) REFERENCES public.readers(reader_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: animal_hit_reader animal_hit_reader_tag_id_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY public.animal_hit_reader
    ADD CONSTRAINT animal_hit_reader_tag_id_id_fkey FOREIGN KEY (tag_id_id) REFERENCES public.tags(tag_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reader_location reader_location_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY public.reader_location
    ADD CONSTRAINT reader_location_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.locations(location_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reader_location reader_location_reader_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY public.reader_location
    ADD CONSTRAINT reader_location_reader_id_fkey FOREIGN KEY (reader_id) REFERENCES public.readers(reader_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tag_owner tag_owner_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY public.tag_owner
    ADD CONSTRAINT tag_owner_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tags(tag_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tag_reads tag_reads_reader_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY public.tag_reads
    ADD CONSTRAINT tag_reads_reader_id_fkey FOREIGN KEY (reader_id) REFERENCES public.readers(reader_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tag_reads tag_reads_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY public.tag_reads
    ADD CONSTRAINT tag_reads_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tags(tag_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tagged_animal tagged_animal_animal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY public.tagged_animal
    ADD CONSTRAINT tagged_animal_animal_id_fkey FOREIGN KEY (animal_id) REFERENCES public.animals(animal_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tagged_animal tagged_animal_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY public.tagged_animal
    ADD CONSTRAINT tagged_animal_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tags(tag_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: upload_location upload_location_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: etag_master
--

ALTER TABLE ONLY public.upload_location
    ADD CONSTRAINT upload_location_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.locations(location_id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

