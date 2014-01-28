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

--
-- Name: update_rating_attractions(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION update_rating_attractions() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    DECLARE
	med   float4;
    BEGIN    	
    	SELECT avg(rating_attractions.rating) INTO med FROM rating_attractions, attractions
    	WHERE attractions.id=NEW.attraction_id AND rating_attractions.attraction_id = attractions.id;

    	UPDATE attractions SET rating = med WHERE id = NEW.attraction_id;
    	RETURN NULL;
    END;
$$;


ALTER FUNCTION public.update_rating_attractions() OWNER TO postgres;

--
-- Name: update_rating_events(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION update_rating_events() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    DECLARE
	med   float4;
    BEGIN    	
    	SELECT avg(rating_events.rating) INTO med FROM rating_events, events
    	WHERE events.id=NEW.event_id AND rating_events.event_id = events.id;

    	UPDATE events SET rating = med WHERE id = NEW.event_id;
    	RETURN NULL;
    END;
$$;


ALTER FUNCTION public.update_rating_events() OWNER TO postgres;

--
-- Name: update_rating_itineraries(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION update_rating_itineraries() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    DECLARE
    med   float4;
    BEGIN       
        SELECT avg(rating_itineraries.rating) INTO med FROM rating_itineraries, itineraries
        WHERE itineraries.id=NEW.itinerary_id AND rating_itineraries.itinerary_id = itineraries.id;

        UPDATE itineraries SET rating = med WHERE id = NEW.itinerary_id;
        RETURN NULL;
    END;
$$;


ALTER FUNCTION public.update_rating_itineraries() OWNER TO postgres;

--
-- Name: update_rating_services(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION update_rating_services() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    DECLARE
	med   float4;
    BEGIN    	
    	SELECT avg(rating_services.rating) INTO med FROM rating_services, services
    	WHERE services.id=NEW.service_id AND rating_services.service_id = services.id;

    	UPDATE services SET rating = med WHERE id = NEW.service_id;
    	RETURN NULL;
    END;
$$;


ALTER FUNCTION public.update_rating_services() OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: attraction_translations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE attraction_translations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    price text,
    schedule text,
    description text,
    transport character varying(100),
    attraction_id bigint NOT NULL,
    language_id integer NOT NULL
);


ALTER TABLE public.attraction_translations OWNER TO postgres;

--
-- Name: attraction_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE attraction_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attraction_translations_id_seq OWNER TO postgres;

--
-- Name: attraction_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE attraction_translations_id_seq OWNED BY attraction_translations.id;


--
-- Name: attraction_types; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE attraction_types (
    id bigint NOT NULL,
    type_id integer NOT NULL,
    attraction_id bigint NOT NULL
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
    site character varying(255),
    email character varying(255),
    address character varying(255),
    phone character varying(30),
    latitude real,
    longitude real,
    active boolean DEFAULT true NOT NULL,
    source text,
    "timestamp" bigint NOT NULL,
    reference_point boolean NOT NULL,
    rating real DEFAULT 0 NOT NULL,
    accessibility boolean DEFAULT false NOT NULL,
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
    description text,
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
-- Name: event_translations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE event_translations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    schedule text,
    price text,
    description text,
    transport character varying(100),
    program text,
    event_id bigint NOT NULL,
    language_id integer NOT NULL
);


ALTER TABLE public.event_translations OWNER TO postgres;

--
-- Name: event_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE event_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_translations_id_seq OWNER TO postgres;

--
-- Name: event_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE event_translations_id_seq OWNED BY event_translations.id;


--
-- Name: event_types; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE event_types (
    id bigint NOT NULL,
    event_id bigint NOT NULL,
    type_id integer NOT NULL
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
    site character varying(255),
    email character varying(255),
    address character varying(255),
    phone character varying(30),
    latitude real,
    longitude real,
    source text,
    active boolean DEFAULT true NOT NULL,
    "timestamp" bigint NOT NULL,
    startdate date,
    enddate date,
    organization character varying(100),
    rating real DEFAULT 0 NOT NULL,
    accessibility boolean DEFAULT false NOT NULL,
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
    rating real DEFAULT 0 NOT NULL,
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
    active boolean NOT NULL,
    CONSTRAINT mobile_users_gender_check CHECK ((gender = ANY (ARRAY['F'::bpchar, 'M'::bpchar])))
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
    photo_file_name character varying(100) NOT NULL,
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
    name character varying(100),
    photo_file_name character varying(100) NOT NULL,
    photo_content_type character varying(100),
    photo_file_size bigint,
    photo_updated_at date,
    description character varying(255),
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
    name character varying(100),
    photo_file_name character varying(100) NOT NULL,
    "photo_content_type " character varying(100),
    photo_file_size bigint,
    photo_updated_at date,
    description character varying(255),
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
    attraction_id bigint NOT NULL,
    CONSTRAINT rating_attractions_rating_check CHECK (((rating <= 5) AND (rating > 0)))
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
    event_id bigint NOT NULL,
    CONSTRAINT rating_events_rating_check CHECK (((rating <= 5) AND (rating > 0)))
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
    service_id bigint NOT NULL,
    CONSTRAINT rating_services_rating_check CHECK (((rating <= 5) AND (rating > 0)))
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
-- Name: service_translations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE service_translations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    schedule text,
    description text,
    transport character varying(100),
    service_id bigint NOT NULL,
    language_id integer NOT NULL
);


ALTER TABLE public.service_translations OWNER TO postgres;

--
-- Name: service_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE service_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_translations_id_seq OWNER TO postgres;

--
-- Name: service_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE service_translations_id_seq OWNED BY service_translations.id;


--
-- Name: service_types; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE service_types (
    id bigint NOT NULL,
    service_id bigint NOT NULL,
    type_id integer NOT NULL
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
    site character varying(255),
    email character varying(255),
    address character varying(255),
    phone character varying(30),
    latitude real,
    longitude real,
    source text,
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
-- Name: types; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE types (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(255)
);


ALTER TABLE public.types OWNER TO postgres;

--
-- Name: types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.types_id_seq OWNER TO postgres;

--
-- Name: types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE types_id_seq OWNED BY types.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    id bigint NOT NULL,
    email character varying(255) NOT NULL,
    username character varying(50),
    encrypted_password character varying(500) NOT NULL,
    typ character(255),
    serviceid text,
    language_id integer,
    country_id integer,
    reset_password_token character varying(150),
    reset_password_sent_at date,
    remember_created_at timestamp without time zone,
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
    uid character varying(30),
    provider character varying(30),
    CONSTRAINT users_typ_check CHECK ((typ = ANY (ARRAY['F'::bpchar, 'G'::bpchar, 'C'::bpchar])))
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

ALTER TABLE ONLY attraction_translations ALTER COLUMN id SET DEFAULT nextval('attraction_translations_id_seq'::regclass);


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

ALTER TABLE ONLY event_translations ALTER COLUMN id SET DEFAULT nextval('event_translations_id_seq'::regclass);


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

ALTER TABLE ONLY service_translations ALTER COLUMN id SET DEFAULT nextval('service_translations_id_seq'::regclass);


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

ALTER TABLE ONLY types ALTER COLUMN id SET DEFAULT nextval('types_id_seq'::regclass);


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
-- Data for Name: attraction_translations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY attraction_translations (id, name, price, schedule, description, transport, attraction_id, language_id) FROM stdin;
1	Museu dos Cordofones	\N	Todos os dias, a partir das 9h00 \r\nPara grupos, é necessário marcação prévia.	O Museu de Cordofones de Domingos Machado, foi inaugurado a 22 de Setembro de 1995. O museu está instalado numa casa de aspecto agradável, edificada em pedra recentemente, em Tebosa, face à estrada Nacional.\r\nÉ um Museu particular, que pertence a Domingos Machado. O seu proprietário não beneficiou de qualquer apoio, subsídio ou contributo.\r\nNo primeiro andar do edifício, estão expostas várias colecções de instrumentos de corda: cavaquinhos, violas clássicas, guitarras, bajos, banjolins, bandolins e violas típicas. O visitante pode visualizar , as alfaias utilizadas na sua confecção, e as várias etapas da construção de um cavaquinho. Podemos ainda encontrar muita documentação sobre a sua obra, bibliografia, algumas obras de arte (quase tudo oferta de amigos), objectos vários, e fotos.\r\nDomingos Machado, é considerado o mais célebre português no fabrico de instrumentos de corda tradicionais.\r\nO visitante pode ainda visitar a oficina do Artesão. Uma grande mesa de trabalho, gasta pelo tempo e os adereços próprios do ofício: moldes que darão forma às violas, guitarras, cavaquinhos e outros instrumentos; álcool, colas, vernizes, etc.	\N	1	1
2	Museu dos Cordofones	\N	Every day, from 9:00\r\nFor groups, appointment is necessary.	\N	\N	1	2
3	Museu dos Cordofones	\N	Todos los dias, a partir de las 9h00 	" El Museo de Cordófonos de Domingos Machado, fue inaugurado el 22 de septiembre de 1995. El museo está ubicado en una casa de aspecto agradable, construida en piedra recientemente, en Tebosa , frente a la Carretera Nacional.\r\nEs un museo privado perteneciente a Domingos Machado. Su dueño no ha recibido ningún tipo de apoyo , subvención o contribución.\r\nEn el primer piso del edificio, están expuestos varias colecciones de instrumentos de cuerda: Ukuleles , guitarras clásicas , guitarras eléctricas, bajos , banjolins , mandolinas y guitarras típicas. El visitante puede ver,  las herramientas utilizadas en su fabricación, así como las diferentes etapas de la construcción de un ukelele. Todavía podemos encontrar un montón de información acerca de su trabajo, bibliografía , algunas obras de arte (casi todos ofrecidos por amigos ) , varios objetos y fotos.\r\nDomingos Machado, es considerado el más famoso portugués en la fabricación de instrumentos de cuerda tradicionales.\r\nLos visitantes también pueden visitar el taller del artesano. Una gran mesa de trabajo, desgastada por el tiempo y con los accesorios propios de este oficio:  Moldes que darán forma a las guitarras,  cavaquinhos y otros instrumentos,  alcohol , pegamentos , barnices , etc "	\N	1	4
4	Museu dos Cordofones	\N	\N	\N	\N	1	5
5	Museu dos Cordofones	\N	\N	\N	\N	1	3
6	Jardim de Santa Bárbara	\N	\N	O Jardim de Santa Bárbara localiza-se na freguesia da Sé, no centro histórico da cidade de Braga, no distrito de mesmo nome, em Portugal.\r\nTrata-se de um jardim público municipal, junto à ala medieval do Paço Episcopal Bracarense.\r\nNo seu centro encontra-se uma fonte do século XVII, que pertencia originalmente ao antigo Convento dos Remédios. Encimada por uma estátua de Santa Bárbara, é ela quem dá o nome ao jardim.	\N	2	1
7	Jardim de Santa Bárbara	\N	\N	Santa Bárbara garden, is a public garden located in Braga, near the Medieval section of the “Paço Episcopal Bracarense”. In the center of the garden there is a fountain with the statue of Saint Bárbara at the top.	\N	2	2
8	Jardim de Santa Bárbara	\N	\N	El Jardín de Santa Bárbara está situado en la parroquia de la Catedral, en el centro histórico de la ciudad de Braga, en el barrio del mismo nombre, en Portugal.	\N	2	4
9	Jardim de Santa Bárbara	\N	\N	\N	\N	2	5
10	Jardim de Santa Bárbara	\N	\N	Le jardin de Santa Barbara est situé dans la paroisse de la Sé (Cathédrale) dans le centre historique de la ville de Braga, dans le district du même nom au Portugal.\r\nIl s'agit d'un jardin public municipal proche de l'aile médiévale du Palais  Épiscopale de Braga.\r\nAu centre se trouve une fontaine du XVIIe siècle, qui appartenait à l'origine à l'ancien Convento dos Remédios (Couvent des Recours). Surmontée d'une statue de Sainte Barbara qui donne le nom au jardin.	\N	2	3
11	Capela dos Coimbras	\N	\N	De provável origem românica a capela de traça gótica que hoje conhecemos remonta a 1528, tendo sido edificada no consulado do Arcebispo D. Diogo de Sousa, por artistas da Biscaia, contratados por este prelado, para a execução de diversas obras na cidade medieval de Braga.	\N	3	1
12	Capela dos Coimbras	\N	\N	This chapel of gothic style (of probable Roman origin) was built in 1528, during the time of the Archbishop D. Diogo de Sousa, by artists from Buscay, hired for the construction of several buildings in the medieval city of Braga.	\N	3	2
13	Capela dos Coimbras	\N	\N	Probablemente de origen románica la capilla de trazas góticas que hoy conocemos y se remonta al 1528; fue construido en el consulado del Arzobispo Diogo de Sousa, por artistas de Biscaia, contratados por este prelado, para la ejecución de diversas obras en la ciudad medieval de Braga.	\N	3	4
14	Capela dos Coimbras	\N	\N	\N	\N	3	5
15	Capela dos Coimbras	\N	\N	\N	\N	3	3
16	Mercado Municipal	\N	Todos os dias de manhã	Mercado Municipal onde se podem encontrar todo o tipo de produtos.	\N	4	1
17	Mercado Municipal	\N	Every day in the morning	Market where you can find all kinds of products.	\N	4	2
18	Mercado Municipal	\N	Todos los dias en la mañana	Mercado Municipal donde se pueden encontrar todo tipo de produtos	\N	4	4
19	Mercado Municipal	\N	\N	\N	\N	4	5
20	Mercado Municipal	\N	\N	\N	\N	4	3
21	Museu Pio XII	\N	Terça a Domingo \r\n9.30h - 12.30h / 14.30h - 18.00h	O Museu Pio XII foi fundado em 1957, pelo Cónego Luciano Afonso dos Santos, nas instalações do Seminário de Santiago. Começou por ser um Museu de Arqueologia.\r\nOs espaços destinados ao Museu foram-se tornando exíguos. As coleções estavam mal acondicionadas, o edifício não oferecia as necessárias condições de exposição, conservação e segurança. Muito do espólio foi apresentando sinais dessas inadequadas circunstâncias.	\N	5	1
22	Museu Pio XII	\N	Tuesday to Sunday\r\n9.30h - 12.30h / 14.30h - 18.00h	“Museu Pio XII” has a large number of assets in the lytic, numismatic, ceramic, textile, sculpture, painting and jewellery areas. The visitors can discover a significant part of Henrique Medina’s work, one of the greatest portrait painters of the 20th century. The “Museu Pio XII” is the depositor of 50 paintings and 20 drawings. \r\nThe museum offers a visit to the Medieval Tower, or “Nossa Senhora da Torre”, where, throughout its 5 floors, the history of Braga is narrated. The first floor illustrates the period from the “brácaros” to the reconquering; on the second floor you will see the medieval Braga; the third floor takes you to the renaissance – Braga expanding into beautiful squares; the embellishment of these new spaces (work of the architects André Soares and Carlos Amarante) is narrated on the fourth floor; the last floor shows us Braga as it is today.	\N	5	2
23	Museu Pio XII	\N	De Martes a Domingo\r\nHorário de Inverno:\r\nDas 09h00 às 12h30\r\nDas 14h00 às 17h30\r\nHorário de Verão:\r\nDas 09h00 às 12h30\r\nDas 14h00 às 18h30\r\nEncerra à 2ª feira	El Museo Pío XII fue fundado en 1957 por Cónego Luciano Afonso dos Santos, en las instalaciones de un Seminario de Santiago. Comenzó por ser el Museo de Arqueología.\r\nLos espacios destinados para el Museo comenzaron a ser pequeños. Las colecciones fueron mal manejadas y el edificio no proporcionó las condiciones necessárias de exposición, mantenimiento y seguridad. Gran parte de la finca estaba mostrando signos de tales circunstancias inapropiadas.\r\n	\N	5	4
24	Museu Pio XII	\N	\N	\N	\N	5	5
25	Museu Pio XII	\N	\N	Le Musée Pie XII a été fondée en 1957 par le Canon Luciano Afonso dos Santos, sur les lieux d'un séminaire de Santiago. Au debut celui-ci etait un Musée d'Archéologie.\r\nL' espace du Musée a commencé à devenir de plus en plus serré. Les collections ont été malmenés, le bâtiment n'a pas fourni les conditions d'exposition nécessaires, l'entretien et la sécurité. Une grande partie de la succession montrait des signes de telles circonstances inappropriées.	\N	5	3
26	Arco da Porta Nova	\N	\N	Foi uma das portas nas muralhas da cidade, rasgada em 1512, à época do Arcebispo de Braga, D. Diogo de Sousa.\r\nA sua atual feição data de 1772, por iniciativa do arcebispo D. Gaspar de Bragança, com projeto do arquiteto bracarense André Soares, num momento histórico em que a cidade rompia as antigas muralhas, expandindo-se.\r\nEncontra-se classificada como Monumento Nacional desde 1910.	\N	6	1
27	Arco da Porta Nova	\N	\N	\N	\N	6	2
28	Arco da Porta Nova	\N	\N	Fue una de las puertas de las murallas de la ciudad, desgarrada en 1512, en la época del arzobispo de Braga, D. Diogo de Sousa.\r\nLa fachada actual data de 1772, por iniciativa del arzobispo Gaspar de Bragança, con el proyecto del arquitecto de Braga André Soares, en un momento histórico en el que la ciudad rompia las antiguas murallas de la ciudad, en expansión.\r\nEstá clasificado como Monumento Nacional desde 1910.\r\n	\N	6	4
29	Arco da Porta Nova	\N	\N	\N	\N	6	5
30	Arco da Porta Nova	\N	\N	Elle était l'une des portes des murs de la ville, arrachées en 1512, à l'époque de l'archevêque de Braga, D. Diogo de Sousa.\r\nSa façade actuelle remonte à 1772, à l'initiative de l'archevêque Gaspar de Bragança, avec le projet de l'architecte de Braga André Soares, dans un moment historique oú la ville brisait ces anciens remparts, en pleine expansion.\r\nL´Arco da Porta Nova est classé comme monument national depuis 1910.	\N	6	3
31	Largo do Paço	\N	\N	O Largo do Paço, situado no centro histórico de Braga, é constituído por um conjunto de edifícios que foram a antiga residência dos Arcebispos, conhecida como Paço Episcopal Bracarense.\r\nO Largo do Paço é constituído por quatro edifícios, onde atualmente se situa o Salão Nobre da Universidade do Minho, a Biblioteca Pública de Braga e o Arquivo Municipal.	\N	7	1
32	Largo do Paço	\N	\N	“Largo do Paço”, located in the historical centre of Braga, is constituted by a set of buildings that were once the ancient residence of the Archbishops, known as Paço Episcopal Bracarense (Braga’s Bishop Palace).\r\nThe “Largo do Paço” is constituted by 3 buildings, where at present are located the University of Minho Noble Hall, the Public Library of Braga and the Municipal Archive.	\N	7	2
33	Largo do Paço	\N	\N	"El largo del Paso, situado en el centro histórico de Braga, esta constituído por un conjunto de edificios que fueron la antigua residencia de los arzobispos, conocido como el paso episcopal Bracarense. \r\nEl Largo do Paso esta constituído de cuatro edificios, donde actualmente se situa el Aula Magna de la Universidad de Minho, la Biblioteca Pública de Braga y el Archivo Municipal”\r\n	\N	7	4
34	Largo do Paço	\N	\N	\N	\N	7	5
35	Largo do Paço	\N	\N	\N	\N	7	3
36	Balneário Pré-Romano	\N	\N	O Balneário Pré-Romano de Bracara ou Balneário pré-romano da Estação da CP, situa-se na Estação de Caminhos de Ferro.\r\nFoi descoberto durante as escavações da nova estação de comboios de Braga. Tem cerca de 4 m de comprimento x 2 m de largura, e segundo os arqueólogos foi construído durante o período pré-romano (época castreja) no noroeste da Península Ibérica.\r\nO balneário era semienterrado, típico da cultura castreja, de paredes em pedra e teto em lajes de pedra que encaixavam nas paredes exteriores e numa viga central de madeira. O interior estava dividido em três zonas, uma sala de sauna, um forno e uma sala intermédia de transição. Entre a sala intermédia e a sala de sauna existe uma grande laje com uma abertura semicircular, abertura que permitiria a entrada e saída da sala de sauna. A laje destinava-se a reter o calor proveniente da sala de sauna.	\N	8	1
37	Balneário Pré-Romano	\N	\N	Bracara’s Pre-Roman Bathhouse is located in Braga’s Railway Station. \r\nIt was discovered during the excavations for the new railway station. It has about 4 m in length x 2 m width large (13,12 ft x 6,56 ft), and according to the archaeologists it was built during the pre-roman period (the “castreja” era) in the northeast of the Iberian Peninsula. \r\nThe Bathhouse was half-buried, typical feature of the “castreja” culture, with stone walls and a flagstone ceiling that join in the exterior walls and in one central beam. The interior was divided in three areas, a sauna room, a small kiln and an intermediate room of transition. Between the intermediate room and the sauna/steam room there is a great flagstone with a semi-circular opening which allowed the entrance and the exit (of the sauna room). The flagstone’s purpose was to retain the heat coming from the sauna.	\N	8	2
38	Balneário Pré-Romano	\N	\N	"El balneario pre-Romano de Bracara o balneario pre-Romano de la estación de CP, se encuentra en la estación de tren. \r\nFue descubierto durante las excavaciones de la nueva estación de tren de Braga. Tiene cerca de 4 m de largo x 2 m de ancho y de acuerdo a los arqueólogos fue construida durante el periodo pre-romano (temporada castro) en el noroeste de la Península Ibérica. \r\nEl complejo estaba semi-enterrado, típico de la cultura castreja, de paredes de piedra y losas de techo de piedra que encajan en las paredes exteriores y en una de las vigas de madera central. El interior se divide en tres zonas, una sauna, un cuarto com la caldera y una transición intermedia. Entre el cuarto intermedio y el sauna existe una gran losa con una abertura semicircular, la apertura que permitiria la entrada y salida de la sauna. La losa se destinava  a retener el calor de la sala de sauna ".\r\n	\N	8	4
39	Balneário Pré-Romano	\N	\N	\N	\N	8	5
40	Balneário Pré-Romano	\N	\N	\N	\N	8	3
83	Sé de Braga	\N	\N	"La catedral es considerada como un centro de irradiación episcopal y uno de los templos más importantes del románico portugués, su historia se remonta a la obra del primer obispo, Pedro Braga, que corresponde a la restauración de la sede episcopal en 1070, que no restos se conservan. \r\nEsta catedral se encuentran las tumbas de Enrique de Borgoña y su esposa, Teresa de León, los condes de Portucalense, los padres del rey Afonso Henriques ".	\N	17	4
84	Sé de Braga	\N	\N	\N	\N	17	5
41	Palácio dos Biscaínhos 	\N	\N	O Palácio dos Biscainhos fica para no centro da cidade, foi construído no século XVI e modificado ao longo dos séculos este palácio aristocrático exibe terraços com jardins ornamentados e grandes salões com tectos luxuosos. Abriga o Museu Etnográfico e Artístico, com peças de mobiliário português e estrangeiro. O pavimento estriado do rés-do-chão, particularmente invulgar, permitia que as carruagens entrassem no edifício a fim de desembarcarem os passageiros e seguirem para as cavalariças.\r\nEm 10 de Julho de 1963, faleceu o seu último proprietário, que tudo doou à cidade nas vésperas da morte.	\N	9	1
42	Palácio dos Biscaínhos 	\N	\N	The “Palácio dos Biscaínhos” is located in the centre of town. Built in the 16th century and modified throughout the centuries, this aristocratic palace has terraces with ornamented gardens and grand salons with luxurious ceilings. It houses the Artistic and Ethnographic Museum, with furniture pieces of Portuguese and foreign origin. The grooved pavement on the ground-floor is rather unique and allowed carriages to enter the building so that they could proceed to the horse-stables after the passengers had disembarked. \r\nOn June 10th 1963 its last owner passed away and donated the entire building and its contents to the city.	\N	9	2
43	Palácio dos Biscaínhos 	\N	\N	El Palacio de los Biscaiños queda en el centro de la ciudad, fue construido en el siglo XVI y modificado con el paso de los siglos; este palacio aristocrático exhibe terrazas con jardines ornamentados y grandes salones con techos de lujo. Alberga el Museo Etnográfico y de Arte con piezas de mobiliario portugués y extranjero. El pavimento com estrias de la planta baja, es particularmente inusual, permitiendo que las carruajes entrassem al edificio con el fin de desembarcar pasajeros y seguir a los establos. \r\nEl 10 de julio de 1963, murió su último propietario, quien la donó a la ciudad en la víspera de la muerte.	\N	9	4
44	Palácio dos Biscaínhos 	\N	\N	\N	\N	9	5
45	Palácio dos Biscaínhos 	\N	\N	\N	\N	9	3
46	Santuário do Sameiro	\N	Aberto todos os dias	O Santuário de Nossa Senhora do Sameiro (ou, simplesmente, Santuário do Sameiro) é um santuário mariano localizado em Braga, Portugal, cuja construção se iniciou a 14 de Julho de 1863. O fundador deste santuário foi o vigário de Braga, Padre Martinho António Pereira da Silva, natural de Semelhe, que em 1871 fez colocar, no cume da montanha, uma imagem de Nossa Senhora da Conceição. Este santuário um dos centros de maior devoção mariana em Portugal, logo depois do Santuário de Fátima e do Santuário da Mãe Soberana. Neste Templo, concluído no século XX, destaca-se no seu interior o altar-mor em granito branco polido, bem como o sacrário de prata. Em frente do Templo ergue-se um imponente e vasto escadório, no topo do qual se levantam dois altos pilares, encimados com a imagem da Virgem Maria e do Sagrado Coração de Jesus.	\N	10	1
47	Santuário do Sameiro	\N	Open everyday	The Sameiro Shrine, began its construction around the 19th century and it’s the largest centre of Marian devotion in Portugal, after Fátima.\r\nThe construction of the Temple was completed in the 20th century. From its interior we point out the high altar in white polish granite as well as the silver sacrarium. In front of the temple rises a wide majestic polished, which ends in  two pillars, topped by the Virgin and the Heart of Jesus.	\N	10	2
48	Santuário do Sameiro	\N	Abierto todos los dias	El Santuario de Nuestra Señora de Sameiro (o simplemente, el Santuario de Sameiro) es un santuario mariano situado en Braga, Portugal, cuya construcción comenzó el 14 de julio de 1863. El fundador del santuario era el vicario de Braga, Padre Martinho António Pereira da Silva, nacio en Semelhe y en 1871 hizo colocar en la cima de la montaña una imagen de Nuestra Señora de la Concepción.  Este santuario es uno de los mayores centros de devoción mariana en Portugal, poco después del Santuario de Fátima y el Santuario de la Madre Soberana. En el interior de este templo, terminado en el siglo XX, se destaca el altar mayor de granito blanco pulido y el tabernáculo de plata. En frente del templo, se encuentra una escalera majestuosa y amplia, en la parte superior se elevan dos pilares de gran altura, coronado con la imagen de la Virgen María y el Sagrado Corazón de Jesús.	\N	10	4
49	Santuário do Sameiro	\N	\N	\N	\N	10	5
50	Santuário do Sameiro	\N	\N	\N	\N	10	3
51	Museu dos Biscainhos	\N	De Terça feira a domingo\r\nDas 10h00 às 12h15\r\nDas 14h00 às 17h30	O Museu dos Biscainhos encontra-se instalado num notável conjunto patrimonial integrado pelo imóvel e jardins, ilustra uma Casa Senhorial do período Barroco. O edifício integra interiores de grande interesse artístico, designadamente, compartimentos com revestimentos parietais de azulejos do séc. XVIII e tetos com pinturas e tratamentos ornamentais.\r\n\r\nNo âmbito da componente programática, apresenta ao público uma sequência de espaços que proporcionam uma visão das ocupações, gostos e tradições dos nossos antepassados da nobreza dos séculos XVII e XVIII, podendo visitar-se o Átrio, o Salão Nobre, as Salas de Estrado, Oratório, Música, Jogo, a Sala de Jantar, as Cavalariças e as Cozinhas Antigas. Como complemento obrigatório da visita, os jardins do séc. XVIII (Barroco), desdobram-se num espetáculo de beleza artística e ambiental.	\N	11	1
52	Museu dos Biscainhos	\N	From Tuesday to Sunday\r\nFrom 10h00 to 12h15\r\nFrom 14h00 to 17h30	\N	\N	11	2
53	Museu dos Biscainhos	\N	De Martes a Domingo\r\nHorário de Inverno:\r\nDas 09h00 às 12h30\r\nDas 14h00 às 17h30\r\nHorário de Verão:\r\nDas 09h00 às 12h30\r\nDas 14h00 às 18h30\r\nEncerra à 2ª feira	"El Museo de los Biscaiños se instala en una notable conjunto patrimonial  integrado por jardines y el inmueble, ilustra una casa señorial de la época barroca. El edificio integra interiores de gran interés artístico, como lo son los azulejos del siglo XVIII , compartimentos com revestimientos parietales, techos con pinturas y tratamientos ornamentales. \r\n\r\nDentro del componente programático presenta al público una secuencia de espacios que ofrecen una visión general de las ocupaciones, gustos y tradiciones de nuestros antepasados de la nobleza de los siglos XVII y XVIII; se puede visitar el vestíbulo, la sala principal, las salas de la cubierta, el oratorio, música, juegos, el comedor, las antiguas caballerizas y la cocina. Como complemento obligatorio de la visita, los jardines del siglo. XVIII (barroco), se desarrollan en un espectáculo de belleza artística y ambiental ".	\N	11	4
54	Museu dos Biscainhos	\N	\N	\N	\N	11	5
55	Museu dos Biscainhos	\N	\N	\N	\N	11	3
85	Sé de Braga	\N	\N	\N	\N	17	3
56	Parque do Bom Jesus do Monte	\N	\N	O Santuário do Bom Jesus do Monte, também referido como Santuário do Bom Jesus de Braga, localiza-se na freguesia de Tenões, na cidade, concelho e distrito de Braga.\r\nA uns Kms de Braga, levanta-se majestosa a estância turístico - religiosa do Bom Jesus, em que a natureza e a arte "dão mutuamente as mãos" para fazerem dela um verdadeiro ex-libris da cidade dos Arcebispos.\r\nAs origens da estância do Bom Jesus remontam ao principio do século XIV, quando alguém - talvez a seguir à batalha do salado (1340) - decidiu colocar uma cruz no alto da encosta do monte Espinho. Bem depressa esta cruz foi abrigada por uma ermida, que se tornou meta de peregrinação por parte dos Bracarenses e de outros fiéis das redondezas. Tal ermida esteve anexa à paroquia de Tenões.	\N	12	1
57	Parque do Bom Jesus do Monte	\N	\N	In the Bom Jesus Garden, you will find one of the most beautiful and spiritually uplifting places in the world. When crossing it, you’ll enter a spiritual environment beginning your visit with a staircase surrounded by century-old trees that will lead to chapels which portray the passion of Christ. It cannot be missed by both devotees and tourists. On the medium landing you will find the first belvedere from where you can see the entire city of Braga and the surrounding landscape. From there on, the staircases are set in surrounding woodlands and the space opens up. At the top of the staircase is the grand church of Bom Jesus welcoming strolling tourists.\r\nIn a medium landing, you will find the first belvedere; from here you can see the entire city of Braga and the involving landscape. From there on, the staircases do not cross the woods and the space opens up. At the top is the grand church of Bom Jesus inviting the pedestrian to reach it.	\N	12	2
58	Parque do Bom Jesus do Monte	\N	\N	"El Santuario de Bom Jesus do Monte, también conocida como el Santuario de Bom Jesus de Braga, ubicada en la parroquia de Tenões en la ciudad, el condado y el distrito de Braga.\r\nA pocos Kms de Braga, se eleva majestuosamente el complejo turístico - religioso Bom Jesús, donde la naturaleza y el arte " se dan mutuamente las manos" para hacer de este lugar un verdadero ex-libris de la ciudad de los arzobispos.\r\nLos orígenes de la estancia del Bom Jesús remontan a principios del siglo XIV, cuando alguien - quizás después de la batalla del Salado (1340) - decidió poner una cruz en la parte superior de la ladera del monte Espinho. Muy pronto esta cruz fue resguardado por una capilla, que se convirtió en un lugar de peregrinación por los fieles de Braga y de otras zonas. Esta capilla fue anexada a la parroquia de Tenões ".\r\n	\N	12	4
59	Parque do Bom Jesus do Monte	\N	\N	\N	\N	12	5
60	Parque do Bom Jesus do Monte	\N	\N	"Le sanctuaire de Bom Jesus do Monte, appelé aussi le sanctuaire de Bom Jesus de Braga, située dans la paroisse de Tenões dans la ville, le comté et district de Braga.\r\nA quelques Kms de Braga, se dresse majestueusement à la station touristique - religieuse Bom Jesus, où la nature et l'art "rejoignent mutuellement les mains" pour en faire un véritable ex-libris de la ville des archevêques.\r\nLes origines de l'office de Bom Jesus remonte au début du XIVe siècle, quand quelqu'un - peut-être après la bataille de Salado (1340) - a décidé de mettre une croix sur le dessus de la colline de Espinho. Très vite, cette croix a été abritée par une chapelle, qui est devenu un lieu de pèlerinage pour les habitants de Braga et d' autres fidèles de proximité. Cette chapelle a été annexée à la paroisse de Tenões ".	\N	12	3
61	Museu de Arqueologia D. Diogo de Sousa 	\N	De 3ª feira a domingo\r\nDas 10h00 às 17h30 	Criado em 1918, este Museu foi revitalizado em 1980, como Museu de Arqueologia.\r\nDependente do Instituto de Museus e da Conservação e do Ministério da Cultura, o Museu exerce a sua atividade no domínio de apoio à investigação e valorização do património arqueológico.\r\nPossui um laboratório de restauro e serviços técnicos especializados. A área ao público comporta um auditório, exposições temporárias e permanentes, loja, serviços educativos, biblioteca, cafetaria e jardim.	\N	13	1
62	Museu de Arqueologia D. Diogo de Sousa 	\N	De Terça feira a domingo\r\nDas 10h00 às 17h30	\N	\N	13	2
63	Museu de Arqueologia D. Diogo de Sousa 	\N	De Martes a Domingo\r\nHorário de Inverno:\r\nDas 09h00 às 12h30\r\nDas 14h00 às 17h30\r\nHorário de Verão:\r\nDas 09h00 às 12h30\r\nDas 14h00 às 18h30\r\nEncerra à 2ª feira	Creado en 1918, este museo fue revitalizado en 1980 como el Museo de Arqueología. \r\nDependiente del Instituto de Museos y de la Conservación del Ministerio de Cultura, el Museo ejerce su actividad en el campo para apoyar la investigación y la valorización del patrimonio arqueológico. \r\nTiene un laboratorio de restauración y los servicios técnicos. El área incluye un auditorio público, exposiciones permanentes y temporales, tienda, servicios educativos, biblioteca, cafetería y jardín.	\N	13	4
64	Museu de Arqueologia D. Diogo de Sousa 	\N	\N	\N	\N	13	5
65	Museu de Arqueologia D. Diogo de Sousa 	\N	\N	\N	\N	13	3
66	Estádio Municipal	\N	Inverno - 10h30 e 15h30\r\nVerão - Junho, Julho e Agosto: 10h30, 14h30 e 16h30	O Estádio Municipal de Braga, conhecido por Estádio da Pedreira afirma-se como uma mais-valia para o concelho, valorizando a cidade e a região. Projectado pelo Arquitectoportuguês Eduardo Souto Moura (Prémio Pritzker 2011) e pelo Engenheiro português Rui Furtado, é uma obra de particular beleza, enquanto peça de arquitectura e de invulgar engenharia «uma grande obra de arte», que vem dar corpo ao Parque Urbano implantado na encosta do Monte Castro, na periferia da área urbana de Braga virado para o vale do Rio Cávado. O estádio é actualmente utilizado pelo Sporting Clube de Braga.	\N	14	1
67	Estádio Municipal	\N	Winter - 10h30 e 15h30\r\nSummer - June, July anf August: 10h30, 14h30 e 16h30	Braga Municipal Stadium is a football stadium in Braga, Portugal, with an all-seated capacity of 30,286, built in 2003 as the new home for local club Sporting Clube de Braga, and as a UEFA Euro 2004 venue. Its architect was Portuguese Eduardo Souto de Moura. The stadium is also known as A Pedreira (The Quarry), as it is carved into the face of the adjacent Monte Castro quarry.	\N	14	2
68	Estádio Municipal	\N	Invierno - 10h30 a 15h30\r\nVerão - Junho, Julho e Agosto: 10h30, 14h30 e 16h30	El Estadio Municipal de Braga, conocido como el estadio de la cantera (pedrera) se afirma como activo de la comarca, valorizando la ciudad y la región. Diseñado por el arquitecto português Eduardo Souto Moura (Premio Pritzker 2011) y por el ingeniero portugués Rui Furtado, es una obra de singular belleza, una pieza de arquitectura e ingeniería inusual, una “gran obra de arte”, que viene a dar cuerpo al Parque Urbano desplegado en ladera del Monte Castro, en las afueras de la zona urbana de Braga frente al valle del río Cávado. El estadio es utilizado actualmente por el Sporting Clube de Braga.\r\n	\N	14	4
69	Estádio Municipal	\N	\N	\N	\N	14	5
70	Estádio Municipal	\N	\N	\N	\N	14	3
71	Palácio do Raio ou Casa do Mexicano	\N	\N	O Palácio do Raio, ou Casa do Mexicano é um palácio construído em 1754-55, por encomenda de João Duarte de Faria, poderoso comerciante de Braga, e projeto do arquiteto André Soares, é um dos mais notáveis edifícios de arquitetura civil da cidade de Braga, em estilo barroco joanino.\r\nO palácio foi vendido em 1853, por José Maria Duarte Peixoto, a Miguel José Raio, visconde de São Lázaro, ficando conhecido como Palácio do Raio. Miguel José Raio era um capitalista brasileiro, nascido em Braga, na rua da Cruz de Pedra, em 10 de Maio de 1814 e falecido em 14 de Agosto de 1875. O novo proprietário, em 1863, abriu a rua em frente do palácio, para permitir uma melhor visão da sua casa e poder construir duas habitações para as suas filhas.\r\nAtualmente pertence à Santa Casa da Misericórdia de Braga e está classificado como Imóvel de Interesse Público desde 1956.	\N	15	1
72	Palácio do Raio ou Casa do Mexicano	\N	\N	The “Palácio do Raio”, or “Casa do Mexicano” is a palace built between 1754- 55, and was commissioned by João Duarte de Faria, an influential merchant in Braga. The project, which was designed by the architect André Soares, is one of Braga’s most remarkable examples of civil architecture, in the baroque style of King John I.The palace was sold in 1853 by José Maria Duarte Peixoto to Miguel José Raio, viscount of São Lázaro, and is still known as “Palácio do Raio”.\r\nMiguel José Raio was a wealthy Brazilian capitalist, born in Braga, in Rua Cruz de Pedra, on May 10th, 1814. He died on August 14th, 1875. In 1863 the following owner opened the street in front of the palace to allow for a better view of his house and to be able to build two houses for his daughters. Nowadays, it belongs to the Santa Casa da Misericórdia of Braga and has been classified as a Building of Public Interest since 1956.	\N	15	2
73	Palácio do Raio ou Casa do Mexicano	\N	\N	"El palacio del rayo, o la Casa del Mexicano es un palacio construido en 1754-1755, encargado por John Duarte de Faria, comerciante poderoso de Braga; el arquitecto André Soares, proyectó uno de los edificios más notables de la arquitectura civil de la ciudad Braga, en estilo barroco de Joanino. \r\nEl palacio fue vendido en 1853 por José María Duarte Peixoto a  José Miguel Ray, vizconde de San Lázaro, llegando a ser conocido como el palácio del rayo. José Miguel Ray era un capitalista brasileño, nacido en Braga, en la calle de la Cruz de Piedra 10 de mayo 1814 y murió el 14 de agosto de 1875. El nuevo propietario, en 1863, abrió la calle en frente del palacio, para permitir una mejor visión de su hogar y poder construir dos casas para sus hijas. \r\nActualmente pertenece a la Santa Casa da Misericordia de Braga y se clasifica como edifício de interés público desde el año 1956 ".\r\n	\N	15	4
74	Palácio do Raio ou Casa do Mexicano	\N	\N	\N	\N	15	5
75	Palácio do Raio ou Casa do Mexicano	\N	\N	\N	\N	15	3
76	Fonte do Ídolo	\N	Terça a Sexta: 9h00 às 12h30 e das 14h00 às 17h30\r\nEncerra à Segunda e Feriados\r\nFim de Semana: 11h00 às 17h00	A Fonte do Ídolo é um monumento romano da cidade, localiza-se na Rua do Raio, na zona central da cidade.\r\nPossivelmente construída no século I dC, A Fonte do Ídolo consiste de uma fonte de água com inscrições e figuras esculpidas em um afloramento natural de granito. Uma inscrição indica que um tal Célico Fronto, natural de Arcóbriga, mandou fazer o monumento. Perto dessa inscrição se encontra uma figura vestida com uma toga, que poderia representar o dedicante. Ao lado, sobre a fonte d'água, se encontra outra figura esculpida: um busto, erodido, dentro de um nicho de perfil clássico com uma figura de uma pomba no frontão. Perto dessa figura se encontra outra inscrição com o nome do dedicante e o nome da divindade Tongoenabiago, que provavelmente é representada pela figura do nicho. Perto da fonte se encontraram vestígios arquitetónicos que indicam que o santuário pode ter sido parte de um templo.	\N	16	1
77	Fonte do Ídolo	\N	Tuesday to Friday: 9:00 to 12:30 and from 14:00 to 17:30\r\nClosed on Mondays and public holidays\r\nWeekend: 11h00 to 17h00	The Idol Fountain is a Roman monument. It’s located in "Rua do Raio", in the central area of the city.\r\n\r\nPossibly built in the 1st century B.C, the Idol Fountain consists of a water fountain with inscriptions and figures sculpted in a natural granite outcrop. An inscription indicates that a certain Célico Fronto, native of Arcóbriga, ordered the construction of the monument.  Near that inscription is a figure dressed in a toga, which might represent that man. Next to it, over the water fountain, you will find another sculpted figure: a bust, eroded, inside a niche of a classic profile with a dove (figure) on the front. Near that figure you’ll find another inscription with the name of the person who ordered the construction of the monument and the name of the divinity, Tongoenabiago, which is probably is represented by the figure in the niche. Near the fountain there are architectonical traces which indicate that the sanctuary might have been part of a temple.	\N	16	2
78	Fonte do Ídolo	\N	Martes a Viernes: 9h00 a 12h30 e de las 14h00 a las 17h30\r\nEncerra à Segunda e Feriados\r\nFim de Semana: 11h00 às 17h00	"La fuente del idolo es un monumento romano de la ciudad, se encuentra en la calle del rayo, en el centro de la ciudad. \r\nPosiblemente construida en el siglo I dC, La fuente del ídolo es una fuente de agua con figuras e inscripciones talladas en un afloramiento de granito natural. Una inscripción indica que un tal Celico Fronto, de la region de Arcóbriga, mando hacer este monumento. Cerca de esta inscripción, existe una figura vestida con una toga, lo que podría representar el dedicante. Al lado, en la fuente de agua, existe otra figura tallada: un busto, erodio, dentro de un nicho de perfil classico y una figura de una paloma. Cerca de esa figura, existe otra inscripción con el nombre del dedicante y el nombre de la divinidad Tongoenabiago, que está probablemente representado por la figura del nicho. Cerca de la fuente se encontraron restos arquitectónicos que indica que el santuario puede haber sido parte de un templo ".	\N	16	4
79	Fonte do Ídolo	\N	\N	\N	\N	16	5
80	Fonte do Ídolo	\N	\N	\N	\N	16	3
81	Sé de Braga	\N	\N	A Sé Catedral é considerada como um centro de irradiação episcopal e um dos mais importantes templos do românico português, a sua história remonta à obra do primeiro bispo, D. Pedro de Braga, correspondendo à restauração da Sé episcopal em 1070, de que não se conservam vestígios.\r\nNesta catedral encontram-se os túmulos de Henrique de Borgonha e sua mulher, Teresa de Leão, os condes do Condado Portucalense, pais do rei D. Afonso Henriques.	\N	17	1
82	Sé de Braga	\N	\N	The Sé Cathedral is considered the centre of Episcopalian diffusion and one of the most important temples of the Portuguese Roman style. Its history goes back to the work of the first bishop, D. Pedro of Braga, corresponding to the restoration of the Episcopalian See in 1070, of which there are no traces.\r\nIn this cathedral, you will find the tombs of Henrique of Borgonha and his wife, Teresa of Leão, the Counts of the Condado Portucalense (first Portuguese County) and parents of king D. Afonso Henriques.	\N	17	2
86	Casa dos Paivas ou Casa da Roda 	\N	\N	A Casa dos Paivas ou da Roda foi construída no século XVI, no centro histórico de Braga. No final do século XIX, a Câmara Municipal de Braga aluga o imóvel, onde instalou o "Hospício dos Expostos" ou "Casa da Roda", que seria a última casa da Roda em Braga, daí a sua designação atual. Em 1986 é adquirido pela Câmara Municipal. O edifício é requalificado e classificado como Imóvel de Interesse Público.\r\nO edifício foi construído com materiais de edifícios anteriores, esta reutilização confere-lhe um aspeto original. O edifício é caracterizado por um estilo renascentista Florentino. As arestas do edifício em pedra, a simetria, a estética e a harmonia são os aspetos mais marcantes.\r\nHoje no edifício encontra-se a Junta de Freguesia de São João do Souto e a Associação Jovens em Caminhada.	\N	18	1
87	Casa dos Paivas ou Casa da Roda 	\N	\N	The “Casa dos Paivas ou da Roda” was built in the 16th century and is\r\nsituated in the historical center of Braga. In the late 19th century, The Braga City Hall rented the building, where the “Hospício dos Expostos” or “Casa da Roda”, was installed.\r\nThus would be Braga’s last “Casa da Roda”, or orphanage, thus its present designation. In 1986 it was bought by the City Hall. The building has been re-qualified and classified as a Building of Public Interest. It was built using materials from former buildings, which explains its unique appearance. The building is characteristic of by a renaissance Florentine style. The stone corners of the building, its symmetry, aesthetics and harmony are its most remarkable aspects.\r\nToday, the building houses the Parish Council of São João do Souto and the Youth\r\nAssociation “Jovens em Caminhada".	\N	18	2
88	Casa dos Paivas ou Casa da Roda 	\N	\N	"La Casa de Paivas o de la rueda fue construida en el siglo XVI en el centro histórico de Braga. A finales del siglo XIX, el ayuntamiento de la ciudad de Braga comenzo a arrendar la propiedad donde se instala el "Hospicio de los expuestos" o "Casa de la rueda", que seria la última casa de la Rueda en Braga, de ahí su nombre actual. En 1986 es adquirida por el ayuntamiento. El edificio fue clasificado como de interés público. \r\nEl edificio fue construido con los materiales de edifícios anteriores, esta  reutilización le da un aspecto único. El edificio se caracteriza por el estilo renacimiento florentino. Los bordes de la piedra, la simetría, la estética y la armonía del edifício son los aspectos más llamativos. \r\nHoy en día el edificio es la parroquia de São João do Souto y la Asociación de Jóvenes en caminada.\r\n	\N	18	4
89	Casa dos Paivas ou Casa da Roda 	\N	\N	\N	\N	18	5
90	Casa dos Paivas ou Casa da Roda 	\N	\N	\N	\N	18	3
91	Igreja Santa Maria Madalena  	\N	\N	Na Serra de Falperra, podemos encontrar a Igreja de Santa Maria Madalena, construída por ordem do arcebispo D. Rodrigo de Moura Teles. É um harmonioso monumento em estilo barroco, precedido por uma ampla escadaria, de acordo com a tipologia comum aos santuários mais próximos.\r\nNo interior, também ricamente decorado em estilo barroco, importa destacar o púlpito e o revestimento azulejar do séc. XVIII assinado pelo ceramista Policarpo de Oliveira Fernandes.  	\N	19	1
92	Igreja Santa Maria Madalena  	\N	\N	In the Falperra Hill we find the Santa Maria Madalena Church built by the archbishop D. Rodrigo de Moura Teles. It is a harmonious monument in the rococo style.\r\nThere is a wide staircase at the entrance, in accordance with surrounding sanctuaries in the same style. The interior, also richly decorated in a Baroque style, has a noteworthy pulpit and 18th century glazed tiles produced by the ceramist Policarpo de Oliveira Fernandes.	\N	19	2
93	Igreja Santa Maria Madalena  	\N	\N	"En la sierra de la Falperra, se encuentra la Iglesia de Santa María Magdalena, construida por orden del arzobispo Rodrigo de Moura Teles. Es un monumento barroco armonioso, precedido por una amplia escalera, de acuerdo a la tipología común de los santuarios más próximos. \r\nEn el interior, también ricamente decorado en estilo barroco, es de destacar el púlpito y el revestimiento de azulejos del siglo XVIII firmado por el alfarero Policarpo de Oliveira Fernandes. "\r\n	\N	19	4
94	Igreja Santa Maria Madalena  	\N	\N	\N	\N	19	5
95	Igreja Santa Maria Madalena  	\N	\N	\N	\N	19	3
96	Capela de S. Frutuoso   	\N	\N	Templo datável do século VII em estilo visigótico (informação que não reúne o consenso dos especialistas), constitui o mais importante exemplar nacional da arquitetura pré românica e um dos mais significativos da península.	\N	20	1
97	Capela de S. Frutuoso   	\N	\N	This 7TH century temple with a Visigothic style (a controversial feature according to specialists), is the most important example of pre-Roman architecture in the nation and one of the most significant in the peninsula.	\N	20	2
98	Capela de S. Frutuoso   	\N	\N	Templo del siglo VII en estilo visigodo (información que no cumple con el consenso de los expertos), es el ejemplo nacional más importante de la arquitectura pre románica y uno de los más significativos de la península.\r\n	\N	20	4
99	Capela de S. Frutuoso   	\N	\N	\N	\N	20	5
100	Capela de S. Frutuoso   	\N	\N	\N	\N	20	3
101	Museu Nogueira da Silva	\N	Museu \r\nDas 10h00 às 12h00\r\nDas 14h00 às 17h00\r\nGaleria \r\nDas 10h00 às 12h00\r\nDas 14h00 às 18h45\r\nEncerra aos sábados de manhã, domingos, segundas e Feriados	O Museu Nogueira da Silva deve a sua fundação ao legado, feito em Setembro de 1975, a favor da Universidade do Minho por António Augusto Nogueira da Silva. Originário de uma família bracarense, desenvolveu uma atividade filantrópica que levou o Estado e a Igreja a distingui-lo com várias ordens honoríficas.\r\nA dimensão do edifício da autoria do arquiteto Rodrigues Lima, o jardim e a situação no centro da cidade, tornaram possível a disponibilização de espaços para atividades culturais complementares ao Museu como a Galeria da Universidade, onde se realizam exposições temporárias de Arte; auditórios para conferências e concertos; a Fototeca, onde se conservam vários arquivos fotográficos e o Serviço Educativo com uma variada programação de atividades para escolas. A exposição permanente inclui uma importante coleção de porcelana, peças de mobiliário, pintura, prata, marfim e algumas tapeçarias e azulejos.	\N	21	1
102	Museu Nogueira da Silva	\N	Museum\r\nFrom 10h00 to 12h00\r\nFrom 14.00 to 17.00\r\nGallery\r\nFrom 10h00 to 12h00\r\nFrom 14h00 to 18h45\r\nClosed on Saturday mornings, Sundays, Mondays and Holidays	The “Nogueira da Silva” Museum owes its foundation to the legacy made in September, 1975 in favour of the University of Minho by António Augusto Nogueira da Silva. Born in Braga, he developed philanthropic activities, which led to his recognition by the Government and the Church, receiving several honorary titles. The area of the building, originally designed by architect Rodrigues Lima, the garden and the fact that it is located in the city centre, allows for spaces to be opened for complementary cultural activities to the\r\nMuseum: the University Gallery, where temporary Art exhibitions are held; auditoriums for conferences and concerts; the Fototeca (Photographic Library), where several photographic archives are kept and the Educational Service with a diverse activity programme for schools. The permanent exhibition includes an important porcelain collection, pieces of furniture, paintings, silver, ivory and some tapestries and glazed tiles.	\N	21	2
103	Museu Nogueira da Silva	\N	Museu \r\nDas 10h00 às 12h00\r\nDas 14h00 às 17h00\r\nGaleria \r\nDas 10h00 às 12h00\r\nDas 14h00 às 18h45\r\nEncerra aos sábados de manhã, domingos, segundas e Feriados	"El Museo Nogueira da Silva debe su fundación al legado, realizado en septiembre de 1975 a favor de la Universidad de Minho por António Augusto Nogueira da Silva. Originario de una familia de Braga, desarrolló una actividad filantrópica que dirigió el Estado y la Iglesia para distinguir con varias órdenes honoríficas. \r\nEl tamaño del edificio diseñado por el arquitecto Rodrigues Lima, el jardín y la situación en el centro de la ciudad, han hecho posible la creación de espacios adicionales para las actividades culturales como la Galería Museo de la Universidad, donde se celebran exposiciones temporales de arte, auditorios y salas de conferencias conciertos, la biblioteca de fotos, que se conservan diversos archivos fotográficos y servicio educativo con un variado programa de actividades para las escuelas. La exposición permanente incluye una importante colección de porcelanas, muebles, pinturas, plata, marfil y algunos tapices y azulejos ".	\N	21	4
104	Museu Nogueira da Silva	\N	\N	\N	\N	21	5
105	Museu Nogueira da Silva	\N	\N	\N	\N	21	3
106	Tesouro-Museu da Sé de Braga	\N	De 3ª feira a Domingo\r\nHorário de Inverno:\r\nDas 09h00 às 12h30\r\nDas 14h00 às 17h30\r\nHorário de Verão:\r\nDas 09h00 às 12h30\r\nDas 14h00 às 18h30\r\nEncerra à 2ª feira	O Tesouro-Museu da Sé de Braga encerra um espólio de inestimável valor, com peças que cobrem um período de mil e quinhentos anos e que, em muitos casos, sintetizam a vida cristã dinamizada a partir da Catedral.\r\nA fundação do Tesouro-Museu da Sé de Braga data de 1930 e resulta da vontade do Arcebispo D. Manuel Vieira de Matos que tudo fez junto do Governo de então para a criação de um Museu de Arte Sacra. Criado deste modo o hoje designado Tesouro-Museu da Sé de Braga, está desde a sua fundação instalado na antiga Casa do Cabido. Esta casa anexa à Catedral foi mandada construir, no século XVIII, pelo Arcebispo D. Rodrigo de Moura Teles. As instalações foram ampliadas, durante os anos 2003 a 2007, a cinco casas contíguas. As obras de ampliação e remodelação de todo o espaço foram inauguradas a 30 de Março de 2007.	\N	22	1
107	Tesouro-Museu da Sé de Braga	\N	\N	\N	\N	22	2
108	Tesouro-Museu da Sé de Braga	\N	De Martes a Domingo\r\nHorário de Inverno:\r\nDas 09h00 às 12h30\r\nDas 14h00 às 17h30\r\nHorário de Verão:\r\nDas 09h00 às 12h30\r\nDas 14h00 às 18h30\r\nEncerra à 2ª feira	El Museo del Tesoro de la Catzedral de Braga contiene una colección de valor incalculable, con piezas que abarcan un período de 1.500 años y que, en muchos casos, resumen la vida cristiana de la Catedral.\r\nLa fundación de la Catedral del Tesoro-Museo Braga data de 1930 es el resultado de la voluntad del Arzobispo Manuel Vieira de Matos que hizo todo lo posible con el Gobierno de entonces para  crear un Museo de Arte Sacro. Asi, lo que hoy se designa como el Tesoro-Museo de la Catedral de Braga, desde su fundación se encuentra en la antigua casa del Capítulo. Esta casa anexa a la Catedral, fue construida en el siglo XVIII por el arzobispo Rodrigo de Moura Teles. Las instalaciones se ampliaron durante los años 2003 a 2007, cinco casas contiguas. La ampliación y remodelación de todo el espacio se abrieron el 30 de marzo de 2007.	\N	22	4
109	Tesouro-Museu da Sé de Braga	\N	\N	\N	\N	22	5
110	Tesouro-Museu da Sé de Braga	\N	\N	Le Musée du Trésor de la cathédrale Sé de Braga renferme une collection d'objets de valeurs inestimables, avec des pièces couvrant une période de mille cinq cents ans et que, dans de nombreux cas,  résume la vie chrétienne dinamizée a partir de la cathédrale.La fondation de la cathédrale du Trésor-Musée de la Sé de Braga date de 1930 et est le résultat de la volonté de l'archevêque Manuel Vieira de Matos qui a tout fait au près du gouvernement pour créer un Musée d'Art Sacré. Ainsi créé le Trésor désigné aujourd'hui Musée de la cathédrale Sé de Braga, depuis sa fondation est logé dans l'ancienne maison du chapitre. Cette maison mitoyenne de la cathédrale a été construite au XVIIIe siècle par l'archevêque Rodrigo de Moura Teles. Les installations ont été agrandies au cours des années 2003 à 2007, rassemblant cinq maisons mitoyennes. L'expansion et la rénovation de l'ensemble de l'espace ont été ouvertes le 30 Mars 2007.	\N	22	3
111	Mosteiro São Martinho de Tibães	\N	Todos os dias das 09h30 às 18h00 horas\r\nexceto -  1 de Janeiro, Dia de Páscoa, 1 de Maio e 25 de Dezembro\r\nVisitas Guiadas todos os dias (sem marcação) às: 11h00, 15h00 e 16h30.	O Mosteiro de S. Martinho de Tibães, antiga Casa-Mãe da Congregação Beneditina Portuguesa, situa-se na região norte de Portugal, a 6 kms a noroeste de Braga.\r\nFundado em finais do século X, inícios do XI, foi reconstruído no último terço do século XI, transformando-se, com o apoio real e a concessão de Cartas de Couto, num dos mais ricos e poderosos mosteiros do norte de Portugal. Com o Movimento da Reforma e o fim da crise religiosa dos séculos XIV a XVI, o Mosteiro de S. Martinho de Tibães assiste à fundação da Congregação de S. Bento de Portugal e do Brasil, torna-se Casa Mãe de todos os mosteiros beneditinos e centro difusor de culturas e estéticas. A importância do Mosteiro de Tibães mede-se, também, pelo papel que desempenhou como autêntico "estaleiro-escola" de um conjunto de arquitetos, mestres pedreiros e carpinteiros, entalhadores, douradores, enxambradores, imaginários e escultores, cuja produção ativa em todo o Noroeste peninsular ficou ligada ao melhor do que se fez na arte portuguesa dos séculos XVII e XVIII.	\N	23	1
112	Mosteiro São Martinho de Tibães	\N	Every day from 09:30 to 18:00 hours\r\nexcept - 1 January, Easter Day, May 1st and December 25th\r\nGuided tours every day (unmarked) at: 11h00, 15h00 and 16h30.	This Roman monastery was founded in the late 9th century and it received the “Carta do Couto”, granted by the Count D. Henrique in 1110. Throughout the early Middle Ages, the monastery became the trustee of a vast heritage. It was extended in the first half of the XVI century thanks to the Commendatory Abbot Friar António de Sá. In 1567 it became the headquarters of the Congregation of São Bento of Portugal and Brazil. Its restoration and cultural promotion began after it was bought by the Portuguese Government in 1986,\r\nand was then empty and derelict. Besides the church, which can be used for cultural heritage, the re-establishment of a monastic community, the transformation of different areas of the building into a museum and the creation of a study centre are planned due to the importance of the monastery in the Portuguese circuit of Saint Benedict.	\N	23	2
113	Mosteiro São Martinho de Tibães	\N	Todos los dias de  09h30 a 18h00 \r\nexceto -  1 de Janeiro, Dia de Páscoa, 1 de Maio e 25 de Dezembro\r\nVisitas Guiadas todos os dias (sem marcação) às: 11h00, 15h00 e 16h30.	El Monasterio de S. Martin Tibães , antigua Casa Madre de la Congregación Benedictina Portuguesa , está situado al norte de Portugal, a 6 kms al noroeste de Braga.\r\nFundada a finales del siglo X, principios del XI, fue reconstruida en el último tercio del siglo XI , convirtiéndose , con el apoyo real y el otorgamiento de Cartas de Couto , uno de los monasterios más ricos y poderosos del norte de Portugal. Con el Movimiento de la Reforma y el fin de la crisis religiosa del XIV a XVI, el monasterio de S. Martin Tibães asiste a la fundación de la Congregación de San Bento de Portugal y Brasil y se convierte en Casa Madre de todos los monasterios benedictinos y centro difusor de cultura y estética. La importancia del Monasterio de Tibães puede también medirse por su papel como una escuela de un grupo de arquitectos, maestros albañiles y carpinteros, tallistas , doradores , ensambladores , pensadores  y escultores cuya producción activa durante todo el noroeste peninsular quedo ligada a lo mejor que se hizo en el arte portugués en los siglos XVII y XVIII.\r\n	\N	23	4
114	Mosteiro São Martinho de Tibães	\N	\N	\N	\N	23	5
115	Mosteiro São Martinho de Tibães	\N	\N	Le monastère de S. Martin de Tibães, ancienne maison mère de la Congrégation bénédictine Portuguaise, est situé dans le nord du Portugal , à 6 km au nord-ouest de Braga.\r\nFondée à la fin du Xe siècle , début du XIe , ce monastère a été reconstruit dans le dernier tiers du XIe siècle, devenant, avec le soutien de la royauté et l'octroi de lettres de Couto, l'un des monastères les plus riches et les plus puissants du nord du Portugal. Avec le Mouvement de la Réforme et la fin de la crise religieuse du XIVe au XVIe siècles, le monastère de S. Martin de Tibães assiste à la fondation de la Congrégation de Saint-Bento du Portugal et du Brésil, et devient la Maison Mère de tous les monastères bénédictins et centre de diffusion de la culture et de l'esthétique. L'importance du monastère de Tibães est également mesurée pour son rôle comme un véritable " cour d'école " d'un groupe d'architectes, maîtres maçons et charpentiers, sculpteurs, doreurs, entre autres, dont la production actif tout au long de la péninsule du nord-ouest a été liée au meilleure qu'il y a été fait dans l'art portugais des XVIIe et XVIIIe siècles .	\N	23	3
116	Termas Romanas	\N	Terça a Sexta: 9h00 às 12h30 e das 14h00 às 17h30\r\nEncerra à Segunda e Feriados\r\nFim de Semana: 11h00 às 17h00	As Termas Romanas do Alto da Cividade ficam situadas na freguesia de Cividade.\r\nEm 1977, escavações efetuadas na colina da Cividade de Cima, puseram a descoberto as ruínas dumas termas públicas junto ao Forum da antiga cidade romana, situado, segundo a tradição, no actual Largo de Paulo Orósio. As termas públicas eram vastos edifícios preparados para proporcionar aos habitantes ou visitantes da cidade a possibilidade de tomar o seu banho de acordo com as regras prescritas pela medicina da época. Segundo estas, o banhista devia começar por untar o corpo com óleos e praticar alguns exercícios de ginástica, desporto ou luta livre. Entrava depois numa sala muito aquecida, o sudatório, onde transpirava abundantemente. Passava então ao caledário, sala ainda aquecida, onde podia lavar-se e retirar os restos de óleo. Depois de uma curta passagem pelo tepidário, mergulhava na piscina do frigidário, cuja água gelada lhe revigorava o corpo, sendo em seguida massajado e untado de óleos aromáticos.\r\nA área escavada das termas ocupa cerca de 850 m2. Estas termas eram, todavia, mais vastas, como se pode ver pela presença do hipocausto e piscina a sul, separados do restante corpo do edifício por um estreito corredor. Foram construídas nos finais do século I, restando desta fase o testemunho das quatro salas quentes cujos hipocaustos se encontram relativamente bem conservados. Não se conseguiu ainda definir o seu circuito interno nem a função de alguns dos seus compartimentos anexos. Nos finais do século III, o edifício sofreu uma grande remodelação e a sua superfície foi muito reduzida.	\N	24	1
117	Termas Romanas	\N	Tuesday to Friday: 9:00 to 12:30 and from 14:00 to 17:30\r\nClosed on Mondays and public holidays\r\nWeekend: 11h00 to 17h00	The Roman Spa of Alto da Cividade is located in the parish of Cividade. \r\nIn 1977, excavations made in Cividade de Cima hill, uncovered the ruins of a public spa near the Forum of the ancient Roman city located, according to the tradition, in the present Largo de Paulo Orósio. The public spa consisted of several buildings which allowed the inhabitants or visitors to take their bath according to the rules prescribed by medicine at the time. According to these rules, the bather should start by greasing his body with oils and practising some gymnastics exercises, sport or wrestling. Then he would enter a very warm room, the sudatorium, where he would transpire abundantly. He would later go to the caledarium, an even hotter room, where he could be washed and cleansed of the remaining oil. After a short passage by the tepidarium, he would dive in the frigidarium’s swimming pool, whose gelid waters would invigorate his body, followed by a massage and anointment with aromatic oils.\r\nThe excavated area of the spa covers an area of 850 m2 (9.149 ft²). This spa was, however, larger, as is clear due to the presence of the hypocaust and the swimming pool located in the south, which is separated from the rest of the building by a narrow corridor. All that was left from this spa built in the 1st century is the evidence of these four hot rooms whose hypocausts are in a good state of conservation. It has not been possible to define the internal circuit or the function of some of its annexed compartments. In the late 3rd century, the building was greatly remodelled and its surface was reduced.	\N	24	2
118	Termas Romanas	\N	Martes a Viernes: 9h00 a 12h30 e de las 14h00 a las 17h30\r\nEncerra à Segunda e Feriados\r\nFim de Semana: 11h00 às 17h00	" Los baños romanos de la Alta Cividade se encuentran en la parroquia de Cividade.\r\nEn 1977, las excavaciones llevadas a cabo en la colina Cividade de arriba, pusieron al descubierto las ruinas de una termas públicas cerca del foro de la antigua ciudad romana , que se encuentra , según la tradición , en el actual Largo Pablo Orosio . Los baños públicos eran grandes edificios preparados para proporcionar a los residentes y visitantes de la ciudad la oportunidad de tomar su baño de conformidad con las disposiciones prescritas por la medicina de la época. Según estos, el bañista debe comenzar untando el cuerpo con aceites y practicar algunos ejercicios de gimnasia , deportes o lucha libre. Entrando después en una habitación muy acalorada, o sudatorium, donde se transpiraba abundantemente. Luego,  pasaban la caledário, una  habitación todavía caliente en el que se podían lavar y eliminar el aceite restante. Después de un corto período de tiempo en el tepidarium, se sumergian en la piscina, cuya agua helada vigorizaba el cuerpo,  seguido de un masaje y aceites com fragâncias.\r\nEl área excavada del spa ocupa unos 850 m2. Estos baños eran , sin embargo , más extensa , como se muestra por la presencia del hipocausto y de la piscina el sur , separados del cuerpo restante del edificio por un pasillo estrecho . Se construyeron a finales del siglo I, dejando esta fase, el testimonio de cuatro salas calientes cuyas hipocaustos se encuentran relativamente bien conservados. Todavía no se ha podido definir sus circuitos internos o la función de algunos de sus compartimentos adjuntos. A finales del siglo III, el edificio sufrió una importante remodelación y su superficie fue muy reducida"\r\n	\N	24	4
119	Termas Romanas	\N	\N	\N	\N	24	5
120	Termas Romanas	\N	\N	\N	\N	24	3
121	Igreja do Pópulo	\N	\N	A Igreja do Pópulo está incluída no Convento do Pópulo e onde se venera a imagem da virgem da Igreja de Santa Maria del Popolo em Roma. A construção de todo o conjunto arrastou-se pelos século XVI ao XIX. Grande parte do edifício (incluindo a fachada) é um projeto de autoria do arquiteto Carlos Amarante.\r\nEm 1834, com a extinção das ordens religiosas passou para as mãos do estado, e em 1841 o convento passou a acolher um Regimento de Infantaria.	\N	25	1
122	Igreja do Pópulo	\N	\N	Pópulo Church is part of the Pópulo Convent, which worships the Virgin of Santa Maria del Popolo church in Rome. The church and the convent were built throughout the 18th and 19th century. Most of the building (including the façade) is a project of the architect Carlos Amarante. \r\nIn 1834, with the extinction of the religious orders, it became the property of the State. In 1841, the Convent began to house the Infantry Regiment.\r\nToday it is one of the buildings belonging to the Braga Municipal Council.	\N	25	2
123	Igreja do Pópulo	\N	\N	"La Iglesia del Pópulo está incluida en el Convento del Pópulo y que venera la imagen de la virgen de la iglesia de Santa Maria del Popolo en Roma. La construcción de todo el conjunto fue arrasado desde XVI hasta el siglo XIX. Gran parte del edificio (incluyendo la fachada) es un proyecto del arquitecto Carlos Amarante. \r\nEn 1834, con la disolución de las órdenes religiosas pasaron a manos del Estado, y en 1841 el convento comenzó a acoger un regimiento de infantería ".\r\n	\N	25	4
124	Igreja do Pópulo	\N	\N	\N	\N	25	5
125	Igreja do Pópulo	\N	\N	\N	\N	25	3
\.


--
-- Name: attraction_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('attraction_translations_id_seq', 125, true);


--
-- Data for Name: attraction_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY attraction_types (id, type_id, attraction_id) FROM stdin;
1	11	1
2	1	2
3	11	4
4	1	12
\.


--
-- Name: attraction_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('attraction_types_id_seq', 4, true);


--
-- Data for Name: attractions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY attractions (id, site, email, address, phone, latitude, longitude, active, source, "timestamp", reference_point, rating, accessibility, city_id, web_user_id) FROM stdin;
2	http://www.cm-braga.pt/wps/portal/publico/!ut/p/c5/04_SB8K8xLLM9MSSzPy8xBz9CP0os_gAN0evQE8zH09TEzPnMBMTIx8DKND388jPTdUvyHZUBAD-sdZx/dl3/d3/L3dDb0EvUU5RTGtBISEvWUZSdndBISEvNl9QRkFKUUk2TEk1NDZDVjQ0MkwwMDAwMDAwMA!!/	\N	Rua da Doutor Justino Cruz\r\n4700-317 Braga	253 262 550	41.5518036	-8.42591572	t	\N	1390346193	f	4.5	f	3	1
5	http://www.museupioxii.com/	geral@museupioxii.com	Largo de Santiago, 47\r\n4704-532 Braga	253 200 130	41.5480614	-8.42604828	t	\N	1390346194	f	4.5	f	3	1
13	\N	mdds@ipmuseus.pt	Rua dos Bombeiros Voluntários - 4700-025 Braga	253 273 706 / 253 615 844	41.5458488	-8.42765427	t	\N	1390346195	f	4.5	f	3	1
7	\N	\N	Largo do Paço\r\n4700-313 Braga ‎	\N	41.5508156	-8.42642593	t	\N	1390346194	f	4.5	f	3	1
16	\N	fonte.idolo@cm-braga.pt	Rua Raio 383\r\n4700-924 Braga	253 218 011	41.5485992	-8.42196846	t	\N	1390346196	f	4.5	f	3	1
1	http://www.geira.pt/MCordofones/	mcordofones@um.geira.pt	Rua de Santo António 3, 4705-630 Tebosa - Braga	253 673 855	41.4888725	-8.47282314	t	\N	1390346193	f	4.5	f	3	1
3	\N	\N	Largo de São João do Souto, 4700-328 Braga 	253 262 550 	41.5499649	-8.42481709	t	\N	1390346193	f	4.5	f	3	1
6	http://www.cm-braga.pt/wps/portal/publico/!ut/p/c5/04_SB8K8xLLM9MSSzPy8xBz9CP0os_gAN0evQE8zH09TEzPnMBMTIx8DKND388jPTdUvyHZUBAD-sdZx/dl3/d3/L3dDb0EvUU5RTGtBISEvWUZSdndBISEvNl9QRkFKUUk2TEk1NDZDVjQ0MkwwMDAwMDAwMA!!/	\N	Rua Dom Diogo de Sousa, Braga, Norte, 4700	253 262 550	41.5506973	-8.42853355	t	\N	1390346194	f	4.5	f	3	1
11	http://museus.bragadigital.pt/Biscainhos/	mbiscainhos@ipmuseus.pt	Rua dos Biscainhos - 4700-415 Braga	253 204 650	41.5512733	-8.42939472	t	\N	1390346195	f	4.5	f	3	1
8	\N	\N	Rua Nova da Estação\r\n4700-223 Braga	\N	41.5490837	-8.43425083	t	\N	1390346194	f	4.5	f	3	1
4	\N	\N	Praça do Comércio\r\n4700-370 Braga 	\N	41.5569992	-8.44299984	t	\N	1390346194	f	4.5	f	3	1
14	http://www.scbraga.pt/	visitas@scbraga.pt	Parque Norte, R. de Montecastro, 4700-087 Braga	253 206 860	41.5660019	-8.42599964	t	\N	1390346195	f	4.5	f	3	1
23	http://www.mosteirodetibaes.org/	msmtibaes@culturanorte.pt	Rua do Mosteiro\r\n4700-565 Mire de Tibães	253 622 670	41.555088	-8.47943783	t	\N	1390346197	f	4.5	f	3	1
17	http://www.se-braga.pt/index2.php	info@se-braga.pt	Rua Dom Paio Mendes, 4700-424 Braga	253 263 317	41.5499687	-8.42747211	t	\N	1390346196	f	4.5	f	3	1
12	http://bomjesus.net/	info@bomjesus.eu	Monte do Bom Jesus, Braga	253 676 636	41.5550957	-8.37881947	t	\N	1390346195	f	4.5	f	3	1
20	\N	\N	\N	\N	\N	\N	t	\N	1390346197	f	4.5	f	3	1
9	\N	\N	\N	\N	\N	\N	t	\N	1390346194	f	4.5	f	3	1
15	\N	\N	Rua do Raio, Braga, Norte\r\n4820-142	253 262 550	41.5485268	-8.42247486	t	\N	1390346195	f	4.5	f	3	1
10	http://www.diocese-braga.pt/	geral@arquidiocese-braga.pt	Avenida Nossa Senhora do Sameiro 44, 4715-616 Espinho - Braga	253 203 180	41.5422821	-8.36971855	t	\N	1390346194	f	4.5	f	3	1
18	\N	\N	Rua de Nossa Senhora do Leite 2\r\n4700-317 Braga	\N	41.5499763	-8.42654419	t	\N	1390346196	f	4.5	f	3	1
21	www.mns.uminho.pt	sec@mns.uminho.pt	Av. Central, 61 - 4710-228 Braga	253 601 275	41.5518227	-8.42177677	t	\N	1390346197	f	4.5	f	3	1
24	\N	termas.romanas@cm-braga.pt	Rua Dr. Rocha Peixoto\r\n4700 Braga	253 278 455	41.5471382	-8.42992592	t	\N	1390346197	f	4.5	f	3	1
19	\N	\N	Estrada Via Falperra, 4700-407 Braga	253 240 700	41.5208244	-8.3890667	t	\N	1390346196	f	4.5	f	3	1
22	http://www.se-braga.pt/tesouro_museu.php	tmsb.educar@gmail.com	R. D. Paio Mendes, s/n 4700-424 Braga	253 263 317	41.5501022	-8.42810535	t	\N	1390346197	f	4.5	f	3	1
25	\N	\N	Rua Conde de Agrolongo 107\r\n4700-313 Braga	\N	41.5520973	-8.42845345	t	\N	1390346198	f	4.5	f	3	1
\.


--
-- Name: attractions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('attractions_id_seq', 25, true);


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cities (id, name, abv, description, country_id) FROM stdin;
1	Lisboa	LSB	\N	188
2	Porto	PRT	\N	188
3	Braga	BRG	\N	188
4	Coimbra	CBR	\N	188
5	Amadora	AMD	\N	188
6	Vila Nova de Gaia	VNG	\N	188
7	Setúbal	STB	\N	188
8	Beja	BJA	\N	188
9	Évora	EVR	\N	188
10	Faro	FAR	\N	188
11	Portimão	PTM	\N	188
12	Vila Real	VRL	\N	188
13	Bragança	BGC	\N	188
14	Viana do Castelo	VCT	\N	188
15	Alcobaça	ACB	\N	188
16	Funchal	FUN	\N	188
17	Portalegre	PTG	\N	188
18	Aveiro	AVR	\N	188
19	Almada	ALM	\N	188
20	Barreiro	BRR	\N	188
21	Cartaxo	CTX	\N	188
22	Elvas	ELV	\N	188
23	Chaves	CHV	\N	188
24	Fátima	VNO	\N	188
25	Espinho	ESP	\N	188
26	Guarda	GRD	\N	188
27	Gouveia	GVA	\N	188
28	Fundão	FND	\N	188
29	Leiria	LRA	\N	188
30	Maia	MAI	\N	188
31	Loures	LRS	\N	188
32	Moura	MRA	\N	188
33	Mirandela	MDL	\N	188
34	Penafiel	PNF	\N	188
35	Pinhel	PNH	\N	188
36	Praia da Vitória	VPV	\N	188
37	Queluz	SNT	\N	188
38	Ribeira Grande	RGR	\N	188
39	Santana	STN	\N	188
40	Santa Cruz	SCR	\N	188
41	Seia	SEI	\N	188
42	São Pedro do Sul	SPS	\N	188
43	Tomar	TMR	\N	188
44	Tavira	TVR	\N	188
45	Trancoso	TCS	\N	188
46	Trofa	TRF	\N	188
\.


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cities_id_seq', 46, true);


--
-- Data for Name: comment_attractions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comment_attractions (id, comment, evaluationdate, mobile_user_id, attraction_id) FROM stdin;
1	Ir a Braga e não ir ao Bom Jesus é como ir a Roma e não ver o Papa. É um sítio lindíssimo, com uma igreja bonita e com imensos espaços verdes. Aproveite para fazer um pouco de exercício e subir a escadaria :)	2013-12-01	2	1
2	Principal atração turística de Braga, fica no topo de uma escadaria marcada por sinais religiosos católicos (estações com cenas da Paixão de Cristo). Prepare o fôlego para subir as escadas ou utilize o funicular. Os jardins em torno da igreja ficam lindos na primavera.	2013-12-01	3	1
3	É bonito, mas nada espetacular. Se tem uma bela vista desde a parte inferior, de onde se vêem as escadarias e a igreja no alto. A vista lá de cima também é razoável. Suba de "funicular" e desça andando. O local merecia estar num estado de conservação melhor.	2013-12-01	4	1
4	Visitar o Bom Jesus é fazer uma viagem pelo local mais belo do norte de Portugal, tendo em conta a sua importância histórica.	2013-12-01	5	1
5	O lugar é simplesmente lindo! A natureza exuberante, a arquitetura combinando muito com a natureza, os jardins super bem cuidados, a igreja e seus sinos, o bonde tocado à água, enfim, a composição toda vale ser visitada. Se possível, subir ou descer sem ser pelo bonde, pelas escadarias, entre as estações da via sacra e a natureza.	2013-12-01	6	1
6	Magnifica vegetação, vista deslumbrante sobre a cidade de Braga.Pode-se subir de elevador ou de carro. Muito agradável no Verão e no Inverno.	2013-12-01	7	1
7	Muito bom. 5 estrelas. Recomendo :)	2013-12-01	2	2
8	A não perder	2013-12-01	3	2
9	É bonito, mas nada espetacular.	2013-12-01	4	2
10	Local mais belo do norte de Portugal	2013-12-01	5	2
11	O lugar é simplesmente lindo!	2013-12-01	6	2
12	Muito agradável no Verão e no Inverno.	2013-12-01	7	2
13	Muito bom. 5 estrelas. Recomendo :)	2013-12-01	2	3
14	A não perder	2013-12-01	3	3
15	É bonito, mas nada espetacular.	2013-12-01	4	3
16	Local mais belo do norte de Portugal	2013-12-01	5	3
17	O lugar é simplesmente lindo!	2013-12-01	6	3
18	Muito agradável no Verão e no Inverno.	2013-12-01	7	3
19	Muito bom. 5 estrelas. Recomendo :)	2013-12-01	2	4
20	A não perder	2013-12-01	3	4
21	É bonito, mas nada espetacular.	2013-12-01	4	4
22	Local mais belo do norte de Portugal	2013-12-01	5	4
23	O lugar é simplesmente lindo!	2013-12-01	6	4
24	Muito agradável no Verão e no Inverno.	2013-12-01	7	4
25	Muito bom. 5 estrelas. Recomendo :)	2013-12-01	2	5
26	A não perder	2013-12-01	3	5
27	É bonito, mas nada espetacular.	2013-12-01	4	5
28	Local mais belo do norte de Portugal	2013-12-01	5	5
29	O lugar é simplesmente lindo!	2013-12-01	6	5
30	Muito agradável no Verão e no Inverno.	2013-12-01	7	5
31	Muito bom. 5 estrelas. Recomendo :)	2013-12-01	2	6
32	A não perder	2013-12-01	3	6
33	É bonito, mas nada espetacular.	2013-12-01	4	6
34	Local mais belo do norte de Portugal	2013-12-01	5	6
35	O lugar é simplesmente lindo!	2013-12-01	6	6
36	Muito agradável no Verão e no Inverno.	2013-12-01	7	6
37	Muito bom. 5 estrelas. Recomendo :)	2013-12-01	2	7
38	A não perder	2013-12-01	3	7
39	É bonito, mas nada espetacular.	2013-12-01	4	7
40	Local mais belo do norte de Portugal	2013-12-01	5	7
41	O lugar é simplesmente lindo!	2013-12-01	6	7
42	Muito agradável no Verão e no Inverno.	2013-12-01	7	7
43	Muito bom. 5 estrelas. Recomendo :)	2013-12-01	2	8
44	A não perder	2013-12-01	3	8
45	É bonito, mas nada espetacular.	2013-12-01	4	8
46	Local mais belo do norte de Portugal	2013-12-01	5	8
47	O lugar é simplesmente lindo!	2013-12-01	6	8
48	Muito agradável no Verão e no Inverno.	2013-12-01	7	8
49	Muito bom. 5 estrelas. Recomendo :)	2013-12-01	2	9
50	A não perder	2013-12-01	3	9
51	É bonito, mas nada espetacular.	2013-12-01	4	9
52	Local mais belo do norte de Portugal	2013-12-01	5	9
53	O lugar é simplesmente lindo!	2013-12-01	6	9
54	Muito agradável no Verão e no Inverno.	2013-12-01	7	9
55	Muito bom. 5 estrelas. Recomendo :)	2013-12-01	2	10
56	A não perder	2013-12-01	3	10
57	É bonito, mas nada espetacular.	2013-12-01	4	10
58	Local mais belo do norte de Portugal	2013-12-01	5	10
59	O lugar é simplesmente lindo!	2013-12-01	6	10
60	Muito agradável no Verão e no Inverno.	2013-12-01	7	10
61	Muito bom. 5 estrelas. Recomendo :)	2013-12-01	2	11
62	A não perder	2013-12-01	3	11
63	É bonito, mas nada espetacular.	2013-12-01	4	11
64	Local mais belo do norte de Portugal	2013-12-01	5	11
65	O lugar é simplesmente lindo!	2013-12-01	6	11
66	Muito agradável no Verão e no Inverno.	2013-12-01	7	11
67	Muito bom. 5 estrelas. Recomendo :)	2013-12-01	2	12
68	A não perder	2013-12-01	3	12
69	É bonito, mas nada espetacular.	2013-12-01	4	12
70	Local mais belo do norte de Portugal	2013-12-01	5	12
71	O lugar é simplesmente lindo!	2013-12-01	6	12
72	Muito agradável no Verão e no Inverno.	2013-12-01	7	12
73	Muito bom. 5 estrelas. Recomendo :)	2013-12-01	2	13
74	A não perder	2013-12-01	3	13
75	É bonito, mas nada espetacular.	2013-12-01	4	13
76	Local mais belo do norte de Portugal	2013-12-01	5	13
77	O lugar é simplesmente lindo!	2013-12-01	6	13
78	Muito agradável no Verão e no Inverno.	2013-12-01	7	13
79	Muito bom. 5 estrelas. Recomendo :)	2013-12-01	2	14
80	A não perder	2013-12-01	3	14
81	É bonito, mas nada espetacular.	2013-12-01	4	14
82	Local mais belo do norte de Portugal	2013-12-01	5	14
83	O lugar é simplesmente lindo!	2013-12-01	6	14
84	Muito agradável no Verão e no Inverno.	2013-12-01	7	14
85	Muito bom. 5 estrelas. Recomendo :)	2013-12-01	2	15
86	A não perder	2013-12-01	3	15
87	É bonito, mas nada espetacular.	2013-12-01	4	15
88	Local mais belo do norte de Portugal	2013-12-01	5	15
89	O lugar é simplesmente lindo!	2013-12-01	6	15
90	Muito agradável no Verão e no Inverno.	2013-12-01	7	15
91	Muito bom. 5 estrelas. Recomendo :)	2013-12-01	2	16
92	A não perder	2013-12-01	3	16
93	É bonito, mas nada espetacular.	2013-12-01	4	16
94	Local mais belo do norte de Portugal	2013-12-01	5	16
95	O lugar é simplesmente lindo!	2013-12-01	6	16
96	Muito agradável no Verão e no Inverno.	2013-12-01	7	16
97	Muito bom. 5 estrelas. Recomendo :)	2013-12-01	2	17
98	A não perder	2013-12-01	3	17
99	É bonito, mas nada espetacular.	2013-12-01	4	17
100	Local mais belo do norte de Portugal	2013-12-01	5	17
101	O lugar é simplesmente lindo!	2013-12-01	6	17
102	Muito agradável no Verão e no Inverno.	2013-12-01	7	17
103	Muito bom. 5 estrelas. Recomendo :)	2013-12-01	2	18
104	A não perder	2013-12-01	3	18
105	É bonito, mas nada espetacular.	2013-12-01	4	18
106	Local mais belo do norte de Portugal	2013-12-01	5	18
107	O lugar é simplesmente lindo!	2013-12-01	6	18
108	Muito agradável no Verão e no Inverno.	2013-12-01	7	18
109	Muito bom. 5 estrelas. Recomendo :)	2013-12-01	2	19
110	A não perder	2013-12-01	3	19
111	É bonito, mas nada espetacular.	2013-12-01	4	19
112	Local mais belo do norte de Portugal	2013-12-01	5	19
113	O lugar é simplesmente lindo!	2013-12-01	6	19
114	Muito agradável no Verão e no Inverno.	2013-12-01	7	19
115	Muito bom. 5 estrelas. Recomendo :)	2013-12-01	2	20
116	A não perder	2013-12-01	3	20
117	É bonito, mas nada espetacular.	2013-12-01	4	20
118	Local mais belo do norte de Portugal	2013-12-01	5	20
119	O lugar é simplesmente lindo!	2013-12-01	6	20
120	Muito agradável no Verão e no Inverno.	2013-12-01	7	20
121	Muito bom. 5 estrelas. Recomendo :)	2013-12-01	2	21
122	A não perder	2013-12-01	3	21
123	É bonito, mas nada espetacular.	2013-12-01	4	21
124	Local mais belo do norte de Portugal	2013-12-01	5	21
125	O lugar é simplesmente lindo!	2013-12-01	6	21
126	Muito agradável no Verão e no Inverno.	2013-12-01	7	21
127	Muito bom. 5 estrelas. Recomendo :)	2013-12-01	2	22
128	A não perder	2013-12-01	3	22
129	É bonito, mas nada espetacular.	2013-12-01	4	22
130	Local mais belo do norte de Portugal	2013-12-01	5	22
131	O lugar é simplesmente lindo!	2013-12-01	6	22
132	Muito agradável no Verão e no Inverno.	2013-12-01	7	22
133	Muito bom. 5 estrelas. Recomendo :)	2013-12-01	2	23
134	A não perder	2013-12-01	3	23
135	É bonito, mas nada espetacular.	2013-12-01	4	23
136	Local mais belo do norte de Portugal	2013-12-01	5	23
137	O lugar é simplesmente lindo!	2013-12-01	6	23
138	Muito agradável no Verão e no Inverno.	2013-12-01	7	23
139	Muito bom. 5 estrelas. Recomendo :)	2013-12-01	2	24
140	A não perder	2013-12-01	3	24
141	É bonito, mas nada espetacular.	2013-12-01	4	24
142	Local mais belo do norte de Portugal	2013-12-01	5	24
143	O lugar é simplesmente lindo!	2013-12-01	6	24
144	Muito agradável no Verão e no Inverno.	2013-12-01	7	24
145	Muito bom. 5 estrelas. Recomendo :)	2013-12-01	2	25
146	A não perder	2013-12-01	3	25
147	É bonito, mas nada espetacular.	2013-12-01	4	25
148	Local mais belo do norte de Portugal	2013-12-01	5	25
149	O lugar é simplesmente lindo!	2013-12-01	6	25
150	Muito agradável no Verão e no Inverno.	2013-12-01	7	25
\.


--
-- Name: comment_attractions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comment_attractions_id_seq', 150, true);


--
-- Data for Name: comment_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comment_events (id, comment, evaluationdate, mobile_user_id, event_id) FROM stdin;
1	Ambiente agradável conjugado com comida e bebida boa! Vale a pena a visita! Oferece vários tipos de cerveja, principalmente a belga! A francesinha, ao meu ver, prato principal do restaurante é muito boa, e com preço acessível!	2013-12-01	2	1
2	No geral, o serviço foi muito bom... Tive relativa facilidade em arranjar mesa, visto sermos apenas 2 pessoas. Quanto à francesinha, é realmente muito boa, embora ache o molho um bocado adocicado. A oferta de cerveja é realmente uma mais valia. A repetir, sem dúvida!	2013-12-01	3	1
3	Ao chegar perto das 21:00 já não se arranja mesa. A espera para arranjar mesa foi de cerca de 30 minutos e mais 30 minutos para ser servidos. A espera só se justifica pela grande qualidade da Francesinha. Ingredientes bons, mas o molho ( que quanto a mim é o que faz toda a diferença numa francesinha), é fenomenal. A carta de cervejas também é muito boa pela sua variedade.O preço não é o melhor para o tipo de prato que se fala, mas é justo tendo em conta a alta qualidade do mesmo.Vale a pena esperar e vale a pena experimentar!!!!	2013-12-01	4	1
4	Recomendado por amigos fui a Taberna Belga na expectativa de provar a melhor Francesinha... Sinto muito mas sai um pouco defraudado, a Francesinha é boa sim senhor, mas não é a melhor... Contudo gostei muito do ambiente e da excelente carta de cervejas Artesanais.	2013-12-01	5	1
5	De tanto ouvir falar nas famosas francesinhas, visitei o local. Ficou aquém das minhas espectativas. O melhor que se retirou da francesinha foi o bife muito suculento, o molho era muito doce, e o pão de forma nada de especial. As ditas cervejas belgas, o preço era acima da média e muito, pedimos um fino claro, pois ficava mais caro as cervejas que as francesinhas. O espaço é apertado, que temos de comer com o vizinho da mesa do lado quase no colo.	2013-12-01	6	1
6	Recomendo este local a quem quer comer uma boa francesinha. Tem também muita variedade de cerveja. O preço é acima da média mas é justo. É um estabelecimento muito frequentado pelo que é aconselhável fazer marcação.	2013-12-01	7	1
7	No geral, o serviço foi muito bom... Tive relativa facilidade em arranjar mesa, visto sermos apenas 2 pessoas. Quanto à francesinha, é realmente muito boa, embora ache o molho um bocado adocicado. A oferta de cerveja é realmente uma mais valia. A repetir, sem dúvida!	2013-12-01	3	2
8	Ao chegar perto das 21:00 já não se arranja mesa. A espera para arranjar mesa foi de cerca de 30 minutos e mais 30 minutos para ser servidos. A espera só se justifica pela grande qualidade da Francesinha. Ingredientes bons, mas o molho ( que quanto a mim é o que faz toda a diferença numa francesinha), é fenomenal. A carta de cervejas também é muito boa pela sua variedade.O preço não é o melhor para o tipo de prato que se fala, mas é justo tendo em conta a alta qualidade do mesmo.Vale a pena esperar e vale a pena experimentar!!!!	2013-12-01	4	2
9	Recomendado por amigos fui a Taberna Belga na expectativa de provar a melhor Francesinha... Sinto muito mas sai um pouco defraudado, a Francesinha é boa sim senhor, mas não é a melhor... Contudo gostei muito do ambiente e da excelente carta de cervejas Artesanais.	2013-12-01	5	2
10	De tanto ouvir falar nas famosas francesinhas, visitei o local. Ficou aquém das minhas espectativas. O melhor que se retirou da francesinha foi o bife muito suculento, o molho era muito doce, e o pão de forma nada de especial. As ditas cervejas belgas, o preço era acima da média e muito, pedimos um fino claro, pois ficava mais caro as cervejas que as francesinhas. O espaço é apertado, que temos de comer com o vizinho da mesa do lado quase no colo.	2013-12-01	6	2
\.


--
-- Name: comment_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comment_events_id_seq', 10, true);


--
-- Data for Name: comment_itineraries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comment_itineraries (id, comment, evaluationdate, itinerary_id, mobile_user_id) FROM stdin;
1	Vale a pena	2013-12-15	1	2
2	Passeio agradável.	2013-12-15	1	3
3	Tem que ir!	2013-12-15	1	4
4	Lindo lugar. Vale a pena o passeio.	2013-12-15	1	5
5	Magnifica vista lá do alto sobre a cidade de Braga e toda a zona circundante. Santuário com cafes, wc, lojas de lembranças, zonas de sombra e hotel.	2013-12-15	1	6
6	Boas sugestões.	2013-12-15	1	7
7	Vale a pena	2013-12-15	2	2
8	Tem que ir!	2013-12-15	2	4
9	Lindo lugar. Vale a pena o passeio.	2013-12-15	2	5
10	Boas sugestões.	2013-12-15	2	7
11	Vale a pena	2013-12-15	3	2
12	Passeio agradável.	2013-12-15	3	3
13	Tem que ir!	2013-12-15	3	4
14	Magnifica vista lá do alto sobre a cidade de Braga e toda a zona circundante. Santuário com cafes, wc, lojas de lembranças, zonas de sombra e hotel.	2013-12-15	3	6
15	Boas sugestões.	2013-12-15	3	7
\.


--
-- Name: comment_itineraries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comment_itineraries_id_seq', 15, true);


--
-- Data for Name: comment_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comment_services (id, comment, evaluationdate, mobile_user_id, service_id) FROM stdin;
1	No geral, o serviço foi muito bom... Tive relativa facilidade em arranjar mesa, visto sermos apenas 2 pessoas. Quanto à francesinha, é realmente muito boa, embora ache o molho um bocado adocicado. A oferta de cerveja é realmente uma mais valia. A repetir, sem dúvida!	2013-12-01	3	1
2	Ao chegar perto das 21:00 já não se arranja mesa. A espera para arranjar mesa foi de cerca de 30 minutos e mais 30 minutos para ser servidos. A espera só se justifica pela grande qualidade da Francesinha. Ingredientes bons, mas o molho ( que quanto a mim é o que faz toda a diferença numa francesinha), é fenomenal. A carta de cervejas também é muito boa pela sua variedade.O preço não é o melhor para o tipo de prato que se fala, mas é justo tendo em conta a alta qualidade do mesmo.Vale a pena esperar e vale a pena experimentar!!!!	2013-12-01	4	1
3	Recomendado por amigos fui a Taberna Belga na expectativa de provar a melhor Francesinha... Sinto muito mas sai um pouco defraudado, a Francesinha é boa sim senhor, mas não é a melhor... Contudo gostei muito do ambiente e da excelente carta de cervejas Artesanais.	2013-12-01	5	1
4	De tanto ouvir falar nas famosas francesinhas, visitei o local. Ficou aquém das minhas espectativas. O melhor que se retirou da francesinha foi o bife muito suculento, o molho era muito doce, e o pão de forma nada de especial. As ditas cervejas belgas, o preço era acima da média e muito, pedimos um fino claro, pois ficava mais caro as cervejas que as francesinhas. O espaço é apertado, que temos de comer com o vizinho da mesa do lado quase no colo.	2013-12-01	6	1
5	Recomendo este local a quem quer comer uma boa francesinha. Tem também muita variedade de cerveja. O preço é acima da média mas é justo. É um estabelecimento muito frequentado pelo que é aconselhável fazer marcação.	2013-12-01	7	1
6	Ambiente agradável conjugado com comida e bebida boa! Vale a pena a visita! Oferece vários tipos de cerveja, principalmente a belga! A francesinha, ao meu ver, prato principal do restaurante é muito boa, e com preço acessível!	2013-12-01	2	1
7	No geral, o serviço foi muito bom... Tive relativa facilidade em arranjar mesa	2013-12-01	3	2
8	Ao chegar perto das 21:00 já não se arranja mesa. Vale a pena esperar e vale a pena experimentar!!!!	2013-12-01	4	2
9	Recomendado por amigos fui... Sinto muito mas sai um pouco defraudado	2013-12-01	5	2
10	Ficou aquém das minhas espectativas.	2013-12-01	6	2
11	Recomendo este local. O preço é acima da média mas é justo.	2013-12-01	7	2
12	Vale a pena a visita! 	2013-12-01	2	2
13	No geral, o serviço foi muito bom... Tive relativa facilidade em arranjar mesa	2013-12-01	3	3
14	Ao chegar perto das 21:00 já não se arranja mesa. Vale a pena esperar e vale a pena experimentar!!!!	2013-12-01	4	3
15	Recomendado por amigos fui... Sinto muito mas sai um pouco defraudado	2013-12-01	5	3
16	Ficou aquém das minhas espectativas.	2013-12-01	6	3
17	Recomendo este local. O preço é acima da média mas é justo.	2013-12-01	7	3
18	Vale a pena a visita! 	2013-12-01	2	3
19	No geral, o serviço foi muito bom... Tive relativa facilidade em arranjar mesa	2013-12-01	3	4
20	Ao chegar perto das 21:00 já não se arranja mesa. Vale a pena esperar e vale a pena experimentar!!!!	2013-12-01	4	4
21	Recomendado por amigos fui... Sinto muito mas sai um pouco defraudado	2013-12-01	5	4
22	Ficou aquém das minhas espectativas.	2013-12-01	6	4
23	Recomendo este local. O preço é acima da média mas é justo.	2013-12-01	7	4
24	Vale a pena a visita! 	2013-12-01	2	4
25	No geral, o serviço foi muito bom... Tive relativa facilidade em arranjar mesa	2013-12-01	3	5
26	Ao chegar perto das 21:00 já não se arranja mesa. Vale a pena esperar e vale a pena experimentar!!!!	2013-12-01	4	5
27	Recomendado por amigos fui... Sinto muito mas sai um pouco defraudado	2013-12-01	5	5
28	Ficou aquém das minhas espectativas.	2013-12-01	6	5
29	Recomendo este local. O preço é acima da média mas é justo.	2013-12-01	7	5
30	Vale a pena a visita! 	2013-12-01	2	5
31	No geral, o serviço foi muito bom... Tive relativa facilidade em arranjar mesa	2013-12-01	3	6
32	Ao chegar perto das 21:00 já não se arranja mesa. Vale a pena esperar e vale a pena experimentar!!!!	2013-12-01	4	6
33	Recomendado por amigos fui... Sinto muito mas sai um pouco defraudado	2013-12-01	5	6
34	Ficou aquém das minhas espectativas.	2013-12-01	6	6
35	Recomendo este local. O preço é acima da média mas é justo.	2013-12-01	7	6
36	Vale a pena a visita! 	2013-12-01	2	6
37	No geral, o serviço foi muito bom... Tive relativa facilidade em arranjar mesa	2013-12-01	3	7
38	Ao chegar perto das 21:00 já não se arranja mesa. Vale a pena esperar e vale a pena experimentar!!!!	2013-12-01	4	7
39	Recomendado por amigos fui... Sinto muito mas sai um pouco defraudado	2013-12-01	5	7
40	Ficou aquém das minhas espectativas.	2013-12-01	6	7
41	Recomendo este local. O preço é acima da média mas é justo.	2013-12-01	7	7
42	Vale a pena a visita! 	2013-12-01	2	7
43	No geral, o serviço foi muito bom... Tive relativa facilidade em arranjar mesa	2013-12-01	3	8
44	Ao chegar perto das 21:00 já não se arranja mesa. Vale a pena esperar e vale a pena experimentar!!!!	2013-12-01	4	8
45	Recomendado por amigos fui... Sinto muito mas sai um pouco defraudado	2013-12-01	5	8
46	Ficou aquém das minhas espectativas.	2013-12-01	6	8
47	Recomendo este local. O preço é acima da média mas é justo.	2013-12-01	7	8
48	Vale a pena a visita! 	2013-12-01	2	8
49	No geral, o serviço foi muito bom... Tive relativa facilidade em arranjar mesa	2013-12-01	3	9
50	Ao chegar perto das 21:00 já não se arranja mesa. Vale a pena esperar e vale a pena experimentar!!!!	2013-12-01	4	9
51	Recomendado por amigos fui... Sinto muito mas sai um pouco defraudado	2013-12-01	5	9
52	Ficou aquém das minhas espectativas.	2013-12-01	6	9
53	Recomendo este local. O preço é acima da média mas é justo.	2013-12-01	7	9
54	Vale a pena a visita! 	2013-12-01	2	9
55	No geral, o serviço foi muito bom... Tive relativa facilidade em arranjar mesa	2013-12-01	3	10
56	Ao chegar perto das 21:00 já não se arranja mesa. Vale a pena esperar e vale a pena experimentar!!!!	2013-12-01	4	10
57	Recomendado por amigos fui... Sinto muito mas sai um pouco defraudado	2013-12-01	5	10
58	Ficou aquém das minhas espectativas.	2013-12-01	6	10
59	Recomendo este local. O preço é acima da média mas é justo.	2013-12-01	7	10
60	Vale a pena a visita! 	2013-12-01	2	10
61	No geral, o serviço foi muito bom... Tive relativa facilidade em arranjar mesa	2013-12-01	3	11
62	Ao chegar perto das 21:00 já não se arranja mesa. Vale a pena esperar e vale a pena experimentar!!!!	2013-12-01	4	11
63	Recomendado por amigos fui... Sinto muito mas sai um pouco defraudado	2013-12-01	5	11
64	Ficou aquém das minhas espectativas.	2013-12-01	6	11
65	Recomendo este local. O preço é acima da média mas é justo.	2013-12-01	7	11
66	Vale a pena a visita! 	2013-12-01	2	11
67	No geral, o serviço foi muito bom... Tive relativa facilidade em arranjar mesa	2013-12-01	3	12
68	Ao chegar perto das 21:00 já não se arranja mesa. Vale a pena esperar e vale a pena experimentar!!!!	2013-12-01	4	12
69	Recomendado por amigos fui... Sinto muito mas sai um pouco defraudado	2013-12-01	5	12
70	Ficou aquém das minhas espectativas.	2013-12-01	6	12
71	Recomendo este local. O preço é acima da média mas é justo.	2013-12-01	7	12
72	Vale a pena a visita! 	2013-12-01	2	12
73	No geral, o serviço foi muito bom... Tive relativa facilidade em arranjar mesa	2013-12-01	3	13
74	Ao chegar perto das 21:00 já não se arranja mesa. Vale a pena esperar e vale a pena experimentar!!!!	2013-12-01	4	13
75	Recomendado por amigos fui... Sinto muito mas sai um pouco defraudado	2013-12-01	5	13
76	Ficou aquém das minhas espectativas.	2013-12-01	6	13
77	Recomendo este local. O preço é acima da média mas é justo.	2013-12-01	7	13
78	Vale a pena a visita! 	2013-12-01	2	13
79	No geral, o serviço foi muito bom... Tive relativa facilidade em arranjar mesa	2013-12-01	3	14
80	Ao chegar perto das 21:00 já não se arranja mesa. Vale a pena esperar e vale a pena experimentar!!!!	2013-12-01	4	14
81	Recomendado por amigos fui... Sinto muito mas sai um pouco defraudado	2013-12-01	5	14
82	Ficou aquém das minhas espectativas.	2013-12-01	6	14
83	Recomendo este local. O preço é acima da média mas é justo.	2013-12-01	7	14
84	Vale a pena a visita! 	2013-12-01	2	14
85	No geral, o serviço foi muito bom... Tive relativa facilidade em arranjar mesa	2013-12-01	3	15
86	Ao chegar perto das 21:00 já não se arranja mesa. Vale a pena esperar e vale a pena experimentar!!!!	2013-12-01	4	15
87	Recomendado por amigos fui... Sinto muito mas sai um pouco defraudado	2013-12-01	5	15
88	Ficou aquém das minhas espectativas.	2013-12-01	6	15
89	Recomendo este local. O preço é acima da média mas é justo.	2013-12-01	7	15
90	Vale a pena a visita! 	2013-12-01	2	15
91	No geral, o serviço foi muito bom... Tive relativa facilidade em arranjar mesa	2013-12-01	3	16
92	Ao chegar perto das 21:00 já não se arranja mesa. Vale a pena esperar e vale a pena experimentar!!!!	2013-12-01	4	16
93	Recomendado por amigos fui... Sinto muito mas sai um pouco defraudado	2013-12-01	5	16
94	Ficou aquém das minhas espectativas.	2013-12-01	6	16
95	Recomendo este local. O preço é acima da média mas é justo.	2013-12-01	7	16
96	Vale a pena a visita! 	2013-12-01	2	16
97	No geral, o serviço foi muito bom... Tive relativa facilidade em arranjar mesa	2013-12-01	3	17
98	Ao chegar perto das 21:00 já não se arranja mesa. Vale a pena esperar e vale a pena experimentar!!!!	2013-12-01	4	17
99	Recomendado por amigos fui... Sinto muito mas sai um pouco defraudado	2013-12-01	5	17
100	Ficou aquém das minhas espectativas.	2013-12-01	6	17
101	Recomendo este local. O preço é acima da média mas é justo.	2013-12-01	7	17
102	Vale a pena a visita! 	2013-12-01	2	17
103	No geral, o serviço foi muito bom... Tive relativa facilidade em arranjar mesa	2013-12-01	3	18
104	Ao chegar perto das 21:00 já não se arranja mesa. Vale a pena esperar e vale a pena experimentar!!!!	2013-12-01	4	18
105	Recomendado por amigos fui... Sinto muito mas sai um pouco defraudado	2013-12-01	5	18
106	Ficou aquém das minhas espectativas.	2013-12-01	6	18
107	Recomendo este local. O preço é acima da média mas é justo.	2013-12-01	7	18
108	Vale a pena a visita! 	2013-12-01	2	18
109	No geral, o serviço foi muito bom... Tive relativa facilidade em arranjar mesa	2013-12-01	3	19
110	Ao chegar perto das 21:00 já não se arranja mesa. Vale a pena esperar e vale a pena experimentar!!!!	2013-12-01	4	19
111	Recomendado por amigos fui... Sinto muito mas sai um pouco defraudado	2013-12-01	5	19
112	Ficou aquém das minhas espectativas.	2013-12-01	6	19
113	Recomendo este local. O preço é acima da média mas é justo.	2013-12-01	7	19
114	Vale a pena a visita! 	2013-12-01	2	19
115	No geral, o serviço foi muito bom... Tive relativa facilidade em arranjar mesa	2013-12-01	3	20
116	Ao chegar perto das 21:00 já não se arranja mesa. Vale a pena esperar e vale a pena experimentar!!!!	2013-12-01	4	20
117	Recomendado por amigos fui... Sinto muito mas sai um pouco defraudado	2013-12-01	5	20
118	Ficou aquém das minhas espectativas.	2013-12-01	6	20
119	Recomendo este local. O preço é acima da média mas é justo.	2013-12-01	7	20
120	Vale a pena a visita! 	2013-12-01	2	20
121	No geral, o serviço foi muito bom... Tive relativa facilidade em arranjar mesa	2013-12-01	3	21
122	Ao chegar perto das 21:00 já não se arranja mesa. Vale a pena esperar e vale a pena experimentar!!!!	2013-12-01	4	21
123	Recomendado por amigos fui... Sinto muito mas sai um pouco defraudado	2013-12-01	5	21
124	Ficou aquém das minhas espectativas.	2013-12-01	6	21
125	Recomendo este local. O preço é acima da média mas é justo.	2013-12-01	7	21
126	Vale a pena a visita! 	2013-12-01	2	21
127	No geral, o serviço foi muito bom... Tive relativa facilidade em arranjar mesa	2013-12-01	3	22
128	Ao chegar perto das 21:00 já não se arranja mesa. Vale a pena esperar e vale a pena experimentar!!!!	2013-12-01	4	22
129	Recomendado por amigos fui... Sinto muito mas sai um pouco defraudado	2013-12-01	5	22
130	Ficou aquém das minhas espectativas.	2013-12-01	6	22
131	Recomendo este local. O preço é acima da média mas é justo.	2013-12-01	7	22
132	Vale a pena a visita! 	2013-12-01	2	22
133	No geral, o serviço foi muito bom... Tive relativa facilidade em arranjar mesa	2013-12-01	3	23
134	Ao chegar perto das 21:00 já não se arranja mesa. Vale a pena esperar e vale a pena experimentar!!!!	2013-12-01	4	23
135	Recomendado por amigos fui... Sinto muito mas sai um pouco defraudado	2013-12-01	5	23
136	Ficou aquém das minhas espectativas.	2013-12-01	6	23
137	Recomendo este local. O preço é acima da média mas é justo.	2013-12-01	7	23
138	Vale a pena a visita! 	2013-12-01	2	23
139	No geral, o serviço foi muito bom... Tive relativa facilidade em arranjar mesa	2013-12-01	3	24
140	Ao chegar perto das 21:00 já não se arranja mesa. Vale a pena esperar e vale a pena experimentar!!!!	2013-12-01	4	24
141	Recomendado por amigos fui... Sinto muito mas sai um pouco defraudado	2013-12-01	5	24
142	Ficou aquém das minhas espectativas.	2013-12-01	6	24
143	Recomendo este local. O preço é acima da média mas é justo.	2013-12-01	7	24
144	Vale a pena a visita! 	2013-12-01	2	24
145	No geral, o serviço foi muito bom... Tive relativa facilidade em arranjar mesa	2013-12-01	3	25
146	Ao chegar perto das 21:00 já não se arranja mesa. Vale a pena esperar e vale a pena experimentar!!!!	2013-12-01	4	25
147	Recomendado por amigos fui... Sinto muito mas sai um pouco defraudado	2013-12-01	5	25
148	Ficou aquém das minhas espectativas.	2013-12-01	6	25
149	Recomendo este local. O preço é acima da média mas é justo.	2013-12-01	7	25
150	Vale a pena a visita! 	2013-12-01	2	25
151	No geral, o serviço foi muito bom... Tive relativa facilidade em arranjar mesa	2013-12-01	3	26
152	Ao chegar perto das 21:00 já não se arranja mesa. Vale a pena esperar e vale a pena experimentar!!!!	2013-12-01	4	26
153	Recomendado por amigos fui... Sinto muito mas sai um pouco defraudado	2013-12-01	5	26
154	Ficou aquém das minhas espectativas.	2013-12-01	6	26
155	Recomendo este local. O preço é acima da média mas é justo.	2013-12-01	7	26
156	Vale a pena a visita! 	2013-12-01	2	26
157	No geral, o serviço foi muito bom... Tive relativa facilidade em arranjar mesa	2013-12-01	3	27
158	Ao chegar perto das 21:00 já não se arranja mesa. Vale a pena esperar e vale a pena experimentar!!!!	2013-12-01	4	27
159	Recomendado por amigos fui... Sinto muito mas sai um pouco defraudado	2013-12-01	5	27
160	Ficou aquém das minhas espectativas.	2013-12-01	6	27
161	Recomendo este local. O preço é acima da média mas é justo.	2013-12-01	7	27
162	Vale a pena a visita! 	2013-12-01	2	27
\.


--
-- Name: comment_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comment_services_id_seq', 162, true);


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

SELECT pg_catalog.setval('countries_id_seq', 264, true);


--
-- Data for Name: event_translations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY event_translations (id, name, schedule, price, description, transport, program, event_id, language_id) FROM stdin;
1	Braga Romana	Todo o dia	Entrada Livre	A iniciativa convida a reviver Bracara Avgvsta nos tempos do Império Romano.\r\nDurante os 5 dias de duração, esta recriação histórica no centro da cidade de Braga apresenta diferentes áreas representativas da época, como são exemplo o Mercado Romano, as Tabernas Tradicionais, a Área Escolar e Associativa, a Tenda Pedagógica e o Acampamento Militar.	\N	\N	1	1
2	Braga Romana	All day	Free	\N	\N	\N	1	2
3	Braga Romana	Todo el dia	Entrada Libre	"La iniciativa llama a revivir la Bracara AVGVSTA de la época romana.\r\nDurante la duración de 5 días, esta recreación histórica en el centro de la ciudad de Braga ofrece diferentes áreas representativas de la época, como por ejemplo, "el mercado romano, las tabernas tradicionales, Zona Escolar y Vida Asociativa, la tienda Pedagógica y el campamento Militar.\r\n	\N	\N	1	4
4	Braga Romana	\N	\N	\N	\N	\N	1	5
5	Braga Romana	\N	\N	L'iniciative invite a revivre Bracara Augusta, nom de la ville de Braga à l'époque de l'Empire Romain. Pendant la durée de 5 jours, cette reconstitution historique dans le centre de la ville de Braga dispose de différents secteurs représentant les diverses simbôles de l'époque, comme par exemple le marché romain, les tavernes traditionnelles, le secteur scolaire et le secteur Associative, le pédagogique et le campement avec les tentes du camp militaire.	\N	\N	1	3
6	Semana Santa de Braga	Todo o dia	Entrada Livre	As representações comemorativas da Paixão e Morte de Jesus tiveram início na Terra Santa, no século IV, desde que, após séculos de perseguição pelo poder romano, o imperador Constantino, com o famoso Édito de Milão (313), deu a paz à Igreja.\r\nRealizavam-se nos locais e horas em que tinham decorrido os respectivos acontecimentos. A peregrina Egéria (ou Etéria), que, nos finais daquele\r\nséculo, se deslocou do noroeste da Ibéria (Galécia) à Palestina, no seu\r\nescrito Peregrinatio ad Loca Sancta (Peregrinação aos Lugares Santos),\r\nfaz já um relato daquelas celebrações.	\N	\N	2	1
7	Semana Santa de Braga	All day	Free	\N	\N	\N	2	2
8	Semana Santa de Braga	Todo el dia	Entrada Libre	"Las representaciones conmemorativas de la Pasión y Muerte de Jesús tuvieron inicio en Tierra Santa en el siglo IV, ya que, después de siglos de persecución por parte del imperio romano, el emperador Constantino, con el famoso Edicto de Milán (313), le dio paz a la Iglesia .\r\nSe realizabam en los lugares y horas en los que habían transcurrido los respectivos eventos originales. La peregrina Egeria (o Etéria), que, en finales de aquel siglo, se trasladó desde el noroeste de Iberia (Galécia) a Palestina, en su escrito Peregrinatio ad Loca Sancta (peregrinación a los Santos Lugares) ya hacia un relato de estas celebraciones ".\r\n	\N	\N	2	4
9	Semana Santa de Braga	\N	\N	\N	\N	\N	2	5
10	Semana Santa de Braga	\N	\N	Les représentations commémoratives de la Passion et la Mort de Jésus en Terre Sainte ont commencé au quatrième siècle, après des siècles de persécution par le pouvoir romain, l'empereur Constantin, avec le célèbre édit de Milan (313), a donné la paix à l'Église.\r\nLa Semaine Sainte se realisait dans des endroits et à des moments où les épreuves respectives s'étaient écoulés. La pèlegrinne Egeria (ou Etheria), qui à la fin du siècle s'est déplacé du nord-ouest d' Iberia (Galécia) jusqu'en Palestine, dans son ecri, Peregrinatio Loca Sancta (pèlerinage aux Lieux Saints),\r\ndonne déjà un compte de ces célébrations.	\N	\N	2	3
\.


--
-- Name: event_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('event_translations_id_seq', 10, true);


--
-- Data for Name: event_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY event_types (id, event_id, type_id) FROM stdin;
\.


--
-- Name: event_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('event_types_id_seq', 1, false);


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY events (id, site, email, address, phone, latitude, longitude, source, active, "timestamp", startdate, enddate, organization, rating, accessibility, city_id, web_user_id) FROM stdin;
1	http://www.bragaromana.com/site/home.asp	geral@bragaromana.com	4700-034 Braga	253 331 373	41.5444641	-8.42904854	http://www.bragaromana.com/site/home.asp	t	1390346198	2014-05-22	2014-05-26	Braga Romana	3	f	3	1
2	http://www.semanasantabraga.com/	info@semanasantabraga.com	Rua D. Paio Mendes, 4700-424 Braga	253 263 317	41.5499878	-8.42827702	http://www.semanasantabraga.com/\r\nhttps://www.facebook.com/pages/Semana-Santa-de-Braga/112881175455744	t	1390346198	2014-03-22	2014-03-31	Semana Santa de Braga	4	f	3	1
\.


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('events_id_seq', 2, true);


--
-- Data for Name: itineraries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY itineraries (id, name, description, rating, itinerary_type_id, user_id) FROM stdin;
4	Noite de Braga	Noite de Braga	0	6	1
1	Rapidinha	Rota para quem quer conecer Braga em pouco tempo	4.66666651	4	1
2	Rota dos Restaurantes	Rota dos restaurantes	4.5	3	1
3	Rota das Igrejas	Rota dos restaurantes	4.5999999	1	1
\.


--
-- Name: itineraries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('itineraries_id_seq', 1, false);


--
-- Data for Name: itinerary_attractions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY itinerary_attractions (id, "order", itinerary_id, attraction_id) FROM stdin;
1	1	1	17
2	2	1	23
3	3	1	19
4	4	1	18
\.


--
-- Name: itinerary_attractions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('itinerary_attractions_id_seq', 4, true);


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
1	5	1	15
2	0	2	18
3	0	2	8
4	0	2	9
5	0	2	16
6	0	2	19
7	0	2	20
8	0	2	23
9	0	2	27
10	0	3	4
11	0	3	5
12	0	3	9
13	0	3	17
14	0	3	18
15	0	3	19
16	0	3	21
17	0	3	23
18	0	4	19
19	0	4	21
20	0	4	24
\.


--
-- Name: itinerary_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('itinerary_services_id_seq', 20, true);


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
1	Português	PT	Lingua Tuga
2	Inglês	EN	Lingua de Sua Majestade
3	Francês	FR	Baguete
4	Espanhol	ES	Febras
5	Alemão	DE	Podolsky
\.


--
-- Name: languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('languages_id_seq', 5, true);


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
2	Nuno	Pereira	M	1987-11-20	t
3	Rita	Faria	F	1991-09-28	t
4	João	Fonseca	M	1989-06-02	t
5	José	Pinheiro	M	1991-12-05	t
6	Catarina	Oliveira	F	1991-02-07	t
7	Flávio	Loureiro	M	1990-03-27	t
\.


--
-- Data for Name: pack_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pack_types (id, name, description, duration, price) FROM stdin;
1	Profissional	Pack que permite colocar vários dados do local e criar eventos	12	70
\.


--
-- Name: pack_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pack_types_id_seq', 1, true);


--
-- Data for Name: photo_attractions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY photo_attractions (id, name, photo_file_name, photo_content_type, photo_file_size, photo_updated_at, description, attraction_id) FROM stdin;
\.


--
-- Name: photo_attractions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('photo_attractions_id_seq', 1, false);


--
-- Data for Name: photo_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY photo_events (id, name, photo_file_name, photo_content_type, photo_file_size, photo_updated_at, description, event_id) FROM stdin;
\.


--
-- Name: photo_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('photo_events_id_seq', 1, false);


--
-- Data for Name: photo_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY photo_services (id, name, photo_file_name, "photo_content_type ", photo_file_size, photo_updated_at, description, service_id) FROM stdin;
\.


--
-- Name: photo_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('photo_services_id_seq', 1, false);


--
-- Data for Name: rating_attractions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rating_attractions (id, rating, evaluationdate, mobile_user_id, attraction_id) FROM stdin;
1	5	2013-12-01	2	1
2	5	2013-12-01	3	1
3	3	2013-12-01	4	1
4	5	2013-12-01	5	1
5	4	2013-12-01	6	1
6	5	2013-12-01	7	1
7	5	2013-12-01	2	2
8	5	2013-12-01	3	2
9	3	2013-12-01	4	2
10	5	2013-12-01	5	2
11	4	2013-12-01	6	2
12	5	2013-12-01	7	2
13	5	2013-12-01	2	3
14	5	2013-12-01	3	3
15	3	2013-12-01	4	3
16	5	2013-12-01	5	3
17	4	2013-12-01	6	3
18	5	2013-12-01	7	3
19	5	2013-12-01	2	4
20	5	2013-12-01	3	4
21	3	2013-12-01	4	4
22	5	2013-12-01	5	4
23	4	2013-12-01	6	4
24	5	2013-12-01	7	4
25	5	2013-12-01	2	5
26	5	2013-12-01	3	5
27	3	2013-12-01	4	5
28	5	2013-12-01	5	5
29	4	2013-12-01	6	5
30	5	2013-12-01	7	5
31	5	2013-12-01	2	6
32	5	2013-12-01	3	6
33	3	2013-12-01	4	6
34	5	2013-12-01	5	6
35	4	2013-12-01	6	6
36	5	2013-12-01	7	6
37	5	2013-12-01	2	7
38	5	2013-12-01	3	7
39	3	2013-12-01	4	7
40	5	2013-12-01	5	7
41	4	2013-12-01	6	7
42	5	2013-12-01	7	7
43	5	2013-12-01	2	8
44	5	2013-12-01	3	8
45	3	2013-12-01	4	8
46	5	2013-12-01	5	8
47	4	2013-12-01	6	8
48	5	2013-12-01	7	8
49	5	2013-12-01	2	9
50	5	2013-12-01	3	9
51	3	2013-12-01	4	9
52	5	2013-12-01	5	9
53	4	2013-12-01	6	9
54	5	2013-12-01	7	9
55	5	2013-12-01	2	10
56	5	2013-12-01	3	10
57	3	2013-12-01	4	10
58	5	2013-12-01	5	10
59	4	2013-12-01	6	10
60	5	2013-12-01	7	10
61	5	2013-12-01	2	11
62	5	2013-12-01	3	11
63	3	2013-12-01	4	11
64	5	2013-12-01	5	11
65	4	2013-12-01	6	11
66	5	2013-12-01	7	11
67	5	2013-12-01	2	12
68	5	2013-12-01	3	12
69	3	2013-12-01	4	12
70	5	2013-12-01	5	12
71	4	2013-12-01	6	12
72	5	2013-12-01	7	12
73	5	2013-12-01	2	13
74	5	2013-12-01	3	13
75	3	2013-12-01	4	13
76	5	2013-12-01	5	13
77	4	2013-12-01	6	13
78	5	2013-12-01	7	13
79	5	2013-12-01	2	14
80	5	2013-12-01	3	14
81	3	2013-12-01	4	14
82	5	2013-12-01	5	14
83	4	2013-12-01	6	14
84	5	2013-12-01	7	14
85	5	2013-12-01	2	15
86	5	2013-12-01	3	15
87	3	2013-12-01	4	15
88	5	2013-12-01	5	15
89	4	2013-12-01	6	15
90	5	2013-12-01	7	15
91	5	2013-12-01	2	16
92	5	2013-12-01	3	16
93	3	2013-12-01	4	16
94	5	2013-12-01	5	16
95	4	2013-12-01	6	16
96	5	2013-12-01	7	16
97	5	2013-12-01	2	17
98	5	2013-12-01	3	17
99	3	2013-12-01	4	17
100	5	2013-12-01	5	17
101	4	2013-12-01	6	17
102	5	2013-12-01	7	17
103	5	2013-12-01	2	18
104	5	2013-12-01	3	18
105	3	2013-12-01	4	18
106	5	2013-12-01	5	18
107	4	2013-12-01	6	18
108	5	2013-12-01	7	18
109	5	2013-12-01	2	19
110	5	2013-12-01	3	19
111	3	2013-12-01	4	19
112	5	2013-12-01	5	19
113	4	2013-12-01	6	19
114	5	2013-12-01	7	19
115	5	2013-12-01	2	20
116	5	2013-12-01	3	20
117	3	2013-12-01	4	20
118	5	2013-12-01	5	20
119	4	2013-12-01	6	20
120	5	2013-12-01	7	20
121	5	2013-12-01	2	21
122	5	2013-12-01	3	21
123	3	2013-12-01	4	21
124	5	2013-12-01	5	21
125	4	2013-12-01	6	21
126	5	2013-12-01	7	21
127	5	2013-12-01	2	22
128	5	2013-12-01	3	22
129	3	2013-12-01	4	22
130	5	2013-12-01	5	22
131	4	2013-12-01	6	22
132	5	2013-12-01	7	22
133	5	2013-12-01	2	23
134	5	2013-12-01	3	23
135	3	2013-12-01	4	23
136	5	2013-12-01	5	23
137	4	2013-12-01	6	23
138	5	2013-12-01	7	23
139	5	2013-12-01	2	24
140	5	2013-12-01	3	24
141	3	2013-12-01	4	24
142	5	2013-12-01	5	24
143	4	2013-12-01	6	24
144	5	2013-12-01	7	24
145	5	2013-12-01	2	25
146	5	2013-12-01	3	25
147	3	2013-12-01	4	25
148	5	2013-12-01	5	25
149	4	2013-12-01	6	25
150	5	2013-12-01	7	25
\.


--
-- Name: rating_attractions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rating_attractions_id_seq', 150, true);


--
-- Data for Name: rating_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rating_events (id, rating, evaluationdate, mobile_user_id, event_id) FROM stdin;
1	2	2013-12-01	2	1
2	2	2013-12-01	3	1
3	3	2013-12-01	4	1
4	4	2013-12-01	5	1
5	3	2013-12-01	6	1
6	4	2013-12-01	7	1
7	4	2013-12-01	3	2
8	4	2013-12-01	4	2
\.


--
-- Name: rating_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rating_events_id_seq', 8, true);


--
-- Data for Name: rating_itineraries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rating_itineraries (id, rating, evaluationdate, itinerary_id, mobile_user_id) FROM stdin;
1	4	2013-12-01	1	2
2	5	2013-12-01	1	3
3	4	2013-12-01	1	4
4	5	2013-12-01	1	5
5	5	2013-12-01	1	6
6	5	2013-12-01	1	7
7	4	2013-12-01	2	2
8	4	2013-12-01	2	4
9	5	2013-12-01	2	5
10	5	2013-12-01	2	7
11	4	2013-12-01	3	2
12	5	2013-12-01	3	3
13	4	2013-12-01	3	4
14	5	2013-12-01	3	6
15	5	2013-12-01	3	7
\.


--
-- Name: rating_itineraries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rating_itineraries_id_seq', 15, true);


--
-- Data for Name: rating_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rating_services (id, rating, evaluationdate, mobile_user_id, service_id) FROM stdin;
1	4	2013-12-01	3	1
2	4	2013-12-01	4	1
3	4	2013-12-01	5	1
4	4	2013-12-01	6	1
5	5	2013-12-01	7	1
6	4	2013-12-01	2	1
7	5	2013-12-01	3	2
8	5	2013-12-01	4	2
9	5	2013-12-01	5	2
10	5	2013-12-01	6	2
11	5	2013-12-01	7	2
12	4	2013-12-01	2	2
13	3	2013-12-01	3	3
14	3	2013-12-01	4	3
15	3	2013-12-01	5	3
16	3	2013-12-01	6	3
17	3	2013-12-01	7	3
18	4	2013-12-01	2	3
19	5	2013-12-01	3	4
20	4	2013-12-01	4	4
21	5	2013-12-01	5	4
22	5	2013-12-01	6	4
23	5	2013-12-01	7	4
24	4	2013-12-01	2	4
25	2	2013-12-01	3	5
26	2	2013-12-01	4	5
27	2	2013-12-01	5	5
28	2	2013-12-01	6	5
29	3	2013-12-01	7	5
30	4	2013-12-01	2	5
31	4	2013-12-01	3	6
32	4	2013-12-01	4	6
33	2	2013-12-01	5	6
34	2	2013-12-01	6	6
35	2	2013-12-01	7	6
36	4	2013-12-01	2	6
37	4	2013-12-01	3	7
38	4	2013-12-01	4	7
39	4	2013-12-01	5	7
40	4	2013-12-01	6	7
41	5	2013-12-01	7	7
42	4	2013-12-01	2	7
43	5	2013-12-01	3	8
44	5	2013-12-01	4	8
45	5	2013-12-01	5	8
46	3	2013-12-01	6	8
47	5	2013-12-01	7	8
48	4	2013-12-01	2	8
49	3	2013-12-01	3	9
50	4	2013-12-01	4	9
51	3	2013-12-01	5	9
52	5	2013-12-01	6	9
53	3	2013-12-01	7	9
54	4	2013-12-01	2	9
55	5	2013-12-01	3	10
56	5	2013-12-01	4	10
57	3	2013-12-01	5	10
58	3	2013-12-01	6	10
59	3	2013-12-01	7	10
60	4	2013-12-01	2	10
61	5	2013-12-01	3	11
62	5	2013-12-01	4	11
63	4	2013-12-01	5	11
64	4	2013-12-01	6	11
65	3	2013-12-01	7	11
66	3	2013-12-01	2	11
67	2	2013-12-01	3	12
68	2	2013-12-01	4	12
69	3	2013-12-01	5	12
70	4	2013-12-01	6	12
71	4	2013-12-01	7	12
72	4	2013-12-01	2	12
73	2	2013-12-01	3	13
74	4	2013-12-01	4	13
75	5	2013-12-01	5	13
76	5	2013-12-01	6	13
77	5	2013-12-01	7	13
78	4	2013-12-01	2	13
79	1	2013-12-01	3	14
80	3	2013-12-01	4	14
81	3	2013-12-01	5	14
82	3	2013-12-01	6	14
83	2	2013-12-01	7	14
84	4	2013-12-01	2	14
85	1	2013-12-01	3	15
86	2	2013-12-01	4	15
87	2	2013-12-01	5	15
88	2	2013-12-01	6	15
89	3	2013-12-01	7	15
90	3	2013-12-01	2	15
91	3	2013-12-01	3	16
92	2	2013-12-01	4	16
93	3	2013-12-01	5	16
94	4	2013-12-01	6	16
95	5	2013-12-01	7	16
96	4	2013-12-01	2	16
97	4	2013-12-01	3	17
98	4	2013-12-01	4	17
99	3	2013-12-01	5	17
100	5	2013-12-01	6	17
101	3	2013-12-01	7	17
102	4	2013-12-01	2	17
103	5	2013-12-01	3	18
104	4	2013-12-01	4	18
105	5	2013-12-01	5	18
106	4	2013-12-01	6	18
107	5	2013-12-01	7	18
108	4	2013-12-01	2	18
109	2	2013-12-01	3	19
110	2	2013-12-01	4	19
111	2	2013-12-01	5	19
112	1	2013-12-01	6	19
113	1	2013-12-01	7	19
114	4	2013-12-01	2	19
115	2	2013-12-01	3	20
116	4	2013-12-01	4	20
117	5	2013-12-01	5	20
118	1	2013-12-01	6	20
119	5	2013-12-01	7	20
120	4	2013-12-01	2	20
121	5	2013-12-01	3	21
122	4	2013-12-01	4	21
123	5	2013-12-01	5	21
124	3	2013-12-01	6	21
125	3	2013-12-01	7	21
126	4	2013-12-01	2	21
127	3	2013-12-01	3	22
128	4	2013-12-01	4	22
129	5	2013-12-01	5	22
130	3	2013-12-01	6	22
131	5	2013-12-01	7	22
132	4	2013-12-01	2	22
133	2	2013-12-01	3	23
134	4	2013-12-01	4	23
135	5	2013-12-01	5	23
136	3	2013-12-01	6	23
137	5	2013-12-01	7	23
138	4	2013-12-01	2	23
139	3	2013-12-01	3	24
140	4	2013-12-01	4	24
141	5	2013-12-01	5	24
142	2	2013-12-01	6	24
143	5	2013-12-01	7	24
144	4	2013-12-01	2	24
145	3	2013-12-01	3	25
146	4	2013-12-01	4	25
147	5	2013-12-01	5	25
148	2	2013-12-01	6	25
149	3	2013-12-01	7	25
150	4	2013-12-01	2	25
151	5	2013-12-01	3	26
152	4	2013-12-01	4	26
153	4	2013-12-01	5	26
154	3	2013-12-01	6	26
155	4	2013-12-01	7	26
156	4	2013-12-01	2	26
157	5	2013-12-01	3	27
158	3	2013-12-01	4	27
159	3	2013-12-01	5	27
160	3	2013-12-01	6	27
161	3	2013-12-01	7	27
162	4	2013-12-01	2	27
\.


--
-- Name: rating_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rating_services_id_seq', 162, true);


--
-- Data for Name: service_translations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY service_translations (id, name, schedule, description, transport, service_id, language_id) FROM stdin;
1	Polícia de Segurança Pública	\N	A Polícia de Segurança Pública, designada por PSP, é uma força de segurança, uniformizada e armada, com natureza de serviço público e dotada de autonomia administrativa. A PSP tem por missão assegurar a legalidade democrática, garantir a segurança interna e os direitos dos cidadãos, nos termos da Constituição e da lei.	\N	1	1
2	Polícia de Segurança Pública	\N	\N	\N	1	2
3	Polícia de Segurança Pública	\N	\N	\N	1	4
4	Polícia de Segurança Pública	\N	\N	\N	1	5
5	Polícia de Segurança Pública	\N	La police de sécurité publique, connue sous le nom de PSP, est une force de sécurité, en uniforme et armé, avec la nature de service public et doté d'autonomie administrative. La PSP est chargé de veiller à la légalité démocratique, assurer la sécurité intérieure et les droits des citoyens en vertu de la Constitution et la loi.	\N	1	3
6	TaxiBraga	\N	A TaxiBraga foi fundada em Junho de 1982, exercendo a sua actividade de transporte de passageiros em táxi há mais de 20 anos, tendo alterado a sua natureza jurídica para sociedade limitada por quotas e a sua denominação para Taxibraga II, Lda em 2008.Estamos sedeados em Braga, sendo a nossa área de actuação Braga e Vila Verde.Possuímos uma vasta experiência em transfers de Braga para aeroporto do Porto (Francisco Sá Carneiro), para o aeroporto de Lisboa (Pedras Rubras) e outros aeroportos.Efectuamos o transporte de passageiros para todo país e Europa.As nossas viaturas (Mercedes Benz Class E) estão equipadas com ar condicionado, GPS e todos os elementos de segurança activa e passiva.	\N	2	1
7	TaxiBraga	\N	\N	\N	2	2
8	TaxiBraga	\N	\N	\N	2	4
9	TaxiBraga	\N	\N	\N	2	5
10	TaxiBraga	\N	Le TaxiBraga a été fondée en Juin 1982, exercant l' activité de transport de passager dans un taxi depuis plus de 20 ans. Installé á Braga, avec notre zone d'opération sur tout Braga y compris Vila Verde. Possède une vaste expérience dans les transferts de Braga à l'aéroport de Porto (Francisco Sá Carneiro), à l'aéroport de Lisbonne  et d'autres aeroportos. Efectue le transport des passagers pour  tout le pays et Europe. Les voitures (Mercedes-Benz classe E)  sont équipées de la climatisation, GPS et tous les éléments de sécurité active et passive.	\N	2	3
11	Transportes Urbanos de Braga	\N	A empresa TUB - EM tem como objeto social a prestação do serviço de transporte urbano de passageiros no concelho de Braga.\r\nA nossa missão consiste em proporcionar um serviço com cada vez mais qualidade, alicerçado na responsabilidade ambiental, social e económica, adequando a nossa oferta à política de mobilidade definida pelo Município de Braga, respeitando as restrições orçamentais existentes, fruto do carácter social que esta atividade representa. Neste sentido, com elevado espírito de racionalidade económico-financeira, procuramos dotar a empresa das ferramentas que permitam a melhoria contínua dos processos, com especial enfoque na relação com os clientes, procurando dotar o serviço de mais comodidade, frequência e abrangência social e territorial, de forma a conseguirmos tornar o transporte coletivo cada vez mais atrativo em relação ao transporte individual, incentivando assim a transferência modal, gerando consequentemente externalidades positivas para a sociedade.	\N	3	1
12	Transportes Urbanos de Braga	\N	\N	\N	3	2
13	Transportes Urbanos de Braga	\N	\N	\N	3	4
14	Transportes Urbanos de Braga	\N	\N	\N	3	5
15	Transportes Urbanos de Braga	\N	" La société TUB - EM s' engages dans la fourniture de services de transport urbain de passagers dans la municipalité de Braga.\r\nNotre mission est de fournir un service de qualité, fondé sur la responsabilité sociale, environnementale et économique , en adaptant notre offre de mobilité défini par la municipalité et la politique de Braga, en respectant les contraintes budgétaires , et le résultat d'une nature sociale que cette activité représente. En ce sens, avec un esprit élevé de faisabilité économique et financière, nous cherchons à fournir à l'entreprise tout les outils qui permettent l'amélioration continue des processus, avec un accent particulier sur la relation avec les clients, en cherchant à fournir au service plus de commodité, la fréquence et la couverture sociale et territoriale, de façon a pouvoir devenir de plus en plus attrayant comme transports publics par rapport au transport privé, encourageant ainsi le transfert modal, générant ainsi des externalités positives pour la société . "	\N	3	3
16	Posto de Turismo	\N	A Porta de Braga é o Centro de Interpretação que a cidade disponibiliza aos seus visitantes, aqui encontra tudo o que precisa para conhecer e desfrutar do melhor que Braga tem para oferecer: informação personalizada; elementos multimédia e a projeção de filmes para planear o seu roteiro; sala multiusos para atividades e eventos; e ainda visitas acompanhadas ao Centro de Interpretação.	\N	4	1
17	Posto de Turismo	\N	\N	\N	4	2
18	Posto de Turismo	\N	\N	\N	4	4
19	Posto de Turismo	\N	\N	\N	4	5
20	Posto de Turismo	\N	La Porte de Braga est le Centre d'interprétation que la ville offre à ses visiteurs, ici vous trouverez tout ce que vous devez savoir pour profiter du meilleur que Braga a à offrir: des informations personnalisées, des éléments multimédia et projection de film pour planifier votre itinéraire; salle polyvalente pour les activités et les événements culturels et encore des visites accompagnés au Centre d'interprétation.	\N	4	3
21	Hospital de Braga	\N	Com uma estrutura arquitectónica totalmente construída de raiz, com uma área de construção de 140.000 m2, o Hospital de Braga abriu portas em Maio de 2011, com uma capacidade de internamento até 705 camas.Esta nova construção, um projecto há muito aguardado nesta região, veio substituir o antigo Hospital de São Marcos, uma estrutura com mais de 500 anos.A criação do Hospital de Braga permitiu alargar os cuidados médicos a cerca de 1.2 milhões de pessoas dos distritos de Braga e Viana do Castelo e permitiu ainda disponibilizar maiores e melhores instalações totalmente equipadas com tecnologia de primeira linha.	\N	5	1
22	Hospital de Braga	\N	\N	\N	5	2
23	Hospital de Braga	\N	\N	\N	5	4
24	Hospital de Braga	\N	\N	\N	5	5
25	Hospital de Braga	\N	Avec une structure architecturale construite entièrement à partir de zéro, avec une zone de construction de 140 000 m2, l'hôpital de Braga a ouvert ses portes en mai 2011 avec une capacité de jusqu'à 705 patients hospitalisés en internat. Cette nouvelle construction, un projet attendu depuis longtemps dans cette région, a remplacé l'ancien hôpital de São Marcos, une structure avec plus de 500 ans. La création de l'hôpital de Braga a étendu les soins de santé à environ 1,2 million de personnes dans les districts de Braga et Viana do Castelo et permis même de fournir plus et meilleurs installations entièrement équipées avec la technologie de pointe.	\N	5	3
52	Restaurante Panorâmico do Hotel do Elevador	\N	\N	\N	11	2
26	Yellow Bus	\N	Embarque numa viagem panorâmica, num autocarro de dois pisos a 4 metros de altura, percorrendo os mais belos locais da cidade de Braga, os seus miradouros, monumentos e pontos históricos.	\N	6	1
27	Yellow Bus	\N	\N	\N	6	2
28	Yellow Bus	\N	Embárcate en un viaje panorâmico, en un autobús de dos pisos y 4 metros de altura, recorrendo los lugares más hermosos de la ciudad de Braga, sus puntos de interés, miradores, monumentos y sitios históricos.	\N	6	4
29	Yellow Bus	\N	\N	\N	6	5
30	Yellow Bus	\N	Embarquez pour un voyage panoramique dans un bus à deux étages de 4 mètres de haut, à travers les plus beaux endroits de la ville de Braga, ses sites, ses monuments et ses sites historiques.	\N	6	3
31	Mercure Braga Centro	\N	Hotel Mercure Braga Centro é o seu novo hotel de 4 estrelas em Braga, situado no centro da cidade, ideal para as suas deslocações de lazer ou negócios. Os espaçosos e modernos quartos proporcionam um elevado nível de conforto. Beneficie de canais de TV por cabo, Sport TV e internet WiFi grátis. No Restaurante encontrará uma vasta sugestão de pratos. Desfrute do Bar, do fitness e da piscina exterior situados no ultimo piso. O Hotel dispõe ainda de 4 salas de reunião e parque de estacionamento.	\N	7	1
32	Mercure Braga Centro	\N	\N	\N	7	2
33	Mercure Braga Centro	\N	\N	\N	7	4
34	Mercure Braga Centro	\N	\N	\N	7	5
35	Mercure Braga Centro	\N	Mercure Hôtel Braga est votre nouvel hôtel 4 étoiles à Braga, situé dans le centre ville, idéal pour vos loisirs oú voyage d'affaires. Les chambres spacieuses et modernes offrent un haut niveau de confort. Prestation de chaînes de télévision par câble, Sport TV et une connexion WiFi gratuite. Au restaurant trouverez une large suggestion de plats. Profitez du Bar, SPA et une piscine extérieure située à l'étage supérieur. L'hôtel dispose également de 4 salles de réunion et un parking.	\N	7	3
36	Montalegrense	\N	Estamos localizados mesmo ao lado da Universidade do Minho. Os nossos clientes, são por isso mesmo maioritariamente alunos e professores da Universidade que já conhecem muito bem o serviço dedicado que prestamos. A oferta em bolos, sandes e menus rápidos é diversa. A frescura dos nossos produtos tem de estar sempre garantida, dada a grande procura que tem. Em dias de sol a nossa esplanada é transformada quase que em ponto de encontro das dezenas e centenas de estudantes que por lá passam. Estamos rodeados de juventude, de conhecimento e claro, de projectos de vida! Orgulhamo-nos em acompanhar de perto o desenvolvimento e crescimento de muitos jovens estudantes, de conhecer muitas histórias e de partilhar outras tantas. E no meio disto, o nosso serviço tem de ser do melhor todos os dias. Já são muito anos, sempre a servir bem e na convivência com o universo universitário.	\N	8	1
37	Montalegrense	\N	\N	\N	8	2
38	Montalegrense	\N	Estamos situados justo al lado de la Universidad de Minho. Nuestros clientes son en su mayoría estudiantes y profesores de la Universidad conocedores de la dedicación y servicio que brindamos. Las oferta de tortas, bocadillos y menús rápidos son diversas. La frescura de nuestros productos siempre se debe garantizar, dada la alta demanda que tiene. En los días soleados la terraza se transforma en un lugar de encuentro de cientos de estudiantes que pasan por allí. Estamos rodeados de jóvenes, de conocimiento, y claro, de proyectos de vida! Estamos orgullosos de seguir de cerca el desarrollo y crecimiento de muchos jóvenes estudiantes, de conocer a muchas historias que compartir y muchos otros. Y en medio de todo esto, nuestro servicio tiene que ser el mejor cada día. 	\N	8	4
39	Montalegrense	\N	\N	\N	8	5
40	Montalegrense	\N	\N	\N	8	3
41	Melia Braga	Serviço de quarto 24 horas\r\nCheck-in 14h00 e Check out 12h00	O Melia Braga Hotel &amp; SPA é um moderno e sofisticado Hotel de 5 estrelas ao serviço da cidade de Braga e de toda a região.\r\nCom uma arquitectura moderna com linhas e decoração contemporâneas, conta com três pisos VIP, um jardim bar com zona social, um moderno Spa e um piso com salas para reuniões e congressos.	\N	9	1
42	Melia Braga	Room Service 24 hours\r\nCheck-in and check-out 14h00 12h00	\N	\N	9	2
43	Melia Braga	Servicio de cuartos 24 horas\r\nCheck-in 14h00 e Check out 12h00	"El Hotel &amp; Spa Meliá Braga es un hotel moderno y sofisticado de 5 estrellas que sirve la ciudad de Braga y toda la región.\r\nCon una arquitectura moderna con líneas y decoración contemporánea, VIP cuenta con tres plantas, un bar en el jardín con área social, un moderno spa y un piso con salas para reuniones y conferencias ".\r\n	\N	9	4
44	Melia Braga	\N	\N	\N	9	5
45	Melia Braga	\N	Le Melia Braga Hôtel &amp; Spa est un hôtel 5 étoiles moderne et sophistiqué au service de la ville de Braga et  de toute la région.\r\nAvec une architecture moderne avec des lignes et un décor contemporain, avec trois étages VIP, un bar de jardin avec espace social, un spa moderne et un étage avec plusieurs salles de réunions et conférences .	\N	9	3
46	DeGema Hamburgueria	Segunda a Quinta: 12h00 às 23h00\r\nSexta a Sábado: 12h00 às 0h00	A DeGema surge em 2013, na cidade de Braga, fruto de longos anos trabalho nas áreas da padaria, pastelaria e restauração. \r\nDe raiz familiar, a DeGema é criada para dar resposta a dois desafios: unir sob o mesmo conceito as empresas Confeitaria Christina e Pastelaria &amp; Padaria Ferreira Capa; e ir mais além na gama de produtos oferecidos, inovando, apostando no fabrico próprio e artesanal, e procurando ir ao encontro daqueles que são os desejos e exigências dos nossos clientes.\r\nAssim, surgem a DeGema Padaria &amp; Pastelaria, a DeGema Croissanteria Artesanal, a DeGema Hamburgueria Artesanal, e ainda a DeGema Gelataria Artesanal	\N	10	1
47	DeGema Hamburgueria	Monday to Thursday: 12h00 to 23h00\r\nFriday to Saturday: 12h00 to 00h00	\N	\N	10	2
48	DeGema Hamburgueria	Lunes a Jueves: 12h00 a 23h00\r\nSexta a Sábado: 12h00 às 0h00	"El DeGema aparece en 2013 en la ciudad de Braga, resultado de muchos años de trabajo en las áreas de panadería, pastelería y catering. \r\nDe caracter familiar, la DeGema fue diseñada para dar respuestas a dos retos: unir sobre el mismo concepto las empresas de confitería Christina y la pastelería y panadería Ferreira Capa, e ir más allá de la gama de productos ofrecidos, inovando, apostando en la fabricación propia y artesanal, buscando  satisfazer las necesidades de nuestros clientes. \r\nAsí surgen Degema Panadería y Pastelería, Croissanteria, Hamburgueria y Gelateria Artesanal	\N	10	4
49	DeGema Hamburgueria	\N	\N	\N	10	5
50	DeGema Hamburgueria	\N	\N	\N	10	3
51	Restaurante Panorâmico do Hotel do Elevador	\N	O Restaurante Panorâmico do Hotel do Elevador, complementa os serviços dos hotéis do Bom Jesus, oferecendo um amplo leque de propostas eno-gastronómicas, representativas das principais regiões do país.\r\nAcepipes variados, pratos típicos regionais e sobremesas de eleição, fazem as delícias de quem visita o restaurante.	\N	11	1
53	Restaurante Panorâmico do Hotel do Elevador	\N	\N	\N	11	4
54	Restaurante Panorâmico do Hotel do Elevador	\N	\N	\N	11	5
55	Restaurante Panorâmico do Hotel do Elevador	\N	"Le Restaurant Panoramique de l' Hôtel de l' Ascenseur complète les services des hôtels de Bom Jesus, offrant un large éventail de propositions eno-gastronomique, représentant les principales régions du pays.\r\nSpécialités variées, plats et desserts de choix typiques de la région, font le plus grand plaisir des visiteurs du restaurant  ".	\N	11	3
56	Restaurante Sale &amp; Dolce	\N	Especialidade da casa: Joelho de Porco no Forno, Pizzas em Forno de Lenha, Pastas Frescas, Bacalhau à Sale &amp; Dolce	\N	12	1
57	Restaurante Sale &amp; Dolce	\N	\N	\N	12	2
58	Restaurante Sale &amp; Dolce	\N	Especialidad de la casa: Rodilla de cerdo Horno, Horno Pizzas en Leña, pastas frescas, Bacalao Sale &amp; Dolce 	\N	12	4
59	Restaurante Sale &amp; Dolce	\N	\N	\N	12	5
60	Restaurante Sale &amp; Dolce	\N	\N	\N	12	3
61	Caldo Entornado	\N	A atmosfera acolhedora que envolve este espaço e a imensa boa disposição dos seus criadores, são o melhor cartão de visita.\r\nOs responsáveis, Nuninho e Luica, explicam que este é um projecto de dois apreciadores da boa mesa que, decidiram enveredar pelo mundo da restauração.\r\nCom um talento inato para a cozinha, revelaram que conhecem o processo de confeção de cada prato e que, o segredo de tão intensos e deliciosos sabores é sem dúvida, a aposta na qualidade dos produtos que os compõem.	\N	13	1
62	Caldo Entornado	\N	\N	\N	13	2
63	Caldo Entornado	\N	"El ambiente familiar que rodea a este espacio y la inmensa voluntad de sus creadores, son la mejor tarjeta de visita.\r\nLos responsables Nuninho y Luica, explicam que se trata de un proyecto de dos amantes de la buena mesa que decidieron sumergirse en el mundo de la restauración.\r\nCon un talento innato para la cocina, revelaron que conocen el proceso de confección de cada plato y que el secreto de sabores intensos y deliciosos, sin duda, es el enfoque en la calidad de los productos que las componen ".\r\n	\N	13	4
64	Caldo Entornado	\N	\N	\N	13	5
65	Caldo Entornado	\N	L'atmosphère accueillante qui entoure cet espace et l' immense volonté de ses créateurs, sont la meilleure carte de visite.\r\nLes responsables, Nuninho et Luica, expliquent qu'il s'agit d'un projet de deux amoureux de la bonne nourriture qui ont décidés de plonger dans le monde de la restauration.\r\nAvec un talent inné pour la cuisine, ils ont révélés qu'ils savent le processus de confection de chaque plat et que le secret de saveurs si intenses et délicieuses est sans aucun doute l'accent mis sur la qualité des produits qui les composent.	\N	13	3
66	Theatro Circo	De Terça a Sexta das 10h00 às 19h00. Sábado das 13h30 às 19h00.\r\nEm dias de espectáculo encerra 30 minutos após o seu início. \r\nEm espectáculos a realizar às Segundas, Domingos e Feriados, a bilheteira abre 1h antes do espectáculo, encerrando 30 minutos após o seu início.\r\n\r\nHORÁRIO DE VERÃO 2013 (1 a 31 de Agosto)\r\nSegunda: 10h00 às 13h00 e 14h30 às 19h00\r\nTerça a Sexta: 10h00 às 19h00\r\nSábado: 13h30 às 19h00	É considerado o mais prestigiado teatro bracarense. Encontra-se classificado como Imóvel de Interesse Público desde 1983.\r\nEm 1906, um grupo de bracarenses liderado pelo então presidente da Câmara Municipal, Artur José Soares, José António Veloso e Cândido Martins idealizou o Theatro Circo. À época, a cidade possuía apenas o pequeno Teatro São Geraldo (onde hoje se encontra o edifício do Banco de Portugal), respondendo esse projeto aos anseios da cidade, que assistia a um grande desenvolvimento teatral, a exemplo do que acontecia no resto do país. Com a construção do Theatro Circo, o edifício do Teatro São Geraldo foi vendido ao Banco de Portugal, que aí construiria mais tarde a sua delegação em Braga.	\N	14	1
67	Theatro Circo	Tuesday to Friday from 10h00 to 19h00. Saturday from 13h30 to 19h00.\r\nOn performance days closes 30 minutes after the start.\r\nIn performances to be held on Mondays, Sundays and holidays, the box office opens 1 hour prior to the show, ending 30 minutes after its start.\r\n\r\nSCHEDULE OF SUMMER 2013 (1 to August 31)\r\nMonday: 10h00 to 13h00 and 14h30 to 19h00\r\nTuesday to Friday: 10h00 to 19h00\r\nSaturday: 13h30 to 19h00	\N	\N	14	2
68	Theatro Circo	De Martes a Viernes de las 10h00 a las 19h00. Sábado de las 13h30 a las 19h00.\r\nEm dias de espectáculo encerra 30 minutos após o seu início. \r\nEm espectáculos a realizar às Segundas, Domingos e Feriados, a bilheteira abre 1h antes do espectáculo, encerrando 30 minutos após o seu início.\r\n\r\nHORÁRIO DE VERÃO 2013 (1 a 31 de Agosto)\r\nSegunda: 10h00 às 13h00 e 14h30 às 19h00\r\nTerça a Sexta: 10h00 às 19h00\r\nSábado: 13h30 às 19h00	"Es considerado el más prestigioso teatro de Braga. Está catalogado como inmueble de Interés Público desde 1983.\r\nEn 1906, un grupo de Braga dirigido por el entonces alcalde Artur José Soares, José António Veloso y Cândido Martins idealizaron el Teatro Circo. En ese momento, la ciudad tenía sólo un pequeño Teatro São Geraldo (donde hoy está el edificio del Banco de Portugal), este proyecto pretendia responder a los deseos de la ciudad y acompañar el gran desarrollo teatral que tambien ocurria en otras partes del país. Con la construcción del Teatro Circo, el edificio de San Gerardo fue vendido al Banco de Portugal, que, posteriormente, construiria su delegación de Braga ".	\N	14	4
69	Theatro Circo	\N	\N	\N	14	5
70	Theatro Circo	\N	"Il est considéré comme le plus prestigieux théâtre de Braga. Il est répertorié comme un intérêt public depuis 1983.\r\nEn 1906, un groupe de Braga dirigé par le maire d'alors, José Artur Soares Veloso et José António Cândido Martins ony idealisés le Théâtre Cirque. À l'époque, la ville avait que le petit Théâtre de Saint-Gérard (où se trouve aujourd'hui le bâtiment de la Banque de Portugal), ce projet répond à la volonté de la ville qui regardait un grand développement théâtral, comme dans les autres villes. Avec la construction du Théâtre Cirque, le bâtiment du Théâtre Saint-Gérard a été vendue à la Banque du Portugal, qui, plus tard a construi sa délégation à Braga. "	\N	14	3
71	Spirito Cupcakes &amp; Coffee	Segunda a Quinta: 13h30 às 19h00\r\nSexta e Sábado: 13h30 às 19h00 e 21h00 às 00h00	A Spirito Cupcakes &amp; Coffee nasceu em Braga no verão de 2011 para oferecer uma alternativa ao café tradicional, aos bolos típicos e aos gelados industriais. Queriamos trazer a Portugal um pedaço de diferentes partes do mundo, numa viagem pelos sabores.	\N	15	1
72	Spirito Cupcakes &amp; Coffee	Monday to Thursday: 13h30 to 19h00\r\nFriday and Saturday: 13h30 to 19h00 and 21h00 to 00h00	\N	\N	15	2
73	Spirito Cupcakes &amp; Coffee	Lunes a Jueves: 13h30 a 9h00\r\nSexta e Sábado: 13h30 às 19h00 e 21h00 às 00h00	El Spirito Cupcakes &amp; Coffee nació en Braga en el verano de 2011 para ofrecer una alternativa al café tradicional, los pasteles y los helados industriales. Pretende traer a Portugal un pedazo de diferentes partes del mundo en un viaje de sabores.	\N	15	4
74	Spirito Cupcakes &amp; Coffee	\N	\N	\N	15	5
75	Spirito Cupcakes &amp; Coffee	\N	\N	\N	15	3
76	Taberna Belga	Segunda a Sábado 12:00 - 15:00 18:30 - 00:00\r\nDomingo 18:30 - 00:00	\N	\N	16	1
77	Taberna Belga	Monday to Saturday 12h00 to 15h00 and 18h30 to 00h00\r\nSunday 18h30 to 00h00\r\nDomingo 18:30 - 00:00	\N	\N	16	2
78	Taberna Belga	Lunes a Sábado 12:00 - 15:00 18:30 - 00:00\r\nDomingo 18:30 - 00:00	\N	\N	16	4
79	Taberna Belga	\N	\N	\N	16	5
80	Taberna Belga	\N	\N	\N	16	3
81	Casa das Bananas	\N	A casa das Bananas à rua do Souto, tornou-se num lugar de encontro entre bracarenses anónimos, ricos ou pobres, novos ou velhos, crentes ou agnósticos, para desejarem mutuamente votos de um bom Natal e de um feliz Ano Novo, ao som de músicas de natal e de cânticos pouco ortodoxos de linguagem futeboleira (dispensáveis nesta quadra), acompanhados pelos famosos moscatel de Setúbal, figos de ceira e bananas colombianas.	\N	17	1
82	Casa das Bananas	\N	\N	\N	17	2
83	Casa das Bananas	\N	La casa de las bananas de la calle de Souto, se convirtió en un lugar de encuentro para los anónimos, ricos o pobres, jóvenes y viejos Braga, creyentes o agnósticos, para desearse mutuamente los votos por una buena Navidad y un Feliz Año Nuevo con el sonido de canciones navideñas y villancicos poco ortodoxos en lenguaje futbolistico (prescindible en este bloque), acompañado por el famoso Moscatel de Setúbal, higos de ceira y plátanos colombianos.	\N	17	4
84	Casa das Bananas	\N	\N	\N	17	5
85	Casa das Bananas	\N	La Maison des bananes située dans la rue de Souto, est devenu un lieu de rencontre pour anonymes, riches ou pauvres, jeunes ou vieux, croyants ou agnostiques, souhaitent mutuellement les veux pour un bon Noël et une Bonne Année au son de chants de Noël, accompagné par le célèbre Moscatel de Setúbal, figues et bananes colombiennes.	\N	17	3
86	Frigideiras do Cantinho	\N	Fundada nos fins do séc. XVIII, 1796, sendo hoje o estabelecimento comercial, no género, mais antigo desta cidade.\r\nFoi criada para a confecção e comercialização das afamadas “FRIGIDEIRAS”, tendo mantido, segundo as antiquíssimas normas do séc. XVII, receita a qual constitui o segredo da sua reputação em todo o país.\r\nEsta casa é um ex-libris da cidade de Braga, é motivo de regozijo para os Bracarenses e para todos os visitantes. Em 1999 as FRIGIDEIRAS DO CANTINHO, pela sua notoriedade receberam o prémio “Os Galardões da Nossa Terra”.	\N	18	1
87	Frigideiras do Cantinho	\N	\N	\N	18	2
88	Frigideiras do Cantinho	\N	"Fundada a finales del siglo. XVIII, 1796, hoy en día es el establecimiento comercial de este género más antiguo de la ciudad.\r\nSe estableció para la fabricación y la comercialización de las famosas “FRIGIDEIRAS”, manteniendo la receta de acuerdo con las normas seculares de siglo. XVII la cual constituyo el secreto de su reputación en todo el país.\r\nEsta casa es un ex-libris de la ciudad de Braga, es motivo de celebración para los Bracarenses y para todos los visitantes. En 1999 as FRIGIDEIRAS DO CANTINHO, por su notoriedad recibio el premio " Os Galardões da Nossa Terra.	\N	18	4
89	Frigideiras do Cantinho	\N	\N	\N	18	5
90	Frigideiras do Cantinho	\N	Fondée à la fin du siècle. XVIII, 1796, est aujourd'hui, la boutique, du genre, la plus ancienne de la ville.\r\nCréé pour la fabrication et la commercialisation des célèbres "Frigideiras", et entretenu conformément aux règles du siècle XVII, et aux recettes qui constitue le secret de sa réputation à travers le pays.\r\nCette maison est un ex-libris de la ville de Braga, c' est un motif de célébration pour Braga et pour tous les visiteurs. En 1999, les FRIGIDEIRAS DO CANTINHO, par leur notoriété ont reçu le prix ''Os Galardões da Nossa Terra."	\N	18	3
91	Farmácia Silva	Segunda a Sábado: 9h00 às 22h00 \r\nDomingo: 9h00 às 20h00	Na Farmácia Silva queremos ser a sua farmácia de serviço em Braga para todas as suas necessidades. Os nossos farmacêuticos altamente qualificados oferecem aos nossos clientes o melhor serviço possível. \r\nQueremos oferecer-lhe produtos que façam sentir-se bem com a melhor relação preço/qualidade no mercado. As nossas categorias de produtos incluem calçado, cosméticos, produtos para a pele, protectores solares, fragrâncias, bem-estar sexual, vitaminas, produtos de emagrecimento e de desintoxicação, mãe e bebé, cuidados de saúde, homem, higiene pessoal e cuidados capilares.	\N	19	1
92	Farmácia Silva	Monday to Saturday: 9h00 to 22h00\r\nSaturday: 9h00 to 20h00	\N	\N	19	2
93	Farmácia Silva	Segunda a Sábado: 9h00 às 22h00 \r\nDomingo: 9h00 às 20h00	\N	\N	19	4
94	Farmácia Silva	\N	\N	\N	19	5
95	Farmácia Silva	\N	\N	\N	19	3
96	Restaurante Centurium	\N	Beneficiando de uma localização privilegiada, o restaurante Centurium situa-se num edifício do século XIX, a Casa da Legião, na zona pedonal da Avenida Central (em frente ao monumento de homenagem ao Papa João Paulo II).\r\nNo interior, os arcos e as paredes de granito, a música ambiente, o jardim privado e uma decoração suave e quente, convidam aos prazeres da gastronomia e de uma boa conversa. O Centurium promove um menú não fixo, variando de acordo com os produtos mais frescos disponíveis em cada dia. Carnes e peixes frescos preparados com criatividade e bom-gosto, sobremesas deliciosas e uma excelente carta de vinhos.	\N	20	1
97	Restaurante Centurium	\N	\N	\N	20	2
98	Restaurante Centurium	\N	"Con una ubicación privilegiada, el restaurante Centurium está ubicado en un edificio del siglo XIX llamado la Casa de la Legión, en la zona peatonal de la Avenida Central (frente al monumento en honor del Papa Juan Pablo II).\r\nEn el interior, los arcos y paredes de granito, la música ambiental, el jardín privado y una acogedora decoración convidam a los placeres de la buena comida y de una buena conversación. Centurium promueve un menú que no es fijo, variando con los productos más frescos disponibles cada día. Las carnes y pescados frescos preparados con creatividad y buen gusto, deliciosos postres y una excelente carta de vinos ".\r\n	\N	20	4
99	Restaurante Centurium	\N	\N	\N	20	5
100	Restaurante Centurium	\N	Bénéficiant d'un emplacement privilégié, le restaurant Centurium est logé dans un bâtiment du XIXe siècle, la Maison de la Légion, dans la zone piétonne de l'avenue centrale (en face du monument en l'honneur du Pape Jean-Paul II).\r\nA l'intérieur, les voûtes et les murs de granit, musique d'ambiance, jardin privé et une décoration douce, chaleureuse et accueillante aux plaisirs de la bonne nourriture et une bonne conversation. Centurium favorise un menu non-fixe, variant avec les meilleurs produits disponibles chaque jour. Viandes et poissons frais préparés avec créativité et bon goût, de délicieux desserts et une excellente carte des vins.	\N	20	3
101	Espaço 12	Terça a Quinta e Domingo: 10h00 às 00h00 \r\nSextas: 10h00 às 15h00 e 19h00 às 00h00	O Restaurante Espaço 12 é um espaço simpático e acolhedor. Propõe-lhe uma ementa recheada de deliciosos pratos de Cozinha Regional Portuguesa confeccionados por profissionais especializados e com longa experiência. \r\nDesfrute também de musica ao vivo e Karaoke aos fins-de-semana.	\N	21	1
102	Espaço 12	Tuesday to Thursday and Sunday: 10h00 to 00h00\r\nFridays: 10h00 to 15h00 and 19h00 to 00h00	\N	\N	21	2
103	Espaço 12	Martes a Jueves y Domingo: 10h00 a las 00h00 \r\nSextas: 10h00 às 15h00 e 19h00 às 00h00	"El restaurant espácio 12 es un espacio simpático y acogedor. Ofrece un menú lleno de deliciosos platos de cocina portuguesa preparada por profesionales capacitados con años de experiencia. \r\nTambién podrá disfrutar de música en vivo y karaoke los fines de semana ".\r\n	\N	21	4
104	Espaço 12	\N	\N	\N	21	5
105	Espaço 12	\N	\N	\N	21	3
106	Hotel Estação	Check-in das 13h00 às 16h00\r\nCheck-out das 11h30 às 12h00	O Hotel da Estação situa-se em frente à Estação Ferroviária de Braga.Oferece recepção 24 horas e acesso Wi-Fi público e gratuito.\r\nOs quartos do Estação são luminosos e apresentam mobiliário simples. Todos os quartos estão equipados com ar condicionado, casa de banho privada e televisão com canais por satélite. Dispõe de serviço de quartos.	\N	22	1
107	Hotel Estação	Check-in from 13h00 to 16h00\r\nCheck-out from 11h30 to 12h00	\N	\N	22	2
108	Hotel Estação	Check-in de las 13h00 a las 16h00\r\nCheck-out das 11h30 às 12h00	Servicio de cuartos 24 horas\r\nCheck-in 14h00 e Check out 12h00	\N	22	4
109	Hotel Estação	\N	\N	\N	22	5
110	Hotel Estação	\N	"L' Hôtel de la Station est situé en face de la gare ferroviaire de Braga. Il offre 24 heures de réception et d'une connexion Wi-Fi public et gratuite.\r\nLes chambres de l' hôtel station sont lumineuses et disposent d'un mobilier simple. Toutes les chambres sont équipées d'air climatisée, salle de bains privative et d'une télévision avec chaînes satellite. Il propose aussi un service de chambre. "	\N	22	3
111	B.A. Braga	\N	Espaço académico na cidade de Braga, este bar é frequentado por toda a comunidade universitária, incluindo, alunos, professores e empregados de qualquer das universidades.	\N	23	1
112	B.A. Braga	\N	\N	\N	23	2
113	B.A. Braga	\N	"Situado en el centro de la ciudad, al lado del mercado de Carandá esse espácio fue creado con la filosofía de ser café-bar-discoteca en los 1990.\r\n20 años de fiesta, diversión y alegría - celebraciones, conmemoraciones, encuentros y desencuentros ... amigos, cenas de empresa, reuniones, despedidas de soltera navidad, cumpleaños ... las noches de verano junto a la piscina "\r\n	\N	23	4
114	B.A. Braga	\N	\N	\N	23	5
115	B.A. Braga	\N	Espace académique dans la ville de Braga, ce bar est fréquenté par toutes la communauté universitaire, y compris les étudiants, les enseignants et les employés de l'une des universités.	\N	23	3
116	Farmácia Central	Segunda a Sexta: 9h00 às 13h00 e 15h00 às 19h30 \r\nSábado: 9h00 às 13h00	A Farmácia Central Braga distingue-se pela competência técnica dos seus profissionais, os quais têm formação específica para melhor o servir, pela simpatia e boa disposição para com todos os seus utentes e por todos os serviços que presta junto da comunidade.\r\nQueremos ser a sua farmácia de serviço para todas as suas necessidades. Os nossos farmacêuticos e conselheiros de beleza altamente qualificados oferecem aos nossos clientes o melhor serviço possível. Queremos oferecer-lhe produtos que façam sentir-se bem com a melhor relação preço/qualidade no mercado.	\N	24	1
117	Farmácia Central	Monday to Friday: 9:00 to 13:00 and 15:00 to 19:30\r\nSaturday: 9h00 to 13h00	\N	\N	24	2
118	Farmácia Central	Segunda a Sexta: 9h00 às 13h00 e 15h00 às 19h30 \r\nSábado: 9h00 às 13h00	\N	\N	24	4
119	Farmácia Central	\N	\N	\N	24	5
120	Farmácia Central	\N	\N	\N	24	3
121	Hotéis Ibis	\N	Mais de 900 hotéis no mundo, oferecendo todos os serviços dos hotéis modernos, a preços económicos.\r\nCom mais de 900 hotéis em 40 países, a ibis oferece uma qualidade constante de alojamento e serviços em todos os seus hotéis e sempre com a melhor relação qualidade/preço/serviço: um quarto totalmente equipado, a garantia de um serviço disponível 24 horas por dia e 7 dias por semana e uma grande variedade de serviços de restauração.\r\nA qualidade da oferta Ibis é reconhecida pela certificação internacional ISO 9001 desde 1997.  A cadeia é também a primeira no mundo a dar provas do seu compromisso para com o ambiente, ao obter a certificação ISO 14001, já conseguida por quase um terço dos seus hotéis.	\N	25	1
122	Hotéis Ibis	\N	\N	\N	25	2
123	Hotéis Ibis	\N	"Más de 900 hoteles en el mundo, que ofrecen todos los servicios de la hotelería moderna a precios asequibles. \r\nCon más de 900 hoteles en 40 países, ibis ofrece alojamiento de calidad consistente y servicios en todos sus hoteles y siempre con la mejor calidad / precio / servicio: una habitación totalmente equipada, lo que garantiza un servicio disponible las 24 horas día y 7 días a la semana y una gran variedad de servicios de catering. \r\nLa calidad de la oferta Ibis es reconocida por la certificación internacional ISO 9001 desde 1997. La cadena también es la primera en el mundo para demostrar su compromiso con el medio ambiente, para obtener la certificación ISO 14001 ya alcanzado casi un tercio de sus hoteles ".\r\n	\N	25	4
124	Hotéis Ibis	\N	\N	\N	25	5
125	Hotéis Ibis	\N	\N	\N	25	3
126	Farmácia Pipa	Segunda a Sábado: 9h00 às 22h00 \r\nDomingo: 9h00 às 20h00	A Farmácia Pipa, foi inaugurada à mais de 100 anos na Cidade de Braga. É uma farmácia robotizada, com atendimento personalizado e rápido.\r\nA Farmácia Pipa está em constante actualização em produtos e serviços. A Farmácia Pipa é um local onde pode encontrar para além da sua medicação, uma vasta gama de produtos dermocosméticos e outros serviços como, consultas e tratamentos de saúde e beleza.\r\nNa Farmácia Pipa todos os nossos clientes são atendidos com a máxima atenção e qualidade que merecem.	\N	26	1
127	Farmácia Pipa	Monday to Saturday: 9h00 to 22h00\r\nSaturday: 9h00 to 20h00	\N	\N	26	2
128	Farmácia Pipa	Segunda a Sábado: 9h00 às 22h00 \r\nDomingo: 9h00 às 20h00	\N	\N	26	4
129	Farmácia Pipa	\N	\N	\N	26	5
130	Farmácia Pipa	\N	\N	\N	26	3
131	Sardinha Biba	\N	Localizado no centro da cidade, junto ao Mercado do Carandá, espaço criado com uma filosofia de café-bar-discoteca no ano de 1990.\r\n20 anos de festas, diversão e alegria - celebrações, comemorações, encontros e desencontros ... os amigos, os jantares de empresa, as reuniões de natal, as despedidas de solteira, os aniversários ... as noites de verão junto à piscina	\N	27	1
132	Sardinha Biba	\N	\N	\N	27	2
133	Sardinha Biba	\N	"Situado en el centro de la ciudad, al lado del mercado de Carandá esse espácio fue creado con la filosofía de ser café-bar-discoteca en los 1990.\r\n20 años de fiesta, diversión y alegría - celebraciones, conmemoraciones, encuentros y desencuentros ... amigos, cenas de empresa, reuniones, despedidas de soltera navidad, cumpleaños ... las noches de verano junto a la piscina "\r\n	\N	27	4
134	Sardinha Biba	\N	\N	\N	27	5
135	Sardinha Biba	\N	"Situé dans le centre-ville, à côté de l'espace du marché Carandá, créé avec une philosophie café-bar-boîte de nuit en 1990.\r\n20 ans de fête, de plaisir et de joie - célébrations, commémorations et encontres e rencontres ... les amis, les repas d'entreprise, les réunions de noël, les enterrement de vie de jeune fille/garçon, les anniversaires... les nuits d'été au bord de la piscine "	\N	27	3
\.


--
-- Name: service_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('service_translations_id_seq', 135, true);


--
-- Data for Name: service_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY service_types (id, service_id, type_id) FROM stdin;
1	1	10
2	2	8
3	2	10
4	3	8
5	3	10
6	4	10
7	5	10
8	6	8
9	6	6
10	7	9
11	8	3
12	9	2
13	10	3
14	11	9
15	12	3
16	13	3
17	14	6
18	15	3
19	16	3
20	17	11
21	17	3
22	18	11
23	18	3
24	19	10
25	20	3
26	21	3
27	22	2
28	23	4
29	24	10
30	25	2
31	26	10
32	27	4
\.


--
-- Name: service_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('service_types_id_seq', 32, true);


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY services (id, site, email, address, phone, latitude, longitude, source, active, "timestamp", reference_point, capacity, details, rating, accessibility, web_user_id, city_id) FROM stdin;
1	http://www.psp.pt/	contacto@psp.pt	Rua dos Falcões 4700-316 Braga	253 200 420	41.5543251	-8.427742	http://www.psp.pt/\r\nhttps://www.facebook.com/policiasegurancapublica	t	1390346198	f	\N	\N	4.16666651	f	1	3
2	http://www.taxibraga.pt/	geral@taxibraga.pt	Travessa Pascoal Fernandes Nº 12, 1º esq, frente 4715-396 Braga	800 96 1234	41.5455093	-8.40173244	http://www.taxibraga.pt/	t	1390346199	f	\N	\N	4.83333349	f	1	3
3	http://www.tub.pt/	geral@tub.pt	Rua Quinta de S.ta Maria - Apartado 2383\r\n4700 - 244 Braga	253 606 890	41.5399666	-8.43456364	http://www.tub.pt/	t	1390346199	f	\N	\N	3.16666675	f	1	3
4	http://www.cm-braga.pt/wps/portal/publico/!ut/p/c4/04_SB8K8xLLM9MSSzPy8xBz9CP0os_gAN0evQE8zH09TEzPnMBMTswATAwjQL8h2VAQA0cHz7w!!/	turismo@cm-braga.pt	4710-249 Braga, Portugal	253 262 550	41.5509949	-8.4225893	http://www.cm-braga.pt/wps/portal/publico/!ut/p/c4/04_SB8K8xLLM9MSSzPy8xBz9CP0os_gAN0evQE8zH09TEzPnMBMTswATAwjQL8h2VAQA0cHz7w!!/	t	1390346199	f	\N	\N	4.66666651	f	1	3
5	www.hospitaldebraga.com.pt	hbraga@hospitaldebraga.pt	Sete Fontes – São Victor 4710-243 Braga	253 027 000	41.5673065	-8.39978981	www.hospitaldebraga.com.pt	t	1390346199	f	\N	\N	2.5	f	1	3
6	www.yellowbustours.com/pt/cidades/braga/	yellowbus@carristur.pt	Avenida Central	966 923 947	41.5516281	-8.42057323	http://www.yellowbustours.com/pt/cidades/braga/	t	1390346212	f	\N	\N	3	f	1	3
7	www.mercure.com/pt/hotel-8308-mercure-braga-centro/index.shtml	h8308@accor.com	Praceta João XXI\r\n4715-036 - BRAGA	253 206 000	41.5464249	-8.41982174	http://www.mercure.com/pt/hotel-8308-mercure-braga-centro/index.shtml	t	1390346212	f	\N	\N	4.16666651	f	1	3
8	www.montalegrense.pt/	\N	R. Nova Santa Cruz, S. Victor, Braga	253 676 306	41.5638313	-8.3997879	http://www.montalegrense.pt/\r\nhttps://www.facebook.com/montalegrense	t	1390346212	f	\N	\N	4.5	f	1	3
9	www.meliabraga.com/	melia.braga@meliaportugal.com	Avenida General Carrilho da Silva Pinto 8\r\n4715-380 Tenões, Braga	253 144 000	41.5566368	-8.39563942	http://www.meliabraga.com/	t	1390346212	f	\N	\N	3.66666675	f	1	3
10	www.facebook.com/DeGemaHamburgueria	degema@marceloaraujo.com	Rua Dr. Justino da Cruz, 4700-314 Braga	253 687 262	41.5517883	-8.42550945	https://www.facebook.com/DeGemaHamburgueria	t	1390346212	f	\N	\N	3.83333325	f	1	3
11	www.hoteisbomjesus.pt/_restaurante_panoramico	elevador@hoteisbomjesus.pt	Bom Jesus do Monte	253 603 400	41.332016	-8.22390556	http://www.hoteisbomjesus.pt/_restaurante_panoramico	t	1390346212	f	\N	\N	4	f	1	3
12	www.facebook.com/sale.dolce.127	sale.dolce@gmail.com	Rua São Paulo 1-r/c, Braga\r\n4700-042 BRAGA	253 262 603	41.5483437	-8.42751694	http://www.pai.pt/restaurante-sale-dolce-cividade-4700-042/4/	t	1390346213	f	\N	\N	3.16666675	f	1	3
13	www.caldoentornado.com	geral@caldoentornado.com	R. S. João, 8 r/c\r\n4700-325 Braga	253 065 578	41.5503922	-8.42621708	http://www.caldoentornado.com/	t	1390346213	f	\N	\N	4.16666651	f	1	3
14	www.theatrocirco.com/	theatrocirco@theatrocirco.com	Av. da Liberdade, 697 - 4710-251 Braga	253 203 800	41.5499725	-8.42265511	http://www.theatrocirco.com/\r\nhttp://pt.wikipedia.org/wiki/Theatro_Circo	t	1390346213	f	\N	\N	2.66666675	f	1	3
15	www.spiritocupcakes.com/	\N	Largo de São João do Souto 19, 4700-326 Braga	253 268 374	41.5506973	-8.42462921	http://www.spiritocupcakes.com/	t	1390346213	f	\N	\N	2.16666675	f	1	3
16	www.facebook.com/tabernabelga , tabernabelga.wix.com/home	\N	Rua Cónego Luciano Afonso dos Santos loja 1A, S. Vicente, 4700-371 Braga	253 625 098	41.5636063	-8.42025089	"http://tabernabelga.wix.com/home\r\nhttps://www.facebook.com/tabernabelga"	t	1390346213	f	\N	\N	3.5	f	1	3
17	www.facebook.com/pages/Casa-das-Bananas/170469223034211	casadasbananas@hotmail.com	Rua do Souto, nº26, 4700-329 Braga	253 262 681	41.5510635	-8.4249506	http://bracarangustia.blogspot.pt/2007/12/natal-em-braga-moscatel-de-setbal.html\r\nhttps://www.facebook.com/pages/Casa-das-Bananas	t	1390346213	f	\N	\N	3.83333325	f	1	3
18	frigideirasdocantinho.pt/pt	\N	Largo São João Souto 1\r\n4700-326 BRAGA	253 141 065	41.5504723	-8.42525101	http://frigideirasdocantinho.pt/pt	t	1390346213	f	\N	\N	4.5	f	1	3
19	www.farmaciasilvabraga.pt	\N	Largo Senhora-a-Branca 27  4710-443 BRAGA	253 262 571	41.5520897	-8.41673183	http://farmaciasilvabraga.pt/	t	1390346214	f	\N	\N	2	f	1	3
20	centurium.bracaraaugusta.com/index.php	centurium@bracaraaugusta.com	Avenida Central, 134\r\n4710-229	253 206 260	41.5515938	-8.41980076	http://centurium.bracaraaugusta.com/	t	1390346214	f	\N	\N	3.5	f	1	3
21	espaco12.pt/pt	\N	Rua Fábrica 12 \r\n4715-027 BRAGA \r\n( São Victor )	253 252 838	41.5548477	-8.4054966	\N	t	1390346214	f	\N	\N	4	f	1	3
22	www.hotelbragaestacao.com/	hoteldaestacao@htilthotels.com	Largo da estação, 13\r\n4700-223 Braga	253 218 381	41.5488815	-8.43447781	http://www.hotelbragaestacao.com/	t	1390346214	f	\N	\N	4	f	1	3
23	www.aaum.pt/	ba@pedrobandeiraconvida.com	Rua D Pedro V, 4715-402 Braga	\N	41.5673447	-8.38521099	https://www.facebook.com/ba.braga.5\r\nhttp://bragabynight.com/bares/item/ba-bar	t	1390346214	f	\N	\N	3.83333325	f	1	3
24	farmaciacentralbraga.pt/	\N	Rua Capelistas 34  4700-307 BRAGA	253 262 755	41.5518837	-8.42486382	http://farmaciacentralbraga.pt/	t	1390346214	f	\N	\N	3.83333325	f	1	3
25	www.accorhotels.com/pt/hotel-1802-ibis-braga-centro/index.shtml	\N	Rua do Carmo 38\r\n4700-309 BRAGA\r\nPORTUGAL 	\N	41.5529861	-8.42595577	http://www.accorhotels.com/pt/hotel-1802-ibis-braga-centro/index.shtml	t	1390346215	f	\N	\N	3.5	f	1	3
26	www.farmaciapipa.pai.pt	\N	Avenida Dom João II 394 Lamaçães \r\n4715-275 BRAGA	253 262 457	41.5459251	-8.3985424	http://img.pai.pt/mysite/media/59/17/2/69799d77-32f3-4822-af42-f281030e7670_LARGE.png	t	1390346215	f	\N	\N	4	f	1	3
27	sardinhabiba.com/	sardinhabiba@pedrobandeiraconvida.com	Praça Dr. Cândido da Costa Pires\r\n4715-402 Braga	253 260 158	41.5454216	-8.41540337	http://sardinhabiba.com/\r\nhttps://www.facebook.com/Discoteca.Sardinha.Biba	t	1390346215	f	\N	\N	3.5	f	1	3
\.


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('services_id_seq', 27, true);


--
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY types (id, name, description) FROM stdin;
1	Ar livre	\N
2	Hotel	\N
3	Gastronomia	\N
4	Nightlife	\N
5	Actividades	\N
6	Divertimento	\N
7	Artesanato	\N
8	Transporte	\N
9	Acessibilidade	\N
10	Contacto Util	\N
11	Tradicional	\N
12	Anuncio	\N
\.


--
-- Name: types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('types_id_seq', 12, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, email, username, encrypted_password, typ, serviceid, language_id, country_id, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, failed_attempts, unlock_token, locked_at, uid, provider) FROM stdin;
1	turismo@cm-braga.pt	Turismo Braga	$2a$10$c5Q1Hkxg7AXCU0I1SP/r1.p0DY./vjH7n6gd9WmVw7dxURrXBlc86	\N	\N	1	188	\N	\N	\N	1	2014-01-21	2014-01-21	172.19.100.36	172.19.100.36	\N	\N	\N	\N	\N	\N	\N	\N	\N
2	lx2n0xj@gmail.com	x2n0x	password	F                                                                                                                                                                                                                                                              	\N	1	188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3	rivfaria@gmail.com	rivfaria	password	G                                                                                                                                                                                                                                                              	\N	1	188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4	postgres@gmail.com	jprophet	password	F                                                                                                                                                                                                                                                              	\N	1	188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	7jpinheiro@gmail.com	jpinheiro	password	C                                                                                                                                                                                                                                                              	\N	1	188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	catarina.sofia2@gmail.com	cat	password	C                                                                                                                                                                                                                                                              	\N	1	188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7	flavirrl@gmail.com	flavirrl	password	F                                                                                                                                                                                                                                                              	\N	1	188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8	cityroots@gmail.com	Admin	$2a$10$t.6ntyUtryw9/OsRYWsCduk2EXZnNtlkoEB0EorEnVL4Wio0HNl7m	\N	\N	1	188	\N	\N	\N	2	2014-01-21	2014-01-21	127.0.0.1	172.19.100.36	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 8, true);


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
1	Entidade	Entidades de turismo ou departamentos de turismo da câmara responsáveis por contribuir com conteudo certificado.
2	Comércio	Restaurantes, Bares, Discotecas, Pastelarias, Cafés, Pronto-a-Vestir
3	Admin	Administração
\.


--
-- Name: web_user_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('web_user_types_id_seq', 3, true);


--
-- Data for Name: web_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY web_users (id, name, enterprisename, nif, address, active, web_user_type_id, city_id) FROM stdin;
1	Turismo Braga	\N	506901173	Av. da Liberdade, 1 4710-305 Braga	t	1	3
8	Cityroots	\N	000000000	Universidade do Minho	f	3	3
\.


--
-- Name: attraction_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY attraction_translations
    ADD CONSTRAINT attraction_translations_pkey PRIMARY KEY (id);


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
-- Name: event_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY event_translations
    ADD CONSTRAINT event_translations_pkey PRIMARY KEY (id);


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
-- Name: service_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY service_translations
    ADD CONSTRAINT service_translations_pkey PRIMARY KEY (id);


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
-- Name: types_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY types
    ADD CONSTRAINT types_name_key UNIQUE (name);


--
-- Name: types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY types
    ADD CONSTRAINT types_pkey PRIMARY KEY (id);


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
-- Name: update_rating_attractions; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_rating_attractions AFTER INSERT OR UPDATE ON rating_attractions FOR EACH ROW EXECUTE PROCEDURE update_rating_attractions();


--
-- Name: update_rating_events; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_rating_events AFTER INSERT OR UPDATE ON rating_events FOR EACH ROW EXECUTE PROCEDURE update_rating_events();


--
-- Name: update_rating_itineraries; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_rating_itineraries AFTER INSERT OR UPDATE ON rating_itineraries FOR EACH ROW EXECUTE PROCEDURE update_rating_itineraries();


--
-- Name: update_rating_services; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_rating_services AFTER INSERT OR UPDATE ON rating_services FOR EACH ROW EXECUTE PROCEDURE update_rating_services();


--
-- Name: fkattraction245499; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attraction_translations
    ADD CONSTRAINT fkattraction245499 FOREIGN KEY (attraction_id) REFERENCES attractions(id);


--
-- Name: fkattraction335552; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attraction_types
    ADD CONSTRAINT fkattraction335552 FOREIGN KEY (type_id) REFERENCES types(id);


--
-- Name: fkattraction355171; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attractions
    ADD CONSTRAINT fkattraction355171 FOREIGN KEY (web_user_id) REFERENCES web_users(id);


--
-- Name: fkattraction698167; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attractions
    ADD CONSTRAINT fkattraction698167 FOREIGN KEY (city_id) REFERENCES cities(id);


--
-- Name: fkattraction761380; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attraction_translations
    ADD CONSTRAINT fkattraction761380 FOREIGN KEY (language_id) REFERENCES languages(id);


--
-- Name: fkattraction943262; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attraction_types
    ADD CONSTRAINT fkattraction943262 FOREIGN KEY (attraction_id) REFERENCES attractions(id);


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
-- Name: fkevent_tran154688; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY event_translations
    ADD CONSTRAINT fkevent_tran154688 FOREIGN KEY (event_id) REFERENCES events(id);


--
-- Name: fkevent_tran461936; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY event_translations
    ADD CONSTRAINT fkevent_tran461936 FOREIGN KEY (language_id) REFERENCES languages(id);


--
-- Name: fkevent_type299018; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY event_types
    ADD CONSTRAINT fkevent_type299018 FOREIGN KEY (event_id) REFERENCES events(id);


--
-- Name: fkevent_type334331; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY event_types
    ADD CONSTRAINT fkevent_type334331 FOREIGN KEY (type_id) REFERENCES types(id);


--
-- Name: fkevents39646; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events
    ADD CONSTRAINT fkevents39646 FOREIGN KEY (city_id) REFERENCES cities(id);


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
-- Name: fkservice_tr82390; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY service_translations
    ADD CONSTRAINT fkservice_tr82390 FOREIGN KEY (service_id) REFERENCES services(id);


--
-- Name: fkservice_tr853638; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY service_translations
    ADD CONSTRAINT fkservice_tr853638 FOREIGN KEY (language_id) REFERENCES languages(id);


--
-- Name: fkservice_ty368105; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY service_types
    ADD CONSTRAINT fkservice_ty368105 FOREIGN KEY (type_id) REFERENCES types(id);


--
-- Name: fkservice_ty910982; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY service_types
    ADD CONSTRAINT fkservice_ty910982 FOREIGN KEY (service_id) REFERENCES services(id);


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

