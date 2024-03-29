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
    name character varying(30) NOT NULL,
    size_in_light_years numeric,
    is_bigger_than_milky_way boolean,
    life_discovered boolean
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
    moon_name character varying(40) NOT NULL,
    planet_name character varying(40),
    planet_id integer,
    discovered_year integer
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
    name character varying(30) NOT NULL,
    has_life boolean NOT NULL,
    no_of_moons integer
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
    no_of_planets integer,
    name character varying(30),
    size numeric,
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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (3, 'Andromeda', 120000, true, false);
INSERT INTO public.galaxy VALUES (2, 'Canis Major Dwarf', 5000, false, false);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 32200, false, false);
INSERT INTO public.galaxy VALUES (5, 'NGC 55', 70000, false, false);
INSERT INTO public.galaxy VALUES (6, 'Cigar Galaxy', 38000, false, false);
INSERT INTO public.galaxy VALUES (1, 'Milky-Way', 100000, false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth', 1, 1609);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Mars', 2, 1877);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Mars', 2, 1877);
INSERT INTO public.moon VALUES (4, 'Europa', 'Jupiter', 4, 1610);
INSERT INTO public.moon VALUES (5, 'Ganymede', 'Jupiter', 4, 1610);
INSERT INTO public.moon VALUES (6, 'Io', 'Jupiter', 4, 1610);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Jupiter', 4, 1610);
INSERT INTO public.moon VALUES (8, 'Amalthea', 'Jupiter', 4, 1892);
INSERT INTO public.moon VALUES (9, 'Himalia', 'Jupiter', 4, 1904);
INSERT INTO public.moon VALUES (10, 'Elara', 'Jupiter', 4, 1905);
INSERT INTO public.moon VALUES (11, 'Sinope', 'Jupiter', 4, 1914);
INSERT INTO public.moon VALUES (12, 'Titan', 'Saturn', 5, 1655);
INSERT INTO public.moon VALUES (13, 'Mimas', 'Saturn', 5, 1789);
INSERT INTO public.moon VALUES (14, 'Enceladus', 'Saturn', 5, 1789);
INSERT INTO public.moon VALUES (15, 'Tethys', 'Saturn', 5, 1684);
INSERT INTO public.moon VALUES (16, 'Phoebe', 'Saturn', 5, 1898);
INSERT INTO public.moon VALUES (17, 'Atlas', 'Saturn', 5, 1980);
INSERT INTO public.moon VALUES (18, 'Ariel', 'Uranus', 8, 1851);
INSERT INTO public.moon VALUES (19, 'Umbriel', 'Uranus', 8, 1851);
INSERT INTO public.moon VALUES (20, 'Titania', 'Uranus', 8, 1787);
INSERT INTO public.moon VALUES (21, 'Oberon', 'Uranus', 8, 1787);
INSERT INTO public.moon VALUES (22, 'Triton', 'Neptune', 9, 1846);
INSERT INTO public.moon VALUES (23, 'Nereid', 'Neptune', 9, 1949);
INSERT INTO public.moon VALUES (24, 'Thalassa', 'Neptune', 9, 1989);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Earth', true, 1);
INSERT INTO public.planet VALUES (2, 1, 'Mars', false, 2);
INSERT INTO public.planet VALUES (3, 1, 'Venus', false, 0);
INSERT INTO public.planet VALUES (4, 1, 'Jupiter', false, 95);
INSERT INTO public.planet VALUES (5, 1, 'Saturn', false, 146);
INSERT INTO public.planet VALUES (6, 4, 'Proxima Centauri b', false, 0);
INSERT INTO public.planet VALUES (7, 4, 'Proxima Centauri d', false, 0);
INSERT INTO public.planet VALUES (8, 1, 'Uranus', false, 28);
INSERT INTO public.planet VALUES (9, 1, 'Neptune', false, 16);
INSERT INTO public.planet VALUES (10, 1, 'Mercury', false, 0);
INSERT INTO public.planet VALUES (11, 1, 'Pluto', false, 1);
INSERT INTO public.planet VALUES (12, 4, 'Proxima Centauri c', false, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 8, 'Sun', 1400000, 1);
INSERT INTO public.star VALUES (2, 0, 'Betelgeuse', 1200000000, 1);
INSERT INTO public.star VALUES (3, 0, 'Mirach', 139140000, 3);
INSERT INTO public.star VALUES (4, 3, 'Proxima Centauri', 214550, 1);
INSERT INTO public.star VALUES (5, 0, 'Polaris', 45000000, 1);
INSERT INTO public.star VALUES (6, 0, 'UY Scuti', 1200000000, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- PostgreSQL database dump complete
--

