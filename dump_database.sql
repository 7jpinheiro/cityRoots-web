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
-- Name: attraction_big_types; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE attraction_big_types (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(255)
);


ALTER TABLE public.attraction_big_types OWNER TO postgres;

--
-- Name: attraction_big_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE attraction_big_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attraction_big_types_id_seq OWNER TO postgres;

--
-- Name: attraction_big_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE attraction_big_types_id_seq OWNED BY attraction_big_types.id;


--
-- Name: attraction_types; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE attraction_types (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(255),
    attraction_big_types_id integer NOT NULL
);


ALTER TABLE public.attraction_types OWNER TO postgres;

--
-- Name: attraction_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE attraction_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attraction_types_id_seq OWNER TO postgres;

--
-- Name: attraction_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE attraction_types_id_seq OWNED BY attraction_types.id;


--
-- Name: attractions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE attractions (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    schedule character varying(255),
    site character varying(100),
    email character varying(100),
    address character varying(255),
    latitude real,
    longitude real,
    transport character varying(100),
    active boolean NOT NULL,
    "timestamp" bigint NOT NULL,
    reference_point boolean NOT NULL,
    price character varying(255),
    attraction_type_id integer NOT NULL,
    city_id integer NOT NULL,
    web_user_id bigint NOT NULL
);


ALTER TABLE public.attractions OWNER TO postgres;

--
-- Name: attractions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE attractions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attractions_id_seq OWNER TO postgres;

--
-- Name: attractions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE attractions_id_seq OWNED BY attractions.id;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cities (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    abv character varying(10) NOT NULL,
    country_id integer NOT NULL
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_id_seq OWNER TO postgres;

--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cities_id_seq OWNED BY cities.id;


--
-- Name: comment_attractions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE comment_attractions (
    id bigint NOT NULL,
    comment text NOT NULL,
    evaluationdate date NOT NULL,
    mobile_user_id bigint NOT NULL,
    attraction_id bigint NOT NULL
);


ALTER TABLE public.comment_attractions OWNER TO postgres;

--
-- Name: comment_attractions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE comment_attractions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comment_attractions_id_seq OWNER TO postgres;

--
-- Name: comment_attractions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE comment_attractions_id_seq OWNED BY comment_attractions.id;


--
-- Name: comment_events; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE comment_events (
    id bigint NOT NULL,
    comment text NOT NULL,
    evaluationdate date NOT NULL,
    mobile_user_id bigint NOT NULL,
    event_id bigint NOT NULL
);


ALTER TABLE public.comment_events OWNER TO postgres;

--
-- Name: comment_events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE comment_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comment_events_id_seq OWNER TO postgres;

--
-- Name: comment_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE comment_events_id_seq OWNED BY comment_events.id;


--
-- Name: comment_itineraries; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE comment_itineraries (
    id bigint NOT NULL,
    comment character varying(500) NOT NULL,
    evaluationdate date NOT NULL,
    itinerary_id bigint NOT NULL,
    mobile_user_id bigint NOT NULL
);


ALTER TABLE public.comment_itineraries OWNER TO postgres;

--
-- Name: comment_itineraries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE comment_itineraries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comment_itineraries_id_seq OWNER TO postgres;

--
-- Name: comment_itineraries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE comment_itineraries_id_seq OWNED BY comment_itineraries.id;


--
-- Name: comment_services; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE comment_services (
    id bigint NOT NULL,
    comment text NOT NULL,
    evaluationdate date NOT NULL,
    mobile_user_id bigint NOT NULL,
    service_id bigint NOT NULL
);


ALTER TABLE public.comment_services OWNER TO postgres;

--
-- Name: comment_services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE comment_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comment_services_id_seq OWNER TO postgres;

--
-- Name: comment_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE comment_services_id_seq OWNED BY comment_services.id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE countries (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    abv character varying(10) NOT NULL
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.countries_id_seq OWNER TO postgres;

--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE countries_id_seq OWNED BY countries.id;


--
-- Name: event_types; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE event_types (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(255)
);


ALTER TABLE public.event_types OWNER TO postgres;

--
-- Name: event_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE event_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_types_id_seq OWNER TO postgres;

--
-- Name: event_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE event_types_id_seq OWNED BY event_types.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE events (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    schedule character varying(255),
    site character varying(100),
    email character varying(100),
    address character varying(255),
    latitude real,
    longitude real,
    transport character varying(100),
    active boolean NOT NULL,
    "timestamp" bigint NOT NULL,
    startdate date NOT NULL,
    enddate date NOT NULL,
    organization character varying(100),
    price character varying(255) NOT NULL,
    program character varying(500),
    event_type_id integer NOT NULL,
    city_id integer NOT NULL,
    web_user_id bigint NOT NULL
);


ALTER TABLE public.events OWNER TO postgres;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO postgres;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE events_id_seq OWNED BY events.id;


--
-- Name: itineraries; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE itineraries (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(255),
    itinerary_type_id integer NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.itineraries OWNER TO postgres;

--
-- Name: itineraries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE itineraries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.itineraries_id_seq OWNER TO postgres;

--
-- Name: itineraries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE itineraries_id_seq OWNED BY itineraries.id;


--
-- Name: itinerary_attractions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE itinerary_attractions (
    id bigint NOT NULL,
    "order" integer NOT NULL,
    itinerary_id bigint NOT NULL,
    attraction_id bigint NOT NULL
);


ALTER TABLE public.itinerary_attractions OWNER TO postgres;

--
-- Name: itinerary_attractions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE itinerary_attractions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.itinerary_attractions_id_seq OWNER TO postgres;

--
-- Name: itinerary_attractions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE itinerary_attractions_id_seq OWNED BY itinerary_attractions.id;


--
-- Name: itinerary_events; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE itinerary_events (
    id bigint NOT NULL,
    "order" integer NOT NULL,
    itinerary_id bigint NOT NULL,
    event_id bigint NOT NULL
);


ALTER TABLE public.itinerary_events OWNER TO postgres;

--
-- Name: itinerary_events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE itinerary_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.itinerary_events_id_seq OWNER TO postgres;

--
-- Name: itinerary_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE itinerary_events_id_seq OWNED BY itinerary_events.id;


--
-- Name: itinerary_services; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE itinerary_services (
    id bigint NOT NULL,
    "order" integer NOT NULL,
    itinerary_id bigint NOT NULL,
    service_id bigint NOT NULL
);


ALTER TABLE public.itinerary_services OWNER TO postgres;

--
-- Name: itinerary_services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE itinerary_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.itinerary_services_id_seq OWNER TO postgres;

--
-- Name: itinerary_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE itinerary_services_id_seq OWNED BY itinerary_services.id;


--
-- Name: itinerary_types; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE itinerary_types (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(255)
);


ALTER TABLE public.itinerary_types OWNER TO postgres;

--
-- Name: itinerary_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE itinerary_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.itinerary_types_id_seq OWNER TO postgres;

--
-- Name: itinerary_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE itinerary_types_id_seq OWNED BY itinerary_types.id;


--
-- Name: languages; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE languages (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    abv character varying(10) NOT NULL,
    description character varying(255)
);


ALTER TABLE public.languages OWNER TO postgres;

--
-- Name: languages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.languages_id_seq OWNER TO postgres;

--
-- Name: languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE languages_id_seq OWNED BY languages.id;


--
-- Name: mobile_user_cities; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mobile_user_cities (
    id bigint NOT NULL,
    city_id integer NOT NULL,
    mobile_user_id bigint NOT NULL
);


ALTER TABLE public.mobile_user_cities OWNER TO postgres;

--
-- Name: mobile_user_cities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mobile_user_cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mobile_user_cities_id_seq OWNER TO postgres;

--
-- Name: mobile_user_cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mobile_user_cities_id_seq OWNED BY mobile_user_cities.id;


--
-- Name: mobile_users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mobile_users (
    id bigint NOT NULL,
    firstname character varying(100),
    surname character varying(100),
    gender character(1),
    dateofbirth date,
    active boolean NOT NULL
);


ALTER TABLE public.mobile_users OWNER TO postgres;

--
-- Name: pack_types; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pack_types (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(255),
    duration smallint NOT NULL,
    price numeric(19,0) NOT NULL
);


ALTER TABLE public.pack_types OWNER TO postgres;

--
-- Name: pack_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pack_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pack_types_id_seq OWNER TO postgres;

--
-- Name: pack_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pack_types_id_seq OWNED BY pack_types.id;


--
-- Name: photo_attractions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE photo_attractions (
    id bigint NOT NULL,
    name character varying(100),
    photo_file_name character varying(100),
    photo_content_type character varying(100),
    photo_file_size bigint,
    photo_updated_at date,
    description character varying(255),
    attraction_id bigint NOT NULL
);


ALTER TABLE public.photo_attractions OWNER TO postgres;

--
-- Name: photo_attractions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE photo_attractions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photo_attractions_id_seq OWNER TO postgres;

--
-- Name: photo_attractions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE photo_attractions_id_seq OWNED BY photo_attractions.id;


--
-- Name: photo_events; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE photo_events (
    id bigint NOT NULL,
    url character varying(500) NOT NULL,
    name character varying(100),
    description character varying(255),
    extension character varying(10),
    event_id bigint NOT NULL
);


ALTER TABLE public.photo_events OWNER TO postgres;

--
-- Name: photo_events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE photo_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photo_events_id_seq OWNER TO postgres;

--
-- Name: photo_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE photo_events_id_seq OWNED BY photo_events.id;


--
-- Name: photo_services; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE photo_services (
    id bigint NOT NULL,
    url character varying(500) NOT NULL,
    name character varying(100),
    description character varying(255),
    extension character varying(10),
    service_id bigint NOT NULL
);


ALTER TABLE public.photo_services OWNER TO postgres;

--
-- Name: photo_services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE photo_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photo_services_id_seq OWNER TO postgres;

--
-- Name: photo_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE photo_services_id_seq OWNED BY photo_services.id;


--
-- Name: rating_attractions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rating_attractions (
    id bigint NOT NULL,
    rating smallint NOT NULL,
    evaluationdate date NOT NULL,
    mobile_user_id bigint NOT NULL,
    attraction_id bigint NOT NULL
);


ALTER TABLE public.rating_attractions OWNER TO postgres;

--
-- Name: rating_attractions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rating_attractions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rating_attractions_id_seq OWNER TO postgres;

--
-- Name: rating_attractions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE rating_attractions_id_seq OWNED BY rating_attractions.id;


--
-- Name: rating_events; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rating_events (
    id bigint NOT NULL,
    rating smallint NOT NULL,
    evaluationdate date NOT NULL,
    mobile_user_id bigint NOT NULL,
    event_id bigint NOT NULL
);


ALTER TABLE public.rating_events OWNER TO postgres;

--
-- Name: rating_events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rating_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rating_events_id_seq OWNER TO postgres;

--
-- Name: rating_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE rating_events_id_seq OWNED BY rating_events.id;


--
-- Name: rating_itineraries; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rating_itineraries (
    id bigint NOT NULL,
    rating smallint NOT NULL,
    evaluationdate date NOT NULL,
    itinerary_id bigint NOT NULL,
    mobile_user_id bigint NOT NULL
);


ALTER TABLE public.rating_itineraries OWNER TO postgres;

--
-- Name: rating_itineraries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rating_itineraries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rating_itineraries_id_seq OWNER TO postgres;

--
-- Name: rating_itineraries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE rating_itineraries_id_seq OWNED BY rating_itineraries.id;


--
-- Name: rating_services; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rating_services (
    id bigint NOT NULL,
    rating smallint NOT NULL,
    evaluationdate date NOT NULL,
    mobile_user_id bigint NOT NULL,
    service_id bigint NOT NULL
);


ALTER TABLE public.rating_services OWNER TO postgres;

--
-- Name: rating_services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rating_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rating_services_id_seq OWNER TO postgres;

--
-- Name: rating_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE rating_services_id_seq OWNED BY rating_services.id;


--
-- Name: service_types; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE service_types (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(255)
);


ALTER TABLE public.service_types OWNER TO postgres;

--
-- Name: service_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE service_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_types_id_seq OWNER TO postgres;

--
-- Name: service_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE service_types_id_seq OWNED BY service_types.id;


--
-- Name: services; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE services (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    schedule character varying(255),
    site character varying(100),
    email character varying(100),
    address character varying(255),
    latitude real,
    longitude real,
    transport character varying(100),
    active boolean NOT NULL,
    "timestamp" bigint NOT NULL,
    reference_point boolean NOT NULL,
    capacity integer,
    details character varying(255),
    service_type_id integer NOT NULL,
    web_user_id bigint NOT NULL,
    city_id integer NOT NULL
);


ALTER TABLE public.services OWNER TO postgres;

--
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_id_seq OWNER TO postgres;

--
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE services_id_seq OWNED BY services.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    id bigint NOT NULL,
    email character varying(255) NOT NULL,
    username character varying(50),
    encrypted_password character varying(500) NOT NULL,
    language_id integer NOT NULL,
    country_id integer,
    reset_password_token character varying(150),
    reset_password_sent_at date,
    remember_created_at date,
    sign_in_count integer,
    current_sign_in_at date,
    last_sign_in_at date,
    current_sign_in_ip character varying(50),
    last_sign_in_ip character varying(50),
    confirmation_token character varying(50),
    confirmed_at date,
    confirmation_sent_at date,
    unconfirmed_email character varying(50),
    failed_attempts integer,
    unlock_token character varying(50),
    locked_at date
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: web_user_packs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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


ALTER TABLE public.web_user_packs OWNER TO postgres;

--
-- Name: web_user_packs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE web_user_packs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.web_user_packs_id_seq OWNER TO postgres;

--
-- Name: web_user_packs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE web_user_packs_id_seq OWNED BY web_user_packs.id;


--
-- Name: web_user_types; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE web_user_types (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(255)
);


ALTER TABLE public.web_user_types OWNER TO postgres;

--
-- Name: web_user_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE web_user_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.web_user_types_id_seq OWNER TO postgres;

--
-- Name: web_user_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE web_user_types_id_seq OWNED BY web_user_types.id;


--
-- Name: web_users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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


ALTER TABLE public.web_users OWNER TO postgres;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attraction_big_types ALTER COLUMN id SET DEFAULT nextval('attraction_big_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attraction_types ALTER COLUMN id SET DEFAULT nextval('attraction_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attractions ALTER COLUMN id SET DEFAULT nextval('attractions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cities ALTER COLUMN id SET DEFAULT nextval('cities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comment_attractions ALTER COLUMN id SET DEFAULT nextval('comment_attractions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comment_events ALTER COLUMN id SET DEFAULT nextval('comment_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comment_itineraries ALTER COLUMN id SET DEFAULT nextval('comment_itineraries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comment_services ALTER COLUMN id SET DEFAULT nextval('comment_services_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY countries ALTER COLUMN id SET DEFAULT nextval('countries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY event_types ALTER COLUMN id SET DEFAULT nextval('event_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events ALTER COLUMN id SET DEFAULT nextval('events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY itineraries ALTER COLUMN id SET DEFAULT nextval('itineraries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY itinerary_attractions ALTER COLUMN id SET DEFAULT nextval('itinerary_attractions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY itinerary_events ALTER COLUMN id SET DEFAULT nextval('itinerary_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY itinerary_services ALTER COLUMN id SET DEFAULT nextval('itinerary_services_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY itinerary_types ALTER COLUMN id SET DEFAULT nextval('itinerary_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY languages ALTER COLUMN id SET DEFAULT nextval('languages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mobile_user_cities ALTER COLUMN id SET DEFAULT nextval('mobile_user_cities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pack_types ALTER COLUMN id SET DEFAULT nextval('pack_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY photo_attractions ALTER COLUMN id SET DEFAULT nextval('photo_attractions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY photo_events ALTER COLUMN id SET DEFAULT nextval('photo_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY photo_services ALTER COLUMN id SET DEFAULT nextval('photo_services_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rating_attractions ALTER COLUMN id SET DEFAULT nextval('rating_attractions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rating_events ALTER COLUMN id SET DEFAULT nextval('rating_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rating_itineraries ALTER COLUMN id SET DEFAULT nextval('rating_itineraries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rating_services ALTER COLUMN id SET DEFAULT nextval('rating_services_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY service_types ALTER COLUMN id SET DEFAULT nextval('service_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY services ALTER COLUMN id SET DEFAULT nextval('services_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY web_user_packs ALTER COLUMN id SET DEFAULT nextval('web_user_packs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY web_user_types ALTER COLUMN id SET DEFAULT nextval('web_user_types_id_seq'::regclass);


--
-- Data for Name: attraction_big_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY attraction_big_types (id, name, description) FROM stdin;
1	Turismo de Negócios	\N
2	City & Short Breaks	\N
3	Gastronomia	\N
4	Turismo de Natureza	\N
5	Turismo Religioso	\N
6	Touring Cultural e Paisagístico	\N
7	Saúde e Bem-estar	\N
\.


--
-- Name: attraction_big_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('attraction_big_types_id_seq', 1, false);


--
-- Data for Name: attraction_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY attraction_types (id, name, description, attraction_big_types_id) FROM stdin;
1	Centros de Congressos	\N	1
2	Restaurantes	\N	3
3	Adegas	\N	3
4	Jardins	\N	4
5	Igrejas	\N	5
6	Museus	\N	6
7	Monumentos	\N	6
8	Termas	\N	7
9	Piscinas	\N	7
\.


--
-- Name: attraction_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('attraction_types_id_seq', 1, false);


--
-- Data for Name: attractions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY attractions (id, name, description, schedule, site, email, address, latitude, longitude, transport, active, "timestamp", reference_point, price, attraction_type_id, city_id, web_user_id) FROM stdin;
2	Sé de Braga	A Sé Catedral é considerada como um centro de irradiação episcopal e um dos mais importantes templos do românico português, a sua história remonta à obra do primeiro bispo, D. Pedro de Braga, correspondendo à restauração da Sé episcopal em 1070, de que não se conservam vestígios.\nNesta catedral encontram-se os túmulos de Henrique de Borgonha e sua mulher, Teresa de Leão, os condes do Condado Portucalense, pais do rei D. Afonso Henriques.	\N	www.se-braga.pt	info@se-braga.pt, tmsb.educar@gmail.com	Monte do Bom Jesus 4715-056 Braga	8.25389671	41.3259697	\N	t	1387019634	t	\N	5	3	1
3	Tesouro - Museu da Sé de Braga	As coleções do Tesouro-Museu da Sé de Braga (TMSB) testemunham, no seu conjunto, mais de XV séculos da história da Arte e da vida da Igreja em Braga. Em formação desde a sua fundação, em 1930, o TMSB acolhe um valioso espólio, constituído por coleções de cerâmica, escultura, medalhística, mobiliário, numismática, ourivesaria, pintura, têxtil.\nA Exposição Permanente, Raízes de Eternidade. Jesus Cristo – Uma Igreja, consagrada à arte sacra, permite, através dos diferentes núcleos, revisitar a vida de Jesus Cristo e a história da Igreja em Braga. Esta é contada tomando como referência alguns arcebispos, desde o século V até ao século XX. A narração é complementada com os núcleos dedicados à paramentaria e ourivesaria.	De 3ª feira a domingo\nEncerra à 2ª feira.\n09h00-12h30 | 14h00-17h30 (18h30 no Verão)	www.se-braga.pt/tesouro_museu.php	catedralbraga@hotmail.com,tmsb.educar@gmail.com	Tesouro-Museu da Sé de Braga\nR. D. Paio Mendes, s/n 4700-424 Braga	8.25389671	41.3259697	\N	t	1387019634	f	Adultos e crianças a partir dos 10 anos: 3 €\nCrianças de 6 a 10 anos: 50% de desconto\nCrianças e jovens integrados em visitas escolares e acompanhantes: 50% de desconto\nCrianças com menos de 6 anos: gratuito	6	3	1
1	Bom Jesus	A Igreja do Bom Jesus foi desenhada pelo arquitecto Carlos Amarante, por encomenda do Arcebispo D. Gaspar de Bragança, para substituir uma primitiva igreja, mandada construir por D. Rodrigo de Moura Teles que se encontrava em ruínas. As obras começaram em 1 de Junho de 1784, tendo ficado concluídas em 1811.\r\nÉ um dos primeiros edifícios neoclássicos em Portugal, e a fachada é ladeada por duas torres e termina num frontão triangular.		www.estanciadobomjesus.com	geral@estanciadobomjesus.com	Monte do Bom Jesus 4715-056 Braga	8.22375298	41.331707	\N	t	1387019634	t		5	3	1
\.


--
-- Name: attractions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('attractions_id_seq', 6, true);


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
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
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cities_id_seq', 1, false);


--
-- Data for Name: comment_attractions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comment_attractions (id, comment, evaluationdate, mobile_user_id, attraction_id) FROM stdin;
1	Principal atração turística de Braga, fica no topo de uma escadaria marcada por sinais religiosos católicos (estações com cenas da Paixão de Cristo). Prepare o fôlego para subir as escadas ou utilize o funicular. Os jardins em torno da igreja ficam lindos na primavera.	2013-12-01	7	1
2	É bonito, mas nada espetacular. Se tem uma bela vista desde a parte inferior, de onde se vêem as escadarias e a igreja no alto. A vista lá de cima também é razoável. Suba de "funicular" e desça andando. O local merecia estar num estado de conservação melhor.	2013-12-02	8	1
3	Visitar o Bom Jesus é fazer uma viagem pelo local mais belo do norte de Portugal, tendo em conta a sua importância histórica.	2013-12-02	9	1
4	O lugar é simplesmente lindo! A natureza exuberante, a arquitetura combinando muito com a natureza, os jardins super bem cuidados, a igreja e seus sinos, o bonde tocado à água, enfim, a composição toda vale ser visitada. Se possível, subir ou descer sem ser pelo bonde, pelas escadarias, entre as estações da via sacra e a natureza.	2013-12-03	10	1
5	Magnifica vegetação, vista deslumbrante sobre a cidade de Braga.Pode-se subir de elevador ou de carro. Muito agradável no Verão e no Inverno.	2013-12-04	11	1
6	Ir a Braga e não ir ao Bom Jesus é como ir a Roma e não ver o Papa. É um sítio lindíssimo, com uma igreja bonita e com imensos espaços verdes. Aproveite para fazer um pouco de exercício e subir a escadaria :)	2013-12-05	12	1
7	Sítio calmo e bem aproveitado. Nota-se preocupação em dar resposta à população local e ao turismo. É interessante o claustro e o próprio altar.	2013-12-01	7	2
8	Fiquei agradável,ente surpresa ao visitar esta igreja. Bela construção, com um exterior bastante interessante com sua mistura de estilos. O interior é igualmente belo com vitrais, ricas capelas e imagens. Destaco o altar, muito bonito. Valeu a visita.	2013-12-02	8	2
9	É uma bela obra de arte barroca, que nos transmite história através dos ricos detalhes no altar e por toda a igreja, ao mesmo tempo que nos leva a contemplar o sagrado.	2013-12-02	9	2
10	a igreja tem um altar maravilhoso, com muitas imagens douradas, apesar da simplicidade no resto da construção interna.	2013-12-03	10	2
11	Aos apreciadores de igrejas como eu (que nem sou católica), não dá para ir a Braga sem visitar a Sé de Braga. Localizada no belo calçadão no centro histórico da cidade, onde vale a pena passear sem pressa, é rica em arte barroca portuguesa. Imperdível.	2013-12-04	11	2
12	Sugiro que dedique uma hora, pelo menos, a esta visita. Não só a Sé Catedral merece a contemplação, mas também os claustros, as capelas e altares, e os túmulos de muitos santos e nobres. O espaço museológico contemplada várias ossadas e poderão ver os túmulos dos últimos quatro bispos de Braga, bem como o espaço para o próximo. O órgão, os altares, as várias capelas e os pontos arquitectónicos aumentam a qualidade da visita... Sem dúvida, imperdível.	2013-12-05	12	2
\.


--
-- Name: comment_attractions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comment_attractions_id_seq', 1, false);


--
-- Data for Name: comment_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comment_events (id, comment, evaluationdate, mobile_user_id, event_id) FROM stdin;
\.


--
-- Name: comment_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comment_events_id_seq', 1, false);


--
-- Data for Name: comment_itineraries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comment_itineraries (id, comment, evaluationdate, itinerary_id, mobile_user_id) FROM stdin;
\.


--
-- Name: comment_itineraries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comment_itineraries_id_seq', 1, false);


--
-- Data for Name: comment_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comment_services (id, comment, evaluationdate, mobile_user_id, service_id) FROM stdin;
13	A casa em si é agradável no entanto o serviço e a qualidade de atendimento deixam muito a desejar além do servico ser lento os funcionários tem que abandonar a mesa para confirmar disponibilidade da pouca variedade de produtos.	2013-12-01	7	4
14	É um bom conceito. apresenta uma boa imagem. O pão fresco é delicioso.. infelizmente, a maior parte dos bolos feitos do dia não são vendidos.. ou seja o consumidor normalmente consome um produto do dia anterior	2013-12-02	8	4
15	Todos os espaços em si são agradaveis no entanto o serviço e a qualidade de atendimento deixam muito a desejar além do servico ser lento, nota se que os funcionarios não têm superiores a supervisionar pois não são eficazes e por vezes nem conhecem os produtos que vendem nota se tb que carecem de formaçao ...	2013-12-02	9	4
16	O Maria Bolacha é fofo, decoração linda, preços acessíveis. Contudo, a demora no atendimento é terrivel. Mas qualidade é muito boa, prove os macarons e a variedade de tortas doces	2013-12-03	10	4
17	À excepção da filial de Lamaçães, todas as pastelarias da cadeia têm um péssimo atendimento, extremamente demorado e mal organizado! Um simples café, depois de tirado, fica longos minutos no balcão à espera de que o empregado de mesa o sirva, ficando o café frio! Funcionários geralmente pouco afáveis. Preço acima da média.	2013-12-04	11	4
18	Melhor discoteca da região!	2013-12-01	7	5
19	Quem vai à quarta e vai ao sabádo vai notar diferença. Nada haver mesmo. A quarta é muito melhor.	2013-12-02	8	5
20	Muita gente bonita, muita loucura, local excelente.	2013-12-02	9	5
21	O local é mítico! Nem é preciso descrever.	2013-12-03	10	5
22	Paragem obrigatória para quem sai a noite em Braga	2013-12-04	11	5
23	Já teve dias melhores mas continua a ser a melhor disco da zona	2013-12-05	12	5
24	No geral, o serviço foi muito bom... Tive relativa facilidade em arranjar mesa, visto sermos apenas 2 pessoas. Quanto à francesinha, é realmente muito boa, embora ache o molho um bocado adocicado. A oferta de cerveja é realmente uma mais valia. A repetir, sem dúvida!	2013-12-01	7	5
25	Ao chegar perto das 21:00 já não se arranja mesa. A espera para arranjar mesa foi de cerca de 30 minutos e mais 30 minutos para ser servidos. A espera só se justifica pela grande qualidade da Francesinha. Ingredientes bons, mas o molho ( que quanto a mim é o que faz toda a diferença numa francesinha), é fenomenal. A carta de cervejas também é muito boa pela sua variedade.O preço não é o melhor para o tipo de prato que se fala, mas é justo tendo em conta a alta qualidade do mesmo.Vale a pena esperar e vale a pena experimentar!!!!	2013-12-02	8	5
26	Recomendado por amigos fui a Taberna Belga na expectativa de provar a melhor Francesinha... Sinto muito mas sai um pouco defraudado, a Francesinha é boa sim senhor, mas não é a melhor... Contudo gostei muito do ambiente e da excelente carta de cervejas Artesanais.	2013-12-02	9	5
27	De tanto ouvir falar nas famosas francesinhas, visitei o local. Ficou aquém das minhas espectativas. O melhor que se retirou da francesinha foi o bife muito suculento, o molho era muito doce, e o pão de forma nada de especial. As ditas cervejas belgas, o preço era acima da média e muito, pedimos um fino claro, pois ficava mais caro as cervejas que as francesinhas. O espaço é apertado, que temos de comer com o vizinho da mesa do lado quase no colo.	2013-12-03	10	5
28	Recomendo este local a quem quer comer uma boa francesinha. Tem também muita variedade de cerveja. O preço é acima da média mas é justo. É um estabelecimento muito frequentado pelo que é aconselhável fazer marcação.	2013-12-04	11	5
29	Ambiente agradável conjugado com comida e bebida boa! Vale a pena a visita! Oferece vários tipos de cerveja, principalmente a belga! A francesinha, ao meu ver, prato principal do restaurante é muito boa, e com preço acessível!	2013-12-05	12	5
\.


--
-- Name: comment_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comment_services_id_seq', 1, false);


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
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
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('countries_id_seq', 1, false);


--
-- Data for Name: event_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY event_types (id, name, description) FROM stdin;
1	Concerto	\N
2	Feira	\N
3	Festival	\N
4	Teatro	\N
5	Festa Popular	\N
6	Festa	\N
\.


--
-- Name: event_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('event_types_id_seq', 1, false);


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY events (id, name, description, schedule, site, email, address, latitude, longitude, transport, active, "timestamp", startdate, enddate, organization, price, program, event_type_id, city_id, web_user_id) FROM stdin;
1	Festa de S. Geraldo	Festa de S. Geraldo - Patrono da Cidade	todo o dia	\N	\N	Braga	41.3316383	8.22382832	\N	t	1387019634	2013-12-05	2013-12-05	Câmara Municipal de Braga	Gratuito	grupo folclorico ceifeiras de gondar, grupo folclorico rusga de joane	5	3	1
2	Romaria de S. Vicente	Festas de S. Vicente	todo o dia	\N	\N	Braga	41.3316383	8.22382832	\N	t	1387019634	2014-01-22	2014-01-22	Câmara Municipal de Braga	Gratuito até aos 11 anos 2€ a partir dos 11	Marisa, Azeitonas	5	3	1
3	Festas académicas do enterro da gata	A academia bracarense representada, outrora, pelos estudantes do Liceu Nacional (hoje Escola Secundária Sá de Miranda), estava sedeada no Convento dos Congregados e realizou o 1º Enterro da Gata em Maio de 1889.Passados, exatamente, 100 anos sobre o seu nascimento, é retomada a tradição, agora nas mãos dos estudantes da Universidade do Minho. A "gata" representa o indesejado insucesso escolar. É feito um velório em que a "gata" é transportada pelas artérias da cidade seguida por um séquito que não para de chorar a "finada".	todos os dias das 22h as 7	http://enterrodagata.aaum.pt/	aaum@aaum.pt	Rua D.pedro m.88 4710-Braga	41.3316383	8.22382832	\N	t	1387019634	2013-05-10	2013-05-18	ASSOCIAÇÃO ACADEMICA DA UNIVERSIDADE DO MINHO	sócios 7€ não sócios 13€	11-deolinda 12-buraka som sistema 13-paus 14-natiruts 15-josé malhoa 16-the gift 17-kaiser chiefs	3	3	1
4	Bragajazz	O BRAGAJAZZ, desde a sua primeira edição, traz, a Braga, a melhor produção nacional e internacional, tendo em conta a existência de uma numerosa sociedade académica, científica, intelectual e artística que reclama para a cidade uma excelente “performance” jazzística.	todo o dia	\N	\N	Braga	41.3316383	8.22382832	\N	t	1387019634	2014-03-04	2014-03-13	Câmara Municipal de Braga	Gratuito até aos 11 anos 2€ a partir dos 11	4-Maria João Ogre 5-Quarteto de Ohad Talmor 6-The Claudia Quintet 12-Quarteto de Sara Serpa 13-Jamie Baum septet	1	3	1
5	Braga Romana	Reviver o Passado em Bracara Augusta, é viajar no tempo 2000 anos, regressar ao Império Romano, evocando o seu quotidiano como cidade-capital da província da Gallaecia.Nesta iniciativa, que decorre, anualmente, no início do mês de Junho, é recriado um mercado romano no centro histórico da cidade que é, também, palco para dois cortejos romanos, espetáculos de artes circenses, representações dramáticas, simulações bélicas, personificações mitológicas, malabarismos, interpretações musicais e danças da época de Bracara Augusta.	todo o dia	http://bragaromana.cm-braga.pt/	cultura@cm-braga.pt	Convento do Pópulo 4700-312 Braga	41.3316383	8.22382832	\N	t	1387019634	2014-05-22	2014-05-26	Câmara Municipal de Braga	Gratuito	22 Maio 21h30 Rito Fundacional 23 Maio as 22h Pugnati Bracara 24 Maio 23h00 Ludi Saeculares 25 Maio 17h30 Recepção ao Agripa 26 Maio 16h30 Casamento Romana	2	3	1
6	Gala Natal da Academia	DJ sistema & mc's mmundo secreto	\N	http://sardinhabiba.com/	sardinhabiba@pedrobandeiraconvida.com	Praça Dr. Cândido da Costa Pires 4715-402 Braga	41.3316383	8.22382832	\N	t	1387019634	2013-12-18	2013-12-18	Sardinha Biba	Elas 7€ com 4 bebidas Eles 13€		6	3	3
7	Funk Brazilian Beats	The master sisters	\N	http://sardinhabiba.com/	sardinhabiba@pedrobandeiraconvida.com	Praça Dr. Cândido da Costa Pires 4715-402 Braga	41.3316383	8.22382832	\N	t	1387019634	2013-12-25	2013-12-25	Sardinha Biba	Elas 7€ com 4 bebidas Eles 13€		6	3	3
8	JB Tour		\N	http://sardinhabiba.com/	sardinhabiba@pedrobandeiraconvida.com	Praça Dr. Cândido da Costa Pires 4715-402 Braga	41.3316383	8.22382832	\N	t	1387019634	2013-12-25	2013-12-25	Sardinha Biba	Elas 7€ com 4 bebidas Eles 13€		6	3	3
\.


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('events_id_seq', 1, false);


--
-- Data for Name: itineraries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY itineraries (id, name, description, itinerary_type_id, user_id) FROM stdin;
2	Rota dos Estudantes	Rota dos estudantes na noite	6	7
1	Rota das Catedrais 	Rota com as principais Catedrais de Braga	1	1
\.


--
-- Name: itineraries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('itineraries_id_seq', 1, false);


--
-- Data for Name: itinerary_attractions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY itinerary_attractions (id, "order", itinerary_id, attraction_id) FROM stdin;
1	1	1	1
2	2	1	2
3	3	1	3
\.


--
-- Name: itinerary_attractions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('itinerary_attractions_id_seq', 1, false);


--
-- Data for Name: itinerary_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY itinerary_events (id, "order", itinerary_id, event_id) FROM stdin;
\.


--
-- Name: itinerary_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('itinerary_events_id_seq', 1, false);


--
-- Data for Name: itinerary_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY itinerary_services (id, "order", itinerary_id, service_id) FROM stdin;
1	4	1	5
2	1	2	7
3	2	2	8
4	3	2	5
\.


--
-- Name: itinerary_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('itinerary_services_id_seq', 1, false);


--
-- Data for Name: itinerary_types; Type: TABLE DATA; Schema: public; Owner: postgres
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
-- Name: itinerary_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('itinerary_types_id_seq', 1, false);


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY languages (id, name, abv, description) FROM stdin;
1	Portugues	PT	Lingua Tuga
2	Ingles	EN	Lingua de Sua Majestade
\.


--
-- Name: languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('languages_id_seq', 1, false);


--
-- Data for Name: mobile_user_cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY mobile_user_cities (id, city_id, mobile_user_id) FROM stdin;
\.


--
-- Name: mobile_user_cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('mobile_user_cities_id_seq', 1, false);


--
-- Data for Name: mobile_users; Type: TABLE DATA; Schema: public; Owner: postgres
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
-- Data for Name: pack_types; Type: TABLE DATA; Schema: public; Owner: postgres
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
-- Name: pack_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pack_types_id_seq', 1, false);


--
-- Data for Name: photo_attractions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY photo_attractions (id, name, photo_file_name, photo_content_type, photo_file_size, photo_updated_at, description, attraction_id) FROM stdin;
\.


--
-- Name: photo_attractions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('photo_attractions_id_seq', 4, true);


--
-- Data for Name: photo_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY photo_events (id, url, name, description, extension, event_id) FROM stdin;
\.


--
-- Name: photo_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('photo_events_id_seq', 1, false);


--
-- Data for Name: photo_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY photo_services (id, url, name, description, extension, service_id) FROM stdin;
4	https://fbcdn-sphotos-e-a.akamaihd.net/hphotos-ak-prn1/521529_316172415124044_2061491380_n.jpg	amet,	\N	jpg	4
5	http://www.viva-agenda.com/images/venues/1-1298038656-biba.jpg	amet,	\N	jpg	5
6	https://fbcdn-sphotos-e-a.akamaihd.net/hphotos-ak-prn1/521529_316172415124044_2061491380_n.jpg	amet,	\N	jpg	6
7	https://fbcdn-sphotos-e-a.akamaihd.net/hphotos-ak-prn1/521529_316172415124044_2061491380_n.jpg	amet,	\N	jpg	7
8	http://bragabynight.com/images/stories/ba/ba11092012_032.jpg	amet,	\N	jpg	8
\.


--
-- Name: photo_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('photo_services_id_seq', 1, false);


--
-- Data for Name: rating_attractions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rating_attractions (id, rating, evaluationdate, mobile_user_id, attraction_id) FROM stdin;
1	5	2013-12-01	7	1
2	3	2013-12-02	8	1
3	5	2013-12-02	9	1
4	4	2013-12-03	10	1
5	5	2013-12-04	11	1
6	5	2013-12-05	12	1
7	4	2013-12-01	7	2
8	4	2013-12-02	8	2
9	5	2013-12-02	9	2
10	5	2013-12-03	10	2
11	5	2013-12-04	11	2
12	5	2013-12-05	12	2
\.


--
-- Name: rating_attractions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rating_attractions_id_seq', 1, false);


--
-- Data for Name: rating_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rating_events (id, rating, evaluationdate, mobile_user_id, event_id) FROM stdin;
\.


--
-- Name: rating_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rating_events_id_seq', 1, false);


--
-- Data for Name: rating_itineraries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rating_itineraries (id, rating, evaluationdate, itinerary_id, mobile_user_id) FROM stdin;
\.


--
-- Name: rating_itineraries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rating_itineraries_id_seq', 1, false);


--
-- Data for Name: rating_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rating_services (id, rating, evaluationdate, mobile_user_id, service_id) FROM stdin;
13	2	2013-12-01	7	4
14	2	2013-12-02	8	4
15	1	2013-12-02	9	4
16	3	2013-12-03	10	4
17	2	2013-12-04	11	4
18	5	2013-12-01	7	5
19	4	2013-12-02	8	5
20	5	2013-12-02	9	5
21	5	2013-12-03	10	5
22	5	2013-12-04	11	5
23	4	2013-12-05	12	5
24	5	2013-12-01	7	5
25	4	2013-12-02	8	5
26	3	2013-12-02	9	5
27	3	2013-12-03	10	5
28	5	2013-12-04	11	5
29	4	2013-12-05	12	5
\.


--
-- Name: rating_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rating_services_id_seq', 1, false);


--
-- Data for Name: service_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY service_types (id, name, description) FROM stdin;
1	Restaurante	\N
2	Café	\N
3	Bar	\N
4	Discoteca	\N
5	Pastelaria	\N
6	Pronto-a-vestir	\N
\.


--
-- Name: service_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('service_types_id_seq', 1, false);


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY services (id, name, description, schedule, site, email, address, latitude, longitude, transport, active, "timestamp", reference_point, capacity, details, service_type_id, web_user_id, city_id) FROM stdin;
4	Maria Bolacha	\N	Segunda a Sábado das 9h às 20h	www.mariabolacha.net	conf.mariabolacha@gmail.com	Av. D. João II 4715-275 Braga	41.3259697	8.25389671	\N	t	1387019634	f	50	\N	5	2	3
5	Sardinha	\N	Quarta, Sexta e Sábado das 23h às 5h	sardinhabiba.com	sardinhabiba@pedrobandeiraconvida.com	Praça Dr. Cândido da Costa Pires, 4715-402 Braga	41.3259697	8.25389671	\N	t	1387019634	f	1000	\N	4	3	3
6	Dieci	\N	Segunda a Domingo das 12h às 15h e das 19h às 2h	www.dieci.com	geral@dieci.pt	São José de São Lázaro, Braga	41.3259697	8.25389671	\N	t	1387019634	f	200	\N	1	4	3
7	Taberna Belga	\N	Segunda a Domingo das 12h às 15h e das 19h às 24h	www.tabernabelga.com	belga@gmail.com	Rua Cónego Luciano Afonso dos Santos loja 1A, S. Vicente, 4700-371 Braga	41.3259697	8.25389671	\N	t	1387019634	f	100	\N	1	5	3
8	Bar Académico	Bar de estudantes da Universidade do Minho	Segunda a Domingo das 00h às 4h	ba.com	ba@pedrobandeiraconvida.com	Rua D Pedro V, 4715-402 Braga	41.3259697	8.25389671	\N	t	1387019634	f	500	\N	4	3	3
\.


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('services_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, email, username, encrypted_password, language_id, country_id, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, failed_attempts, unlock_token, locked_at) FROM stdin;
1	turismo@cm-braga.pt	PTBraga	password	1	188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2	conf.mariabolacha@gmail.com	MBolacha	password	1	188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3	sardinhabiba@pedrobandeiraconvida.com	Sardinha	password	1	188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4	geral@dieci.pt	Dieci	password	1	188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	belga@gmail.com	TBelga	password	1	188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	geral@cm-porto.pt	PTPorto	password	1	188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7	lx2n0xj@gmail.com	x2n0x	password	1	188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8	rivfaria@gmail.com	rivfaria	password	1	188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9	jprophet89@gmail.com	jprophet	password	1	188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10	7jpinheiro@gmail.com	jpinheiro	password	1	188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12	flavirrl@gmail.com	flavirrl	password	1	188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11	catarina.sofia2@gmail.com	cat	password	1	188	c4afb3fa33786175c54af6ef9f165dca96584738ab8e594842a35648d972b736	2013-12-15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15	katrinaoli@hotmail.com	\N	$2a$10$uGU4H8gYgn/EYSRv6kT86ug7zv7rzszVLFyJWHe8In0ACn5kBrgyK	2	\N	\N	\N	\N	4	2013-12-17	2013-12-17	127.0.0.1	127.0.0.1	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 15, true);


--
-- Data for Name: web_user_packs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY web_user_packs (id, subscriptiondate, validity, obs, active, pack_type_id, web_user_id) FROM stdin;
\.


--
-- Name: web_user_packs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('web_user_packs_id_seq', 1, false);


--
-- Data for Name: web_user_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY web_user_types (id, name, description) FROM stdin;
1	Turismo/Câmara	Entidades de turismo ou departamentos de turismo da câmara responsáveis por contribuir com conteudo certificado.
2	Restauração	Restaurantes, Bares, Discotecas, Pastelarias, Cafés, Pronto-a-Vestir
\.


--
-- Name: web_user_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('web_user_types_id_seq', 1, false);


--
-- Data for Name: web_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY web_users (id, name, enterprisename, nif, address, active, web_user_type_id, city_id) FROM stdin;
1	Posto Turismo de Braga	Município de Braga	506901173	Av. da Liberdade, 1 4710-305 Braga	t	1	3
2	Maria Bolacha	Maria Bolacha	\N	Av. D. João II 4715-275 Braga	t	2	3
3	Sardinha	Sardinha Biba	\N	Praça Dr. Cândido da Costa Pires, 4715-402 Braga	t	2	3
4	Dieci	Dieci	\N	São José de São Lázaro, Braga	t	2	3
5	Taberna Belga	Taberna Belga	\N	Rua Cónego Luciano Afonso dos Santos loja 1A, S. Vicente, 4700-371 Braga	t	2	3
6	Posto Turismo do Porto	Município do Porto	501306099	Praça General Humberto Delgado 4049-001 Porto	t	1	2
\.


--
-- Name: attraction_big_types_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY attraction_big_types
    ADD CONSTRAINT attraction_big_types_name_key UNIQUE (name);


--
-- Name: attraction_big_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY attraction_big_types
    ADD CONSTRAINT attraction_big_types_pkey PRIMARY KEY (id);


--
-- Name: attraction_types_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY attraction_types
    ADD CONSTRAINT attraction_types_name_key UNIQUE (name);


--
-- Name: attraction_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY attraction_types
    ADD CONSTRAINT attraction_types_pkey PRIMARY KEY (id);


--
-- Name: attractions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY attractions
    ADD CONSTRAINT attractions_pkey PRIMARY KEY (id);


--
-- Name: cities_abv_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT cities_abv_key UNIQUE (abv);


--
-- Name: cities_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT cities_name_key UNIQUE (name);


--
-- Name: cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: comment_attractions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY comment_attractions
    ADD CONSTRAINT comment_attractions_pkey PRIMARY KEY (id);


--
-- Name: comment_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY comment_events
    ADD CONSTRAINT comment_events_pkey PRIMARY KEY (id);


--
-- Name: comment_itineraries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY comment_itineraries
    ADD CONSTRAINT comment_itineraries_pkey PRIMARY KEY (id);


--
-- Name: comment_services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY comment_services
    ADD CONSTRAINT comment_services_pkey PRIMARY KEY (id);


--
-- Name: countries_abv_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_abv_key UNIQUE (abv);


--
-- Name: countries_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_name_key UNIQUE (name);


--
-- Name: countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: event_types_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY event_types
    ADD CONSTRAINT event_types_name_key UNIQUE (name);


--
-- Name: event_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY event_types
    ADD CONSTRAINT event_types_pkey PRIMARY KEY (id);


--
-- Name: events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: itineraries_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY itineraries
    ADD CONSTRAINT itineraries_name_key UNIQUE (name);


--
-- Name: itineraries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY itineraries
    ADD CONSTRAINT itineraries_pkey PRIMARY KEY (id);


--
-- Name: itinerary_attractions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY itinerary_attractions
    ADD CONSTRAINT itinerary_attractions_pkey PRIMARY KEY (id);


--
-- Name: itinerary_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY itinerary_events
    ADD CONSTRAINT itinerary_events_pkey PRIMARY KEY (id);


--
-- Name: itinerary_services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY itinerary_services
    ADD CONSTRAINT itinerary_services_pkey PRIMARY KEY (id);


--
-- Name: itinerary_types_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY itinerary_types
    ADD CONSTRAINT itinerary_types_name_key UNIQUE (name);


--
-- Name: itinerary_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY itinerary_types
    ADD CONSTRAINT itinerary_types_pkey PRIMARY KEY (id);


--
-- Name: languages_abv_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY languages
    ADD CONSTRAINT languages_abv_key UNIQUE (abv);


--
-- Name: languages_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY languages
    ADD CONSTRAINT languages_name_key UNIQUE (name);


--
-- Name: languages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);


--
-- Name: mobile_user_cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mobile_user_cities
    ADD CONSTRAINT mobile_user_cities_pkey PRIMARY KEY (id);


--
-- Name: mobile_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mobile_users
    ADD CONSTRAINT mobile_users_pkey PRIMARY KEY (id);


--
-- Name: pack_types_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pack_types
    ADD CONSTRAINT pack_types_name_key UNIQUE (name);


--
-- Name: pack_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pack_types
    ADD CONSTRAINT pack_types_pkey PRIMARY KEY (id);


--
-- Name: photo_attractions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY photo_attractions
    ADD CONSTRAINT photo_attractions_pkey PRIMARY KEY (id);


--
-- Name: photo_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY photo_events
    ADD CONSTRAINT photo_events_pkey PRIMARY KEY (id);


--
-- Name: photo_services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY photo_services
    ADD CONSTRAINT photo_services_pkey PRIMARY KEY (id);


--
-- Name: rating_attractions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY rating_attractions
    ADD CONSTRAINT rating_attractions_pkey PRIMARY KEY (id);


--
-- Name: rating_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY rating_events
    ADD CONSTRAINT rating_events_pkey PRIMARY KEY (id);


--
-- Name: rating_itineraries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY rating_itineraries
    ADD CONSTRAINT rating_itineraries_pkey PRIMARY KEY (id);


--
-- Name: rating_services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY rating_services
    ADD CONSTRAINT rating_services_pkey PRIMARY KEY (id);


--
-- Name: service_types_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY service_types
    ADD CONSTRAINT service_types_name_key UNIQUE (name);


--
-- Name: service_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY service_types
    ADD CONSTRAINT service_types_pkey PRIMARY KEY (id);


--
-- Name: services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: web_user_packs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY web_user_packs
    ADD CONSTRAINT web_user_packs_pkey PRIMARY KEY (id);


--
-- Name: web_user_types_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY web_user_types
    ADD CONSTRAINT web_user_types_name_key UNIQUE (name);


--
-- Name: web_user_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY web_user_types
    ADD CONSTRAINT web_user_types_pkey PRIMARY KEY (id);


--
-- Name: web_users_nif_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY web_users
    ADD CONSTRAINT web_users_nif_key UNIQUE (nif);


--
-- Name: web_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY web_users
    ADD CONSTRAINT web_users_pkey PRIMARY KEY (id);


--
-- Name: itinerary_attractions_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX itinerary_attractions_index ON itinerary_attractions USING btree (itinerary_id, attraction_id);


--
-- Name: itinerary_events_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX itinerary_events_index ON itinerary_events USING btree (itinerary_id, event_id);


--
-- Name: itinerary_services_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX itinerary_services_index ON itinerary_services USING btree (itinerary_id, service_id);


--
-- Name: photo_events_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX photo_events_index ON photo_events USING btree (event_id);


--
-- Name: photos_attractions_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX photos_attractions_index ON photo_attractions USING btree (attraction_id);


--
-- Name: photos_services_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX photos_services_index ON photo_services USING btree (service_id);


--
-- Name: fkattraction342588; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attractions
    ADD CONSTRAINT fkattraction342588 FOREIGN KEY (attraction_type_id) REFERENCES attraction_types(id);


--
-- Name: fkattraction355171; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attractions
    ADD CONSTRAINT fkattraction355171 FOREIGN KEY (web_user_id) REFERENCES web_users(id);


--
-- Name: fkattraction560395; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attraction_types
    ADD CONSTRAINT fkattraction560395 FOREIGN KEY (attraction_big_types_id) REFERENCES attraction_big_types(id);


--
-- Name: fkattraction698167; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attractions
    ADD CONSTRAINT fkattraction698167 FOREIGN KEY (city_id) REFERENCES cities(id);


--
-- Name: fkcities964228; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT fkcities964228 FOREIGN KEY (country_id) REFERENCES countries(id);


--
-- Name: fkcomment_at408705; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comment_attractions
    ADD CONSTRAINT fkcomment_at408705 FOREIGN KEY (mobile_user_id) REFERENCES mobile_users(id);


--
-- Name: fkcomment_at837170; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comment_attractions
    ADD CONSTRAINT fkcomment_at837170 FOREIGN KEY (attraction_id) REFERENCES attractions(id);


--
-- Name: fkcomment_ev460949; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comment_events
    ADD CONSTRAINT fkcomment_ev460949 FOREIGN KEY (mobile_user_id) REFERENCES mobile_users(id);


--
-- Name: fkcomment_ev768047; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comment_events
    ADD CONSTRAINT fkcomment_ev768047 FOREIGN KEY (event_id) REFERENCES events(id);


--
-- Name: fkcomment_it135939; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comment_itineraries
    ADD CONSTRAINT fkcomment_it135939 FOREIGN KEY (itinerary_id) REFERENCES itineraries(id);


--
-- Name: fkcomment_it246343; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comment_itineraries
    ADD CONSTRAINT fkcomment_it246343 FOREIGN KEY (mobile_user_id) REFERENCES mobile_users(id);


--
-- Name: fkcomment_se477012; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comment_services
    ADD CONSTRAINT fkcomment_se477012 FOREIGN KEY (service_id) REFERENCES services(id);


--
-- Name: fkcomment_se94795; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comment_services
    ADD CONSTRAINT fkcomment_se94795 FOREIGN KEY (mobile_user_id) REFERENCES mobile_users(id);


--
-- Name: fkevents39646; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events
    ADD CONSTRAINT fkevents39646 FOREIGN KEY (city_id) REFERENCES cities(id);


--
-- Name: fkevents755129; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events
    ADD CONSTRAINT fkevents755129 FOREIGN KEY (event_type_id) REFERENCES event_types(id);


--
-- Name: fkevents878605; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events
    ADD CONSTRAINT fkevents878605 FOREIGN KEY (web_user_id) REFERENCES web_users(id);


--
-- Name: fkitinerarie234991; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY itineraries
    ADD CONSTRAINT fkitinerarie234991 FOREIGN KEY (itinerary_type_id) REFERENCES itinerary_types(id);


--
-- Name: fkitinerarie798742; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY itineraries
    ADD CONSTRAINT fkitinerarie798742 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fkitinerary_123823; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY itinerary_services
    ADD CONSTRAINT fkitinerary_123823 FOREIGN KEY (itinerary_id) REFERENCES itineraries(id);


--
-- Name: fkitinerary_269539; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY itinerary_attractions
    ADD CONSTRAINT fkitinerary_269539 FOREIGN KEY (itinerary_id) REFERENCES itineraries(id);


--
-- Name: fkitinerary_315722; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY itinerary_attractions
    ADD CONSTRAINT fkitinerary_315722 FOREIGN KEY (attraction_id) REFERENCES attractions(id);


--
-- Name: fkitinerary_534461; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY itinerary_events
    ADD CONSTRAINT fkitinerary_534461 FOREIGN KEY (itinerary_id) REFERENCES itineraries(id);


--
-- Name: fkitinerary_830266; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY itinerary_services
    ADD CONSTRAINT fkitinerary_830266 FOREIGN KEY (service_id) REFERENCES services(id);


--
-- Name: fkitinerary_894772; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY itinerary_events
    ADD CONSTRAINT fkitinerary_894772 FOREIGN KEY (event_id) REFERENCES events(id);


--
-- Name: fkmobile_use157566; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mobile_users
    ADD CONSTRAINT fkmobile_use157566 FOREIGN KEY (id) REFERENCES users(id);


--
-- Name: fkmobile_use312350; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mobile_user_cities
    ADD CONSTRAINT fkmobile_use312350 FOREIGN KEY (mobile_user_id) REFERENCES mobile_users(id);


--
-- Name: fkmobile_use417457; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mobile_user_cities
    ADD CONSTRAINT fkmobile_use417457 FOREIGN KEY (city_id) REFERENCES cities(id);


--
-- Name: fkphoto_attr999784; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY photo_attractions
    ADD CONSTRAINT fkphoto_attr999784 FOREIGN KEY (attraction_id) REFERENCES attractions(id);


--
-- Name: fkphoto_even886063; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY photo_events
    ADD CONSTRAINT fkphoto_even886063 FOREIGN KEY (event_id) REFERENCES events(id);


--
-- Name: fkphoto_serv767782; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY photo_services
    ADD CONSTRAINT fkphoto_serv767782 FOREIGN KEY (service_id) REFERENCES services(id);


--
-- Name: fkrating_att120339; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rating_attractions
    ADD CONSTRAINT fkrating_att120339 FOREIGN KEY (attraction_id) REFERENCES attractions(id);


--
-- Name: fkrating_att548804; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rating_attractions
    ADD CONSTRAINT fkrating_att548804 FOREIGN KEY (mobile_user_id) REFERENCES mobile_users(id);


--
-- Name: fkrating_eve154708; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rating_events
    ADD CONSTRAINT fkrating_eve154708 FOREIGN KEY (event_id) REFERENCES events(id);


--
-- Name: fkrating_eve587885; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rating_events
    ADD CONSTRAINT fkrating_eve587885 FOREIGN KEY (mobile_user_id) REFERENCES mobile_users(id);


--
-- Name: fkrating_iti767737; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rating_itineraries
    ADD CONSTRAINT fkrating_iti767737 FOREIGN KEY (mobile_user_id) REFERENCES mobile_users(id);


--
-- Name: fkrating_iti821570; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rating_itineraries
    ADD CONSTRAINT fkrating_iti821570 FOREIGN KEY (itinerary_id) REFERENCES itineraries(id);


--
-- Name: fkrating_ser410705; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rating_services
    ADD CONSTRAINT fkrating_ser410705 FOREIGN KEY (service_id) REFERENCES services(id);


--
-- Name: fkrating_ser989077; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rating_services
    ADD CONSTRAINT fkrating_ser989077 FOREIGN KEY (mobile_user_id) REFERENCES mobile_users(id);


--
-- Name: fkservices448250; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY services
    ADD CONSTRAINT fkservices448250 FOREIGN KEY (web_user_id) REFERENCES web_users(id);


--
-- Name: fkservices501589; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY services
    ADD CONSTRAINT fkservices501589 FOREIGN KEY (city_id) REFERENCES cities(id);


--
-- Name: fkservices947088; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY services
    ADD CONSTRAINT fkservices947088 FOREIGN KEY (service_type_id) REFERENCES service_types(id);


--
-- Name: fkusers63206; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fkusers63206 FOREIGN KEY (language_id) REFERENCES languages(id);


--
-- Name: fkusers767609; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fkusers767609 FOREIGN KEY (country_id) REFERENCES countries(id);


--
-- Name: fkweb_user_p363066; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY web_user_packs
    ADD CONSTRAINT fkweb_user_p363066 FOREIGN KEY (web_user_id) REFERENCES web_users(id);


--
-- Name: fkweb_user_p657878; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY web_user_packs
    ADD CONSTRAINT fkweb_user_p657878 FOREIGN KEY (pack_type_id) REFERENCES pack_types(id);


--
-- Name: fkweb_users551441; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY web_users
    ADD CONSTRAINT fkweb_users551441 FOREIGN KEY (id) REFERENCES users(id);


--
-- Name: fkweb_users762424; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY web_users
    ADD CONSTRAINT fkweb_users762424 FOREIGN KEY (web_user_type_id) REFERENCES web_user_types(id);


--
-- Name: fkweb_users845994; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY web_users
    ADD CONSTRAINT fkweb_users845994 FOREIGN KEY (city_id) REFERENCES cities(id);


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

