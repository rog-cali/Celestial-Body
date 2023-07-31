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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_size integer,
    galaxy_type text,
    has_life boolean
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
    name character varying(30) NOT NULL,
    moon_size integer,
    only_moon boolean,
    planet_id integer
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
    name character varying(30) NOT NULL,
    has_life boolean,
    star_id integer,
    planet_size numeric(5,1)
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
-- Name: planet_properties; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_properties (
    name character varying(30) NOT NULL,
    avg_density integer,
    surface_gravity numeric(4,1),
    planet_id integer NOT NULL,
    planet_properties_id integer NOT NULL
);


ALTER TABLE public.planet_properties OWNER TO freecodecamp;

--
-- Name: planet_properties_planet_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_properties_planet_properties_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_properties_planet_properties_id_seq OWNER TO freecodecamp;

--
-- Name: planet_properties_planet_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_properties_planet_properties_id_seq OWNED BY public.planet_properties.planet_properties_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_type text,
    star_color character varying(30),
    galaxy_id integer
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
-- Name: planet_properties planet_properties_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_properties ALTER COLUMN planet_properties_id SET DEFAULT nextval('public.planet_properties_planet_properties_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100, 'Spiral', true);
INSERT INTO public.galaxy VALUES (2, 'Canis Majoris', 5, 'Irregular', false);
INSERT INTO public.galaxy VALUES (3, 'Segue', 400, 'Spherodial', false);
INSERT INTO public.galaxy VALUES (4, 'Sag Deg', 10, 'Spherodial', false);
INSERT INTO public.galaxy VALUES (5, 'Ursa', 24, 'Spherodial', false);
INSERT INTO public.galaxy VALUES (6, 'Draco', 3, 'Spiral', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Neso', 37, false, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 14, false, 1);
INSERT INTO public.moon VALUES (3, 'Europa', 1940, false, 1);
INSERT INTO public.moon VALUES (4, 'No Moons', 0, true, 2);
INSERT INTO public.moon VALUES (5, 'Moon', 2159, true, 3);
INSERT INTO public.moon VALUES (6, 'Phobos', 14, false, 4);
INSERT INTO public.moon VALUES (7, 'Deimos', 8, false, 4);
INSERT INTO public.moon VALUES (8, 'Lo', 2264, false, 5);
INSERT INTO public.moon VALUES (9, 'Ganymede', 3274, false, 5);
INSERT INTO public.moon VALUES (10, 'Callisto', 2995, false, 5);
INSERT INTO public.moon VALUES (11, 'Amalthea', 104, false, 5);
INSERT INTO public.moon VALUES (12, 'Titan', 3200, false, 6);
INSERT INTO public.moon VALUES (13, 'Enceladus', 313, false, 6);
INSERT INTO public.moon VALUES (14, 'Mimas', 246, false, 6);
INSERT INTO public.moon VALUES (15, 'Dione', 698, false, 6);
INSERT INTO public.moon VALUES (16, 'Titania', 978, false, 7);
INSERT INTO public.moon VALUES (17, 'Oberon', 946, false, 7);
INSERT INTO public.moon VALUES (18, 'Miranda', 293, false, 7);
INSERT INTO public.moon VALUES (19, 'Cressida', 49, false, 7);
INSERT INTO public.moon VALUES (20, 'Triton', 1682, false, 8);
INSERT INTO public.moon VALUES (21, 'Hippocamp', 11, false, 8);
INSERT INTO public.moon VALUES (22, 'Thalassa', 51, false, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 8, 22.9);
INSERT INTO public.planet VALUES (2, 'Venus', false, 8, 177.7);
INSERT INTO public.planet VALUES (3, 'Earth', true, 8, 196.9);
INSERT INTO public.planet VALUES (4, 'Mars', false, 8, 55.7);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 8, 2371.0);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 8, 1649.0);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 8, 3121.0);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 8, 3121.0);
INSERT INTO public.planet VALUES (9, 'Kepler 452B', false, 8, NULL);
INSERT INTO public.planet VALUES (10, 'Gilese 581C', false, 8, NULL);
INSERT INTO public.planet VALUES (11, 'Pegasi B', false, 8, NULL);
INSERT INTO public.planet VALUES (12, 'Pluto', false, 8, NULL);


--
-- Data for Name: planet_properties; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_properties VALUES ('Mercury', 5440, 0.4, 1, 1);
INSERT INTO public.planet_properties VALUES ('Venus', 5240, 0.9, 2, 2);
INSERT INTO public.planet_properties VALUES ('Earth', 5497, 1.0, 3, 3);
INSERT INTO public.planet_properties VALUES ('Mars', 3940, 0.4, 4, 4);
INSERT INTO public.planet_properties VALUES ('Jupiter', 1340, 2.5, 5, 5);
INSERT INTO public.planet_properties VALUES ('Saturn', 690, 1.2, 6, 6);
INSERT INTO public.planet_properties VALUES ('Uranus', 1190, 0.9, 7, 7);
INSERT INTO public.planet_properties VALUES ('Neptune', 1660, 1.2, 8, 8);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpha Centauri', 'G2-V', 'Orange', 1);
INSERT INTO public.star VALUES (2, 'Bernard Star', 'M4V', 'Red', 1);
INSERT INTO public.star VALUES (3, 'Sirius', 'A0', 'White', 2);
INSERT INTO public.star VALUES (4, 'No Star formation', 'N/A', 'N/A', 3);
INSERT INTO public.star VALUES (5, 'Kaus Australis', 'B9', 'Blue', 4);
INSERT INTO public.star VALUES (6, 'Megrez', 'A3V', 'White', 5);
INSERT INTO public.star VALUES (7, 'Dragon', 'F9V', 'Blue', 6);
INSERT INTO public.star VALUES (8, 'Sun', 'G2V', 'Orange', 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_properties_planet_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_properties_planet_properties_id_seq', 8, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


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
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: planet_properties planet_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_properties
    ADD CONSTRAINT planet_properties_pkey PRIMARY KEY (planet_properties_id);


--
-- Name: planet_properties planet_properties_planet_properties_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_properties
    ADD CONSTRAINT planet_properties_planet_properties_id_key UNIQUE (planet_properties_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_properties planet_properties_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_properties
    ADD CONSTRAINT planet_properties_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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
-- PostgreSQL database dump complete
--

