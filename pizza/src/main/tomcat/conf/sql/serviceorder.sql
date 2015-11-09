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
-- Name: serviceorder; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE serviceorder (
    id integer NOT NULL,
    description character varying(255),
    isopen boolean NOT NULL,
    price real NOT NULL
);


ALTER TABLE public.serviceorder OWNER TO postgres;

--
-- Data for Name: serviceorder; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY serviceorder (id, description, isopen, price) FROM stdin;
17	 * Loin with cheddar|American|	f	45
20	 * Limon Cake * Mango * Coke * Loin with cheddar|American| * Pepperoni|Loin with cheddar|Greek|	f	123
21	 * Limon * Mango * Chocolate Cake * Limon Cake * Brownie * Ice Cream * Chocolate Mousse * Loin with cheddar|American| * Greek|Catupiry|Alicci|Brazilian|	f	198
19	 * Chocolate Cake * Limon Cake	f	32
22	 * Limon * Mango	t	16
23	 * Chocolate Cake * Limon Cake * Brownie	t	51
18	 * Limon * Mango * Coke	f	28
24	 * American|Bahia|	t	45
25	 * Catupiry|Brazilian|Bahia| * American|Loin with cheddar| * Coke * Coke * Limon * Pepperoni|Loin with cheddar|American|Bahia| * Chocolate Cake	f	186
26	 * Pepperoni|Loin with cheddar|	t	40
27	 * Limon Cake	t	17
\.


--
-- Name: serviceorder_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY serviceorder
    ADD CONSTRAINT serviceorder_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

