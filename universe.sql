--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    distance_from_earth numeric(10,2),
    age_in_millions_of_yaers integer,
    galaxy_types integer
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
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    distance_from_earth numeric(10,2),
    age_in_millions_of_yaers integer,
    moon_types integer,
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    distance_from_earth numeric(10,2),
    age_in_millions_of_yaers integer,
    planet_types integer,
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    distance_from_earth numeric(10,2),
    age_in_millions_of_yaers integer,
    star_types integer,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

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
-- Name: supernova; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.supernova (
    supernova_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    distance_from_earth numeric(10,2),
    age_in_millions_of_years integer,
    supernova_types integer,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.supernova OWNER TO freecodecamp;

--
-- Name: supernova_supernova_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.supernova_supernova_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supernova_supernova_id_seq OWNER TO freecodecamp;

--
-- Name: supernova_supernova_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.supernova_supernova_id_seq OWNED BY public.supernova.supernova_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: supernova supernova_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.supernova ALTER COLUMN supernova_id SET DEFAULT nextval('public.supernova_supernova_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'galaxy1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'galaxy2', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'galaxy3', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'galaxy4', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'galaxy5', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'galaxy6', NULL, NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon1', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (2, 'moon2', NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES (3, 'moon3', NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.moon VALUES (4, 'moon4', NULL, NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (5, 'moon5', NULL, NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (6, 'moon6', NULL, NULL, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (7, 'moon7', NULL, NULL, NULL, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (8, 'moon8', NULL, NULL, NULL, NULL, NULL, NULL, 8);
INSERT INTO public.moon VALUES (9, 'moon9', NULL, NULL, NULL, NULL, NULL, NULL, 9);
INSERT INTO public.moon VALUES (10, 'moon10', NULL, NULL, NULL, NULL, NULL, NULL, 10);
INSERT INTO public.moon VALUES (11, 'moon11', NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO public.moon VALUES (12, 'moon12', NULL, NULL, NULL, NULL, NULL, NULL, 12);
INSERT INTO public.moon VALUES (13, 'moon13', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (14, 'moon14', NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES (15, 'moon15', NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.moon VALUES (16, 'moon16', NULL, NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (17, 'moon17', NULL, NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (18, 'moon18', NULL, NULL, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (19, 'moon19', NULL, NULL, NULL, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (20, 'moon20', NULL, NULL, NULL, NULL, NULL, NULL, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'planet1', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (2, 'planet2', NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (3, 'planet3', NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.planet VALUES (4, 'planet4', NULL, NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.planet VALUES (5, 'planet5', NULL, NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.planet VALUES (6, 'planet6', NULL, NULL, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.planet VALUES (7, 'planet7', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (8, 'planet8', NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (9, 'planet9', NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.planet VALUES (10, 'planet10', NULL, NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.planet VALUES (11, 'planet11', NULL, NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.planet VALUES (12, 'planet12', NULL, NULL, NULL, NULL, NULL, NULL, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'star1', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (2, 'star2', NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.star VALUES (3, 'star3', NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.star VALUES (4, 'star4', NULL, NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.star VALUES (5, 'star5', NULL, NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.star VALUES (6, 'star6', NULL, NULL, NULL, NULL, NULL, NULL, 6);


--
-- Data for Name: supernova; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.supernova VALUES (1, 'supernova1', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.supernova VALUES (2, 'supernova2', NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.supernova VALUES (3, 'supernova3', NULL, NULL, NULL, NULL, NULL, NULL, 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: supernova_supernova_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.supernova_supernova_id_seq', 3, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: supernova supernova_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.supernova
    ADD CONSTRAINT supernova_name_key UNIQUE (name);


--
-- Name: supernova supernova_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.supernova
    ADD CONSTRAINT supernova_pkey PRIMARY KEY (supernova_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: supernova supernova_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.supernova
    ADD CONSTRAINT supernova_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

