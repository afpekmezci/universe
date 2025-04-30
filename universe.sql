--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    galaxy_type_id integer NOT NULL,
    name character varying(60),
    description text,
    age_in_millions_fo_years numeric(10,2),
    constrain name
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text,
    constrain name
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    has_life boolean DEFAULT false,
    distance_from_planet integer
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
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    age_in_millions_of_years numeric(6,2),
    has_life boolean DEFAULT false NOT NULL,
    description text,
    distance_from_star integer
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
    star_type_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    age_in_millions_of_years numeric(6,2),
    description text
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
-- Name: star_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_type (
    star_type_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text,
    constrain name
);


ALTER TABLE public.star_type OWNER TO freecodecamp;

--
-- Name: star_types_star_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_types_star_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_types_star_type_id_seq OWNER TO freecodecamp;

--
-- Name: star_types_star_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_types_star_type_id_seq OWNED BY public.star_type.star_type_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_types_galaxy_type_id_seq'::regclass);


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
-- Name: star_type star_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type ALTER COLUMN star_type_id SET DEFAULT nextval('public.star_types_star_type_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 3, 'Milky Way', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 1, 'LMC', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 3, 'Andromeda', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 2, 'Bodes Galaxy', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 1, 'Antennae Galaxies', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 1, 'Large Magellanic Cloud', NULL, NULL, NULL);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Elliptical galaxy', NULL, NULL);
INSERT INTO public.galaxy_type VALUES (2, 'Spiral galaxies', NULL, NULL);
INSERT INTO public.galaxy_type VALUES (3, 'Barred spiral', NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (20, 1, 'Moon1', false, NULL);
INSERT INTO public.moon VALUES (21, 1, 'Moon2', false, NULL);
INSERT INTO public.moon VALUES (22, 1, 'Moon3', false, NULL);
INSERT INTO public.moon VALUES (23, 1, 'Moon4', false, NULL);
INSERT INTO public.moon VALUES (24, 1, 'Moon5', false, NULL);
INSERT INTO public.moon VALUES (25, 1, 'Moon6', false, NULL);
INSERT INTO public.moon VALUES (26, 1, 'Moon7', false, NULL);
INSERT INTO public.moon VALUES (27, 1, 'Moon8', false, NULL);
INSERT INTO public.moon VALUES (28, 1, 'Moon9', false, NULL);
INSERT INTO public.moon VALUES (29, 2, 'Moon10', false, NULL);
INSERT INTO public.moon VALUES (30, 2, 'Moon11', false, NULL);
INSERT INTO public.moon VALUES (31, 3, 'Moon12', false, NULL);
INSERT INTO public.moon VALUES (32, 3, 'Moon13', false, NULL);
INSERT INTO public.moon VALUES (33, 3, 'Moon14', false, NULL);
INSERT INTO public.moon VALUES (34, 3, 'Moon15', false, NULL);
INSERT INTO public.moon VALUES (35, 3, 'Moon16', false, NULL);
INSERT INTO public.moon VALUES (36, 3, 'Moon17', false, NULL);
INSERT INTO public.moon VALUES (37, 3, 'Moon18', false, NULL);
INSERT INTO public.moon VALUES (38, 3, 'Moon19', false, NULL);
INSERT INTO public.moon VALUES (39, 3, 'Moon20', false, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Earth', 1.00, true, NULL, NULL);
INSERT INTO public.planet VALUES (2, 1, 'Mars', 2.00, false, NULL, NULL);
INSERT INTO public.planet VALUES (3, 1, 'Venus', 3.00, false, NULL, NULL);
INSERT INTO public.planet VALUES (4, 1, 'Jupiter', 4.00, false, NULL, NULL);
INSERT INTO public.planet VALUES (5, 1, 'Uranus', 5.00, false, NULL, NULL);
INSERT INTO public.planet VALUES (6, 1, 'Pluton', 6.00, false, NULL, NULL);
INSERT INTO public.planet VALUES (7, 1, 'Mercury', 7.00, false, NULL, NULL);
INSERT INTO public.planet VALUES (8, 1, 'Saturn', 8.00, false, NULL, NULL);
INSERT INTO public.planet VALUES (9, 1, 'Neptune', 9.00, false, NULL, NULL);
INSERT INTO public.planet VALUES (10, 2, 'U-102', 10.00, false, NULL, NULL);
INSERT INTO public.planet VALUES (11, 2, 'U-103', 11.00, false, NULL, NULL);
INSERT INTO public.planet VALUES (12, 3, 'U1020', 12.00, false, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 4, 1, 'Sun', 4.65, NULL);
INSERT INTO public.star VALUES (2, 1, 2, 'Achernar', 10.30, NULL);
INSERT INTO public.star VALUES (3, 2, 3, 'Acrux', 5.70, NULL);
INSERT INTO public.star VALUES (4, 3, 3, 'Sirius', 3.40, NULL);
INSERT INTO public.star VALUES (5, 4, 1, 'Arcturus', 5.40, NULL);
INSERT INTO public.star VALUES (6, 4, 3, 'Altair', 5.60, NULL);


--
-- Data for Name: star_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_type VALUES (1, 'White dwarf', NULL, NULL);
INSERT INTO public.star_type VALUES (2, 'Brown dwarf', NULL, NULL);
INSERT INTO public.star_type VALUES (3, 'Neutron star', NULL, NULL);
INSERT INTO public.star_type VALUES (4, 'Red dwarf', NULL, NULL);
INSERT INTO public.star_type VALUES (5, 'Red Giant', NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_type_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 39, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: star_types_star_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_types_star_type_id_seq', 5, true);


--
-- Name: galaxy galaxy_constrain_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constrain_key UNIQUE (constrain);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_types_constrain_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_types_constrain_key UNIQUE (constrain);


--
-- Name: galaxy_type galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_type_id);


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
-- Name: star_type star_types_constrain_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_types_constrain_key UNIQUE (constrain);


--
-- Name: star_type star_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_types_pkey PRIMARY KEY (star_type_id);


--
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


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
-- Name: star star_star_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_type_id_fkey FOREIGN KEY (star_type_id) REFERENCES public.star_type(star_type_id);


--
-- PostgreSQL database dump complete
--

