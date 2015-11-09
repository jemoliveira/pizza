--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: pizza; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pizza (
    id integer NOT NULL,
    flavor character varying(255),
    price real NOT NULL
);


ALTER TABLE public.pizza OWNER TO postgres;

--
-- Data for Name: pizza; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pizza (id, flavor, price) FROM stdin;
1	Pepperoni	30
2	Loin with cheddar	40
3	Greek	27
4	Catupiry	26
5	Brazilian	50
6	Garlic and oil	29
7	Bahia	32
8	American	45
9	Alicci	25
\.


--
-- Name: pizza_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pizza
    ADD CONSTRAINT pizza_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

