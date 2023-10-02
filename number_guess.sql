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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games_played; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games_played (
    game_id integer NOT NULL,
    username_id integer,
    guess integer
);


ALTER TABLE public.games_played OWNER TO freecodecamp;

--
-- Name: games_played_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_played_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_played_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_played_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_played_game_id_seq OWNED BY public.games_played.game_id;


--
-- Name: usernames; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.usernames (
    username_id integer NOT NULL,
    name character varying(22)
);


ALTER TABLE public.usernames OWNER TO freecodecamp;

--
-- Name: usernames_username_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.usernames_username_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usernames_username_id_seq OWNER TO freecodecamp;

--
-- Name: usernames_username_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.usernames_username_id_seq OWNED BY public.usernames.username_id;


--
-- Name: games_played game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games_played ALTER COLUMN game_id SET DEFAULT nextval('public.games_played_game_id_seq'::regclass);


--
-- Name: usernames username_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.usernames ALTER COLUMN username_id SET DEFAULT nextval('public.usernames_username_id_seq'::regclass);


--
-- Data for Name: games_played; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games_played VALUES (166, 114, NULL);
INSERT INTO public.games_played VALUES (167, 115, 5);
INSERT INTO public.games_played VALUES (169, 117, 6);
INSERT INTO public.games_played VALUES (168, 116, 10);
INSERT INTO public.games_played VALUES (171, 119, 10);
INSERT INTO public.games_played VALUES (170, 118, 9);
INSERT INTO public.games_played VALUES (173, 121, 10);
INSERT INTO public.games_played VALUES (172, 120, 10);
INSERT INTO public.games_played VALUES (175, 123, 6);
INSERT INTO public.games_played VALUES (174, 122, 5);
INSERT INTO public.games_played VALUES (177, 125, 10);
INSERT INTO public.games_played VALUES (176, 124, 5);


--
-- Data for Name: usernames; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.usernames VALUES (114, 'nico');
INSERT INTO public.usernames VALUES (115, 'ariel');
INSERT INTO public.usernames VALUES (116, 'user_1696241589707');
INSERT INTO public.usernames VALUES (117, 'user_1696241589706');
INSERT INTO public.usernames VALUES (118, 'user_1696244222179');
INSERT INTO public.usernames VALUES (119, 'user_1696244222178');
INSERT INTO public.usernames VALUES (120, 'user_1696244397815');
INSERT INTO public.usernames VALUES (121, 'user_1696244397814');
INSERT INTO public.usernames VALUES (122, 'user_1696244444868');
INSERT INTO public.usernames VALUES (123, 'user_1696244444867');
INSERT INTO public.usernames VALUES (124, 'user_1696244456447');
INSERT INTO public.usernames VALUES (125, 'user_1696244456446');


--
-- Name: games_played_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_played_game_id_seq', 177, true);


--
-- Name: usernames_username_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.usernames_username_id_seq', 125, true);


--
-- Name: games_played games_played_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games_played
    ADD CONSTRAINT games_played_pkey PRIMARY KEY (game_id);


--
-- Name: usernames usernames_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.usernames
    ADD CONSTRAINT usernames_pkey PRIMARY KEY (username_id);


--
-- Name: games_played games_played_username_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games_played
    ADD CONSTRAINT games_played_username_id_fkey FOREIGN KEY (username_id) REFERENCES public.usernames(username_id);


--
-- PostgreSQL database dump complete
--

