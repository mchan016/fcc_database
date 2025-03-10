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
    name character varying(40) NOT NULL,
    age integer,
    size integer,
    expansion_rate numeric(4,2),
    description text,
    still_expanding boolean,
    has_black_hole boolean
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
    name character varying(40) NOT NULL,
    age integer,
    size integer,
    orbit_rate numeric(4,2),
    description text,
    is_orbiting boolean,
    has_life boolean,
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
    name character varying(40) NOT NULL,
    age integer,
    size integer,
    recycle_rate numeric(4,2),
    description text,
    has_life boolean,
    is_massive boolean,
    star_id integer
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
    name character varying(40) NOT NULL,
    age integer,
    size integer,
    burn_rate numeric(4,2),
    description text,
    is_super_nova boolean,
    can_spread_heat boolean,
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
-- Name: worm_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.worm_hole (
    worm_hole_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL
);


ALTER TABLE public.worm_hole OWNER TO freecodecamp;

--
-- Name: worm_hole_worm_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.worm_hole_worm_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.worm_hole_worm_hole_id_seq OWNER TO freecodecamp;

--
-- Name: worm_hole_worm_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.worm_hole_worm_hole_id_seq OWNED BY public.worm_hole.worm_hole_id;


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
-- Name: worm_hole worm_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.worm_hole ALTER COLUMN worm_hole_id SET DEFAULT nextval('public.worm_hole_worm_hole_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 453311, 11235, 34.53, 'Cradle of civilization', true, true);
INSERT INTO public.galaxy VALUES (2, 'Hoag Object', 3341, 312, 12.00, 'Cradle of Hoag', false, true);
INSERT INTO public.galaxy VALUES (3, 'Fireworks Galaxy', 4122, 3414, 45.64, 'Cradle of Fireworks', true, true);
INSERT INTO public.galaxy VALUES (4, 'Limo Galaxy', 51221, 313, 32.11, 'Cradle of Limos', true, true);
INSERT INTO public.galaxy VALUES (5, 'Guardians Galaxy', 13133, 5511, 34.11, 'Cradle of Guardians', true, true);
INSERT INTO public.galaxy VALUES (6, 'Tiana Galaxy', 13112, 5233, 67.85, 'Cradle of Tiana', true, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Jan', 131, 411, 56.42, 'Moon Jan', true, false, 10);
INSERT INTO public.moon VALUES (2, 'Feb', 131, 441, 13.44, 'Moon Feb', true, false, 9);
INSERT INTO public.moon VALUES (3, 'March', 411, 311, 34.53, 'Moon March', true, false, 9);
INSERT INTO public.moon VALUES (4, 'April', 1441, 312, 41.11, 'Moon April', true, false, 8);
INSERT INTO public.moon VALUES (5, 'May', 1133, 411, 12.11, 'Moon May', true, false, 8);
INSERT INTO public.moon VALUES (6, 'June', 1411, 112, 56.31, 'Moon June', true, false, 7);
INSERT INTO public.moon VALUES (7, 'July', 5231, 411, 76.22, 'Moon July', true, false, 7);
INSERT INTO public.moon VALUES (8, 'August', 5221, 678, 45.44, 'Moon August', true, false, 6);
INSERT INTO public.moon VALUES (9, 'Sept', 5521, 513, 67.88, 'Moon Sept', true, false, 6);
INSERT INTO public.moon VALUES (10, 'Oct', 5221, 123, 34.55, 'Moon Oct', true, false, 5);
INSERT INTO public.moon VALUES (11, 'Nov', 5622, 122, 53.11, 'Moon Nov', true, false, 5);
INSERT INTO public.moon VALUES (12, 'Dec', 6332, 221, 11.11, 'Moon Dec', true, false, 4);
INSERT INTO public.moon VALUES (13, 'Gold', 5223, 411, 41.12, 'Moon Gold', true, false, 4);
INSERT INTO public.moon VALUES (14, 'Silver', 5632, 234, 44.33, 'Moon Silver', true, false, 3);
INSERT INTO public.moon VALUES (15, 'Bronze', 5231, 331, 67.87, 'Moon Bronze', true, false, 3);
INSERT INTO public.moon VALUES (16, 'Short', 411, 3112, 41.12, 'Moon Short', true, false, 3);
INSERT INTO public.moon VALUES (17, 'Long', 5222, 122, 41.11, 'Moon Long', true, false, 2);
INSERT INTO public.moon VALUES (18, 'Cheese', 5621, 512, 53.11, 'Moon Cheese', true, false, 2);
INSERT INTO public.moon VALUES (19, 'Art', 5623, 123, 53.11, 'Moon Art', true, false, 2);
INSERT INTO public.moon VALUES (20, 'Aulan', 6322, 311, 67.54, 'Moon Aulan', true, false, 2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1311, 144, 12.34, 'Planet Earth', true, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 1322, 541, 14.33, 'Planet Venus', true, true, 1);
INSERT INTO public.planet VALUES (3, 'Woody', 5233, 113, 43.12, 'Planet Woody', false, true, 2);
INSERT INTO public.planet VALUES (4, 'Toy', 5421, 144, 32.11, 'Planet Toy', true, true, 3);
INSERT INTO public.planet VALUES (5, 'Urban', 5233, 124, 51.12, 'Planet Urban', true, true, 4);
INSERT INTO public.planet VALUES (6, 'Space', 5123, 311, 41.11, 'Planet Space', true, true, 5);
INSERT INTO public.planet VALUES (7, 'Clorox', 5411, 511, 67.42, 'Planet Clorox', true, true, 2);
INSERT INTO public.planet VALUES (8, 'Astro', 5213, 114, 45.33, 'Planet Astro', true, true, 2);
INSERT INTO public.planet VALUES (9, 'Neon', 41331, 411, 65.77, 'Planet Neon', true, true, 1);
INSERT INTO public.planet VALUES (10, 'Game', 52322, 113, 14.55, 'Planet Game', true, true, 2);
INSERT INTO public.planet VALUES (11, 'Spider', 6422, 522, 65.44, 'Planet Spider', true, true, 3);
INSERT INTO public.planet VALUES (12, 'Fantasy', 5232, 522, 45.33, 'Planet Fantasy', true, true, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 3122, 4412, 32.11, 'Sun is a star', false, true, 1);
INSERT INTO public.star VALUES (2, 'Titan', 41211, 8371, 14.55, 'Titan is a star', true, true, 1);
INSERT INTO public.star VALUES (3, 'Fisher', 51331, 412, 34.44, 'Fisher is a star', true, true, 3);
INSERT INTO public.star VALUES (4, 'Monsters', 4121, 4311, 14.54, 'Monsters is a star', false, true, 5);
INSERT INTO public.star VALUES (5, 'Violet', 45121, 1311, 34.33, 'Violet is a star', false, true, 2);
INSERT INTO public.star VALUES (6, 'Mermaid', 13131, 441, 13.11, 'Mermaid is a star', true, true, 3);


--
-- Data for Name: worm_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.worm_hole VALUES (2, 1, 'Worm One');
INSERT INTO public.worm_hole VALUES (3, 3, 'Worm Two');
INSERT INTO public.worm_hole VALUES (4, 2, 'Worm Three');


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
-- Name: worm_hole_worm_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.worm_hole_worm_hole_id_seq', 4, true);


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
-- Name: worm_hole worm_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.worm_hole
    ADD CONSTRAINT worm_hole_name_key UNIQUE (name);


--
-- Name: worm_hole worm_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.worm_hole
    ADD CONSTRAINT worm_hole_pkey PRIMARY KEY (worm_hole_id);


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
-- Name: worm_hole worm_hole_origin_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.worm_hole
    ADD CONSTRAINT worm_hole_origin_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

