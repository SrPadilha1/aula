--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

-- Started on 2018-07-11 12:10:32 BRT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12395)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2169 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 33057)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cliente (
    cd_cliente integer NOT NULL,
    endereco_cd_endereco integer,
    nm_razaosocial character varying(60),
    ds_email character varying(30),
    cod_identificacao character varying(100),
    nm_fantasia character varying(30)
);


ALTER TABLE cliente OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 33084)
-- Name: endereco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE endereco (
    cd_endereco integer NOT NULL,
    nm_rua character varying(30),
    "nr-casa" numeric(1000,2),
    ds_complemento character varying(30),
    nm_bairro character varying(30),
    "nm-cidade" character varying(30),
    ds_cep character varying(8),
    telefone1 numeric(20,0),
    telefone2 numeric(20,0)
);


ALTER TABLE endereco OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 33078)
-- Name: funcao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE funcao (
    cd_funcao integer NOT NULL,
    ds_funcao character varying(30),
    "tp-visivel" character(1)
);


ALTER TABLE funcao OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 33075)
-- Name: funcionario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE funcionario (
    cd_funcionario integer NOT NULL,
    "funcao_cd_funcao(FK)" integer,
    "endereco_cd_endereco(FK)" integer,
    "nm-funcionario" character varying(30),
    ds_senha character varying(30),
    nick character varying(30),
    tp_visivel character(1)
);


ALTER TABLE funcionario OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 33087)
-- Name: ordem_servico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ordem_servico (
    cd_ordem_sevico integer NOT NULL,
    "funcionario_cd_funcionario(FK)" integer,
    "cliente_cd_cliente(FK)" integer,
    dt_ordem_servico date,
    "vl-total" numeric(1000,0),
    bool_fechado boolean
);


ALTER TABLE ordem_servico OWNER TO postgres;

--
-- TOC entry 2157 (class 0 OID 33057)
-- Dependencies: 181
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cliente (cd_cliente, endereco_cd_endereco, nm_razaosocial, ds_email, cod_identificacao, nm_fantasia) FROM stdin;
\.


--
-- TOC entry 2160 (class 0 OID 33084)
-- Dependencies: 184
-- Data for Name: endereco; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY endereco (cd_endereco, nm_rua, "nr-casa", ds_complemento, nm_bairro, "nm-cidade", ds_cep, telefone1, telefone2) FROM stdin;
\.


--
-- TOC entry 2159 (class 0 OID 33078)
-- Dependencies: 183
-- Data for Name: funcao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY funcao (cd_funcao, ds_funcao, "tp-visivel") FROM stdin;
\.


--
-- TOC entry 2158 (class 0 OID 33075)
-- Dependencies: 182
-- Data for Name: funcionario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY funcionario (cd_funcionario, "funcao_cd_funcao(FK)", "endereco_cd_endereco(FK)", "nm-funcionario", ds_senha, nick, tp_visivel) FROM stdin;
\.


--
-- TOC entry 2161 (class 0 OID 33087)
-- Dependencies: 185
-- Data for Name: ordem_servico; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ordem_servico (cd_ordem_sevico, "funcionario_cd_funcionario(FK)", "cliente_cd_cliente(FK)", dt_ordem_servico, "vl-total", bool_fechado) FROM stdin;
\.


--
-- TOC entry 2040 (class 2606 OID 33099)
-- Name: endereco_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY endereco
    ADD CONSTRAINT endereco_pkey PRIMARY KEY (cd_endereco);


--
-- TOC entry 2038 (class 2606 OID 33101)
-- Name: funcao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcao
    ADD CONSTRAINT funcao_pkey PRIMARY KEY (cd_funcao);


--
-- TOC entry 2036 (class 2606 OID 33103)
-- Name: funcionario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT funcionario_pkey PRIMARY KEY (cd_funcionario);


--
-- TOC entry 2042 (class 2606 OID 33105)
-- Name: ordem_servico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ordem_servico
    ADD CONSTRAINT ordem_servico_pkey PRIMARY KEY (cd_ordem_sevico);


--
-- TOC entry 2034 (class 2606 OID 33097)
-- Name: pk_cliente; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT pk_cliente PRIMARY KEY (cd_cliente);


--
-- TOC entry 2168 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2018-07-11 12:10:33 BRT

--
-- PostgreSQL database dump complete
--

