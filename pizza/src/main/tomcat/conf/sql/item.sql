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
-- Name: item; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE item (
    id integer DEFAULT nextval('company_id_company_seq'::regclass) NOT NULL,
    category character varying(255),
    flavor character varying(255),
    price real NOT NULL
);


ALTER TABLE public.item OWNER TO postgres;

--
-- Data for Name: item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY item (id, category, flavor, price) FROM stdin;
15	pizza	Pepperoni	30
16	pizza	Loin with cheddar	40
17	pizza	American	45
18	pizza	Bahia	32
19	pizza	Garlic and oil	29
20	pizza	Brazilian	50
21	pizza	Catupiry	26
22	pizza	Alicci	25
23	pizza	Greek	27
24	drink	Orange	5
25	drink	Limon	7
26	drink	Mango	9
27	drink	Coke	12
28	drink	Guarana	12
29	dessert	Chocolate Cake	15
30	dessert	Limon Cake	17
31	dessert	Brownie	19
32	dessert	Ice Cream	14
33	dessert	Chocolate Mousse	22
\.


--
-- Name: item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY item
    ADD CONSTRAINT item_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

