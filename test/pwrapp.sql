--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

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

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

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

--
-- PostgreSQL database dump complete
--

--
-- Database "pwrapp" dump
--

--
-- PostgreSQL database dump
--

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

--
-- Name: pwrapp; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE pwrapp WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


\connect pwrapp

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
-- Name: 2023-01-01; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."2023-01-01" (
    index timestamp without time zone,
    "Wh" double precision
);


--
-- Name: 2023-01-02; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."2023-01-02" (
    index timestamp without time zone,
    "Wh" double precision
);


--
-- Name: 2023-01-03; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."2023-01-03" (
    index timestamp without time zone,
    "Wh" double precision
);


--
-- Name: 2023-01-04; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."2023-01-04" (
    index timestamp without time zone,
    "Wh" double precision
);


--
-- Name: 2023-01-05; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."2023-01-05" (
    index timestamp without time zone,
    "Wh" double precision
);


--
-- Name: 2023-01-06; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."2023-01-06" (
    index timestamp without time zone,
    "Wh" double precision
);


--
-- Name: 2023-01-07; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."2023-01-07" (
    index timestamp without time zone,
    "Wh" double precision
);


--
-- Name: 2023-01-08; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."2023-01-08" (
    index timestamp without time zone,
    "Wh" double precision
);


--
-- Name: 2023-01-09; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."2023-01-09" (
    index timestamp without time zone,
    "Wh" double precision
);


--
-- Name: 2023-01-10; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."2023-01-10" (
    index timestamp without time zone,
    "Wh" double precision
);


--
-- Name: 2023-01-11; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."2023-01-11" (
    index timestamp without time zone,
    "Wh" double precision
);


--
-- Name: 2023-01-12; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."2023-01-12" (
    index timestamp without time zone,
    "Wh" double precision
);


--
-- Name: 2023-01-13; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."2023-01-13" (
    index timestamp without time zone,
    "Wh" double precision
);


--
-- Name: 2023-01-14; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."2023-01-14" (
    index timestamp without time zone,
    "Wh" double precision
);


--
-- Name: 2023-01-15; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."2023-01-15" (
    index timestamp without time zone,
    "Wh" double precision
);


--
-- Name: 2023-01-16; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."2023-01-16" (
    index timestamp without time zone,
    "Wh" double precision
);


--
-- Name: 2023-01-17; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."2023-01-17" (
    index timestamp without time zone,
    "Wh" double precision
);


--
-- Name: 2023-01-18; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."2023-01-18" (
    index timestamp without time zone,
    "Wh" double precision
);


--
-- Name: avg; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.avg (
    index text,
    "kWh" double precision
);


--
-- Data for Name: 2023-01-01; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."2023-01-01" (index, "Wh") FROM stdin;
2023-01-01 00:00:00	664.01
2023-01-01 01:00:00	265.87
2023-01-01 02:00:00	159.4
2023-01-01 03:00:00	206.37
2023-01-01 04:00:00	138.89
2023-01-01 05:00:00	218.03
2023-01-01 06:00:00	135.32
2023-01-01 07:00:00	257.07
2023-01-01 08:00:00	252.03
2023-01-01 09:00:00	434.27
2023-01-01 10:00:00	524.75
2023-01-01 11:00:00	230.54
2023-01-01 12:00:00	326.04
2023-01-01 13:00:00	499.22
2023-01-01 14:00:00	493.5
2023-01-01 15:00:00	367.82
2023-01-01 16:00:00	533.14
2023-01-01 17:00:00	679.79
2023-01-01 18:00:00	918.22
2023-01-01 19:00:00	1081.01
2023-01-01 20:00:00	637.46
2023-01-01 21:00:00	833.68
2023-01-01 22:00:00	489.49
2023-01-01 23:00:00	217.11
2023-01-02 00:00:00	369
\.


--
-- Data for Name: 2023-01-02; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."2023-01-02" (index, "Wh") FROM stdin;
2023-01-02 00:00:00	182.39
2023-01-02 01:00:00	692.19
2023-01-02 02:00:00	858.57
2023-01-02 03:00:00	160.55
2023-01-02 04:00:00	181.46
2023-01-02 05:00:00	167.16
2023-01-02 06:00:00	463.76
2023-01-02 07:00:00	885.02
2023-01-02 08:00:00	1956.58
2023-01-02 09:00:00	834.15
2023-01-02 10:00:00	595.71
2023-01-02 11:00:00	1070.25
2023-01-02 12:00:00	2112.1
2023-01-02 13:00:00	1018.45
2023-01-02 14:00:00	1950.15
2023-01-02 15:00:00	699.02
2023-01-02 16:00:00	671.03
2023-01-02 17:00:00	759.44
2023-01-02 18:00:00	1610.02
2023-01-02 19:00:00	1375.62
2023-01-02 20:00:00	1310.22
2023-01-02 21:00:00	989.27
2023-01-02 22:00:00	850.51
2023-01-02 23:00:00	531.09
2023-01-03 00:00:00	629
\.


--
-- Data for Name: 2023-01-03; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."2023-01-03" (index, "Wh") FROM stdin;
2023-01-03 00:00:00	541.3
2023-01-03 01:00:00	543
2023-01-03 02:00:00	480.28
2023-01-03 03:00:00	535.58
2023-01-03 04:00:00	317.33
2023-01-03 05:00:00	163.87
2023-01-03 06:00:00	266.59
2023-01-03 07:00:00	1374.29
2023-01-03 08:00:00	1122.98
2023-01-03 09:00:00	728.62
2023-01-03 10:00:00	895.32
2023-01-03 11:00:00	860.61
2023-01-03 12:00:00	890.19
2023-01-03 13:00:00	1280.47
2023-01-03 14:00:00	1517.73
2023-01-03 15:00:00	1805.27
2023-01-03 16:00:00	956.31
2023-01-03 17:00:00	625.38
2023-01-03 18:00:00	675.61
2023-01-03 19:00:00	956.18
2023-01-03 20:00:00	1097.97
2023-01-03 21:00:00	894.95
2023-01-03 22:00:00	214.04
2023-01-03 23:00:00	173.41
2023-01-04 00:00:00	141
\.


--
-- Data for Name: 2023-01-04; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."2023-01-04" (index, "Wh") FROM stdin;
2023-01-04 00:00:00	188.17
2023-01-04 01:00:00	162.59
2023-01-04 02:00:00	149.63
2023-01-04 03:00:00	181.87
2023-01-04 04:00:00	144.23
2023-01-04 05:00:00	168.24
2023-01-04 06:00:00	226.73
2023-01-04 07:00:00	481.17
2023-01-04 08:00:00	395.75
2023-01-04 09:00:00	421.47
2023-01-04 10:00:00	374.28
2023-01-04 11:00:00	434.28
2023-01-04 12:00:00	447.93
2023-01-04 13:00:00	768.38
2023-01-04 14:00:00	1077.42
2023-01-04 15:00:00	803.92
2023-01-04 16:00:00	872.65
2023-01-04 17:00:00	1458.95
2023-01-04 18:00:00	1727.07
2023-01-04 19:00:00	1169.99
2023-01-04 20:00:00	1072.77
2023-01-04 21:00:00	1013
2023-01-04 22:00:00	358.67
2023-01-04 23:00:00	156.17
2023-01-05 00:00:00	124
\.


--
-- Data for Name: 2023-01-05; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."2023-01-05" (index, "Wh") FROM stdin;
2023-01-05 00:00:00	170.1
2023-01-05 01:00:00	156.55
2023-01-05 02:00:00	134.32
2023-01-05 03:00:00	187.7
2023-01-05 04:00:00	117.74
2023-01-05 05:00:00	203.18
2023-01-05 06:00:00	203.54
2023-01-05 07:00:00	679.26
2023-01-05 08:00:00	501.27
2023-01-05 09:00:00	339.36
2023-01-05 10:00:00	458.22
2023-01-05 11:00:00	417.45
2023-01-05 12:00:00	516.52
2023-01-05 13:00:00	793.3
2023-01-05 14:00:00	622.67
2023-01-05 15:00:00	271.93
2023-01-05 16:00:00	749.87
2023-01-05 17:00:00	1483.65
2023-01-05 18:00:00	1848.8
2023-01-05 19:00:00	2501.14
2023-01-05 20:00:00	1278.51
2023-01-05 21:00:00	762.37
2023-01-05 22:00:00	543.51
2023-01-05 23:00:00	678.28
2023-01-06 00:00:00	458
\.


--
-- Data for Name: 2023-01-06; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."2023-01-06" (index, "Wh") FROM stdin;
2023-01-06 00:00:00	323.9
2023-01-06 01:00:00	201.49
2023-01-06 02:00:00	117.64
2023-01-06 03:00:00	196.3
2023-01-06 04:00:00	116.02
2023-01-06 05:00:00	159.82
2023-01-06 06:00:00	159.84
2023-01-06 07:00:00	214.16
2023-01-06 08:00:00	695.2
2023-01-06 09:00:00	1539.93
2023-01-06 10:00:00	1039.18
2023-01-06 11:00:00	1394.08
2023-01-06 12:00:00	1370.36
2023-01-06 13:00:00	2222.16
2023-01-06 14:00:00	1406.34
2023-01-06 15:00:00	1111.26
2023-01-06 16:00:00	660.53
2023-01-06 17:00:00	1389.36
2023-01-06 18:00:00	1633.78
2023-01-06 19:00:00	1169.31
2023-01-06 20:00:00	706.62
2023-01-06 21:00:00	549.43
2023-01-06 22:00:00	601.96
2023-01-06 23:00:00	134.51
2023-01-07 00:00:00	138
\.


--
-- Data for Name: 2023-01-07; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."2023-01-07" (index, "Wh") FROM stdin;
2023-01-07 00:00:00	212.67
2023-01-07 01:00:00	133.2
2023-01-07 02:00:00	201.17
2023-01-07 03:00:00	119.44
2023-01-07 04:00:00	172.78
2023-01-07 05:00:00	152.5
2023-01-07 06:00:00	123.17
2023-01-07 07:00:00	971.32
2023-01-07 08:00:00	1055.11
2023-01-07 09:00:00	881.2
2023-01-07 10:00:00	1093.51
2023-01-07 11:00:00	923.11
2023-01-07 12:00:00	755.31
2023-01-07 13:00:00	759.18
2023-01-07 14:00:00	642.14
2023-01-07 15:00:00	702.07
2023-01-07 16:00:00	813.05
2023-01-07 17:00:00	1034.73
2023-01-07 18:00:00	1120.81
2023-01-07 19:00:00	837.76
2023-01-07 20:00:00	686.96
2023-01-07 21:00:00	546.47
2023-01-07 22:00:00	531.74
2023-01-07 23:00:00	471.15
2023-01-08 00:00:00	141
\.


--
-- Data for Name: 2023-01-08; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."2023-01-08" (index, "Wh") FROM stdin;
2023-01-08 00:00:00	185.54
2023-01-08 01:00:00	139.74
2023-01-08 02:00:00	175.41
2023-01-08 03:00:00	138.19
2023-01-08 04:00:00	155.22
2023-01-08 05:00:00	155.86
2023-01-08 06:00:00	120.76
2023-01-08 07:00:00	391.8
2023-01-08 08:00:00	270.56
2023-01-08 09:00:00	235.84
2023-01-08 10:00:00	357.34
2023-01-08 11:00:00	863.48
2023-01-08 12:00:00	979.49
2023-01-08 13:00:00	838.96
2023-01-08 14:00:00	2173.87
2023-01-08 15:00:00	1553.92
2023-01-08 16:00:00	1893.39
2023-01-08 17:00:00	930.53
2023-01-08 18:00:00	1282.85
2023-01-08 19:00:00	1279.73
2023-01-08 20:00:00	1475.59
2023-01-08 21:00:00	992.6
2023-01-08 22:00:00	848.15
2023-01-08 23:00:00	585.27
2023-01-09 00:00:00	579
\.


--
-- Data for Name: 2023-01-09; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."2023-01-09" (index, "Wh") FROM stdin;
2023-01-09 00:00:00	495.24
2023-01-09 01:00:00	536.09
2023-01-09 02:00:00	483.31
2023-01-09 03:00:00	518.68
2023-01-09 04:00:00	499.4
2023-01-09 05:00:00	479.92
2023-01-09 06:00:00	497.25
2023-01-09 07:00:00	852.49
2023-01-09 08:00:00	1029.13
2023-01-09 09:00:00	1126.87
2023-01-09 10:00:00	1018.44
2023-01-09 11:00:00	794.37
2023-01-09 12:00:00	736.19
2023-01-09 13:00:00	1089.32
2023-01-09 14:00:00	741.63
2023-01-09 15:00:00	751.53
2023-01-09 16:00:00	865.81
2023-01-09 17:00:00	1603.09
2023-01-09 18:00:00	1312.71
2023-01-09 19:00:00	1244.05
2023-01-09 20:00:00	1120.51
2023-01-09 21:00:00	1508.76
2023-01-09 22:00:00	926.5
2023-01-09 23:00:00	992.63
2023-01-10 00:00:00	582
\.


--
-- Data for Name: 2023-01-10; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."2023-01-10" (index, "Wh") FROM stdin;
2023-01-10 00:00:00	1180.59
2023-01-10 01:00:00	492.88
2023-01-10 02:00:00	524.83
2023-01-10 03:00:00	471.56
2023-01-10 04:00:00	513.07
2023-01-10 05:00:00	459.54
2023-01-10 06:00:00	562.77
2023-01-10 07:00:00	708.37
2023-01-10 08:00:00	877.36
2023-01-10 09:00:00	926.08
2023-01-10 10:00:00	848.07
2023-01-10 11:00:00	796.38
2023-01-10 12:00:00	998.11
2023-01-10 13:00:00	639.95
2023-01-10 14:00:00	956.99
2023-01-10 15:00:00	590.81
2023-01-10 16:00:00	538.29
2023-01-10 17:00:00	1552.99
2023-01-10 18:00:00	1489.67
2023-01-10 19:00:00	1385.35
2023-01-10 20:00:00	1164.72
2023-01-10 21:00:00	1101.09
2023-01-10 22:00:00	599.43
2023-01-10 23:00:00	533.75
2023-01-11 00:00:00	483
\.


--
-- Data for Name: 2023-01-11; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."2023-01-11" (index, "Wh") FROM stdin;
2023-01-11 00:00:00	783.15
2023-01-11 01:00:00	1210.89
2023-01-11 02:00:00	639
2023-01-11 03:00:00	608.13
2023-01-11 04:00:00	454.8
2023-01-11 05:00:00	511.54
2023-01-11 06:00:00	563.18
2023-01-11 07:00:00	1165.72
2023-01-11 08:00:00	721.34
2023-01-11 09:00:00	608.74
2023-01-11 10:00:00	538.9
2023-01-11 11:00:00	516.29
2023-01-11 12:00:00	481.56
2023-01-11 13:00:00	846.62
2023-01-11 14:00:00	517.34
2023-01-11 15:00:00	513.43
2023-01-11 16:00:00	511.51
2023-01-11 17:00:00	1121.6
2023-01-11 18:00:00	1176.91
2023-01-11 19:00:00	1121.29
2023-01-11 20:00:00	1979.2
2023-01-11 21:00:00	997.79
2023-01-11 22:00:00	928.8
2023-01-11 23:00:00	745.44
2023-01-12 00:00:00	779
\.


--
-- Data for Name: 2023-01-12; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."2023-01-12" (index, "Wh") FROM stdin;
2023-01-12 00:00:00	814.88
2023-01-12 01:00:00	480.31
2023-01-12 02:00:00	693.08
2023-01-12 03:00:00	617.56
2023-01-12 04:00:00	462.87
2023-01-12 05:00:00	516.26
2023-01-12 06:00:00	679.18
2023-01-12 07:00:00	1802.7
2023-01-12 08:00:00	980.42
2023-01-12 09:00:00	835.67
2023-01-12 10:00:00	705.28
2023-01-12 11:00:00	460.82
2023-01-12 12:00:00	808.74
2023-01-12 13:00:00	650.8
2023-01-12 14:00:00	1134.15
2023-01-12 15:00:00	1402.34
2023-01-12 16:00:00	691.7
2023-01-12 17:00:00	906.55
2023-01-12 18:00:00	1314.63
2023-01-12 19:00:00	1326.08
2023-01-12 20:00:00	1262.47
2023-01-12 21:00:00	873.15
2023-01-12 22:00:00	728.85
2023-01-12 23:00:00	584.87
2023-01-13 00:00:00	455
\.


--
-- Data for Name: 2023-01-13; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."2023-01-13" (index, "Wh") FROM stdin;
2023-01-13 00:00:00	479.56
2023-01-13 01:00:00	487.59
2023-01-13 02:00:00	513.17
2023-01-13 03:00:00	452.78
2023-01-13 04:00:00	510.65
2023-01-13 05:00:00	447.46
2023-01-13 06:00:00	671.26
2023-01-13 07:00:00	962.81
2023-01-13 08:00:00	783.2
2023-01-13 09:00:00	1073.41
2023-01-13 10:00:00	934.18
2023-01-13 11:00:00	1083.84
2023-01-13 12:00:00	950.6
2023-01-13 13:00:00	1068.57
2023-01-13 14:00:00	848.64
2023-01-13 15:00:00	801.12
2023-01-13 16:00:00	655.26
2023-01-13 17:00:00	1158.72
2023-01-13 18:00:00	1110.92
2023-01-13 19:00:00	1223.32
2023-01-13 20:00:00	1357.29
2023-01-13 21:00:00	804.55
2023-01-13 22:00:00	837.03
2023-01-13 23:00:00	721.53
2023-01-14 00:00:00	441
\.


--
-- Data for Name: 2023-01-14; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."2023-01-14" (index, "Wh") FROM stdin;
2023-01-14 00:00:00	475.41
2023-01-14 01:00:00	510.7
2023-01-14 02:00:00	508.11
2023-01-14 03:00:00	453.61
2023-01-14 04:00:00	526
2023-01-14 05:00:00	447.33
2023-01-14 06:00:00	501.35
2023-01-14 07:00:00	516.51
2023-01-14 08:00:00	1797.24
2023-01-14 09:00:00	1924.18
2023-01-14 10:00:00	1237.31
2023-01-14 11:00:00	1314.77
2023-01-14 12:00:00	802.59
2023-01-14 13:00:00	1729.55
2023-01-14 14:00:00	863.54
2023-01-14 15:00:00	499.41
2023-01-14 16:00:00	407.32
2023-01-14 17:00:00	581.31
2023-01-14 18:00:00	711.42
2023-01-14 19:00:00	493.29
2023-01-14 20:00:00	856.83
2023-01-14 21:00:00	803.81
2023-01-14 22:00:00	806.35
2023-01-14 23:00:00	529.79
2023-01-15 00:00:00	591
\.


--
-- Data for Name: 2023-01-15; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."2023-01-15" (index, "Wh") FROM stdin;
2023-01-15 00:00:00	475.97
2023-01-15 01:00:00	478.73
2023-01-15 02:00:00	463.71
2023-01-15 03:00:00	1081.42
2023-01-15 04:00:00	710.58
2023-01-15 05:00:00	581.4
2023-01-15 06:00:00	480.76
2023-01-15 07:00:00	997.81
2023-01-15 08:00:00	1680.74
2023-01-15 09:00:00	1020.25
2023-01-15 10:00:00	730.48
2023-01-15 11:00:00	1015.68
2023-01-15 12:00:00	1513.75
2023-01-15 13:00:00	1192.14
2023-01-15 14:00:00	1024.58
2023-01-15 15:00:00	935.9
2023-01-15 16:00:00	872.62
2023-01-15 17:00:00	1007.46
2023-01-15 18:00:00	1534.02
2023-01-15 19:00:00	1700.09
2023-01-15 20:00:00	1646.92
2023-01-15 21:00:00	1029.3
2023-01-15 22:00:00	531.98
2023-01-15 23:00:00	537.51
2023-01-16 00:00:00	466
\.


--
-- Data for Name: 2023-01-16; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."2023-01-16" (index, "Wh") FROM stdin;
2023-01-16 00:00:00	1035.25
2023-01-16 01:00:00	997.71
2023-01-16 02:00:00	781.58
2023-01-16 03:00:00	739.14
2023-01-16 04:00:00	535.31
2023-01-16 05:00:00	437.06
2023-01-16 06:00:00	559.53
2023-01-16 07:00:00	1377.01
2023-01-16 08:00:00	524.91
2023-01-16 09:00:00	276.84
2023-01-16 10:00:00	271.21
2023-01-16 11:00:00	216.4
2023-01-16 12:00:00	301.5
2023-01-16 13:00:00	276.53
2023-01-16 14:00:00	858.33
2023-01-16 15:00:00	774.26
2023-01-16 16:00:00	689.07
2023-01-16 17:00:00	953.86
2023-01-16 18:00:00	1101.23
2023-01-16 19:00:00	900.87
2023-01-16 20:00:00	878.09
2023-01-16 21:00:00	881.64
2023-01-16 22:00:00	637.76
2023-01-16 23:00:00	460.48
2023-01-17 00:00:00	430
\.


--
-- Data for Name: 2023-01-17; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."2023-01-17" (index, "Wh") FROM stdin;
2023-01-17 00:00:00	627.06
2023-01-17 01:00:00	552.16
2023-01-17 02:00:00	507.95
2023-01-17 03:00:00	470.69
2023-01-17 04:00:00	339.65
2023-01-17 05:00:00	204.56
2023-01-17 06:00:00	178.21
2023-01-17 07:00:00	581.68
2023-01-17 08:00:00	1523.03
2023-01-17 09:00:00	1313.34
2023-01-17 10:00:00	1387
2023-01-17 11:00:00	990.69
2023-01-17 12:00:00	977.64
2023-01-17 13:00:00	1058.72
2023-01-17 14:00:00	2007.62
2023-01-17 15:00:00	1832.72
2023-01-17 16:00:00	983.17
2023-01-17 17:00:00	1693.53
2023-01-17 18:00:00	1577.12
2023-01-17 19:00:00	2081.55
2023-01-17 20:00:00	1401.96
2023-01-17 21:00:00	973.52
2023-01-17 22:00:00	734.07
2023-01-17 23:00:00	562.65
2023-01-18 00:00:00	461
\.


--
-- Data for Name: 2023-01-18; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."2023-01-18" (index, "Wh") FROM stdin;
2023-01-18 00:00:00	542.53
2023-01-18 01:00:00	980.41
2023-01-18 02:00:00	1183.04
2023-01-18 03:00:00	495.29
2023-01-18 04:00:00	511.91
2023-01-18 05:00:00	449.78
2023-01-18 06:00:00	915.12
2023-01-18 07:00:00	902.43
2023-01-18 08:00:00	2063.15
2023-01-18 09:00:00	1883.69
2023-01-18 10:00:00	995.53
2023-01-18 11:00:00	856.79
2023-01-18 12:00:00	935.71
2023-01-18 13:00:00	1022.53
2023-01-18 14:00:00	930.86
2023-01-18 15:00:00	1444
2023-01-18 16:00:00	910.98
2023-01-18 17:00:00	1085.72
2023-01-18 18:00:00	1286.04
2023-01-18 19:00:00	1306.33
2023-01-18 20:00:00	954.42
2023-01-18 21:00:00	999.59
2023-01-18 22:00:00	741.03
2023-01-18 23:00:00	468.13
2023-01-19 00:00:00	480
\.


--
-- Data for Name: avg; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.avg (index, "kWh") FROM stdin;
2023-01-01	10.56
2023-01-02	21.93
2023-01-03	18.92
2023-01-04	14.26
2023-01-05	15.62
2023-01-06	19.11
2023-01-07	14.94
2023-01-08	18.02
2023-01-09	21.22
2023-01-10	19.91
2023-01-11	19.26
2023-01-12	20.73
2023-01-13	19.94
2023-01-14	19.3
2023-01-15	23.24
2023-01-16	16.47
2023-01-17	24.56
2023-01-18	23.87
\.


--
-- Name: ix_2023-01-01_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "ix_2023-01-01_index" ON public."2023-01-01" USING btree (index);


--
-- Name: ix_2023-01-02_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "ix_2023-01-02_index" ON public."2023-01-02" USING btree (index);


--
-- Name: ix_2023-01-03_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "ix_2023-01-03_index" ON public."2023-01-03" USING btree (index);


--
-- Name: ix_2023-01-04_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "ix_2023-01-04_index" ON public."2023-01-04" USING btree (index);


--
-- Name: ix_2023-01-05_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "ix_2023-01-05_index" ON public."2023-01-05" USING btree (index);


--
-- Name: ix_2023-01-06_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "ix_2023-01-06_index" ON public."2023-01-06" USING btree (index);


--
-- Name: ix_2023-01-07_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "ix_2023-01-07_index" ON public."2023-01-07" USING btree (index);


--
-- Name: ix_2023-01-08_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "ix_2023-01-08_index" ON public."2023-01-08" USING btree (index);


--
-- Name: ix_2023-01-09_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "ix_2023-01-09_index" ON public."2023-01-09" USING btree (index);


--
-- Name: ix_2023-01-10_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "ix_2023-01-10_index" ON public."2023-01-10" USING btree (index);


--
-- Name: ix_2023-01-11_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "ix_2023-01-11_index" ON public."2023-01-11" USING btree (index);


--
-- Name: ix_2023-01-12_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "ix_2023-01-12_index" ON public."2023-01-12" USING btree (index);


--
-- Name: ix_2023-01-13_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "ix_2023-01-13_index" ON public."2023-01-13" USING btree (index);


--
-- Name: ix_2023-01-14_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "ix_2023-01-14_index" ON public."2023-01-14" USING btree (index);


--
-- Name: ix_2023-01-15_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "ix_2023-01-15_index" ON public."2023-01-15" USING btree (index);


--
-- Name: ix_2023-01-16_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "ix_2023-01-16_index" ON public."2023-01-16" USING btree (index);


--
-- Name: ix_2023-01-17_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "ix_2023-01-17_index" ON public."2023-01-17" USING btree (index);


--
-- Name: ix_2023-01-18_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "ix_2023-01-18_index" ON public."2023-01-18" USING btree (index);


--
-- Name: ix_avg_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_avg_index ON public.avg USING btree (index);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--
