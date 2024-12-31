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

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'fr_FR.UTF-8' LC_CTYPE = 'fr_FR.UTF-8';


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
    name character varying(80) NOT NULL,
    light_year_diameter integer,
    stars_in_billions integer,
    redshift numeric(7,6),
    description text,
    gravity_id integer
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
-- Name: gravity; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.gravity (
    gravity_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text
);


ALTER TABLE public.gravity OWNER TO freecodecamp;

--
-- Name: gravity_gravity_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.gravity_gravity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gravity_gravity_id_seq OWNER TO freecodecamp;

--
-- Name: gravity_gravity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.gravity_gravity_id_seq OWNED BY public.gravity.gravity_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(80),
    planet_id integer NOT NULL,
    orbit character varying(50),
    origin character varying(50),
    gravity_id integer
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
    name character varying(80),
    has_life boolean,
    is_spherical boolean,
    star_id integer NOT NULL,
    gravity_id integer
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
    name character varying(80),
    galaxy_id integer NOT NULL,
    color character varying(50),
    type character varying(50),
    gravity_id integer
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
-- Name: gravity gravity_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.gravity ALTER COLUMN gravity_id SET DEFAULT nextval('public.gravity_gravity_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 100, 0.000000, 'The Milky Way is a barred spiral galaxy containing our solar system.', 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 220000, 1000, -0.001000, 'Andromeda is the largest galaxy in the Local Group and is on a collision course with the Milky Way.', 1);
INSERT INTO public.galaxy VALUES (4, 'LMC', 14000, 30, 0.000930, 'The Large Magellanic Cloud is a satellite galaxy of the Milky Way, visible from the Southern Hemisphere.', 1);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 60000, 40, 0.000600, 'A member of the Local Group, this spiral galaxy is known for its active star-forming regions, particularly the large nebula NGC 604.', 1);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 76000, 100, 0.001540, 'Famous for its well-defined spiral arms, this galaxy is interacting with its smaller companion, NGC 5195, and is a classic example of a grand-design spiral galaxy.', 1);
INSERT INTO public.galaxy VALUES (7, 'Messier 87', 120000, 200, 0.004280, 'An elliptical galaxy in the Virgo Cluster, M87 is home to a supermassive black hole famously imaged by the Event Horizon Telescope in 2019.', 1);


--
-- Data for Name: gravity; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.gravity VALUES (1, 'Galactic Gravity', 'Governs the structure and motion of stars, gas clouds, and dark matter within a galaxy.Responsible for the rotation of the galaxy and binding it together.');
INSERT INTO public.gravity VALUES (2, 'Stellar Gravity', 'Manages the internal structure and processes of stars.Responsible for the immense pressure and heat at the core, enabling nuclear fusion.');
INSERT INTO public.gravity VALUES (3, 'Planetary and Lunar Gravity', 'Operates over smaller scales compared to stellar or galactic gravity.Responsible for shaping planets and moons into spherical forms (if massive enough).Governs the orbits of moons, rings, and artificial satellites.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (18, 'Miranda', 5, 'Elliptical', 'Impact', 3);
INSERT INTO public.moon VALUES (1, 'Luna', 1, 'Elliptical', 'Impact', 3);
INSERT INTO public.moon VALUES (10, 'Phobos', 2, 'Elliptical', 'Capture', 3);
INSERT INTO public.moon VALUES (11, 'Deimos', 2, 'Elliptical', 'Capture', 3);
INSERT INTO public.moon VALUES (12, 'Triton', 6, 'Elliptical', 'Capture', 3);
INSERT INTO public.moon VALUES (22, 'Hyperion', 3, 'Elliptical', 'Capture', 3);
INSERT INTO public.moon VALUES (23, 'Himalia', 4, 'Elliptical', 'Capture', 3);
INSERT INTO public.moon VALUES (4, 'Europa', 4, 'Elliptical', 'Co-formation', 3);
INSERT INTO public.moon VALUES (5, 'Ganymede', 4, 'Elliptical', 'Co-formation', 3);
INSERT INTO public.moon VALUES (6, 'Titan', 3, 'Elliptical', 'Co-formation', 3);
INSERT INTO public.moon VALUES (7, 'Enceladus', 3, 'Elliptical', 'Co-formation', 3);
INSERT INTO public.moon VALUES (8, 'Io', 4, 'Elliptical', 'Co-formation', 3);
INSERT INTO public.moon VALUES (9, 'Callisto', 4, 'Elliptical', 'Co-formation', 3);
INSERT INTO public.moon VALUES (14, 'Rhea', 3, 'Elliptical', 'Co-formation', 3);
INSERT INTO public.moon VALUES (15, 'Tethys', 3, 'Elliptical', 'Co-formation', 3);
INSERT INTO public.moon VALUES (16, 'Dione', 3, 'Elliptical', 'Co-formation', 3);
INSERT INTO public.moon VALUES (17, 'Iapetus', 3, 'Elliptical', 'Co-formation', 3);
INSERT INTO public.moon VALUES (13, 'Charon', 7, 'Circular', 'Co-formation', 3);
INSERT INTO public.moon VALUES (19, 'Oberon', 5, 'Elliptical', 'Co-formation', 3);
INSERT INTO public.moon VALUES (20, 'Umbriel', 5, 'Elliptical', 'Co-formation', 3);
INSERT INTO public.moon VALUES (21, 'Mimas', 3, 'Elliptical', 'Co-formation', 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, true, 1, 3);
INSERT INTO public.planet VALUES (2, 'Mars', false, true, 1, 3);
INSERT INTO public.planet VALUES (3, 'Saturn', false, false, 1, 3);
INSERT INTO public.planet VALUES (4, 'Jupiter', false, true, 1, 3);
INSERT INTO public.planet VALUES (5, 'Uranus', false, true, 1, 3);
INSERT INTO public.planet VALUES (6, 'Neptune', false, true, 1, 3);
INSERT INTO public.planet VALUES (7, 'Pluto', false, true, 1, 3);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', false, true, 4, 3);
INSERT INTO public.planet VALUES (8, 'Kepler-22b', false, true, 5, 3);
INSERT INTO public.planet VALUES (10, 'Tau Ceti e', false, true, 2, 3);
INSERT INTO public.planet VALUES (11, 'Tau Ceti f', false, true, 2, 3);
INSERT INTO public.planet VALUES (12, '55 Cancri e', false, true, 3, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'White', 'G2V', 2);
INSERT INTO public.star VALUES (6, 'OGLE-2005-BLG-390L', 4, 'Red', 'M-type Dwarf', 2);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 'Red', 'M5.5Ve Dwarf', 2);
INSERT INTO public.star VALUES (2, 'Tau Ceti', 1, 'Yellowish', 'G8V', 2);
INSERT INTO public.star VALUES (3, '55 Cancri', 1, 'Yellowish', 'G8V', 2);
INSERT INTO public.star VALUES (5, 'Kepler-22', 1, 'Yellow-White', 'G5V', 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: gravity_gravity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.gravity_gravity_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: gravity gravity_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.gravity
    ADD CONSTRAINT gravity_pkey PRIMARY KEY (gravity_id);


--
-- Name: gravity gravity_type_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.gravity
    ADD CONSTRAINT gravity_type_key UNIQUE (name);


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
-- Name: galaxy galaxy_gravity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_gravity_id_fkey FOREIGN KEY (gravity_id) REFERENCES public.gravity(gravity_id);


--
-- Name: moon moon_gravity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_gravity_id_fkey FOREIGN KEY (gravity_id) REFERENCES public.gravity(gravity_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_gravity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_gravity_id_fkey FOREIGN KEY (gravity_id) REFERENCES public.gravity(gravity_id);


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
-- Name: star star_gravity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_gravity_id_fkey FOREIGN KEY (gravity_id) REFERENCES public.gravity(gravity_id);


--
-- PostgreSQL database dump complete
--

