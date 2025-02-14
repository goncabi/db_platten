--
-- PostgreSQL database dump
--

-- Dumped from database version 12.18 (Debian 12.18-1.pgdg110+2)
-- Dumped by pg_dump version 16.6 (Ubuntu 16.6-0ubuntu0.24.04.1)

-- Started on 2025-02-14 16:23:04 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 205 (class 1259 OID 386966)
-- Name: ablageort; Type: TABLE; Schema: public; Owner: db_platten_user
--

CREATE TABLE public.ablageort (
    ablageort_id integer NOT NULL,
    standort character varying(30) NOT NULL,
    regal_nr integer NOT NULL,
    fach_nr integer NOT NULL
);


ALTER TABLE public.ablageort OWNER TO db_platten_user;

--
-- TOC entry 203 (class 1259 OID 386955)
-- Name: genre; Type: TABLE; Schema: public; Owner: db_platten_user
--

CREATE TABLE public.genre (
    genre_id integer NOT NULL,
    genre_name character varying(20) NOT NULL
);


ALTER TABLE public.genre OWNER TO db_platten_user;

--
-- TOC entry 208 (class 1259 OID 387155)
-- Name: hat_genre; Type: TABLE; Schema: public; Owner: db_platten_user
--

CREATE TABLE public.hat_genre (
    genre_id integer NOT NULL,
    platte_id integer NOT NULL
);


ALTER TABLE public.hat_genre OWNER TO db_platten_user;

--
-- TOC entry 209 (class 1259 OID 387170)
-- Name: interpretiert_von; Type: TABLE; Schema: public; Owner: db_platten_user
--

CREATE TABLE public.interpretiert_von (
    platte_id integer NOT NULL,
    kuenst_id integer NOT NULL
);


ALTER TABLE public.interpretiert_von OWNER TO db_platten_user;

--
-- TOC entry 204 (class 1259 OID 386960)
-- Name: kuenstlerin; Type: TABLE; Schema: public; Owner: db_platten_user
--

CREATE TABLE public.kuenstlerin (
    kuenst_id integer NOT NULL,
    kuenst_name character varying(50) NOT NULL,
    land character varying(30),
    gender character varying(20),
    CONSTRAINT kuenstlerin_gender_check CHECK (((gender)::text = ANY ((ARRAY['weiblich'::character varying, 'maennlich'::character varying, 'divers'::character varying, 'Gruppe'::character varying])::text[])))
);


ALTER TABLE public.kuenstlerin OWNER TO db_platten_user;

--
-- TOC entry 202 (class 1259 OID 386950)
-- Name: label; Type: TABLE; Schema: public; Owner: db_platten_user
--

CREATE TABLE public.label (
    label_id integer NOT NULL,
    label_name character varying(30) NOT NULL,
    land character varying(30)
);


ALTER TABLE public.label OWNER TO db_platten_user;

--
-- TOC entry 206 (class 1259 OID 386974)
-- Name: platte; Type: TABLE; Schema: public; Owner: db_platten_user
--

CREATE TABLE public.platte (
    platte_id integer NOT NULL,
    label_id integer,
    ablageort_id integer,
    artikel_nr character varying(10),
    titel character varying(30) NOT NULL,
    veroeffdatum date,
    zustand_huelle character varying(15) DEFAULT 'gut'::character varying,
    gebrauchsspuren character varying DEFAULT 'Keine'::character varying,
    matrizen_nr integer,
    geschwindigkeit integer,
    groesse character varying(10),
    laufzeit time without time zone,
    einkaufsdatum date,
    einkaufspreis double precision,
    verkaufsdatum date,
    verkaufspreis double precision,
    CONSTRAINT gebrauchsspuren_check CHECK (((gebrauchsspuren)::text = ANY ((ARRAY['Keine'::character varying, 'Leichte'::character varying, 'Schwere'::character varying])::text[]))),
    CONSTRAINT platte_zustand_huelle_check CHECK (((zustand_huelle)::text = ANY ((ARRAY['sehr gut'::character varying, 'gut'::character varying, 'mittelmaessig'::character varying, 'schlecht'::character varying])::text[])))
);


ALTER TABLE public.platte OWNER TO db_platten_user;

--
-- TOC entry 207 (class 1259 OID 387014)
-- Name: track; Type: TABLE; Schema: public; Owner: db_platten_user
--

CREATE TABLE public.track (
    track_id integer NOT NULL,
    track_nr integer NOT NULL,
    titel character varying(30) NOT NULL,
    laenge interval,
    ab_seite character(1),
    bpm integer,
    platte_id integer NOT NULL,
    CONSTRAINT track_ab_seite_check CHECK ((ab_seite = ANY (ARRAY['A'::bpchar, 'B'::bpchar])))
);


ALTER TABLE public.track OWNER TO db_platten_user;

--
-- TOC entry 3012 (class 0 OID 386966)
-- Dependencies: 205
-- Data for Name: ablageort; Type: TABLE DATA; Schema: public; Owner: db_platten_user
--

COPY public.ablageort (ablageort_id, standort, regal_nr, fach_nr) FROM stdin;
1	Berlin	1	1
2	Berlin	1	2
3	Hamburg	2	3
4	Muenchen	3	1
5	Koeln	4	4
6	Frankfurt	5	5
7	Stuttgart	6	2
8	Leipzig	7	3
9	Dresden	8	1
10	Bremen	9	4
11	Hannover	10	2
12	Dortmund	11	3
13	Essen	12	5
14	Duisburg	13	1
15	Nuernberg	14	2
16	Dusseldorf	15	3
17	Bonn	16	4
18	Mannheim	17	1
19	Wiesbaden	18	2
20	Mainz	19	3
21	Karlsruhe	20	4
22	Freiburg	21	5
23	Kiel	22	1
24	Rostock	23	2
25	Erfurt	24	3
26	Magdeburg	25	4
27	Potsdam	26	1
28	Luebeck	27	2
29	Saarbruecken	28	3
30	Augsburg	29	4
31	Gera	30	5
32	Chemnitz	31	1
33	Ulm	32	2
34	Heidelberg	33	3
35	Oldenburg	34	4
36	Goettingen	35	5
37	Reutlingen	36	1
38	Wuerzburg	37	2
39	Heilbronn	38	3
40	Paderborn	39	4
41	Regensburg	40	5
42	Cottbus	41	1
43	Jena	42	2
44	Kassel	43	3
45	Flensburg	44	4
46	Osnabrueck	45	5
47	Ludwigshafen	46	1
48	Bielefeld	47	2
49	Siegen	48	3
50	Gelsenkirchen	49	4
51	Wolfsburg	50	5
52	Bochum	51	1
53	Krefeld	52	2
54	Hamm	53	3
55	Rheine	54	4
56	Darmstadt	55	5
57	Worms	56	1
58	Offenbach	57	2
59	Zwickau	58	3
60	Trier	59	4
61	Marburg	60	5
62	Aachen	61	1
63	Fuerth	62	2
64	Herne	63	3
65	Muelheim	64	4
66	Neuss	65	5
67	Solingen	66	1
68	Dueren	67	2
69	Bayreuth	68	3
70	Fuerstenfeldbruck	69	4
71	Lueneburg	70	5
72	Passau	71	1
73	Landshut	72	2
74	Villingen	73	3
75	Schweinfurt	74	4
76	Coburg	75	5
77	Stralsund	76	1
78	Lippstadt	77	2
79	Gera	78	3
80	Neubrandenburg	79	4
81	Frankfurt Oder	80	5
82	Strasbourg	81	1
83	Nancy	82	2
84	Metz	83	3
85	Luxemburg	84	4
86	Brugge	85	5
87	Antwerpen	86	1
88	Bruessel	87	2
89	Gent	88	3
90	Rotterdam	89	4
91	Den Haag	90	5
92	Amsterdam	91	1
93	Utrecht	92	2
94	Eindhoven	93	3
95	Arnhem	94	4
96	Groningen	95	5
97	Maastricht	96	1
98	Tilburg	97	2
99	Breda	98	3
100	Nijmegen	99	4
\.


--
-- TOC entry 3010 (class 0 OID 386955)
-- Dependencies: 203
-- Data for Name: genre; Type: TABLE DATA; Schema: public; Owner: db_platten_user
--

COPY public.genre (genre_id, genre_name) FROM stdin;
1	Rock
2	Pop
3	Jazz
4	Klassik
5	Hip-Hop
6	Salsa
7	Blues
8	Reggae
9	Electronic
10	Country
11	Folk
12	Funk
13	Metal
14	Punk
15	Soul
16	Disco
17	Gospel
18	Latin
19	R&B
20	Alternative Rock
21	Hard Rock
22	Progressive Rock
23	Indie Rock
24	Psychedelic Rock
25	New Wave
26	Synthpop
27	Dubstep
28	Techno
29	House
30	Trance
31	Drum and Bass
32	Trap
33	Grunge
34	Post-Punk
35	Industrial
36	Shoegaze
37	Chillout
38	Lo-Fi
39	Afrobeat
40	K-Pop
41	J-Pop
42	Bossa Nova
43	Flamenco
44	Cumbia
45	Merengue
46	Tango
47	Bachata
48	Reggaeton
49	Bolero
50	Opera
51	Death Metal
52	Black Metal
53	Doom Metal
54	Thrash Metal
55	Speed Metal
56	Power Metal
57	Progressive Metal
58	Post-Rock
59	Math Rock
60	Art Rock
61	Experimental
62	Baroque
63	Chamber Music
64	Orchestral
65	Chiptune
66	Breakbeat
67	Electro Swing
68	Trip-Hop
69	Vaporwave
70	Ambient
71	Minimalism
72	Future Bass
73	Garage Rock
74	Ska
75	Bluegrass
76	Zydeco
77	Glam Rock
78	Shoegaze
79	No Wave
80	Post-Hardcore
81	Emo
82	Screamo
83	Post-Industrial
84	Dream Pop
85	Noise Rock
86	Yacht Rock
87	Skiffle
88	Surf Rock
89	Rock and Roll
90	Western Swing
91	Freestyle
92	Schlager
93	Neue Deutsche Welle
94	Dancehall
95	Gqom
96	Kwaito
97	Zouk
98	Highlife
99	Ethno Jazz
100	Neo Soul
\.


--
-- TOC entry 3015 (class 0 OID 387155)
-- Dependencies: 208
-- Data for Name: hat_genre; Type: TABLE DATA; Schema: public; Owner: db_platten_user
--

COPY public.hat_genre (genre_id, platte_id) FROM stdin;
1	1
2	2
3	3
1	4
5	5
6	6
7	7
2	8
6	9
3	10
3	11
3	12
3	13
5	77
3	14
1	14
4	15
2	15
5	16
3	16
6	17
4	17
7	18
5	18
8	19
6	19
9	20
7	20
10	21
8	21
11	22
9	22
12	23
10	23
1	24
11	24
2	25
12	25
3	26
13	26
4	27
14	27
5	28
15	28
6	29
16	29
7	30
17	30
8	31
18	31
9	32
19	32
10	33
20	33
11	34
21	34
12	35
22	35
1	36
23	36
2	37
24	37
3	38
25	38
4	39
26	39
5	40
27	40
6	41
28	41
7	42
29	42
8	43
30	43
9	44
31	44
10	45
32	45
11	46
33	46
12	47
34	47
1	48
35	48
2	49
36	49
3	50
37	50
4	51
38	51
5	52
39	52
6	53
40	53
7	54
41	54
8	55
42	55
9	56
43	56
10	57
44	57
11	58
45	58
12	59
46	59
1	60
47	60
2	61
48	61
3	62
49	62
4	63
50	63
5	64
51	64
6	65
52	65
\.


--
-- TOC entry 3016 (class 0 OID 387170)
-- Dependencies: 209
-- Data for Name: interpretiert_von; Type: TABLE DATA; Schema: public; Owner: db_platten_user
--

COPY public.interpretiert_von (platte_id, kuenst_id) FROM stdin;
1	1
2	2
3	3
4	4
5	5
6	6
7	7
8	8
9	9
10	7
11	7
12	7
13	7
14	1
16	1
22	1
15	54
17	19
34	19
69	19
18	19
37	19
19	50
49	50
20	39
24	23
25	6
93	6
26	32
60	32
27	48
92	48
28	13
36	13
29	56
30	47
31	22
33	17
43	18
62	28
82	55
61	43
95	50
79	25
70	25
53	54
52	30
55	10
66	38
81	50
23	24
91	40
85	32
72	33
99	33
83	19
98	19
77	77
58	60
59	61
60	62
61	63
62	64
63	65
64	66
65	67
66	68
67	69
68	70
69	71
70	72
71	73
72	74
73	75
74	76
75	77
76	78
78	80
79	81
80	82
81	83
82	84
83	85
84	86
85	87
86	88
87	89
88	90
89	91
90	92
91	93
92	94
93	95
94	96
95	97
96	98
97	99
98	100
99	1
100	19
\.


--
-- TOC entry 3011 (class 0 OID 386960)
-- Dependencies: 204
-- Data for Name: kuenstlerin; Type: TABLE DATA; Schema: public; Owner: db_platten_user
--

COPY public.kuenstlerin (kuenst_id, kuenst_name, land, gender) FROM stdin;
1	The Beatles	UK	Gruppe
2	Aretha Franklin	USA	weiblich
3	Billie Holiday	USA	weiblich
4	Nina Hagen	Deutschland	weiblich
5	Tupac Shakur	USA	maennlich
6	Celia Cruz	Kuba	weiblich
7	Nina Simone	USA	weiblich
8	Bluemchen	Deutschland	weiblich
9	Buena Vista Social Club	Kuba	Gruppe
10	Bob Dylan	USA	maennlich
11	David Bowie	UK	maennlich
12	Björk	Island	weiblich
13	Freddie Mercury	UK	maennlich
14	Madonna	USA	weiblich
15	Beyoncé	USA	weiblich
16	Frank Sinatra	USA	maennlich
17	Bob Marley	Jamaika	maennlich
18	Prince	USA	maennlich
19	Michael Jackson	USA	maennlich
20	Johnny Cash	USA	maennlich
21	Whitney Houston	USA	weiblich
22	Eminem	USA	maennlich
23	Adele	UK	weiblich
24	Kurt Cobain	USA	maennlich
25	Rihanna	Barbados	weiblich
26	Janis Joplin	USA	weiblich
27	Paul McCartney	UK	maennlich
28	Jimi Hendrix	USA	maennlich
29	Patti Smith	USA	weiblich
30	Elton John	UK	maennlich
31	Joni Mitchell	Kanada	weiblich
32	Bruce Springsteen	USA	maennlich
33	Ray Charles	USA	maennlich
34	Dolly Parton	USA	weiblich
35	Stevie Wonder	USA	maennlich
36	Mariah Carey	USA	weiblich
37	Kanye West	USA	maennlich
38	Shakira	Kolumbien	weiblich
39	Luis Miguel	Mexiko	maennlich
40	Amy Winehouse	UK	weiblich
41	Tina Turner	USA	weiblich
42	Cher	USA	weiblich
43	Carlos Santana	Mexiko	maennlich
44	Rod Stewart	UK	maennlich
45	Eric Clapton	UK	maennlich
46	Tom Jones	Wales	maennlich
47	Cyndi Lauper	USA	weiblich
48	Mick Jagger	UK	maennlich
49	Fela Kuti	Nigeria	maennlich
50	James Brown	USA	maennlich
51	Ed Sheeran	UK	maennlich
52	Bill Withers	USA	maennlich
53	George Michael	UK	maennlich
54	John Lennon	UK	maennlich
55	Simon & Garfunkel	USA	Gruppe
56	Taylor Swift	USA	weiblich
57	Youssou NDour	Senegal	maennlich
58	Anoushka Shankar	Indien	weiblich
59	Andrea Bocelli	Italien	maennlich
60	Lana Del Rey	USA	weiblich
61	Daft Punk	Frankreich	Gruppe
62	Enrique Iglesias	Spanien	maennlich
63	Daddy Yankee	Puerto Rico	maennlich
64	Gustavo Cerati	Argentinien	maennlich
65	Cafe Tacuba	Mexiko	Gruppe
66	Arijit Singh	Indien	maennlich
67	Laura Pausini	Italien	weiblich
68	Manu Chao	Frankreich	maennlich
69	Foster the People	USA	Gruppe
70	Blackpink	Suedkorea	Gruppe
71	IU	Suedkorea	weiblich
72	EXO	Suedkorea	Gruppe
73	Maluma	Kolumbien	maennlich
74	Tarkan	Tuerkei	maennlich
75	AR Rahman	Indien	maennlich
76	Sia	Australien	weiblich
77	Coldplay	UK	Gruppe
78	Bruno Mars	USA	maennlich
79	FKA Twigs	UK	weiblich
80	Ravi Shankar	Indien	maennlich
81	Sezen Aksu	Tuerkei	weiblich
82	Los Fabulosos Cadillacs	Argentinien	Gruppe
83	Soda Stereo	Argentinien	Gruppe
84	PSY	Suedkorea	maennlich
85	Bad Bunny	Puerto Rico	maennlich
86	Gorillaz	UK	Gruppe
87	Camila Cabello	Kuba	weiblich
88	Rosalia	Spanien	weiblich
89	Fito Paez	Argentinien	maennlich
90	Juan Luis Guerra	Dominikanische Republik	maennlich
91	Luis Fonsi	Puerto Rico	maennlich
92	Noel Gallagher	UK	maennlich
93	Alicia Keys	USA	weiblich
94	Luis Alberto Spinetta	Argentinien	maennlich
95	Karol G	Kolumbien	weiblich
96	Shreya Ghoshal	Indien	weiblich
97	BTS	Suedkorea	Gruppe
98	Rammstein	Deutschland	Gruppe
99	Zaz	Frankreich	weiblich
100	Sarah Brightman	UK	weiblich
\.


--
-- TOC entry 3009 (class 0 OID 386950)
-- Dependencies: 202
-- Data for Name: label; Type: TABLE DATA; Schema: public; Owner: db_platten_user
--

COPY public.label (label_id, label_name, land) FROM stdin;
1	EMI	UK
2	Sony Music	USA
3	Blue Note	USA
4	Deutsche Grammophon	Deutschland
5	Death Row Records	USA
6	Fania Records	Kuba
7	ABC-Paramount	USA
8	Universal	Deutschland
9	Island Records	UK
10	Columbia Records	USA
11	Atlantic Records	USA
12	Warner Music Group	USA
13	Virgin Records	UK
14	Motown Records	USA
15	Nonesuch Records	USA
16	Polydor	Deutschland
17	Geffen Records	USA
18	Sub Pop	USA
19	XL Recordings	UK
20	Def Jam Recordings	USA
21	Parlophone	UK
22	BMG Rights Management	Deutschland
23	Rough Trade Records	UK
24	Mute Records	UK
25	4AD	UK
26	Domino Recording Company	UK
27	Matador Records	USA
28	Merge Records	USA
29	Epitaph Records	USA
30	Roadrunner Records	USA
31	Napalm Records	Deutschland
32	Nuclear Blast	Deutschland
33	Spinnin Records	Niederlande
34	Armada Music	Niederlande
35	Ministry of Sound	UK
36	Interscope Records	USA
37	XL Recordings	UK
38	Top Dawg Entertainment	USA
39	Cash Money Records	USA
40	Young Money Entertainment	USA
41	RCA Records	USA
42	Republic Records	USA
43	Capitol Records	USA
44	Epic Records	USA
45	Hollywood Records	USA
46	Sony Classical	USA
47	Chrysalis Records	UK
48	Verve Records	USA
49	Sony Latin	USA
50	Pentatone	Niederlande
51	T-Series	Indien
52	Saregama	Indien
53	YG Entertainment	Suedkorea
54	SM Entertainment	Suedkorea
55	JYP Entertainment	Suedkorea
56	Big Hit Music	Suedkorea
57	Mavin Records	Nigeria
58	Chocolate City	Nigeria
59	Sony Africa	Suedafrika
60	Universal Africa	Suedafrika
61	Universal Latin	USA
62	La Industria Inc.	Kolumbien
63	Codiscos	Kolumbien
64	Sony Music Latin	USA
65	Fonovisa	Mexiko
66	Warner Latina	USA
67	DMX Music	Frankreich
68	Naive Records	Frankreich
69	Because Music	Frankreich
70	Virgin France	Frankreich
71	Universal France	Frankreich
72	Polydor France	Frankreich
73	Warner France	Frankreich
74	Ultra Music	USA
75	Spitfire Records	USA
76	Fantasy Records	USA
77	Rough Trade Germany	Deutschland
78	Sony Deutschland	Deutschland
79	Music For Nations	UK
80	Sanctuary Records	UK
81	InsideOut Music	Deutschland
82	Steamhammer	Deutschland
83	Frontiers Records	Italien
84	Napster	USA
85	Charly Records	UK
86	Relapse Records	USA
87	Century Media Records	Deutschland
88	Season of Mist	Frankreich
89	Candlelight Records	UK
90	AFM Records	Deutschland
91	Koch Records	USA
92	MCA Records	USA
93	Blackened Recordings	USA
94	Roadrunner Germany	Deutschland
95	Pony Canyon	Japan
96	King Records	Japan
97	Avex Group	Japan
98	J Storm	Japan
99	Ariola Japan	Japan
100	Victor Entertainment	Japan
\.


--
-- TOC entry 3013 (class 0 OID 386974)
-- Dependencies: 206
-- Data for Name: platte; Type: TABLE DATA; Schema: public; Owner: db_platten_user
--

COPY public.platte (platte_id, label_id, ablageort_id, artikel_nr, titel, veroeffdatum, zustand_huelle, gebrauchsspuren, matrizen_nr, geschwindigkeit, groesse, laufzeit, einkaufsdatum, einkaufspreis, verkaufsdatum, verkaufspreis) FROM stdin;
1	1	1	A123	Abbey Road	1969-01-01	sehr gut	Keine	1	33	12"	00:43:13	2023-01-15	25.5	2023-07-01	50
2	2	2	B234	Lady Soul	1968-01-01	gut	Leichte	1	33	12"	00:44:05	2023-02-10	15	2023-08-05	30
3	3	3	C345	Lady in Satin	1958-01-01	sehr gut	Keine	1	33	12"	00:39:30	2023-03-05	20	2023-09-10	45
4	4	4	D456	Unbehagen	1979-01-01	sehr gut	Keine	1	33	12"	00:42:40	2023-04-20	30	2023-10-01	55
5	5	1	E567	All Eyez on Me	1996-01-01	sehr gut	Keine	1	33	12"	01:24:30	2023-05-15	40	2023-11-01	90
6	6	5	F678	Azucar!	1974-01-01	gut	Leichte	1	33	12"	00:47:20	2023-06-10	35	\N	\N
7	3	1	G789	Pastel Blues	1965-01-01	gut	Keine	1	33	12"	00:40:10	2023-07-01	28	2023-10-01	55
8	8	1	H890	Herzfrequenz	1996-01-01	gut	Keine	1	33	12"	00:39:50	2023-08-01	18	\N	\N
9	6	5	I901	Buena Vista Social Club	1997-01-01	sehr gut	Keine	1	33	12"	00:58:30	2023-09-01	50	\N	\N
10	3	1	J123	I Put a Spell on You	1965-10-01	sehr gut	Keine	1	33	12"	00:35:10	2023-01-15	25.5	2023-07-01	50
11	3	2	K234	Wild Is the Wind	1966-01-01	gut	Leichte	1	33	12"	00:40:15	2023-02-10	15	2023-08-05	30
12	3	3	L345	Baltimore	1978-04-01	sehr gut	Keine	1	33	12"	00:42:00	2023-03-05	20	2023-09-10	45
13	3	4	M456	The Amazing Nina Simone	1959-10-01	sehr gut	Keine	1	33	12"	00:38:40	2023-04-20	30	2023-11-01	90
14	1	1	A987	Thriller	1982-11-30	sehr gut	Keine	1	33	12"	00:42:19	2024-01-10	45	2024-05-01	90
15	2	2	B876	Nevermind	1991-09-24	gut	Leichte	1	33	12"	00:49:23	2024-01-15	40	\N	\N
16	3	3	C765	The Wall	1979-11-30	mittelmaessig	Schwere	1	33	12"	01:21:09	2024-01-20	55	2024-06-15	100
17	4	4	D654	Hotel California	1976-12-08	sehr gut	Keine	1	33	12"	00:43:28	2024-01-25	50	\N	\N
18	5	5	E543	Born to Run	1975-08-25	gut	Leichte	1	33	12"	00:39:26	2024-02-01	38	2024-07-10	80
19	6	1	F432	Back in Black	1980-07-25	mittelmaessig	Schwere	1	33	12"	00:42:11	2024-02-05	60	\N	\N
20	7	2	G321	Rumours	1977-02-04	sehr gut	Keine	1	33	12"	00:45:19	2024-02-10	65	2024-08-20	120
21	8	3	H210	Dark Side of the Moon	1973-03-01	gut	Leichte	1	33	12"	00:42:49	2024-02-15	70	\N	\N
22	1	4	I109	Led Zeppelin IV	1971-11-08	mittelmaessig	Leichte	1	33	12"	00:42:34	2024-02-20	55	2024-09-01	95
23	2	5	J908	Abbey Road	1969-09-26	sehr gut	Keine	1	33	12"	00:47:03	2024-02-25	80	\N	\N
24	3	1	K807	The Beatles	1968-11-22	gut	Leichte	1	33	12"	01:33:43	2024-03-01	90	2024-10-01	150
25	4	2	L706	Revolver	1966-08-05	mittelmaessig	Schwere	1	33	12"	00:34:43	2024-03-05	40	\N	\N
26	5	3	M605	Rubber Soul	1965-12-03	sehr gut	Keine	1	33	12"	00:35:50	2024-03-10	55	2024-10-15	100
27	6	4	N504	Sgt. Peppers	1967-05-26	gut	Leichte	1	33	12"	00:39:52	2024-03-15	60	\N	\N
28	7	5	O403	A Night at the Opera	1975-11-21	mittelmaessig	Schwere	1	33	12"	00:43:08	2024-03-20	45	2024-11-01	85
29	8	1	P302	Bohemian Rhapsody	1975-10-31	sehr gut	Keine	1	33	12"	00:05:55	2024-03-25	25	\N	\N
30	1	2	Q201	Bridge Over Troubled Water	1970-01-26	gut	Leichte	1	33	12"	00:36:20	2024-04-01	35	2024-11-15	75
31	2	3	R100	Pet Sounds	1966-05-16	mittelmaessig	Schwere	1	33	12"	00:35:59	2024-04-05	40	\N	\N
32	3	4	S999	Kind of Blue	1959-08-17	sehr gut	Keine	1	33	12"	00:45:44	2024-04-10	60	2024-12-01	100
33	4	5	T888	Blue	1971-06-22	gut	Leichte	1	33	12"	00:36:35	2024-04-15	50	\N	\N
34	3	4	D876	Dark Side of the Moon	1973-03-01	sehr gut	Keine	1	33	12"	00:42:49	2024-01-10	50	2024-06-20	95
35	2	5	F987	Rumours	1977-02-04	gut	Leichte	1	33	12"	00:39:43	2024-02-05	40	2024-07-01	85
36	4	3	B543	A Night at the Opera	1975-11-21	mittelmaessig	Schwere	1	33	12"	00:43:08	2024-03-15	45	2024-08-10	80
37	1	2	G654	Thriller	1982-11-30	sehr gut	Keine	1	33	12"	00:42:19	2024-04-20	60	2024-09-05	120
38	5	1	H234	The Wall	1979-11-30	gut	Leichte	1	33	12"	01:21:09	2024-01-20	55	2024-06-15	100
39	6	5	J345	Back in Black	1980-07-25	sehr gut	Keine	1	33	12"	00:41:59	2024-03-10	50	2024-07-20	95
40	7	4	K456	Abbey Road	1969-09-26	schlecht	Schwere	1	33	12"	00:47:23	2024-02-18	35	\N	\N
41	8	3	L567	Hotel California	1976-12-08	mittelmaessig	Leichte	1	33	12"	00:43:28	2024-01-29	45	2024-05-22	75
42	3	2	M678	Led Zeppelin IV	1971-11-08	sehr gut	Keine	1	33	12"	00:42:40	2024-04-05	55	2024-10-01	110
43	2	1	N789	Purple Rain	1984-06-25	gut	Leichte	1	33	12"	00:43:54	2024-03-11	50	2024-09-12	90
44	4	5	O890	Born to Run	1975-08-25	sehr gut	Keine	1	33	12"	00:39:26	2024-02-14	40	2024-06-10	70
45	1	4	P901	The Joshua Tree	1987-03-09	mittelmaessig	Schwere	1	33	12"	00:50:12	2024-05-12	60	2024-11-05	130
46	5	3	Q012	Nevermind	1991-09-24	gut	Leichte	1	33	12"	00:42:37	2024-04-09	55	2024-08-30	105
47	6	2	R123	OK Computer	1997-05-21	sehr gut	Keine	1	33	12"	00:53:15	2024-02-17	65	2024-09-15	140
48	7	1	S234	Nevermind the Bollocks	1977-10-28	gut	Leichte	1	33	12"	00:38:15	2024-03-18	50	2024-07-18	85
49	8	5	T345	Highway to Hell	1979-07-27	sehr gut	Keine	1	33	12"	00:41:00	2024-01-25	55	2024-06-25	90
50	3	4	U456	Pet Sounds	1966-05-16	schlecht	Schwere	1	33	12"	00:36:22	2024-05-10	30	\N	\N
51	2	3	V567	Revolver	1966-08-05	mittelmaessig	Leichte	1	33	12"	00:35:01	2024-04-28	40	2024-10-20	80
52	4	2	W678	Goodbye Yellow Brick Road	1973-10-05	sehr gut	Keine	1	33	12"	00:45:32	2024-02-20	60	2024-08-12	100
53	1	1	X789	A Love Supreme	1965-12-09	gut	Leichte	1	33	12"	00:33:02	2024-03-07	50	2024-09-22	85
54	5	5	Y890	Kind of Blue	1959-08-17	sehr gut	Keine	1	33	12"	00:45:44	2024-04-13	55	2024-10-05	110
55	6	4	Z901	Bitches Brew	1970-03-30	mittelmaessig	Schwere	1	33	12"	00:52:38	2024-01-30	65	2024-07-30	120
56	7	3	A556	Let It Be	1970-05-08	sehr gut	Keine	1	33	12"	00:35:10	2024-03-01	50	2024-09-01	100
57	8	2	B667	Sticky Fingers	1971-04-23	gut	Leichte	1	33	12"	00:46:25	2024-03-05	45	\N	\N
58	3	1	C778	Brothers in Arms	1985-05-13	mittelmaessig	Schwere	1	33	12"	00:55:07	2024-03-10	40	2024-09-20	85
59	2	4	D889	The Rise and Fall of Ziggy	1972-06-16	sehr gut	Keine	1	33	12"	00:38:37	2024-03-15	60	2024-10-01	120
60	1	5	E990	Born in the USA	1984-06-04	gut	Leichte	1	33	12"	00:46:57	2024-03-20	55	\N	\N
61	5	1	F101	The Doors	1967-01-04	mittelmaessig	Schwere	1	33	12"	00:44:17	2024-03-25	45	2024-11-01	95
62	6	3	G212	Electric Ladyland	1968-10-16	sehr gut	Keine	1	33	12"	01:15:10	2024-04-01	70	2024-11-10	130
63	7	4	H323	Grace	1994-08-23	gut	Leichte	1	33	12"	00:58:12	2024-04-05	50	\N	\N
64	8	5	I434	Blue Train	1957-09-15	mittelmaessig	Schwere	1	33	12"	00:42:50	2024-04-10	40	2024-10-10	80
65	3	2	J545	Exodus	1977-06-03	sehr gut	Keine	1	33	12"	00:46:52	2024-04-15	60	\N	\N
66	2	1	K656	Tapestry	1971-02-10	gut	Leichte	1	33	12"	00:44:31	2024-04-20	55	2024-09-25	100
67	1	4	L767	Paranoid	1970-09-18	mittelmaessig	Schwere	1	33	12"	00:41:51	2024-04-25	50	\N	\N
68	5	5	M878	Who's Next	1971-08-14	sehr gut	Keine	1	33	12"	00:43:38	2024-05-01	65	2024-12-01	110
69	6	3	N989	Wish You Were Here	1975-09-12	gut	Leichte	1	33	12"	00:44:11	2024-05-05	50	\N	\N
70	7	2	O090	Blood Sugar Sex Magik	1991-09-24	mittelmaessig	Schwere	1	33	12"	00:43:55	2024-05-10	45	2024-10-15	85
71	8	1	P101	Grace Under Pressure	1984-04-12	sehr gut	Keine	1	33	12"	00:39:40	2024-05-15	55	2024-11-10	95
72	3	5	Q212	Appetite for Destruction	1987-07-21	gut	Leichte	1	33	12"	00:53:36	2024-05-20	60	\N	\N
73	2	4	R323	Moving Pictures	1981-02-12	mittelmaessig	Schwere	1	33	12"	00:39:56	2024-05-25	50	2024-12-15	100
74	1	3	S434	1984	1984-01-09	sehr gut	Keine	1	33	12"	00:42:12	2024-06-01	65	\N	\N
75	5	2	T545	Toxicity	2001-09-04	gut	Leichte	1	33	12"	00:44:01	2024-06-05	55	2024-11-20	105
76	6	1	U656	Dirt	1992-09-29	mittelmaessig	Schwere	1	33	12"	00:57:35	2024-06-10	50	\N	\N
78	3	1	V788	The Division Bell	1994-03-28	sehr gut	Keine	1	33	12"	01:06:23	2024-06-15	60	2024-11-25	110
79	4	2	W799	Californication	1999-06-08	gut	Leichte	1	33	12"	00:56:24	2024-06-20	55	\N	\N
80	5	3	X800	Black Album	1991-08-12	mittelmaessig	Schwere	1	33	12"	01:02:03	2024-06-25	50	2024-12-01	90
81	6	4	Y811	Hysteria	1987-08-03	sehr gut	Keine	1	33	12"	01:02:25	2024-07-01	65	2024-12-15	120
82	7	5	Z822	Bridge Over Troubled	1970-01-26	gut	Leichte	1	33	12"	00:36:29	2024-07-05	55	\N	\N
83	8	1	A833	Led Zeppelin II	1969-10-22	mittelmaessig	Schwere	1	33	12"	00:41:38	2024-07-10	45	2024-12-25	80
84	1	2	B844	The Bends	1995-03-13	sehr gut	Keine	1	33	12"	00:48:36	2024-07-15	60	\N	\N
85	2	3	C855	Achtung Baby	1991-11-18	gut	Leichte	1	33	12"	00:55:25	2024-07-20	55	2024-12-30	95
86	3	4	D866	Harvest	1972-02-01	mittelmaessig	Schwere	1	33	12"	00:37:12	2024-07-25	50	\N	\N
87	4	5	E877	Jagged Little Pill	1995-06-13	sehr gut	Keine	1	33	12"	00:57:18	2024-08-01	65	2024-11-30	105
88	5	1	F888	Siamese Dream	1993-07-27	gut	Leichte	1	33	12"	01:02:16	2024-08-05	55	\N	\N
89	6	2	G899	Ten	1991-08-27	mittelmaessig	Schwere	1	33	12"	00:53:20	2024-08-10	50	2024-12-20	90
90	7	3	H900	Grace	1994-08-23	sehr gut	Keine	1	33	12"	01:00:02	2024-08-15	65	\N	\N
91	8	4	I911	Back to Black	2006-10-27	gut	Leichte	1	33	12"	00:34:32	2024-08-20	55	2024-11-10	95
92	1	5	J922	Let It Bleed	1969-12-05	mittelmaessig	Schwere	1	33	12"	00:42:10	2024-08-25	50	\N	\N
93	2	1	K933	Rumours	1977-02-04	sehr gut	Keine	1	33	12"	00:39:10	2024-09-01	60	2024-11-25	110
94	3	2	L944	Nevermind	1991-09-24	gut	Leichte	1	33	12"	00:49:10	2024-09-05	55	\N	\N
95	4	3	M955	Master of Puppets	1986-03-03	mittelmaessig	Schwere	1	33	12"	00:54:10	2024-09-10	50	2024-12-01	90
96	5	4	N966	Born to Run	1975-08-25	sehr gut	Keine	1	33	12"	00:39:30	2024-09-15	65	2024-12-20	105
97	6	5	O977	Brothers in Arms	1985-05-13	gut	Leichte	1	33	12"	00:55:00	2024-09-20	55	\N	\N
98	7	1	P988	Abbey Road	1969-09-26	mittelmaessig	Schwere	1	33	12"	00:47:11	2024-09-25	50	2024-12-25	80
99	8	2	Q999	Revolver	1966-08-05	sehr gut	Keine	1	33	12"	00:34:55	2024-10-01	60	\N	\N
100	1	3	R1000	Sticky Fingers	1971-04-23	gut	Leichte	1	33	12"	00:46:00	2024-10-05	55	2024-12-30	95
77	4	3	A777	Hybrid Theory	2000-10-24	gut	Leichte	1	33	12"	00:37:45	2024-02-10	40	2024-06-15	80
\.


--
-- TOC entry 3014 (class 0 OID 387014)
-- Dependencies: 207
-- Data for Name: track; Type: TABLE DATA; Schema: public; Owner: db_platten_user
--

COPY public.track (track_id, track_nr, titel, laenge, ab_seite, bpm, platte_id) FROM stdin;
1	1	Come Together	00:04:19	A	120	1
2	2	Something	00:03:03	A	100	1
3	3	Here Comes the Sun	00:03:06	B	110	1
4	4	Octopus's Garden	00:02:51	B	95	1
5	1	Chain of Fools	00:02:47	A	125	2
6	2	A Natural Woman	00:02:45	A	110	2
7	3	People Get Ready	00:03:35	B	105	2
8	1	I'm a Fool to Want You	00:03:24	A	80	3
9	2	You Don't Know What Love Is	00:03:48	A	90	3
10	3	For Heaven's Sake	00:03:30	B	85	3
11	1	TV-Glotzer	00:05:15	A	140	4
12	2	African Reggae	00:06:25	A	130	4
13	1	California Love	00:04:45	A	95	5
14	2	2 of Amerikaz Most Wanted	00:04:07	A	105	5
15	3	How Do U Want It	00:04:47	B	100	5
16	1	Quimbara	00:03:24	A	120	6
17	2	Toro Mata	00:04:30	A	115	6
18	3	Cucala	00:04:23	B	130	6
19	1	Strange Fruit	00:03:26	A	85	7
20	2	Sinnerman	00:10:21	A	95	7
21	3	Trouble in Mind	00:05:42	B	90	7
22	1	Herz an Herz	00:03:40	A	120	8
23	2	Boomerang	00:03:20	A	125	8
24	1	Chan Chan	00:04:16	A	110	9
25	2	El Cuarto de Tula	00:07:25	A	115	9
26	3	Dos Gardenias	00:03:02	B	100	9
27	1	I Put a Spell on You	00:02:35	A	112	10
28	2	Tomorrow Is My Turn	00:02:48	A	108	10
29	3	Ne Me Quitte Pas	00:03:30	A	100	10
30	4	Feeling Good	00:02:55	A	115	10
31	5	One September Day	00:02:48	B	120	10
32	6	Blues on Purpose	00:03:15	B	123	10
33	1	Wild Is the Wind	00:03:25	A	95	11
34	2	Black Is the Color	00:03:25	A	98	11
35	3	If I Should Lose You	00:03:55	A	90	11
36	4	Either Way I Lose	00:02:45	B	92	11
37	5	Lilac Wine	00:03:15	B	88	11
38	6	That\\u2019s All I Want	00:02:05	B	105	11
39	1	Baltimore	00:04:37	A	80	12
40	2	Everything Must Change	00:03:58	A	75	12
41	3	The Family	00:04:15	A	85	12
42	4	My Father	00:04:55	B	78	12
43	5	Music for Lovers	00:03:10	B	110	12
44	6	Rich Girl	00:03:05	B	102	12
45	1	Blue Prelude	00:03:22	A	100	13
46	2	Children Go Where I Send You	00:02:55	A	110	13
47	3	Tomorrow	00:03:15	A	95	13
48	4	Stompin\\u2019 at the Savoy	00:02:10	B	120	13
49	5	It Might as Well Be Spring	00:03:50	B	98	13
50	6	You\\u2019ve Been Gone Too Long	00:02:10	B	108	13
51	1	Billie Jean	00:04:54	A	\N	14
52	2	Thriller	00:05:57	A	\N	14
53	3	Beat It	00:04:18	A	\N	14
54	1	Smells Like Teen Spirit	00:05:01	A	\N	15
55	2	Come as You Are	00:03:38	A	\N	15
56	3	Lithium	00:04:16	A	\N	15
57	1	In the Flesh?	00:03:19	A	\N	16
58	2	Another Brick in the Wall	00:05:39	A	\N	16
59	3	Comfortably Numb	00:06:22	B	\N	16
60	1	Hotel California	00:06:30	A	\N	17
61	2	New Kid in Town	00:05:04	A	\N	17
62	3	Life in the Fast Lane	00:04:46	A	\N	17
63	1	Thunderstruck	00:04:52	A	\N	18
64	2	Back in Black	00:04:15	A	\N	18
65	3	Hells Bells	00:05:12	A	\N	18
66	1	Go Your Own Way	00:03:38	A	\N	19
67	2	Dreams	00:04:14	A	\N	19
68	3	The Chain	00:04:30	B	\N	19
69	1	Bohemian Rhapsody	00:05:55	A	\N	20
70	2	Love of My Life	00:03:38	A	\N	20
71	3	Youre My Best Friend	00:02:50	B	\N	20
72	1	Time	00:07:06	A	\N	21
73	2	Money	00:06:22	A	\N	21
74	3	Us and Them	00:07:49	B	\N	21
75	1	Come Together	00:04:19	A	\N	22
76	2	Something	00:03:02	A	\N	22
77	3	Here Comes the Sun	00:03:05	B	\N	22
78	1	Highway to Hell	00:03:28	A	\N	23
79	2	If You Want Blood	00:04:32	A	\N	23
80	3	Girls Got Rhythm	00:03:24	A	\N	23
81	1	Sweet Child O Mine	00:05:56	A	\N	24
82	2	Paradise City	00:06:45	A	\N	24
83	3	Welcome to the Jungle	00:04:33	B	\N	24
84	1	Take It Easy	00:03:34	A	\N	25
85	2	Desperado	00:03:39	A	\N	25
86	3	Tequila Sunrise	00:02:52	B	\N	25
87	1	I Want to Hold Your Hand	00:02:26	A	\N	26
88	2	I Saw Her Standing There	00:02:56	A	\N	26
89	3	Twist and Shout	00:02:36	B	\N	26
90	1	Let It Be	00:04:03	A	\N	27
91	2	Across the Universe	00:03:48	A	\N	27
92	3	Get Back	00:03:12	B	\N	27
93	1	Born to Run	00:04:30	A	\N	28
94	2	Thunder Road	00:04:49	A	\N	28
95	3	Jungleland	00:09:35	B	\N	28
96	1	Billie Jean	00:04:54	A	\N	29
97	2	Thriller	00:05:57	A	\N	29
98	3	Beat It	00:04:18	A	\N	29
99	1	Paint It Black	00:03:45	A	\N	30
100	2	Gimme Shelter	00:04:37	A	\N	30
\.


--
-- TOC entry 2867 (class 2606 OID 386971)
-- Name: ablageort ablageort_pkey; Type: CONSTRAINT; Schema: public; Owner: db_platten_user
--

ALTER TABLE ONLY public.ablageort
    ADD CONSTRAINT ablageort_pkey PRIMARY KEY (ablageort_id);


--
-- TOC entry 2863 (class 2606 OID 386959)
-- Name: genre genre_pkey; Type: CONSTRAINT; Schema: public; Owner: db_platten_user
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (genre_id);


--
-- TOC entry 2873 (class 2606 OID 387159)
-- Name: hat_genre hat_genre_pkey; Type: CONSTRAINT; Schema: public; Owner: db_platten_user
--

ALTER TABLE ONLY public.hat_genre
    ADD CONSTRAINT hat_genre_pkey PRIMARY KEY (platte_id, genre_id);


--
-- TOC entry 2875 (class 2606 OID 387174)
-- Name: interpretiert_von interpretiert_von_pkey; Type: CONSTRAINT; Schema: public; Owner: db_platten_user
--

ALTER TABLE ONLY public.interpretiert_von
    ADD CONSTRAINT interpretiert_von_pkey PRIMARY KEY (platte_id, kuenst_id);


--
-- TOC entry 2865 (class 2606 OID 386965)
-- Name: kuenstlerin kuenstlerin_pkey; Type: CONSTRAINT; Schema: public; Owner: db_platten_user
--

ALTER TABLE ONLY public.kuenstlerin
    ADD CONSTRAINT kuenstlerin_pkey PRIMARY KEY (kuenst_id);


--
-- TOC entry 2861 (class 2606 OID 386954)
-- Name: label label_pkey; Type: CONSTRAINT; Schema: public; Owner: db_platten_user
--

ALTER TABLE ONLY public.label
    ADD CONSTRAINT label_pkey PRIMARY KEY (label_id);


--
-- TOC entry 2869 (class 2606 OID 386981)
-- Name: platte platte_pkey; Type: CONSTRAINT; Schema: public; Owner: db_platten_user
--

ALTER TABLE ONLY public.platte
    ADD CONSTRAINT platte_pkey PRIMARY KEY (platte_id);


--
-- TOC entry 2871 (class 2606 OID 387019)
-- Name: track track_pkey; Type: CONSTRAINT; Schema: public; Owner: db_platten_user
--

ALTER TABLE ONLY public.track
    ADD CONSTRAINT track_pkey PRIMARY KEY (track_id);


--
-- TOC entry 2879 (class 2606 OID 387160)
-- Name: hat_genre hat_genre_genre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: db_platten_user
--

ALTER TABLE ONLY public.hat_genre
    ADD CONSTRAINT hat_genre_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES public.genre(genre_id) ON DELETE RESTRICT;


--
-- TOC entry 2880 (class 2606 OID 387165)
-- Name: hat_genre hat_genre_platte_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: db_platten_user
--

ALTER TABLE ONLY public.hat_genre
    ADD CONSTRAINT hat_genre_platte_id_fkey FOREIGN KEY (platte_id) REFERENCES public.platte(platte_id) ON DELETE CASCADE;


--
-- TOC entry 2881 (class 2606 OID 387180)
-- Name: interpretiert_von interpretiert_von_kuenst_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: db_platten_user
--

ALTER TABLE ONLY public.interpretiert_von
    ADD CONSTRAINT interpretiert_von_kuenst_id_fkey FOREIGN KEY (kuenst_id) REFERENCES public.kuenstlerin(kuenst_id) ON DELETE RESTRICT;


--
-- TOC entry 2882 (class 2606 OID 387175)
-- Name: interpretiert_von interpretiert_von_platte_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: db_platten_user
--

ALTER TABLE ONLY public.interpretiert_von
    ADD CONSTRAINT interpretiert_von_platte_id_fkey FOREIGN KEY (platte_id) REFERENCES public.platte(platte_id) ON DELETE CASCADE;


--
-- TOC entry 2876 (class 2606 OID 386987)
-- Name: platte platte_ablage_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: db_platten_user
--

ALTER TABLE ONLY public.platte
    ADD CONSTRAINT platte_ablage_id_fkey FOREIGN KEY (ablageort_id) REFERENCES public.ablageort(ablageort_id);


--
-- TOC entry 2877 (class 2606 OID 386982)
-- Name: platte platte_label_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: db_platten_user
--

ALTER TABLE ONLY public.platte
    ADD CONSTRAINT platte_label_id_fkey FOREIGN KEY (label_id) REFERENCES public.label(label_id) ON DELETE RESTRICT;


--
-- TOC entry 2878 (class 2606 OID 387020)
-- Name: track track_platte_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: db_platten_user
--

ALTER TABLE ONLY public.track
    ADD CONSTRAINT track_platte_id_fkey FOREIGN KEY (platte_id) REFERENCES public.platte(platte_id) ON DELETE CASCADE;


--
-- TOC entry 3022 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- TOC entry 3023 (class 0 OID 0)
-- Dependencies: 205
-- Name: TABLE ablageort; Type: ACL; Schema: public; Owner: db_platten_user
--

GRANT ALL ON TABLE public.ablageort TO s0592157;
GRANT SELECT ON TABLE public.ablageort TO s0592799;


--
-- TOC entry 3024 (class 0 OID 0)
-- Dependencies: 203
-- Name: TABLE genre; Type: ACL; Schema: public; Owner: db_platten_user
--

GRANT ALL ON TABLE public.genre TO s0592157;
GRANT SELECT ON TABLE public.genre TO s0592799;


--
-- TOC entry 3025 (class 0 OID 0)
-- Dependencies: 208
-- Name: TABLE hat_genre; Type: ACL; Schema: public; Owner: db_platten_user
--

GRANT ALL ON TABLE public.hat_genre TO s0592157;
GRANT SELECT ON TABLE public.hat_genre TO s0592799;


--
-- TOC entry 3026 (class 0 OID 0)
-- Dependencies: 209
-- Name: TABLE interpretiert_von; Type: ACL; Schema: public; Owner: db_platten_user
--

GRANT ALL ON TABLE public.interpretiert_von TO s0592157;
GRANT SELECT ON TABLE public.interpretiert_von TO s0592799;


--
-- TOC entry 3027 (class 0 OID 0)
-- Dependencies: 204
-- Name: TABLE kuenstlerin; Type: ACL; Schema: public; Owner: db_platten_user
--

GRANT ALL ON TABLE public.kuenstlerin TO s0592157;
GRANT SELECT ON TABLE public.kuenstlerin TO s0592799;


--
-- TOC entry 3028 (class 0 OID 0)
-- Dependencies: 202
-- Name: TABLE label; Type: ACL; Schema: public; Owner: db_platten_user
--

GRANT ALL ON TABLE public.label TO s0592157;
GRANT SELECT ON TABLE public.label TO s0592799;


--
-- TOC entry 3029 (class 0 OID 0)
-- Dependencies: 206
-- Name: TABLE platte; Type: ACL; Schema: public; Owner: db_platten_user
--

GRANT ALL ON TABLE public.platte TO s0592157;
GRANT SELECT ON TABLE public.platte TO s0592799;


--
-- TOC entry 3030 (class 0 OID 0)
-- Dependencies: 207
-- Name: TABLE track; Type: ACL; Schema: public; Owner: db_platten_user
--

GRANT ALL ON TABLE public.track TO s0592157;
GRANT SELECT ON TABLE public.track TO s0592799;


-- Completed on 2025-02-14 16:23:08 CET

--
-- PostgreSQL database dump complete
--

