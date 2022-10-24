--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: earth; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.earth (
    earth_id integer NOT NULL,
    name character varying(50),
    type integer UNIQUE NOT NULL,
    remark text,
    in_use boolean,
    count integer NOT NULL,
    aka integer
);


ALTER TABLE public.earth OWNER TO freecodecamp;

--
-- Name: earth_earth_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.earth_earth_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.earth_earth_id_seq OWNER TO freecodecamp;

--
-- Name: earth_earth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.earth_earth_id_seq OWNED BY public.earth.earth_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50),
    type integer UNIQUE NOT NULL,
    remark text,
    in_use boolean,
    count integer NOT NULL,
    aka integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50),
    type integer UNIQUE NOT NULL,
    remark text,
    in_use boolean,
    count integer NOT NULL,
    aka integer,
    planets numeric,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: moon_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_planet_id_seq OWNER TO freecodecamp;

--
-- Name: moon_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_planet_id_seq OWNED BY public.moon.planet_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50),
    type integer UNIQUE NOT NULL,
    remark text,
    in_use boolean,
    count integer NOT NULL,
    aka integer,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_star_id_seq OWNER TO freecodecamp;

--
-- Name: planet_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_star_id_seq OWNED BY public.planet.star_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50),
    type integer UNIQUE NOT NULL,
    remark text,
    in_use boolean,
    count integer NOT NULL,
    aka integer,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_galaxy_id_seq OWNED BY public.star.galaxy_id;


--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: earth earth_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.earth ALTER COLUMN earth_id SET DEFAULT nextval('public.earth_earth_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: moon planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN planet_id SET DEFAULT nextval('public.moon_planet_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN star_id SET DEFAULT nextval('public.planet_star_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN galaxy_id SET DEFAULT nextval('public.star_galaxy_id_seq'::regclass);


--
-- Data for Name: earth; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
\echo 'Insert table earth'
INSERT INTO public.earth VALUES (1, 'Number one', 1, 'Remark one', true, 1, 2);
INSERT INTO public.earth VALUES (2, 'Number two', 2, 'Remark two', true, 3, 1);
INSERT INTO public.earth VALUES (3, 'Number three', 3, 'Remark three', false, 5, 7);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
\echo 'Insert table galaxy'
INSERT INTO public.galaxy VALUES (1, 'Number one', 1, 'Remark one', true, 1, 2);
INSERT INTO public.galaxy VALUES (2, 'Number two', 2, 'Remark two', true, 3, 1);
INSERT INTO public.galaxy VALUES (3, 'Number three', 3, 'Remark three', false, 5, 7);
INSERT INTO public.galaxy VALUES (4, 'Number four', 4, 'Remark four', true, 4, 4);
INSERT INTO public.galaxy VALUES (5, 'Number five', 5, 'Remark five', true, 5, 5);
INSERT INTO public.galaxy VALUES (6, 'Number six', 6, 'Remark six', true, 1, 2);
INSERT INTO public.galaxy VALUES (7, 'Number seven', 7, 'Remark seven', true, 3, 1);
INSERT INTO public.galaxy VALUES (8, 'Number eight', 8, 'Remark eight', false, 5, 7);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
\echo 'Insert table moon'
INSERT INTO public.moon VALUES (1, 'Number one', 1, 'Remark one', true, 1, 2);
INSERT INTO public.moon VALUES (2, 'Number two', 2, 'Remark two', true, 3, 1);
INSERT INTO public.moon VALUES (3, 'Number three', 3, 'Remark three', false, 5, 7);
INSERT INTO public.moon VALUES (4, 'Number four', 4, 'Remark four', true, 4, 4);
INSERT INTO public.moon VALUES (5, 'Number five', 5, 'Remark five', true, 5, 5);
INSERT INTO public.moon VALUES (6, 'Number six', 6, 'Remark six', true, 1, 2);
INSERT INTO public.moon VALUES (7, 'Number seven', 7, 'Remark seven', true, 3, 1);
INSERT INTO public.moon VALUES (8, 'Number eight', 8, 'Remark eight', false, 5, 7);
INSERT INTO public.moon VALUES (9, 'Number nine', 9, 'Remark nine', true, 1, 2);
INSERT INTO public.moon VALUES (10, 'Number ten', 10, 'Remark 10', true, 3, 1);
INSERT INTO public.moon VALUES (11, 'Number 11', 11, 'Remark 11', true, 1, 2);
INSERT INTO public.moon VALUES (12, 'Number 12', 12, 'Remark 12', true, 3, 1);
INSERT INTO public.moon VALUES (13, 'Number 13', 13, 'Remark 13', false, 5, 7);
INSERT INTO public.moon VALUES (14, 'Number 14', 14, 'Remark 14', true, 4, 4);
INSERT INTO public.moon VALUES (15, 'Number 15e', 15, 'Remark 15', true, 5, 5);
INSERT INTO public.moon VALUES (16, 'Number 16', 16, 'Remark 16', true, 1, 2);
INSERT INTO public.moon VALUES (17, 'Number 17', 17, 'Remark 17', true, 3, 1);
INSERT INTO public.moon VALUES (18, 'Number 18', 18, 'Remark 18', false, 5, 7);
INSERT INTO public.moon VALUES (19, 'Number 19', 19, 'Remark 19', true, 1, 2);
INSERT INTO public.moon VALUES (20, 'Number 20', 20, 'Remark 20', true, 3, 1);

--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
\echo 'Insert table planet'
INSERT INTO public.planet VALUES (1, 'Number one', 1, 'Remark one', true, 1, 2, 1);
INSERT INTO public.planet VALUES (2, 'Number two', 2, 'Remark two', true, 3, 1, 2);
INSERT INTO public.planet VALUES (3, 'Number three', 3, 'Remark three', false, 5, 7, 3);
INSERT INTO public.planet VALUES (4, 'Number four', 4, 'Remark four', true, 4, 4);
INSERT INTO public.planet VALUES (5, 'Number five', 5, 'Remark five', true, 5, 5);
INSERT INTO public.planet VALUES (6, 'Number six', 6, 'Remark six', true, 1, 2);
INSERT INTO public.planet VALUES (7, 'Number seven', 7, 'Remark seven', true, 3, 1);
INSERT INTO public.planet VALUES (8, 'Number eight', 8, 'Remark eight', false, 5, 7);
INSERT INTO public.planet VALUES (9, 'Number nine', 9, 'Remark nine', true, 1, 2);
INSERT INTO public.planet VALUES (10, 'Number ten', 10, 'Remark 10', true, 3, 1);
INSERT INTO public.planet VALUES (11, 'Number 11', 11, 'Remark 11', true, 1, 2);
INSERT INTO public.planet VALUES (12, 'Number 12', 12, 'Remark 12', true, 3, 1);

--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
\echo 'Insert table star'
INSERT INTO public.star VALUES (1, 'Number one', 1, 'Remark one', true, 1, 2, 1);
INSERT INTO public.star VALUES (2, 'Number two', 2, 'Remark two', true, 3, 1, 2);
INSERT INTO public.star VALUES (3, 'Number three', 3, 'Remark three', false, 5, 7, 3);
INSERT INTO public.star VALUES (4, 'Number four', 4, 'Remark four', true, 4, 4);
INSERT INTO public.star VALUES (5, 'Number five', 5, 'Remark five', true, 5, 5);
INSERT INTO public.star VALUES (6, 'Number six', 6, 'Remark six', true, 1, 2);

--
-- Name: earth earth_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.earth
    ADD CONSTRAINT earth_pkey PRIMARY KEY (earth_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

