--
-- PostgreSQL database dump
--

-- Dumped from database version 12.5
-- Dumped by pg_dump version 13.1

-- Started on 2020-11-26 19:34:04

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
-- TOC entry 202 (class 1259 OID 16481)
-- Name: cantidades_productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cantidades_productos (
    id integer NOT NULL,
    cantidad double precision,
    producto_id integer,
    factura_id integer
);


ALTER TABLE public.cantidades_productos OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16484)
-- Name: cantidades_productos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cantidades_productos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cantidades_productos_id_seq OWNER TO postgres;

--
-- TOC entry 2894 (class 0 OID 0)
-- Dependencies: 203
-- Name: cantidades_productos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cantidades_productos_id_seq OWNED BY public.cantidades_productos.id;


--
-- TOC entry 204 (class 1259 OID 16486)
-- Name: categorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorias (
    id integer NOT NULL,
    denominacion character varying(60) NOT NULL,
    descripcion character varying(80)
);


ALTER TABLE public.categorias OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16489)
-- Name: categorias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categorias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categorias_id_seq OWNER TO postgres;

--
-- TOC entry 2895 (class 0 OID 0)
-- Dependencies: 205
-- Name: categorias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categorias_id_seq OWNED BY public.categorias.id;


--
-- TOC entry 213 (class 1259 OID 16582)
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    id integer NOT NULL,
    nombre character varying(60) NOT NULL,
    cuil character varying(12) NOT NULL,
    razon_social character varying(60),
    tipo_cliente_id integer NOT NULL,
    apellido character varying(60) NOT NULL,
    fecha_nacimiento date
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16580)
-- Name: clientes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clientes_id_seq OWNER TO postgres;

--
-- TOC entry 2896 (class 0 OID 0)
-- Dependencies: 212
-- Name: clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;


--
-- TOC entry 206 (class 1259 OID 16496)
-- Name: facturas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facturas (
    id integer NOT NULL,
    fecha date,
    observacion character varying(250),
    cliente_id integer,
    total double precision
);


ALTER TABLE public.facturas OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16499)
-- Name: facturas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.facturas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.facturas_id_seq OWNER TO postgres;

--
-- TOC entry 2897 (class 0 OID 0)
-- Dependencies: 207
-- Name: facturas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.facturas_id_seq OWNED BY public.facturas.id;


--
-- TOC entry 208 (class 1259 OID 16501)
-- Name: forma_de_pago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forma_de_pago (
    id integer NOT NULL,
    contado integer,
    tarjeta integer,
    debito integer
);


ALTER TABLE public.forma_de_pago OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16504)
-- Name: forma_de_pago_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.forma_de_pago_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forma_de_pago_id_seq OWNER TO postgres;

--
-- TOC entry 2898 (class 0 OID 0)
-- Dependencies: 209
-- Name: forma_de_pago_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.forma_de_pago_id_seq OWNED BY public.forma_de_pago.id;


--
-- TOC entry 215 (class 1259 OID 16595)
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos (
    id integer NOT NULL,
    categoria_id integer NOT NULL,
    nombre character varying(128) NOT NULL,
    stock_minimo double precision,
    stock_maximo double precision,
    precio double precision NOT NULL,
    descripcion character varying(60),
    fecha_creacion date NOT NULL
);


ALTER TABLE public.productos OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16593)
-- Name: productos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.productos_id_seq OWNER TO postgres;

--
-- TOC entry 2899 (class 0 OID 0)
-- Dependencies: 214
-- Name: productos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_id_seq OWNED BY public.productos.id;


--
-- TOC entry 210 (class 1259 OID 16511)
-- Name: tipo_cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_cliente (
    id integer NOT NULL,
    nombre character varying(60) NOT NULL,
    descripcion character varying(120)
);


ALTER TABLE public.tipo_cliente OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16514)
-- Name: tipo_cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_cliente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_cliente_id_seq OWNER TO postgres;

--
-- TOC entry 2900 (class 0 OID 0)
-- Dependencies: 211
-- Name: tipo_cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_cliente_id_seq OWNED BY public.tipo_cliente.id;


--
-- TOC entry 2723 (class 2604 OID 16516)
-- Name: cantidades_productos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cantidades_productos ALTER COLUMN id SET DEFAULT nextval('public.cantidades_productos_id_seq'::regclass);


--
-- TOC entry 2724 (class 2604 OID 16517)
-- Name: categorias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias ALTER COLUMN id SET DEFAULT nextval('public.categorias_id_seq'::regclass);


--
-- TOC entry 2728 (class 2604 OID 16585)
-- Name: clientes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);


--
-- TOC entry 2725 (class 2604 OID 16519)
-- Name: facturas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturas ALTER COLUMN id SET DEFAULT nextval('public.facturas_id_seq'::regclass);


--
-- TOC entry 2726 (class 2604 OID 16520)
-- Name: forma_de_pago id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forma_de_pago ALTER COLUMN id SET DEFAULT nextval('public.forma_de_pago_id_seq'::regclass);


--
-- TOC entry 2729 (class 2604 OID 16598)
-- Name: productos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos ALTER COLUMN id SET DEFAULT nextval('public.productos_id_seq'::regclass);


--
-- TOC entry 2727 (class 2604 OID 16522)
-- Name: tipo_cliente id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_cliente ALTER COLUMN id SET DEFAULT nextval('public.tipo_cliente_id_seq'::regclass);


--
-- TOC entry 2875 (class 0 OID 16481)
-- Dependencies: 202
-- Data for Name: cantidades_productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cantidades_productos (id, cantidad, producto_id, factura_id) VALUES (1, 2, 2, 9);
INSERT INTO public.cantidades_productos (id, cantidad, producto_id, factura_id) VALUES (2, 2, 18, 10);
INSERT INTO public.cantidades_productos (id, cantidad, producto_id, factura_id) VALUES (3, 50, 2, 11);
INSERT INTO public.cantidades_productos (id, cantidad, producto_id, factura_id) VALUES (4, 1, 18, 11);
INSERT INTO public.cantidades_productos (id, cantidad, producto_id, factura_id) VALUES (5, 1, 17, 11);
INSERT INTO public.cantidades_productos (id, cantidad, producto_id, factura_id) VALUES (6, 80, 17, 12);


--
-- TOC entry 2877 (class 0 OID 16486)
-- Dependencies: 204
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categorias (id, denominacion, descripcion) VALUES (71, 'dulces', 'caramelo');
INSERT INTO public.categorias (id, denominacion, descripcion) VALUES (1, 'Juguetes', 'Plastico');
INSERT INTO public.categorias (id, denominacion, descripcion) VALUES (72, 'galletas ', 'comida');
INSERT INTO public.categorias (id, denominacion, descripcion) VALUES (74, 'asdasdas', 'sdadsadas');


--
-- TOC entry 2886 (class 0 OID 16582)
-- Dependencies: 213
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.clientes (id, nombre, cuil, razon_social, tipo_cliente_id, apellido, fecha_nacimiento) VALUES (9, 'Franco Javier', '204564620', NULL, 17, 'Cuevas', '2020-11-19');
INSERT INTO public.clientes (id, nombre, cuil, razon_social, tipo_cliente_id, apellido, fecha_nacimiento) VALUES (8, 'Jhon', '123123', NULL, 17, 'Doe', '2020-11-17');
INSERT INTO public.clientes (id, nombre, cuil, razon_social, tipo_cliente_id, apellido, fecha_nacimiento) VALUES (7, '777', '7777', NULL, 1, 'ap 7', '2020-01-01');
INSERT INTO public.clientes (id, nombre, cuil, razon_social, tipo_cliente_id, apellido, fecha_nacimiento) VALUES (10, 'Nombre Nuevo', '123', NULL, 17, 'ap 7', '2020-01-01');


--
-- TOC entry 2879 (class 0 OID 16496)
-- Dependencies: 206
-- Data for Name: facturas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.facturas (id, fecha, observacion, cliente_id, total) VALUES (1, '2020-04-01', 'This is una observacion
', 7, 150);
INSERT INTO public.facturas (id, fecha, observacion, cliente_id, total) VALUES (2, '2020-11-26', 'asdasdsadasdsa', 9, 0);
INSERT INTO public.facturas (id, fecha, observacion, cliente_id, total) VALUES (3, '2020-11-26', 'observo', 9, 220);
INSERT INTO public.facturas (id, fecha, observacion, cliente_id, total) VALUES (4, '2020-11-26', 'observacion final', 9, 220);
INSERT INTO public.facturas (id, fecha, observacion, cliente_id, total) VALUES (5, '2020-11-26', 'Observacion final x', 9, 220);
INSERT INTO public.facturas (id, fecha, observacion, cliente_id, total) VALUES (6, '2020-11-26', 'asdasdas', 9, 120);
INSERT INTO public.facturas (id, fecha, observacion, cliente_id, total) VALUES (7, '2020-11-26', 'asdasdsadasd', 9, 120);
INSERT INTO public.facturas (id, fecha, observacion, cliente_id, total) VALUES (8, '2020-11-26', 'asdasdasd', 9, 120);
INSERT INTO public.facturas (id, fecha, observacion, cliente_id, total) VALUES (9, '2020-11-26', 'asdasdsad', 9, 120);
INSERT INTO public.facturas (id, fecha, observacion, cliente_id, total) VALUES (10, '2020-11-26', 'asdsadsad', 9, 2);
INSERT INTO public.facturas (id, fecha, observacion, cliente_id, total) VALUES (11, '2020-11-26', 'xxx', 8, 3051);
INSERT INTO public.facturas (id, fecha, observacion, cliente_id, total) VALUES (12, '2020-11-18', 'asdasdasd', 7, 4000);


--
-- TOC entry 2881 (class 0 OID 16501)
-- Dependencies: 208
-- Data for Name: forma_de_pago; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2888 (class 0 OID 16595)
-- Dependencies: 215
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.productos (id, categoria_id, nombre, stock_minimo, stock_maximo, precio, descripcion, fecha_creacion) VALUES (17, 71, 'Chupetin', NULL, NULL, 50, 'Naranjka', '2020-11-24');
INSERT INTO public.productos (id, categoria_id, nombre, stock_minimo, stock_maximo, precio, descripcion, fecha_creacion) VALUES (2, 1, 'Auto', NULL, NULL, 60, 'Hotwheels', '2020-11-23');
INSERT INTO public.productos (id, categoria_id, nombre, stock_minimo, stock_maximo, precio, descripcion, fecha_creacion) VALUES (18, 72, 'huawie', NULL, NULL, 1, 'saladas', '2020-11-24');


--
-- TOC entry 2883 (class 0 OID 16511)
-- Dependencies: 210
-- Data for Name: tipo_cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipo_cliente (id, nombre, descripcion) VALUES (1, 'Particular', 'TIPO A');
INSERT INTO public.tipo_cliente (id, nombre, descripcion) VALUES (17, 'Empresa', 'TIPO C');


--
-- TOC entry 2901 (class 0 OID 0)
-- Dependencies: 203
-- Name: cantidades_productos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cantidades_productos_id_seq', 6, true);


--
-- TOC entry 2902 (class 0 OID 0)
-- Dependencies: 205
-- Name: categorias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorias_id_seq', 74, true);


--
-- TOC entry 2903 (class 0 OID 0)
-- Dependencies: 212
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_id_seq', 10, true);


--
-- TOC entry 2904 (class 0 OID 0)
-- Dependencies: 207
-- Name: facturas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.facturas_id_seq', 12, true);


--
-- TOC entry 2905 (class 0 OID 0)
-- Dependencies: 209
-- Name: forma_de_pago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.forma_de_pago_id_seq', 1, false);


--
-- TOC entry 2906 (class 0 OID 0)
-- Dependencies: 214
-- Name: productos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_id_seq', 18, true);


--
-- TOC entry 2907 (class 0 OID 0)
-- Dependencies: 211
-- Name: tipo_cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_cliente_id_seq', 17, true);


--
-- TOC entry 2731 (class 2606 OID 16524)
-- Name: cantidades_productos cantidades_productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cantidades_productos
    ADD CONSTRAINT cantidades_productos_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 16587)
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 16526)
-- Name: facturas facturas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturas
    ADD CONSTRAINT facturas_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 16528)
-- Name: forma_de_pago forma_de_pago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forma_de_pago
    ADD CONSTRAINT forma_de_pago_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 16532)
-- Name: categorias pk_id_categorias; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT pk_id_categorias PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 16600)
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 16536)
-- Name: tipo_cliente tipo_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_cliente
    ADD CONSTRAINT tipo_cliente_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 1259 OID 16616)
-- Name: fki_fk_factura; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fk_factura ON public.cantidades_productos USING btree (factura_id);


--
-- TOC entry 2748 (class 2606 OID 16601)
-- Name: productos fk_categoria_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT fk_categoria_id FOREIGN KEY (categoria_id) REFERENCES public.categorias(id);


--
-- TOC entry 2746 (class 2606 OID 16611)
-- Name: cantidades_productos fk_factura; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cantidades_productos
    ADD CONSTRAINT fk_factura FOREIGN KEY (factura_id) REFERENCES public.facturas(id) NOT VALID;


--
-- TOC entry 2745 (class 2606 OID 16606)
-- Name: cantidades_productos fk_producto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cantidades_productos
    ADD CONSTRAINT fk_producto FOREIGN KEY (producto_id) REFERENCES public.productos(id) NOT VALID;


--
-- TOC entry 2747 (class 2606 OID 16588)
-- Name: clientes fk_tipo_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT fk_tipo_cliente FOREIGN KEY (tipo_cliente_id) REFERENCES public.tipo_cliente(id);


-- Completed on 2020-11-26 19:34:04

--
-- PostgreSQL database dump complete
--

