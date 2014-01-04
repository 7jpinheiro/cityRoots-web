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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: attraction_translations; Type: TABLE; Schema: public; Owner: jprophet89; Tablespace: 
--

CREATE TABLE attraction_translations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    schedule character varying(255),
    language character varying(20) NOT NULL,
    description text,
    transport character varying(100),
    attraction_id bigint NOT NULL
);


ALTER TABLE public.attraction_translations OWNER TO jprophet89;

--
-- Name: attraction_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: jprophet89
--

CREATE SEQUENCE attraction_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attraction_translations_id_seq OWNER TO jprophet89;

--
-- Name: attraction_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jprophet89
--

ALTER SEQUENCE attraction_translations_id_seq OWNED BY attraction_translations.id;


--
-- Name: attraction_types; Type: TABLE; Schema: public; Owner: jprophet89; Tablespace: 
--

CREATE TABLE attraction_types (
    id bigint NOT NULL,
    type_id integer NOT NULL,
    attraction_id bigint NOT NULL
);


ALTER TABLE public.attraction_types OWNER TO jprophet89;

--
-- Name: attraction_types_id_seq; Type: SEQUENCE; Schema: public; Owner: jprophet89
--

CREATE SEQUENCE attraction_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attraction_types_id_seq OWNER TO jprophet89;

--
-- Name: attraction_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jprophet89
--

ALTER SEQUENCE attraction_types_id_seq OWNED BY attraction_types.id;


--
-- Name: attractions; Type: TABLE; Schema: public; Owner: jprophet89; Tablespace: 
--

CREATE TABLE attractions (
    id bigint NOT NULL,
    site character varying(100),
    email character varying(100),
    address character varying(255),
    latitude real,
    longitude real,
    active boolean DEFAULT true NOT NULL,
    "timestamp" bigint NOT NULL,
    reference_point boolean NOT NULL,
    price character varying(255),
    rating real DEFAULT 0 NOT NULL,
    accessibility boolean DEFAULT false NOT NULL,
    city_id integer NOT NULL,
    web_user_id bigint NOT NULL
);


ALTER TABLE public.attractions OWNER TO jprophet89;

--
-- Name: attractions_id_seq; Type: SEQUENCE; Schema: public; Owner: jprophet89
--

CREATE SEQUENCE attractions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attractions_id_seq OWNER TO jprophet89;

--
-- Name: attractions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jprophet89
--

ALTER SEQUENCE attractions_id_seq OWNED BY attractions.id;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: jprophet89; Tablespace: 
--

CREATE TABLE cities (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    abv character varying(10) NOT NULL,
    country_id integer NOT NULL
);


ALTER TABLE public.cities OWNER TO jprophet89;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: jprophet89
--

CREATE SEQUENCE cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_id_seq OWNER TO jprophet89;

--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jprophet89
--

ALTER SEQUENCE cities_id_seq OWNED BY cities.id;


--
-- Name: comment_attractions; Type: TABLE; Schema: public; Owner: jprophet89; Tablespace: 
--

CREATE TABLE comment_attractions (
    id bigint NOT NULL,
    comment text NOT NULL,
    evaluationdate date NOT NULL,
    mobile_user_id bigint NOT NULL,
    attraction_id bigint NOT NULL
);


ALTER TABLE public.comment_attractions OWNER TO jprophet89;

--
-- Name: comment_attractions_id_seq; Type: SEQUENCE; Schema: public; Owner: jprophet89
--

CREATE SEQUENCE comment_attractions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comment_attractions_id_seq OWNER TO jprophet89;

--
-- Name: comment_attractions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jprophet89
--

ALTER SEQUENCE comment_attractions_id_seq OWNED BY comment_attractions.id;


--
-- Name: comment_events; Type: TABLE; Schema: public; Owner: jprophet89; Tablespace: 
--

CREATE TABLE comment_events (
    id bigint NOT NULL,
    comment text NOT NULL,
    evaluationdate date NOT NULL,
    mobile_user_id bigint NOT NULL,
    event_id bigint NOT NULL
);


ALTER TABLE public.comment_events OWNER TO jprophet89;

--
-- Name: comment_events_id_seq; Type: SEQUENCE; Schema: public; Owner: jprophet89
--

CREATE SEQUENCE comment_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comment_events_id_seq OWNER TO jprophet89;

--
-- Name: comment_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jprophet89
--

ALTER SEQUENCE comment_events_id_seq OWNED BY comment_events.id;


--
-- Name: comment_itineraries; Type: TABLE; Schema: public; Owner: jprophet89; Tablespace: 
--

CREATE TABLE comment_itineraries (
    id bigint NOT NULL,
    comment character varying(500) NOT NULL,
    evaluationdate date NOT NULL,
    itinerary_id bigint NOT NULL,
    mobile_user_id bigint NOT NULL
);


ALTER TABLE public.comment_itineraries OWNER TO jprophet89;

--
-- Name: comment_itineraries_id_seq; Type: SEQUENCE; Schema: public; Owner: jprophet89
--

CREATE SEQUENCE comment_itineraries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comment_itineraries_id_seq OWNER TO jprophet89;

--
-- Name: comment_itineraries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jprophet89
--

ALTER SEQUENCE comment_itineraries_id_seq OWNED BY comment_itineraries.id;


--
-- Name: comment_services; Type: TABLE; Schema: public; Owner: jprophet89; Tablespace: 
--

CREATE TABLE comment_services (
    id bigint NOT NULL,
    comment text NOT NULL,
    evaluationdate date NOT NULL,
    mobile_user_id bigint NOT NULL,
    service_id bigint NOT NULL
);


ALTER TABLE public.comment_services OWNER TO jprophet89;

--
-- Name: comment_services_id_seq; Type: SEQUENCE; Schema: public; Owner: jprophet89
--

CREATE SEQUENCE comment_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comment_services_id_seq OWNER TO jprophet89;

--
-- Name: comment_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jprophet89
--

ALTER SEQUENCE comment_services_id_seq OWNED BY comment_services.id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: jprophet89; Tablespace: 
--

CREATE TABLE countries (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    abv character varying(10) NOT NULL
);


ALTER TABLE public.countries OWNER TO jprophet89;

--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: jprophet89
--

CREATE SEQUENCE countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.countries_id_seq OWNER TO jprophet89;

--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jprophet89
--

ALTER SEQUENCE countries_id_seq OWNED BY countries.id;


--
-- Name: event_translations; Type: TABLE; Schema: public; Owner: jprophet89; Tablespace: 
--

CREATE TABLE event_translations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    schedule character varying(255),
    language character varying(20) NOT NULL,
    description text,
    transport character varying(100),
    event_id bigint NOT NULL
);


ALTER TABLE public.event_translations OWNER TO jprophet89;

--
-- Name: event_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: jprophet89
--

CREATE SEQUENCE event_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_translations_id_seq OWNER TO jprophet89;

--
-- Name: event_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jprophet89
--

ALTER SEQUENCE event_translations_id_seq OWNED BY event_translations.id;


--
-- Name: event_types; Type: TABLE; Schema: public; Owner: jprophet89; Tablespace: 
--

CREATE TABLE event_types (
    id bigint NOT NULL,
    event_id bigint NOT NULL,
    type_id integer NOT NULL
);


ALTER TABLE public.event_types OWNER TO jprophet89;

--
-- Name: event_types_id_seq; Type: SEQUENCE; Schema: public; Owner: jprophet89
--

CREATE SEQUENCE event_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_types_id_seq OWNER TO jprophet89;

--
-- Name: event_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jprophet89
--

ALTER SEQUENCE event_types_id_seq OWNED BY event_types.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: jprophet89; Tablespace: 
--

CREATE TABLE events (
    id bigint NOT NULL,
    site character varying(100),
    email character varying(100),
    address character varying(255),
    latitude real,
    longitude real,
    active boolean DEFAULT true NOT NULL,
    "timestamp" bigint NOT NULL,
    startdate date,
    enddate date,
    organization character varying(100),
    price character varying(255) NOT NULL,
    program character varying(500),
    rating real DEFAULT 0 NOT NULL,
    accessibility boolean DEFAULT false NOT NULL,
    city_id integer NOT NULL,
    web_user_id bigint NOT NULL
);


ALTER TABLE public.events OWNER TO jprophet89;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: jprophet89
--

CREATE SEQUENCE events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO jprophet89;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jprophet89
--

ALTER SEQUENCE events_id_seq OWNED BY events.id;


--
-- Name: itineraries; Type: TABLE; Schema: public; Owner: jprophet89; Tablespace: 
--

CREATE TABLE itineraries (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(255),
    itinerary_type_id integer NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.itineraries OWNER TO jprophet89;

--
-- Name: itineraries_id_seq; Type: SEQUENCE; Schema: public; Owner: jprophet89
--

CREATE SEQUENCE itineraries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.itineraries_id_seq OWNER TO jprophet89;

--
-- Name: itineraries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jprophet89
--

ALTER SEQUENCE itineraries_id_seq OWNED BY itineraries.id;


--
-- Name: itinerary_attractions; Type: TABLE; Schema: public; Owner: jprophet89; Tablespace: 
--

CREATE TABLE itinerary_attractions (
    id bigint NOT NULL,
    "order" integer NOT NULL,
    itinerary_id bigint NOT NULL,
    attraction_id bigint NOT NULL
);


ALTER TABLE public.itinerary_attractions OWNER TO jprophet89;

--
-- Name: itinerary_attractions_id_seq; Type: SEQUENCE; Schema: public; Owner: jprophet89
--

CREATE SEQUENCE itinerary_attractions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.itinerary_attractions_id_seq OWNER TO jprophet89;

--
-- Name: itinerary_attractions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jprophet89
--

ALTER SEQUENCE itinerary_attractions_id_seq OWNED BY itinerary_attractions.id;


--
-- Name: itinerary_events; Type: TABLE; Schema: public; Owner: jprophet89; Tablespace: 
--

CREATE TABLE itinerary_events (
    id bigint NOT NULL,
    "order" integer NOT NULL,
    itinerary_id bigint NOT NULL,
    event_id bigint NOT NULL
);


ALTER TABLE public.itinerary_events OWNER TO jprophet89;

--
-- Name: itinerary_events_id_seq; Type: SEQUENCE; Schema: public; Owner: jprophet89
--

CREATE SEQUENCE itinerary_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.itinerary_events_id_seq OWNER TO jprophet89;

--
-- Name: itinerary_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jprophet89
--

ALTER SEQUENCE itinerary_events_id_seq OWNED BY itinerary_events.id;


--
-- Name: itinerary_services; Type: TABLE; Schema: public; Owner: jprophet89; Tablespace: 
--

CREATE TABLE itinerary_services (
    id bigint NOT NULL,
    "order" integer NOT NULL,
    itinerary_id bigint NOT NULL,
    service_id bigint NOT NULL
);


ALTER TABLE public.itinerary_services OWNER TO jprophet89;

--
-- Name: itinerary_services_id_seq; Type: SEQUENCE; Schema: public; Owner: jprophet89
--

CREATE SEQUENCE itinerary_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.itinerary_services_id_seq OWNER TO jprophet89;

--
-- Name: itinerary_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jprophet89
--

ALTER SEQUENCE itinerary_services_id_seq OWNED BY itinerary_services.id;


--
-- Name: itinerary_types; Type: TABLE; Schema: public; Owner: jprophet89; Tablespace: 
--

CREATE TABLE itinerary_types (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(255)
);


ALTER TABLE public.itinerary_types OWNER TO jprophet89;

--
-- Name: itinerary_types_id_seq; Type: SEQUENCE; Schema: public; Owner: jprophet89
--

CREATE SEQUENCE itinerary_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.itinerary_types_id_seq OWNER TO jprophet89;

--
-- Name: itinerary_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jprophet89
--

ALTER SEQUENCE itinerary_types_id_seq OWNED BY itinerary_types.id;


--
-- Name: languages; Type: TABLE; Schema: public; Owner: jprophet89; Tablespace: 
--

CREATE TABLE languages (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    abv character varying(10) NOT NULL,
    description character varying(255)
);


ALTER TABLE public.languages OWNER TO jprophet89;

--
-- Name: languages_id_seq; Type: SEQUENCE; Schema: public; Owner: jprophet89
--

CREATE SEQUENCE languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.languages_id_seq OWNER TO jprophet89;

--
-- Name: languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jprophet89
--

ALTER SEQUENCE languages_id_seq OWNED BY languages.id;


--
-- Name: mobile_user_cities; Type: TABLE; Schema: public; Owner: jprophet89; Tablespace: 
--

CREATE TABLE mobile_user_cities (
    id bigint NOT NULL,
    city_id integer NOT NULL,
    mobile_user_id bigint NOT NULL
);


ALTER TABLE public.mobile_user_cities OWNER TO jprophet89;

--
-- Name: mobile_user_cities_id_seq; Type: SEQUENCE; Schema: public; Owner: jprophet89
--

CREATE SEQUENCE mobile_user_cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mobile_user_cities_id_seq OWNER TO jprophet89;

--
-- Name: mobile_user_cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jprophet89
--

ALTER SEQUENCE mobile_user_cities_id_seq OWNED BY mobile_user_cities.id;


--
-- Name: mobile_users; Type: TABLE; Schema: public; Owner: jprophet89; Tablespace: 
--

CREATE TABLE mobile_users (
    id bigint NOT NULL,
    firstname character varying(100),
    surname character varying(100),
    gender character(1),
    dateofbirth date,
    active boolean NOT NULL,
    CONSTRAINT mobile_users_gender_check CHECK ((gender = ANY (ARRAY['F'::bpchar, 'M'::bpchar])))
);


ALTER TABLE public.mobile_users OWNER TO jprophet89;

--
-- Name: pack_types; Type: TABLE; Schema: public; Owner: jprophet89; Tablespace: 
--

CREATE TABLE pack_types (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(255),
    duration smallint NOT NULL,
    price numeric(19,0) NOT NULL
);


ALTER TABLE public.pack_types OWNER TO jprophet89;

--
-- Name: pack_types_id_seq; Type: SEQUENCE; Schema: public; Owner: jprophet89
--

CREATE SEQUENCE pack_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pack_types_id_seq OWNER TO jprophet89;

--
-- Name: pack_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jprophet89
--

ALTER SEQUENCE pack_types_id_seq OWNED BY pack_types.id;


--
-- Name: photo_attractions; Type: TABLE; Schema: public; Owner: jprophet89; Tablespace: 
--

CREATE TABLE photo_attractions (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    photo_file_name character varying(100) NOT NULL,
    photo_content_type character varying(100),
    photo_file_size bigint,
    photo_updated_at date,
    description character varying(255),
    attraction_id bigint NOT NULL
);


ALTER TABLE public.photo_attractions OWNER TO jprophet89;

--
-- Name: photo_attractions_id_seq; Type: SEQUENCE; Schema: public; Owner: jprophet89
--

CREATE SEQUENCE photo_attractions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photo_attractions_id_seq OWNER TO jprophet89;

--
-- Name: photo_attractions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jprophet89
--

ALTER SEQUENCE photo_attractions_id_seq OWNED BY photo_attractions.id;


--
-- Name: photo_events; Type: TABLE; Schema: public; Owner: jprophet89; Tablespace: 
--

CREATE TABLE photo_events (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    photo_file_name character varying(100) NOT NULL,
    photo_content_type character varying(100),
    photo_file_size bigint,
    photo_updated_at date,
    description character varying(255),
    event_id bigint NOT NULL
);


ALTER TABLE public.photo_events OWNER TO jprophet89;

--
-- Name: photo_events_id_seq; Type: SEQUENCE; Schema: public; Owner: jprophet89
--

CREATE SEQUENCE photo_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photo_events_id_seq OWNER TO jprophet89;

--
-- Name: photo_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jprophet89
--

ALTER SEQUENCE photo_events_id_seq OWNED BY photo_events.id;


--
-- Name: photo_services; Type: TABLE; Schema: public; Owner: jprophet89; Tablespace: 
--

CREATE TABLE photo_services (
    id bigint NOT NULL,
    name character varying(100),
    photo_file_name character varying(100),
    "photo_content_type " character varying(100),
    photo_file_size bigint,
    photo_updated_at date,
    description character varying(255),
    service_id bigint NOT NULL
);


ALTER TABLE public.photo_services OWNER TO jprophet89;

--
-- Name: photo_services_id_seq; Type: SEQUENCE; Schema: public; Owner: jprophet89
--

CREATE SEQUENCE photo_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photo_services_id_seq OWNER TO jprophet89;

--
-- Name: photo_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jprophet89
--

ALTER SEQUENCE photo_services_id_seq OWNED BY photo_services.id;


--
-- Name: rating_attractions; Type: TABLE; Schema: public; Owner: jprophet89; Tablespace: 
--

CREATE TABLE rating_attractions (
    id bigint NOT NULL,
    rating smallint NOT NULL,
    evaluationdate date NOT NULL,
    mobile_user_id bigint NOT NULL,
    attraction_id bigint NOT NULL,
    CONSTRAINT rating_attractions_rating_check CHECK (((rating <= 5) AND (rating > 0)))
);


ALTER TABLE public.rating_attractions OWNER TO jprophet89;

--
-- Name: rating_attractions_id_seq; Type: SEQUENCE; Schema: public; Owner: jprophet89
--

CREATE SEQUENCE rating_attractions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rating_attractions_id_seq OWNER TO jprophet89;

--
-- Name: rating_attractions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jprophet89
--

ALTER SEQUENCE rating_attractions_id_seq OWNED BY rating_attractions.id;


--
-- Name: rating_events; Type: TABLE; Schema: public; Owner: jprophet89; Tablespace: 
--

CREATE TABLE rating_events (
    id bigint NOT NULL,
    rating smallint NOT NULL,
    evaluationdate date NOT NULL,
    mobile_user_id bigint NOT NULL,
    event_id bigint NOT NULL,
    CONSTRAINT rating_events_rating_check CHECK (((rating <= 5) AND (rating > 0)))
);


ALTER TABLE public.rating_events OWNER TO jprophet89;

--
-- Name: rating_events_id_seq; Type: SEQUENCE; Schema: public; Owner: jprophet89
--

CREATE SEQUENCE rating_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rating_events_id_seq OWNER TO jprophet89;

--
-- Name: rating_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jprophet89
--

ALTER SEQUENCE rating_events_id_seq OWNED BY rating_events.id;


--
-- Name: rating_itineraries; Type: TABLE; Schema: public; Owner: jprophet89; Tablespace: 
--

CREATE TABLE rating_itineraries (
    id bigint NOT NULL,
    rating smallint NOT NULL,
    evaluationdate date NOT NULL,
    itinerary_id bigint NOT NULL,
    mobile_user_id bigint NOT NULL
);


ALTER TABLE public.rating_itineraries OWNER TO jprophet89;

--
-- Name: rating_itineraries_id_seq; Type: SEQUENCE; Schema: public; Owner: jprophet89
--

CREATE SEQUENCE rating_itineraries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rating_itineraries_id_seq OWNER TO jprophet89;

--
-- Name: rating_itineraries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jprophet89
--

ALTER SEQUENCE rating_itineraries_id_seq OWNED BY rating_itineraries.id;


--
-- Name: rating_services; Type: TABLE; Schema: public; Owner: jprophet89; Tablespace: 
--

CREATE TABLE rating_services (
    id bigint NOT NULL,
    rating smallint NOT NULL,
    evaluationdate date NOT NULL,
    mobile_user_id bigint NOT NULL,
    service_id bigint NOT NULL,
    CONSTRAINT rating_services_rating_check CHECK (((rating <= 5) AND (rating > 0)))
);


ALTER TABLE public.rating_services OWNER TO jprophet89;

--
-- Name: rating_services_id_seq; Type: SEQUENCE; Schema: public; Owner: jprophet89
--

CREATE SEQUENCE rating_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rating_services_id_seq OWNER TO jprophet89;

--
-- Name: rating_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jprophet89
--

ALTER SEQUENCE rating_services_id_seq OWNED BY rating_services.id;


--
-- Name: service_translations; Type: TABLE; Schema: public; Owner: jprophet89; Tablespace: 
--

CREATE TABLE service_translations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    schedule character varying(255),
    language character varying(20) NOT NULL,
    description text,
    transport character varying(100),
    service_id bigint NOT NULL
);


ALTER TABLE public.service_translations OWNER TO jprophet89;

--
-- Name: service_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: jprophet89
--

CREATE SEQUENCE service_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_translations_id_seq OWNER TO jprophet89;

--
-- Name: service_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jprophet89
--

ALTER SEQUENCE service_translations_id_seq OWNED BY service_translations.id;


--
-- Name: service_types; Type: TABLE; Schema: public; Owner: jprophet89; Tablespace: 
--

CREATE TABLE service_types (
    id bigint NOT NULL,
    service_id bigint NOT NULL,
    type_id integer NOT NULL
);


ALTER TABLE public.service_types OWNER TO jprophet89;

--
-- Name: service_types_id_seq; Type: SEQUENCE; Schema: public; Owner: jprophet89
--

CREATE SEQUENCE service_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_types_id_seq OWNER TO jprophet89;

--
-- Name: service_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jprophet89
--

ALTER SEQUENCE service_types_id_seq OWNED BY service_types.id;


--
-- Name: services; Type: TABLE; Schema: public; Owner: jprophet89; Tablespace: 
--

CREATE TABLE services (
    id bigint NOT NULL,
    site character varying(100),
    email character varying(100),
    address character varying(255),
    latitude real,
    longitude real,
    active boolean DEFAULT true NOT NULL,
    "timestamp" bigint NOT NULL,
    reference_point boolean NOT NULL,
    capacity integer,
    details character varying(255),
    rating real DEFAULT 0 NOT NULL,
    accessibility boolean DEFAULT false NOT NULL,
    web_user_id bigint NOT NULL,
    city_id integer NOT NULL
);


ALTER TABLE public.services OWNER TO jprophet89;

--
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: jprophet89
--

CREATE SEQUENCE services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_id_seq OWNER TO jprophet89;

--
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jprophet89
--

ALTER SEQUENCE services_id_seq OWNED BY services.id;


--
-- Name: types; Type: TABLE; Schema: public; Owner: jprophet89; Tablespace: 
--

CREATE TABLE types (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(255)
);


ALTER TABLE public.types OWNER TO jprophet89;

--
-- Name: types_id_seq; Type: SEQUENCE; Schema: public; Owner: jprophet89
--

CREATE SEQUENCE types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.types_id_seq OWNER TO jprophet89;

--
-- Name: types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jprophet89
--

ALTER SEQUENCE types_id_seq OWNED BY types.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: jprophet89; Tablespace: 
--

CREATE TABLE users (
    id bigint NOT NULL,
    email character varying(255) NOT NULL,
    username character varying(50),
    encrypted_password character varying(500) NOT NULL,
    type character(255),
    serviceid text,
    language_id integer,
    country_id integer,
    reset_password_token character varying(150),
    reset_password_sent_at date,
    remember_created_at date,
    sign_in_count integer,
    current_sign_in_at date,
    last_sign_in_at date,
    current_sign_in_ip character varying(50),
    last_sign_in_ip character varying(50),
    confirmation_token character varying(150),
    confirmed_at date,
    confirmation_sent_at date,
    unconfirmed_email character varying(50),
    failed_attempts integer,
    unlock_token character varying(50),
    locked_at date,
    CONSTRAINT users_type_check CHECK ((type = ANY (ARRAY['F'::bpchar, 'G'::bpchar, 'C'::bpchar])))
);


ALTER TABLE public.users OWNER TO jprophet89;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: jprophet89
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO jprophet89;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jprophet89
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: web_user_packs; Type: TABLE; Schema: public; Owner: jprophet89; Tablespace: 
--

CREATE TABLE web_user_packs (
    id bigint NOT NULL,
    subscriptiondate date NOT NULL,
    validity date NOT NULL,
    obs character varying(255),
    active boolean NOT NULL,
    pack_type_id integer NOT NULL,
    web_user_id bigint NOT NULL
);


ALTER TABLE public.web_user_packs OWNER TO jprophet89;

--
-- Name: web_user_packs_id_seq; Type: SEQUENCE; Schema: public; Owner: jprophet89
--

CREATE SEQUENCE web_user_packs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.web_user_packs_id_seq OWNER TO jprophet89;

--
-- Name: web_user_packs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jprophet89
--

ALTER SEQUENCE web_user_packs_id_seq OWNED BY web_user_packs.id;


--
-- Name: web_user_types; Type: TABLE; Schema: public; Owner: jprophet89; Tablespace: 
--

CREATE TABLE web_user_types (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(255)
);


ALTER TABLE public.web_user_types OWNER TO jprophet89;

--
-- Name: web_user_types_id_seq; Type: SEQUENCE; Schema: public; Owner: jprophet89
--

CREATE SEQUENCE web_user_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.web_user_types_id_seq OWNER TO jprophet89;

--
-- Name: web_user_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jprophet89
--

ALTER SEQUENCE web_user_types_id_seq OWNED BY web_user_types.id;


--
-- Name: web_users; Type: TABLE; Schema: public; Owner: jprophet89; Tablespace: 
--

CREATE TABLE web_users (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    enterprisename character varying(255),
    nif character varying(20),
    address character varying(255),
    active boolean NOT NULL,
    web_user_type_id integer NOT NULL,
    city_id integer
);


ALTER TABLE public.web_users OWNER TO jprophet89;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY attraction_translations ALTER COLUMN id SET DEFAULT nextval('attraction_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY attraction_types ALTER COLUMN id SET DEFAULT nextval('attraction_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY attractions ALTER COLUMN id SET DEFAULT nextval('attractions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY cities ALTER COLUMN id SET DEFAULT nextval('cities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY comment_attractions ALTER COLUMN id SET DEFAULT nextval('comment_attractions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY comment_events ALTER COLUMN id SET DEFAULT nextval('comment_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY comment_itineraries ALTER COLUMN id SET DEFAULT nextval('comment_itineraries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY comment_services ALTER COLUMN id SET DEFAULT nextval('comment_services_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY countries ALTER COLUMN id SET DEFAULT nextval('countries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY event_translations ALTER COLUMN id SET DEFAULT nextval('event_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY event_types ALTER COLUMN id SET DEFAULT nextval('event_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY events ALTER COLUMN id SET DEFAULT nextval('events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY itineraries ALTER COLUMN id SET DEFAULT nextval('itineraries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY itinerary_attractions ALTER COLUMN id SET DEFAULT nextval('itinerary_attractions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY itinerary_events ALTER COLUMN id SET DEFAULT nextval('itinerary_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY itinerary_services ALTER COLUMN id SET DEFAULT nextval('itinerary_services_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY itinerary_types ALTER COLUMN id SET DEFAULT nextval('itinerary_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY languages ALTER COLUMN id SET DEFAULT nextval('languages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY mobile_user_cities ALTER COLUMN id SET DEFAULT nextval('mobile_user_cities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY pack_types ALTER COLUMN id SET DEFAULT nextval('pack_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY photo_attractions ALTER COLUMN id SET DEFAULT nextval('photo_attractions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY photo_events ALTER COLUMN id SET DEFAULT nextval('photo_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY photo_services ALTER COLUMN id SET DEFAULT nextval('photo_services_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY rating_attractions ALTER COLUMN id SET DEFAULT nextval('rating_attractions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY rating_events ALTER COLUMN id SET DEFAULT nextval('rating_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY rating_itineraries ALTER COLUMN id SET DEFAULT nextval('rating_itineraries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY rating_services ALTER COLUMN id SET DEFAULT nextval('rating_services_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY service_translations ALTER COLUMN id SET DEFAULT nextval('service_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY service_types ALTER COLUMN id SET DEFAULT nextval('service_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY services ALTER COLUMN id SET DEFAULT nextval('services_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY types ALTER COLUMN id SET DEFAULT nextval('types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY web_user_packs ALTER COLUMN id SET DEFAULT nextval('web_user_packs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY web_user_types ALTER COLUMN id SET DEFAULT nextval('web_user_types_id_seq'::regclass);


--
-- Data for Name: attraction_translations; Type: TABLE DATA; Schema: public; Owner: jprophet89
--

COPY attraction_translations (id, name, schedule, language, description, transport, attraction_id) FROM stdin;
1	Bom Jesus	Todo o dia aberto	Portugues	No meio do monte	Autocarro e carro	1
\.


--
-- Name: attraction_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jprophet89
--

SELECT pg_catalog.setval('attraction_translations_id_seq', 1, true);


--
-- Data for Name: attraction_types; Type: TABLE DATA; Schema: public; Owner: jprophet89
--

COPY attraction_types (id, type_id, attraction_id) FROM stdin;
\.


--
-- Name: attraction_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jprophet89
--

SELECT pg_catalog.setval('attraction_types_id_seq', 1, false);


--
-- Data for Name: attractions; Type: TABLE DATA; Schema: public; Owner: jprophet89
--

COPY attractions (id, site, email, address, latitude, longitude, active, "timestamp", reference_point, price, rating, accessibility, city_id, web_user_id) FROM stdin;
1	www.bomjesus.com	bom@jesus.pt	No meio do monte	41.532299	-8.34234047	t	1388777929	t	Gratuito	0	t	3	17
\.


--
-- Name: attractions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jprophet89
--

SELECT pg_catalog.setval('attractions_id_seq', 1, true);


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: jprophet89
--

COPY cities (id, name, abv, country_id) FROM stdin;
1	Lisboa	LSB	188
2	Porto	PRT	188
3	Braga	BRG	188
4	Coimbra	CBR	188
5	Amadora	AMD	188
6	Vila Nova de Gaia	VNG	188
7	Setúbal	STB	188
8	Beja	BJA	188
9	Évora	EVR	188
10	Faro	FAR	188
11	Portimão	PTM	188
12	Vila Real	VRL	188
13	Bragança	BGC	188
14	Viana do Castelo	VCT	188
15	Alcobaça	ACB	188
16	Funchal	FUN	188
17	Portalegre	PTG	188
18	Aveiro	AVR	188
19	Almada	ALM	188
20	Barreiro	BRR	188
21	Cartaxo	CTX	188
22	Elvas	ELV	188
23	Chaves	CHV	188
24	Fátima	VNO	188
25	Espinho	ESP	188
26	Guarda	GRD	188
27	Gouveia	GVA	188
28	Fundão	FND	188
29	Leiria	LRA	188
30	Maia	MAI	188
31	Loures	LRS	188
32	Moura	MRA	188
33	Mirandela	MDL	188
34	Penafiel	PNF	188
35	Pinhel	PNH	188
36	Praia da Vitória	VPV	188
37	Queluz	SNT	188
38	Ribeira Grande	RGR	188
39	Santana	STN	188
40	Santa Cruz	SCR	188
41	Seia	SEI	188
42	São Pedro do Sul	SPS	188
43	Tomar	TMR	188
44	Tavira	TVR	188
45	Trancoso	TCS	188
46	Trofa	TRF	188
\.


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jprophet89
--

SELECT pg_catalog.setval('cities_id_seq', 46, true);


--
-- Data for Name: comment_attractions; Type: TABLE DATA; Schema: public; Owner: jprophet89
--

COPY comment_attractions (id, comment, evaluationdate, mobile_user_id, attraction_id) FROM stdin;
\.


--
-- Name: comment_attractions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jprophet89
--

SELECT pg_catalog.setval('comment_attractions_id_seq', 1, false);


--
-- Data for Name: comment_events; Type: TABLE DATA; Schema: public; Owner: jprophet89
--

COPY comment_events (id, comment, evaluationdate, mobile_user_id, event_id) FROM stdin;
\.


--
-- Name: comment_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jprophet89
--

SELECT pg_catalog.setval('comment_events_id_seq', 1, false);


--
-- Data for Name: comment_itineraries; Type: TABLE DATA; Schema: public; Owner: jprophet89
--

COPY comment_itineraries (id, comment, evaluationdate, itinerary_id, mobile_user_id) FROM stdin;
\.


--
-- Name: comment_itineraries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jprophet89
--

SELECT pg_catalog.setval('comment_itineraries_id_seq', 1, false);


--
-- Data for Name: comment_services; Type: TABLE DATA; Schema: public; Owner: jprophet89
--

COPY comment_services (id, comment, evaluationdate, mobile_user_id, service_id) FROM stdin;
\.


--
-- Name: comment_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jprophet89
--

SELECT pg_catalog.setval('comment_services_id_seq', 1, false);


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: jprophet89
--

COPY countries (id, name, abv) FROM stdin;
1	Afghanistan	AF
2	Albania	AL
3	Algeria	DZ
4	American Samoa	AS
5	Andorra	AD
6	Angola	AO
7	Anguilla	AI
8	Antarctica	AQ
9	Antigua and Barbuda	AG
10	Argentina	AR
11	Armenia	AM
12	Aruba	AW
13	Australia	AU
14	Austria	AT
15	Azerbaijan	AZ
16	Bahamas	BS
17	Bahrain	BH
18	Bangladesh	BD
19	Barbados	BB
20	Belarus	BY
21	Belgium	BE
22	Belize	BZ
23	Benin	BJ
24	Bermuda	BM
25	Bhutan	BT
26	Bolivia	BO
27	Bosnia and Herzegovina	BA
28	Botswana	BW
29	Bouvet Island	BV
30	Brazil	BR
31	British Antarctic Territory	BQ
32	British Indian Ocean Territory	IO
33	British Virgin Islands	VG
34	Brunei	BN
35	Bulgaria	BG
36	Burkina Faso	BF
37	Burundi	BI
38	Cambodia	KH
39	Cameroon	CM
40	Canada	CA
41	Canton and Enderbury Islands	CT
42	Cape Verde	CV
43	Cayman Islands	KY
44	Central African Republic	CF
45	Chad	TD
46	Chile	CL
47	China	CN
48	Christmas Island	CX
49	Cocos [Keeling] Islands	CC
50	Colombia	CO
51	Comoros	KM
52	Congo - Brazzaville	CG
53	Congo - Kinshasa	CD
54	Cook Islands	CK
55	Costa Rica	CR
56	Croatia	HR
57	Cuba	CU
58	Cyprus	CY
59	Czech Republic	CZ
60	Côte d’Ivoire	CI
61	Denmark	DK
62	Djibouti	DJ
63	Dominica	DM
64	Dominican Republic	DO
65	Dronning Maud Land	NQ
66	East Germany	DD
67	Ecuador	EC
68	Egypt	EG
69	El Salvador	SV
70	Equatorial Guinea	GQ
71	Eritrea	ER
72	Estonia	EE
73	Ethiopia	ET
74	Falkland Islands	FK
75	Faroe Islands	FO
76	Fiji	FJ
77	Finland	FI
78	France	FR
79	French Guiana	GF
80	French Polynesia	PF
81	French Southern Territories	TF
82	French Southern and Antarctic Territories	FQ
83	Gabon	GA
84	Gambia	GM
85	Georgia	GE
86	Germany	DE
87	Ghana	GH
88	Gibraltar	GI
89	Greece	GR
90	Greenland	GL
91	Grenada	GD
92	Guadeloupe	GP
93	Guam	GU
94	Guatemala	GT
95	Guernsey	GG
96	Guinea	GN
97	Guinea-Bissau	GW
98	Guyana	GY
99	Haiti	HT
100	Heard Island and McDonald Islands	HM
101	Honduras	HN
102	Hong Kong SAR China	HK
103	Hungary	HU
104	Iceland	IS
105	India	IN
106	Indonesia	abv
107	Iran	IR
108	Iraq	IQ
109	Ireland	IE
110	Isle of Man	IM
111	Israel	IL
112	Italy	IT
113	Jamaica	JM
114	Japan	JP
115	Jersey	JE
116	Johnston Island	JT
117	Jordan	JO
118	Kazakhstan	KZ
119	Kenya	KE
120	Kiribati	KI
121	Kuwait	KW
122	Kyrgyzstan	KG
123	Laos	LA
124	Latvia	LV
125	Lebanon	LB
126	Lesotho	LS
127	Liberia	LR
128	Libya	LY
129	Liechtenstein	LI
130	Lithuania	LT
131	Luxembourg	LU
132	Macau SAR China	MO
133	Macedonia	MK
134	Madagascar	MG
135	Malawi	MW
136	Malaysia	MY
137	Maldives	MV
138	Mali	ML
139	Malta	MT
140	Marshall Islands	MH
141	Martinique	MQ
142	Mauritania	MR
143	Mauritius	MU
144	Mayotte	YT
145	Metropolitan France	FX
146	Mexico	MX
147	Micronesia	FM
148	Madvway Islands	MI
149	Moldova	MD
150	Monaco	MC
151	Mongolia	MN
152	Montenegro	ME
153	Montserrat	MS
154	Morocco	MA
155	Mozambique	MZ
156	Myanmar [Burma]	MM
157	Namibia	NA
158	Nauru	NR
159	Nepal	NP
160	Netherlands	NL
161	Netherlands Antilles	AN
162	Neutral Zone	NT
163	New Caledonia	NC
164	New Zealand	NZ
165	Nicaragua	NI
166	Niger	NE
167	Nigeria	NG
168	Niue	NU
169	Norfolk Island	NF
170	North Korea	KP
171	North Vietnam	VD
172	Northern Mariana Islands	MP
173	Norway	NO
174	Oman	OM
175	Pacific Islands Trust Territory	PC
176	Pakistan	PK
177	Palau	PW
178	Palestinian Territories	PS
179	Panama	PA
180	Panama Canal Zone	PZ
181	Papua New Guinea	PG
182	Paraguay	PY
183	People s Democratic Republic of Yemen	YD
184	Peru	PE
185	Philippines	PH
186	Pitcairn Islands	PN
187	Poland	PL
188	Portugal	PT
189	Puerto Rico	PR
190	Qatar	QA
191	Romania	RO
192	Russia	RU
193	Rwanda	RW
194	Réunion	RE
195	Saint Barthélemy	BL
196	Saint Helena	SH
197	Saint Kitts and Nevis	KN
198	Saint Lucia	LC
199	Saint Martin	MF
200	Saint Pierre and Miquelon	PM
201	Saint Vincent and the Grenadines	VC
202	Samoa	WS
203	San Marino	SM
204	Saudi Arabia	SA
205	Senegal	SN
206	Serbia	RS
207	Serbia and Montenegro	CS
208	Seychelles	SC
209	Sierra Leone	SL
210	Singapore	SG
211	Slovakia	SK
212	Slovenia	SI
213	Solomon Islands	SB
214	Somalia	SO
215	South Africa	ZA
216	South Georgia and the South Sandwich Islands	GS
217	South Korea	KR
218	Spain	ES
219	Sri Lanka	LK
220	Sudan	SD
221	Suriname	SR
222	Svalbard and Jan Mayen	SJ
223	Swaziland	SZ
224	Sweden	SE
225	Switzerland	CH
226	Syria	SY
227	São Tomé and Príncipe	ST
228	Taiwan	TW
229	Tajikistan	TJ
230	Tanzania	TZ
231	Thailand	TH
232	Timor-Leste	TL
233	Togo	TG
234	Tokelau	TK
235	Tonga	TO
236	Trinadvad and Tobago	TT
237	Tunisia	TN
238	Turkey	TR
239	Turkmenistan	TM
240	Turks and Caicos Islands	TC
241	Tuvalu	TV
242	U.S. Minor Outlying Islands	UM
243	U.S. Miscellaneous Pacific Islands	PU
244	U.S. Virgin Islands	VI
245	Uganda	UG
246	Ukraine	UA
247	Union of Soviet Socialist Republics	SU
248	United Arab Emirates	AE
249	United Kingdom	GB
250	United States	US
251	Unknown or Invaladv Region	ZZ
252	Uruguay	UY
253	Uzbekistan	UZ
254	Vanuatu	VU
255	Vatican City	VA
256	Venezuela	VE
257	Vietnam	VN
258	Wake Island	WK
259	Wallis and Futuna	WF
260	Western Sahara	EH
261	Yemen	YE
262	Zambia	ZM
263	Zimbabwe	ZW
264	Åland Islands	AX
\.


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jprophet89
--

SELECT pg_catalog.setval('countries_id_seq', 264, true);


--
-- Data for Name: event_translations; Type: TABLE DATA; Schema: public; Owner: jprophet89
--

COPY event_translations (id, name, schedule, language, description, transport, event_id) FROM stdin;
1	Festa de Sjoão	Todo o dia	Portugues	Festa cultural de braga	Autocarro e metro	1
\.


--
-- Name: event_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jprophet89
--

SELECT pg_catalog.setval('event_translations_id_seq', 1, true);


--
-- Data for Name: event_types; Type: TABLE DATA; Schema: public; Owner: jprophet89
--

COPY event_types (id, event_id, type_id) FROM stdin;
1	1	1
\.


--
-- Name: event_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jprophet89
--

SELECT pg_catalog.setval('event_types_id_seq', 1, true);


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: jprophet89
--

COPY events (id, site, email, address, latitude, longitude, active, "timestamp", startdate, enddate, organization, price, program, rating, accessibility, city_id, web_user_id) FROM stdin;
1	festa_sjoao.com	festa_sjoao@gmail.com	Avenida Central de Braga	41.3316002	-8.23412037	t	1388763615	2014-01-03	2014-01-03	Câmara Municipal de Braga	Gratuito até aos 11 anos 2€ a partir dos 11	Todo o dia	0	t	3	17
\.


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jprophet89
--

SELECT pg_catalog.setval('events_id_seq', 1, true);


--
-- Data for Name: itineraries; Type: TABLE DATA; Schema: public; Owner: jprophet89
--

COPY itineraries (id, name, description, itinerary_type_id, user_id) FROM stdin;
1	Rota das Catedrais	Rota com as principais Catedrais de Braga	1	1
2	Rota dos Estudantes	Rota dos estudantes na noite	6	7
3	Rota Arqueológica	Rota com pontos arqueológicos de Braga	5	1
4	Rapidinha	Rota para quem quer conecer Braga em pouco tempo	4	1
5	Rota 1	Uma rota muito gira	3	17
\.


--
-- Name: itineraries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jprophet89
--

SELECT pg_catalog.setval('itineraries_id_seq', 5, true);


--
-- Data for Name: itinerary_attractions; Type: TABLE DATA; Schema: public; Owner: jprophet89
--

COPY itinerary_attractions (id, "order", itinerary_id, attraction_id) FROM stdin;
\.


--
-- Name: itinerary_attractions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jprophet89
--

SELECT pg_catalog.setval('itinerary_attractions_id_seq', 1, false);


--
-- Data for Name: itinerary_events; Type: TABLE DATA; Schema: public; Owner: jprophet89
--

COPY itinerary_events (id, "order", itinerary_id, event_id) FROM stdin;
1	1	5	1
\.


--
-- Name: itinerary_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jprophet89
--

SELECT pg_catalog.setval('itinerary_events_id_seq', 1, true);


--
-- Data for Name: itinerary_services; Type: TABLE DATA; Schema: public; Owner: jprophet89
--

COPY itinerary_services (id, "order", itinerary_id, service_id) FROM stdin;
1	2	5	2
\.


--
-- Name: itinerary_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jprophet89
--

SELECT pg_catalog.setval('itinerary_services_id_seq', 1, true);


--
-- Data for Name: itinerary_types; Type: TABLE DATA; Schema: public; Owner: jprophet89
--

COPY itinerary_types (id, name, description) FROM stdin;
1	Religioso	Rotas que comtemplam lugares religiosos
2	Conhecer	Rotas que contemplam os principais locais de uma cidade
3	Gastronomia	Rotas sobre gastronomia
4	Rapidinhas	Rotas para conhecer a cidade/localidade em pouco tempo
5	Arte	Rotas com os locais relacionados com arte como museus, monumentos
6	Noite	Rotas com locais para sair à noite
\.


--
-- Name: itinerary_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jprophet89
--

SELECT pg_catalog.setval('itinerary_types_id_seq', 6, true);


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: jprophet89
--

COPY languages (id, name, abv, description) FROM stdin;
1	Portugues	PT	Lingua Tuga
2	Ingles	EN	Lingua de Sua Majestade
\.


--
-- Name: languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jprophet89
--

SELECT pg_catalog.setval('languages_id_seq', 2, true);


--
-- Data for Name: mobile_user_cities; Type: TABLE DATA; Schema: public; Owner: jprophet89
--

COPY mobile_user_cities (id, city_id, mobile_user_id) FROM stdin;
\.


--
-- Name: mobile_user_cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jprophet89
--

SELECT pg_catalog.setval('mobile_user_cities_id_seq', 1, false);


--
-- Data for Name: mobile_users; Type: TABLE DATA; Schema: public; Owner: jprophet89
--

COPY mobile_users (id, firstname, surname, gender, dateofbirth, active) FROM stdin;
7	Nuno	Pereira	M	1987-11-20	t
8	Rita	Faria	F	1991-09-28	t
9	João	Fonseca	M	1989-06-02	t
10	José	Pinheiro	M	1991-12-05	t
11	Catarina	Oliveira	F	1991-02-07	t
12	Flávio	Loureiro	M	1990-03-27	t
\.


--
-- Data for Name: pack_types; Type: TABLE DATA; Schema: public; Owner: jprophet89
--

COPY pack_types (id, name, description, duration, price) FROM stdin;
1	Simplex	Pack Simples que permite apenas nome e morada	0	0
2	Avançado	Pack que permite colocar vários dados do local	12	50
3	Profissional	Pack que permite colocar vários dados do local e criar eventos	12	70
4	Simplex extension	Extensão ao pack simples que permite ter mais um local associado ao mesmo user	0	0
5	Avançado extension	Extensão ao pack avançado que permite associar mais um local ao pacote	12	10
6	Profissional extension	Extensão ao pack professional que permite associar mais um local ao pacote	12	20
\.


--
-- Name: pack_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jprophet89
--

SELECT pg_catalog.setval('pack_types_id_seq', 6, true);


--
-- Data for Name: photo_attractions; Type: TABLE DATA; Schema: public; Owner: jprophet89
--

COPY photo_attractions (id, name, photo_file_name, photo_content_type, photo_file_size, photo_updated_at, description, attraction_id) FROM stdin;
\.


--
-- Name: photo_attractions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jprophet89
--

SELECT pg_catalog.setval('photo_attractions_id_seq', 1, false);


--
-- Data for Name: photo_events; Type: TABLE DATA; Schema: public; Owner: jprophet89
--

COPY photo_events (id, name, photo_file_name, photo_content_type, photo_file_size, photo_updated_at, description, event_id) FROM stdin;
\.


--
-- Name: photo_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jprophet89
--

SELECT pg_catalog.setval('photo_events_id_seq', 1, false);


--
-- Data for Name: photo_services; Type: TABLE DATA; Schema: public; Owner: jprophet89
--

COPY photo_services (id, name, photo_file_name, "photo_content_type ", photo_file_size, photo_updated_at, description, service_id) FROM stdin;
\.


--
-- Name: photo_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jprophet89
--

SELECT pg_catalog.setval('photo_services_id_seq', 1, false);


--
-- Data for Name: rating_attractions; Type: TABLE DATA; Schema: public; Owner: jprophet89
--

COPY rating_attractions (id, rating, evaluationdate, mobile_user_id, attraction_id) FROM stdin;
\.


--
-- Name: rating_attractions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jprophet89
--

SELECT pg_catalog.setval('rating_attractions_id_seq', 1, false);


--
-- Data for Name: rating_events; Type: TABLE DATA; Schema: public; Owner: jprophet89
--

COPY rating_events (id, rating, evaluationdate, mobile_user_id, event_id) FROM stdin;
\.


--
-- Name: rating_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jprophet89
--

SELECT pg_catalog.setval('rating_events_id_seq', 1, false);


--
-- Data for Name: rating_itineraries; Type: TABLE DATA; Schema: public; Owner: jprophet89
--

COPY rating_itineraries (id, rating, evaluationdate, itinerary_id, mobile_user_id) FROM stdin;
\.


--
-- Name: rating_itineraries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jprophet89
--

SELECT pg_catalog.setval('rating_itineraries_id_seq', 1, false);


--
-- Data for Name: rating_services; Type: TABLE DATA; Schema: public; Owner: jprophet89
--

COPY rating_services (id, rating, evaluationdate, mobile_user_id, service_id) FROM stdin;
\.


--
-- Name: rating_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jprophet89
--

SELECT pg_catalog.setval('rating_services_id_seq', 1, false);


--
-- Data for Name: service_translations; Type: TABLE DATA; Schema: public; Owner: jprophet89
--

COPY service_translations (id, name, schedule, language, description, transport, service_id) FROM stdin;
1	Taberna Belga	Todo o dia	Portugues	Sempre cheio	Autocarros e Metro ou Carro	2
\.


--
-- Name: service_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jprophet89
--

SELECT pg_catalog.setval('service_translations_id_seq', 1, true);


--
-- Data for Name: service_types; Type: TABLE DATA; Schema: public; Owner: jprophet89
--

COPY service_types (id, service_id, type_id) FROM stdin;
1	2	3
\.


--
-- Name: service_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jprophet89
--

SELECT pg_catalog.setval('service_types_id_seq', 1, true);


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: jprophet89
--

COPY services (id, site, email, address, latitude, longitude, active, "timestamp", reference_point, capacity, details, rating, accessibility, web_user_id, city_id) FROM stdin;
2	www.tabernabelga.pt	fransezinha@belga.pt	Perto da retunda	41.2345009	-8.92341995	t	1388768060	t	50	Sempre cheio	0	t	17	3
\.


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jprophet89
--

SELECT pg_catalog.setval('services_id_seq', 2, true);


--
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: jprophet89
--

COPY types (id, name, description) FROM stdin;
1	Cultural	um evento cultural
2	Religioso	um evento religioso
3	Gastronomico	Comida e bebidas
\.


--
-- Name: types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jprophet89
--

SELECT pg_catalog.setval('types_id_seq', 3, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: jprophet89
--

COPY users (id, email, username, encrypted_password, type, serviceid, language_id, country_id, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, failed_attempts, unlock_token, locked_at) FROM stdin;
1	turismo@cm-braga.pt	PTBraga	password	\N	\N	1	188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	geral@cm-porto.pt	PTPorto	password	\N	\N	1	188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2	conf.mariabolacha@gmail.com	MBolacha	password	\N	\N	1	188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3	sardinhabiba@pedrobandeiraconvida.com	Sardinha	password	\N	\N	1	188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4	geral@dieci.pt	Dieci	password	\N	\N	1	188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	belga@gmail.com	TBelga	password	\N	\N	1	188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13	estudio22.braga@gmail.com	estudio22	password	\N	\N	1	188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14	info@montalegrense.pt	montalegrense	password	\N	\N	1	188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15	mail@spiritocupcakes.com	spiritocupcakes	password	\N	\N	1	188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16	ferreiracapa@marceloaraujo.com	marceloaraujo	password	\N	\N	1	188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7	lx2n0xj@gmail.com	x2n0x	password	\N	\N	1	188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8	rivfaria@gmail.com	rivfaria	password	\N	\N	1	188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9	jprophet89@gmail.com	jprophet	password	\N	\N	1	188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10	7jpinheiro@gmail.com	jpinheiro	password	\N	\N	1	188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11	catarina.sofia2@gmail.com	cat	password	\N	\N	1	188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12	flavirrl@gmail.com	flavirrl	password	\N	\N	1	188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17	jprophet91@gmail.com	jprophet89	$2a$10$q3RX3K/EME6wQ3vt3qdMpelmCdCJIpCLZvcMTXz2sZc/7kpsATofm	\N	\N	1	188	\N	\N	\N	2	2014-01-04	2014-01-03	127.0.0.1	127.0.0.1	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jprophet89
--

SELECT pg_catalog.setval('users_id_seq', 17, true);


--
-- Data for Name: web_user_packs; Type: TABLE DATA; Schema: public; Owner: jprophet89
--

COPY web_user_packs (id, subscriptiondate, validity, obs, active, pack_type_id, web_user_id) FROM stdin;
\.


--
-- Name: web_user_packs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jprophet89
--

SELECT pg_catalog.setval('web_user_packs_id_seq', 1, false);


--
-- Data for Name: web_user_types; Type: TABLE DATA; Schema: public; Owner: jprophet89
--

COPY web_user_types (id, name, description) FROM stdin;
1	Turismo/Câmara	Entidades de turismo ou departamentos de turismo da câmara responsáveis por contribuir com conteudo certificado.
2	Restauração	Restaurantes, Bares, Discotecas, Pastelarias, Cafés, Pronto-a-Vestir
\.


--
-- Name: web_user_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jprophet89
--

SELECT pg_catalog.setval('web_user_types_id_seq', 2, true);


--
-- Data for Name: web_users; Type: TABLE DATA; Schema: public; Owner: jprophet89
--

COPY web_users (id, name, enterprisename, nif, address, active, web_user_type_id, city_id) FROM stdin;
1	Posto Turismo de Braga	Município de Braga	506901173	Av. da Liberdade, 1 4710-305 Braga	t	1	3
6	Posto Turismo do Porto	Município do Porto	501306099	Praça General Humberto Delgado 4049-001 Porto	t	1	2
2	Maria Bolacha	Maria Bolacha	\N	Av. D. João II 4715-275 Braga	t	2	3
3	Sardinha	Sardinha Biba	\N	Praça Dr. Cândido da Costa Pires, 4715-402 Braga	t	2	3
4	Dieci	Dieci	\N	São José de São Lázaro, Braga	t	2	3
5	Taberna Belga	Taberna Belga	\N	Rua Cónego Luciano Afonso dos Santos loja 1A, S. Vicente, 4700-371 Braga	t	2	3
13	Estudio 22	Estudio 22	506901174	Rua Dom Paio Mendes, n.º 22 4700-424 Braga	t	2	3
14	Pastelaria Montalegrense	Montalegrense	506901175	R. Nova de Santa Cruz, nº 10 e 12, 4700-409 Braga	t	2	3
15	Spirito Cupcakes & Coffee	Spirito	506901176	Largo São João de Souto, 19, 4700-326 Braga	t	2	3
16	Marcelo Araujo	Marcelo Araujo Lda	506901177	Rua dos Capelistas 45, 4700-307 Braga	t	2	3
17	Empresa 1	\N	12341233	Rua do sobe e desce	t	1	3
\.


--
-- Name: attraction_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY attraction_translations
    ADD CONSTRAINT attraction_translations_pkey PRIMARY KEY (id);


--
-- Name: attraction_types_pkey; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY attraction_types
    ADD CONSTRAINT attraction_types_pkey PRIMARY KEY (id);


--
-- Name: attractions_pkey; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY attractions
    ADD CONSTRAINT attractions_pkey PRIMARY KEY (id);


--
-- Name: cities_abv_key; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT cities_abv_key UNIQUE (abv);


--
-- Name: cities_name_key; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT cities_name_key UNIQUE (name);


--
-- Name: cities_pkey; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: comment_attractions_pkey; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY comment_attractions
    ADD CONSTRAINT comment_attractions_pkey PRIMARY KEY (id);


--
-- Name: comment_events_pkey; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY comment_events
    ADD CONSTRAINT comment_events_pkey PRIMARY KEY (id);


--
-- Name: comment_itineraries_pkey; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY comment_itineraries
    ADD CONSTRAINT comment_itineraries_pkey PRIMARY KEY (id);


--
-- Name: comment_services_pkey; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY comment_services
    ADD CONSTRAINT comment_services_pkey PRIMARY KEY (id);


--
-- Name: countries_abv_key; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_abv_key UNIQUE (abv);


--
-- Name: countries_name_key; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_name_key UNIQUE (name);


--
-- Name: countries_pkey; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: event_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY event_translations
    ADD CONSTRAINT event_translations_pkey PRIMARY KEY (id);


--
-- Name: event_types_pkey; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY event_types
    ADD CONSTRAINT event_types_pkey PRIMARY KEY (id);


--
-- Name: events_pkey; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: itineraries_name_key; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY itineraries
    ADD CONSTRAINT itineraries_name_key UNIQUE (name);


--
-- Name: itineraries_pkey; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY itineraries
    ADD CONSTRAINT itineraries_pkey PRIMARY KEY (id);


--
-- Name: itinerary_attractions_pkey; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY itinerary_attractions
    ADD CONSTRAINT itinerary_attractions_pkey PRIMARY KEY (id);


--
-- Name: itinerary_events_pkey; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY itinerary_events
    ADD CONSTRAINT itinerary_events_pkey PRIMARY KEY (id);


--
-- Name: itinerary_services_pkey; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY itinerary_services
    ADD CONSTRAINT itinerary_services_pkey PRIMARY KEY (id);


--
-- Name: itinerary_types_name_key; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY itinerary_types
    ADD CONSTRAINT itinerary_types_name_key UNIQUE (name);


--
-- Name: itinerary_types_pkey; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY itinerary_types
    ADD CONSTRAINT itinerary_types_pkey PRIMARY KEY (id);


--
-- Name: languages_abv_key; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY languages
    ADD CONSTRAINT languages_abv_key UNIQUE (abv);


--
-- Name: languages_name_key; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY languages
    ADD CONSTRAINT languages_name_key UNIQUE (name);


--
-- Name: languages_pkey; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);


--
-- Name: mobile_user_cities_pkey; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY mobile_user_cities
    ADD CONSTRAINT mobile_user_cities_pkey PRIMARY KEY (id);


--
-- Name: mobile_users_pkey; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY mobile_users
    ADD CONSTRAINT mobile_users_pkey PRIMARY KEY (id);


--
-- Name: pack_types_name_key; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY pack_types
    ADD CONSTRAINT pack_types_name_key UNIQUE (name);


--
-- Name: pack_types_pkey; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY pack_types
    ADD CONSTRAINT pack_types_pkey PRIMARY KEY (id);


--
-- Name: photo_attractions_pkey; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY photo_attractions
    ADD CONSTRAINT photo_attractions_pkey PRIMARY KEY (id);


--
-- Name: photo_events_pkey; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY photo_events
    ADD CONSTRAINT photo_events_pkey PRIMARY KEY (id);


--
-- Name: photo_services_pkey; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY photo_services
    ADD CONSTRAINT photo_services_pkey PRIMARY KEY (id);


--
-- Name: rating_attractions_pkey; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY rating_attractions
    ADD CONSTRAINT rating_attractions_pkey PRIMARY KEY (id);


--
-- Name: rating_events_pkey; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY rating_events
    ADD CONSTRAINT rating_events_pkey PRIMARY KEY (id);


--
-- Name: rating_itineraries_pkey; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY rating_itineraries
    ADD CONSTRAINT rating_itineraries_pkey PRIMARY KEY (id);


--
-- Name: rating_services_pkey; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY rating_services
    ADD CONSTRAINT rating_services_pkey PRIMARY KEY (id);


--
-- Name: service_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY service_translations
    ADD CONSTRAINT service_translations_pkey PRIMARY KEY (id);


--
-- Name: service_types_pkey; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY service_types
    ADD CONSTRAINT service_types_pkey PRIMARY KEY (id);


--
-- Name: services_pkey; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: types_name_key; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY types
    ADD CONSTRAINT types_name_key UNIQUE (name);


--
-- Name: types_pkey; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY types
    ADD CONSTRAINT types_pkey PRIMARY KEY (id);


--
-- Name: users_email_key; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_username_key; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: web_user_packs_pkey; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY web_user_packs
    ADD CONSTRAINT web_user_packs_pkey PRIMARY KEY (id);


--
-- Name: web_user_types_name_key; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY web_user_types
    ADD CONSTRAINT web_user_types_name_key UNIQUE (name);


--
-- Name: web_user_types_pkey; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY web_user_types
    ADD CONSTRAINT web_user_types_pkey PRIMARY KEY (id);


--
-- Name: web_users_nif_key; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY web_users
    ADD CONSTRAINT web_users_nif_key UNIQUE (nif);


--
-- Name: web_users_pkey; Type: CONSTRAINT; Schema: public; Owner: jprophet89; Tablespace: 
--

ALTER TABLE ONLY web_users
    ADD CONSTRAINT web_users_pkey PRIMARY KEY (id);


--
-- Name: itinerary_attractions_index; Type: INDEX; Schema: public; Owner: jprophet89; Tablespace: 
--

CREATE INDEX itinerary_attractions_index ON itinerary_attractions USING btree (itinerary_id, attraction_id);


--
-- Name: itinerary_events_index; Type: INDEX; Schema: public; Owner: jprophet89; Tablespace: 
--

CREATE INDEX itinerary_events_index ON itinerary_events USING btree (itinerary_id, event_id);


--
-- Name: itinerary_services_index; Type: INDEX; Schema: public; Owner: jprophet89; Tablespace: 
--

CREATE INDEX itinerary_services_index ON itinerary_services USING btree (itinerary_id, service_id);


--
-- Name: photo_events_index; Type: INDEX; Schema: public; Owner: jprophet89; Tablespace: 
--

CREATE INDEX photo_events_index ON photo_events USING btree (event_id);


--
-- Name: photos_attractions_index; Type: INDEX; Schema: public; Owner: jprophet89; Tablespace: 
--

CREATE INDEX photos_attractions_index ON photo_attractions USING btree (attraction_id);


--
-- Name: photos_services_index; Type: INDEX; Schema: public; Owner: jprophet89; Tablespace: 
--

CREATE INDEX photos_services_index ON photo_services USING btree (service_id);


--
-- Name: fkattraction335552; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY attraction_types
    ADD CONSTRAINT fkattraction335552 FOREIGN KEY (type_id) REFERENCES types(id);


--
-- Name: fkattraction355171; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY attractions
    ADD CONSTRAINT fkattraction355171 FOREIGN KEY (web_user_id) REFERENCES web_users(id);


--
-- Name: fkattraction698167; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY attractions
    ADD CONSTRAINT fkattraction698167 FOREIGN KEY (city_id) REFERENCES cities(id);


--
-- Name: fkattraction818439; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY attraction_translations
    ADD CONSTRAINT fkattraction818439 FOREIGN KEY (attraction_id) REFERENCES attractions(id);


--
-- Name: fkattraction943262; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY attraction_types
    ADD CONSTRAINT fkattraction943262 FOREIGN KEY (attraction_id) REFERENCES attractions(id);


--
-- Name: fkcities964228; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT fkcities964228 FOREIGN KEY (country_id) REFERENCES countries(id);


--
-- Name: fkcomment_at408705; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY comment_attractions
    ADD CONSTRAINT fkcomment_at408705 FOREIGN KEY (mobile_user_id) REFERENCES mobile_users(id);


--
-- Name: fkcomment_at837170; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY comment_attractions
    ADD CONSTRAINT fkcomment_at837170 FOREIGN KEY (attraction_id) REFERENCES attractions(id);


--
-- Name: fkcomment_ev460949; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY comment_events
    ADD CONSTRAINT fkcomment_ev460949 FOREIGN KEY (mobile_user_id) REFERENCES mobile_users(id);


--
-- Name: fkcomment_ev768047; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY comment_events
    ADD CONSTRAINT fkcomment_ev768047 FOREIGN KEY (event_id) REFERENCES events(id);


--
-- Name: fkcomment_it135939; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY comment_itineraries
    ADD CONSTRAINT fkcomment_it135939 FOREIGN KEY (itinerary_id) REFERENCES itineraries(id);


--
-- Name: fkcomment_it246343; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY comment_itineraries
    ADD CONSTRAINT fkcomment_it246343 FOREIGN KEY (mobile_user_id) REFERENCES mobile_users(id);


--
-- Name: fkcomment_se477012; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY comment_services
    ADD CONSTRAINT fkcomment_se477012 FOREIGN KEY (service_id) REFERENCES services(id);


--
-- Name: fkcomment_se94795; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY comment_services
    ADD CONSTRAINT fkcomment_se94795 FOREIGN KEY (mobile_user_id) REFERENCES mobile_users(id);


--
-- Name: fkevent_tran72033; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY event_translations
    ADD CONSTRAINT fkevent_tran72033 FOREIGN KEY (event_id) REFERENCES events(id);


--
-- Name: fkevent_type299018; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY event_types
    ADD CONSTRAINT fkevent_type299018 FOREIGN KEY (event_id) REFERENCES events(id);


--
-- Name: fkevent_type334331; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY event_types
    ADD CONSTRAINT fkevent_type334331 FOREIGN KEY (type_id) REFERENCES types(id);


--
-- Name: fkevents39646; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY events
    ADD CONSTRAINT fkevents39646 FOREIGN KEY (city_id) REFERENCES cities(id);


--
-- Name: fkevents878605; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY events
    ADD CONSTRAINT fkevents878605 FOREIGN KEY (web_user_id) REFERENCES web_users(id);


--
-- Name: fkitinerarie234991; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY itineraries
    ADD CONSTRAINT fkitinerarie234991 FOREIGN KEY (itinerary_type_id) REFERENCES itinerary_types(id);


--
-- Name: fkitinerarie798742; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY itineraries
    ADD CONSTRAINT fkitinerarie798742 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fkitinerary_123823; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY itinerary_services
    ADD CONSTRAINT fkitinerary_123823 FOREIGN KEY (itinerary_id) REFERENCES itineraries(id);


--
-- Name: fkitinerary_269539; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY itinerary_attractions
    ADD CONSTRAINT fkitinerary_269539 FOREIGN KEY (itinerary_id) REFERENCES itineraries(id);


--
-- Name: fkitinerary_315722; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY itinerary_attractions
    ADD CONSTRAINT fkitinerary_315722 FOREIGN KEY (attraction_id) REFERENCES attractions(id);


--
-- Name: fkitinerary_534461; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY itinerary_events
    ADD CONSTRAINT fkitinerary_534461 FOREIGN KEY (itinerary_id) REFERENCES itineraries(id);


--
-- Name: fkitinerary_830266; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY itinerary_services
    ADD CONSTRAINT fkitinerary_830266 FOREIGN KEY (service_id) REFERENCES services(id);


--
-- Name: fkitinerary_894772; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY itinerary_events
    ADD CONSTRAINT fkitinerary_894772 FOREIGN KEY (event_id) REFERENCES events(id);


--
-- Name: fkmobile_use157566; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY mobile_users
    ADD CONSTRAINT fkmobile_use157566 FOREIGN KEY (id) REFERENCES users(id);


--
-- Name: fkmobile_use312350; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY mobile_user_cities
    ADD CONSTRAINT fkmobile_use312350 FOREIGN KEY (mobile_user_id) REFERENCES mobile_users(id);


--
-- Name: fkmobile_use417457; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY mobile_user_cities
    ADD CONSTRAINT fkmobile_use417457 FOREIGN KEY (city_id) REFERENCES cities(id);


--
-- Name: fkphoto_attr999784; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY photo_attractions
    ADD CONSTRAINT fkphoto_attr999784 FOREIGN KEY (attraction_id) REFERENCES attractions(id);


--
-- Name: fkphoto_even886063; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY photo_events
    ADD CONSTRAINT fkphoto_even886063 FOREIGN KEY (event_id) REFERENCES events(id);


--
-- Name: fkphoto_serv767782; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY photo_services
    ADD CONSTRAINT fkphoto_serv767782 FOREIGN KEY (service_id) REFERENCES services(id);


--
-- Name: fkrating_att120339; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY rating_attractions
    ADD CONSTRAINT fkrating_att120339 FOREIGN KEY (attraction_id) REFERENCES attractions(id);


--
-- Name: fkrating_att548804; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY rating_attractions
    ADD CONSTRAINT fkrating_att548804 FOREIGN KEY (mobile_user_id) REFERENCES mobile_users(id);


--
-- Name: fkrating_eve154708; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY rating_events
    ADD CONSTRAINT fkrating_eve154708 FOREIGN KEY (event_id) REFERENCES events(id);


--
-- Name: fkrating_eve587885; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY rating_events
    ADD CONSTRAINT fkrating_eve587885 FOREIGN KEY (mobile_user_id) REFERENCES mobile_users(id);


--
-- Name: fkrating_iti767737; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY rating_itineraries
    ADD CONSTRAINT fkrating_iti767737 FOREIGN KEY (mobile_user_id) REFERENCES mobile_users(id);


--
-- Name: fkrating_iti821570; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY rating_itineraries
    ADD CONSTRAINT fkrating_iti821570 FOREIGN KEY (itinerary_id) REFERENCES itineraries(id);


--
-- Name: fkrating_ser410705; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY rating_services
    ADD CONSTRAINT fkrating_ser410705 FOREIGN KEY (service_id) REFERENCES services(id);


--
-- Name: fkrating_ser989077; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY rating_services
    ADD CONSTRAINT fkrating_ser989077 FOREIGN KEY (mobile_user_id) REFERENCES mobile_users(id);


--
-- Name: fkservice_tr163430; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY service_translations
    ADD CONSTRAINT fkservice_tr163430 FOREIGN KEY (service_id) REFERENCES services(id);


--
-- Name: fkservice_ty368105; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY service_types
    ADD CONSTRAINT fkservice_ty368105 FOREIGN KEY (type_id) REFERENCES types(id);


--
-- Name: fkservice_ty910982; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY service_types
    ADD CONSTRAINT fkservice_ty910982 FOREIGN KEY (service_id) REFERENCES services(id);


--
-- Name: fkservices448250; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY services
    ADD CONSTRAINT fkservices448250 FOREIGN KEY (web_user_id) REFERENCES web_users(id);


--
-- Name: fkservices501589; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY services
    ADD CONSTRAINT fkservices501589 FOREIGN KEY (city_id) REFERENCES cities(id);


--
-- Name: fkusers63206; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fkusers63206 FOREIGN KEY (language_id) REFERENCES languages(id);


--
-- Name: fkusers767609; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fkusers767609 FOREIGN KEY (country_id) REFERENCES countries(id);


--
-- Name: fkweb_user_p363066; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY web_user_packs
    ADD CONSTRAINT fkweb_user_p363066 FOREIGN KEY (web_user_id) REFERENCES web_users(id);


--
-- Name: fkweb_user_p657878; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY web_user_packs
    ADD CONSTRAINT fkweb_user_p657878 FOREIGN KEY (pack_type_id) REFERENCES pack_types(id);


--
-- Name: fkweb_users551441; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY web_users
    ADD CONSTRAINT fkweb_users551441 FOREIGN KEY (id) REFERENCES users(id);


--
-- Name: fkweb_users762424; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY web_users
    ADD CONSTRAINT fkweb_users762424 FOREIGN KEY (web_user_type_id) REFERENCES web_user_types(id);


--
-- Name: fkweb_users845994; Type: FK CONSTRAINT; Schema: public; Owner: jprophet89
--

ALTER TABLE ONLY web_users
    ADD CONSTRAINT fkweb_users845994 FOREIGN KEY (city_id) REFERENCES cities(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: jprophet89
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM jprophet89;
GRANT ALL ON SCHEMA public TO jprophet89;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

