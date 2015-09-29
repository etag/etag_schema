-- Drop Tables
DROP TABLE readers CASCADE;
DROP TABLE reader_location CASCADE;
DROP TABLE tags CASCADE;
DROP TABLE tag_reads CASCADE;
DROP TABLE animal CASCADE;
DROP TABLE accessory_data CASCADE;

--*********** TABLE readers ***********************
CREATE TABLE readers
(
  reader_id text NOT NULL,
  description text,
  user_id integer,
  CONSTRAINT readers_pk PRIMARY KEY (reader_id)
);

--*********** TABLE reader_location ***********************

CREATE TABLE reader_location
(
  reader_id text,
  location_id serial NOT NULL,
  latitude double precision,
  longitude double precision,
  start_date date,
  end_date date,
  active boolean,
  CONSTRAINT location_id_pk PRIMARY KEY (location_id),
  CONSTRAINT readers_fk FOREIGN KEY (reader_id)
      REFERENCES readers (reader_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);
--*********** TABLE animal ***********************
CREATE TABLE animal
(
  animal_id serial NOT NULL,
  field_data json,
  CONSTRAINT animal_pk PRIMARY KEY (animal_id)
);
--*********** TABLE tags ***********************
CREATE TABLE tags
(
  tag_id serial NOT NULL,
  start_date date,
  end_date date,
  animal_id integer,
  CONSTRAINT tags_pk PRIMARY KEY (tag_id),
  CONSTRAINT animal_id_tags_animal_fk FOREIGN KEY (animal_id)
      REFERENCES animal (animal_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);
--*********** TABLE tags_reads ***********************
CREATE TABLE tag_reads
(
  reader_id text NOT NULL,
  tag_id text NOT NULL,
  "timestamp" timestamp without time zone,
  accessory_data_id integer,
  CONSTRAINT tag_reads_pk PRIMARY KEY (reader_id, tag_id)
);

--*********** TABLE accessory_data ***********************
CREATE TABLE accessory_data
(
  accessory_id serial NOT NULL,
  reader_id text,
  "timestamp" timestamp without time zone,
  type text,
  value json,
  CONSTRAINT accesory_id_pk PRIMARY KEY (accessory_id)
);
