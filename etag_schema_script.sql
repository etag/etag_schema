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
  reader_id serial NOT NULL,
  name varchar(255) NOT NULL,
  description text,
  user_id integer,
  CONSTRAINT readers_pk PRIMARY KEY (reader_id)
);

--*********** TABLE reader_location ***********************

CREATE TABLE reader_location
(
  reader_id integer NOT NULL,
  location_id serial NOT NULL,
  name varchar(255),
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
  tag_id varchar(255) NOT NULL,
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
  tag_reads_id serial NOT NULL,
  reader_id integer NOT NULL,
  tag_id varchar(255) NOT NULL,
  "timestamp" timestamp without time zone,
  accessory_data_id integer,
  CONSTRAINT tag_reads_pk PRIMARY KEY (tag_reads_id)
);

--*********** TABLE accessory_data ***********************
CREATE TABLE accessory_data
(
  accessory_id serial NOT NULL,
  "timestamp" timestamp without time zone,
  accessory_type varchar(255),
  value json,
  CONSTRAINT accesory_id_pk PRIMARY KEY (accessory_id)
);
