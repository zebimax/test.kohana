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

CREATE TABLE countries (
    id smallint NOT NULL,
    iso3_code character(3) NOT NULL,
    name character varying(64) NOT NULL,
    deleted boolean DEFAULT false NOT NULL
);


ALTER TABLE public.countries OWNER TO ajax;

--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: ajax
--

CREATE SEQUENCE countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.countries_id_seq OWNER TO ajax;

--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ajax
--

ALTER SEQUENCE countries_id_seq OWNED BY countries.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: ajax; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying(32) NOT NULL,
    last_name character varying(64) NOT NULL,
    email character varying(255) NOT NULL,
    address text,
    city character varying(255) NOT NULL,
    country_id smallint NOT NULL,
    deleted boolean default false
);


ALTER TABLE public.users OWNER TO ajax;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: ajax
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO ajax;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ajax
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ajax
--

ALTER TABLE ONLY countries ALTER COLUMN id SET DEFAULT nextval('countries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ajax
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: ajax
--

COPY countries (id, iso3_code, name, deleted) FROM stdin;
1	AND	Andorra	f
2	ARE	United Arab Emirates	f
3	AFG	Afghanistan	f
4	ATG	Antigua and Barbuda	f
5	AIA	Anguilla	f
6	ALB	Albania	f
7	ARM	Armenia	f
8	AGO	Angola	f
9	ATA	Antarctica	f
10	ARG	Argentina	f
11	ASM	American Samoa	f
12	AUT	Austria	f
13	AUS	Australia	f
14	ABW	Aruba	f
15	ALA	Aland Islands	f
16	AZE	Azerbaijan	f
17	BIH	Bosnia and Herzegovina	f
18	BRB	Barbados	f
19	BGD	Bangladesh	f
20	BEL	Belgium	f
21	BFA	Burkina Faso	f
22	BGR	Bulgaria	f
23	BHR	Bahrain	f
24	BDI	Burundi	f
25	BEN	Benin	f
26	BLM	Saint Barthelemy	f
27	BMU	Bermuda	f
28	BRN	Brunei Darussalam	f
29	BOL	Bolivia, Plurinational State of	f
30	BES	Bonaire, Sint Eustatius and Saba	f
31	BRA	Brazil	f
32	BHS	Bahamas	f
33	BTN	Bhutan	f
34	BVT	Bouvet Island	f
35	BWA	Botswana	f
36	BLR	Belarus	f
37	BLZ	Belize	f
38	CAN	Canada	f
39	CCK	Cocos (Keeling) Islands	f
40	COD	Congo, the Democratic Republic of the	f
41	CAF	Central African Republic	f
42	COG	Congo	f
43	CHE	Switzerland	f
44	CIV	Cote d''Ivoire	f
45	COK	Cook Islands	f
46	CHL	Chile	f
47	CMR	Cameroon	f
48	CHN	China	f
49	COL	Colombia	f
50	CRI	Costa Rica	f
51	CUB	Cuba	f
52	CPV	Cape Verde	f
53	CUW	Curacao	f
54	CXR	Christmas Island	f
55	CYP	Cyprus	f
56	CZE	Czech Republic	f
57	DEU	Germany	f
58	DJI	Djibouti	f
59	DNK	Denmark	f
60	DMA	Dominica	f
61	DOM	Dominican Republic	f
62	DZA	Algeria	f
63	ECU	Ecuador	f
64	EST	Estonia	f
65	EGY	Egypt	f
66	ESH	Western Sahara	f
67	ERI	Eritrea	f
68	ESP	Spain	f
69	ETH	Ethiopia	f
70	FIN	Finland	f
71	FJI	Fiji	f
72	FLK	Falkland Islands (Malvinas)	f
73	FSM	Micronesia, Federated States of	f
74	FRO	Faroe Islands	f
75	FRA	France	f
76	GAB	Gabon	f
77	GBR	United Kingdom	f
78	GRD	Grenada	f
79	GEO	Georgia	f
80	GUF	French Guiana	f
81	GGY	Guernsey	f
82	GHA	Ghana	f
83	GIB	Gibraltar	f
84	GRL	Greenland	f
85	GMB	Gambia	f
86	GIN	Guinea	f
87	GLP	Guadeloupe	f
88	GNQ	Equatorial Guinea	f
89	GRC	Greece	f
90	SGS	South Georgia and the South Sandwich Islands	f
91	GTM	Guatemala	f
92	GUM	Guam	f
93	GNB	Guinea-Bissau	f
94	GUY	Guyana	f
95	HKG	Hong Kong	f
96	HMD	Heard Island and McDonald Islands	f
97	HND	Honduras	f
98	HRV	Croatia	f
99	HTI	Haiti	f
100	HUN	Hungary	f
101	IDN	Indonesia	f
102	IRL	Ireland	f
103	ISR	Israel	f
104	IMN	Isle of Man	f
105	IND	India	f
106	IOT	British Indian Ocean Territory	f
107	IRQ	Iraq	f
108	IRN	Iran, Islamic Republic of	f
109	ISL	Iceland	f
110	ITA	Italy	f
111	JEY	Jersey	f
112	JAM	Jamaica	f
113	JOR	Jordan	f
114	JPN	Japan	f
115	KEN	Kenya	f
116	KGZ	Kyrgyzstan	f
117	KHM	Cambodia	f
118	KIR	Kiribati	f
119	COM	Comoros	f
120	KNA	Saint Kitts and Nevis	f
121	PRK	Korea, Democratic People''s Republic of	f
122	KOR	Korea, Republic of	f
123	KWT	Kuwait	f
124	CYM	Cayman Islands	f
125	KAZ	Kazakhstan	f
126	LAO	Lao People''s Democratic Republic	f
127	LBN	Lebanon	f
128	LCA	Saint Lucia	f
129	LIE	Liechtenstein	f
130	LKA	Sri Lanka	f
131	LBR	Liberia	f
132	LSO	Lesotho	f
133	LTU	Lithuania	f
134	LUX	Luxembourg	f
135	LVA	Latvia	f
136	LBY	Libyan Arab Jamahiriya	f
137	MAR	Morocco	f
138	MCO	Monaco	f
139	MDA	Moldova, Republic of	f
140	MNE	Montenegro	f
141	MAF	Saint Martin (French part)	f
142	MDG	Madagascar	f
143	MHL	Marshall Islands	f
144	MKD	Macedonia, the former Yugoslav Republic of	f
145	MLI	Mali	f
146	MMR	Myanmar	f
147	MNG	Mongolia	f
148	MAC	Macao	f
149	MNP	Northern Mariana Islands	f
150	MTQ	Martinique	f
151	MRT	Mauritania	f
152	MSR	Montserrat	f
153	MLT	Malta	f
154	MUS	Mauritius	f
155	MDV	Maldives	f
156	MWI	Malawi	f
157	MEX	Mexico	f
158	MYS	Malaysia	f
159	MOZ	Mozambique	f
160	NAM	Namibia	f
161	NCL	New Caledonia	f
162	NER	Niger	f
163	NFK	Norfolk Island	f
164	NGA	Nigeria	f
165	NIC	Nicaragua	f
166	NLD	Netherlands	f
167	NOR	Norway	f
168	NPL	Nepal	f
169	NRU	Nauru	f
170	NIU	Niue	f
171	NZL	New Zealand	f
172	OMN	Oman	f
173	PAN	Panama	f
174	PER	Peru	f
175	PYF	French Polynesia	f
176	PNG	Papua New Guinea	f
177	PHL	Philippines	f
178	PAK	Pakistan	f
179	POL	Poland	f
180	SPM	Saint Pierre and Miquelon	f
181	PCN	Pitcairn	f
182	PRI	Puerto Rico	f
183	PSE	Palestinian Territory, Occupied	f
184	PRT	Portugal	f
185	PLW	Palau	f
186	PRY	Paraguay	f
187	QAT	Qatar	f
188	REU	Reunion	f
189	ROU	Romania	f
190	SRB	Serbia	f
191	RUS	Russian Federation	f
192	RWA	Rwanda	f
193	SAU	Saudi Arabia	f
194	SLB	Solomon Islands	f
195	SYC	Seychelles	f
196	SDN	Sudan	f
197	SWE	Sweden	f
198	SGP	Singapore	f
199	SHN	Saint Helena, Ascension and Tristan da Cunha	f
200	SVN	Slovenia	f
201	SJM	Svalbard and Jan Mayen	f
202	SVK	Slovakia	f
203	SLE	Sierra Leone	f
204	SMR	San Marino	f
205	SEN	Senegal	f
206	SOM	Somalia	f
207	SUR	Suriname	f
208	SSD	South Sudan	f
209	STP	Sao Tome and Principe	f
210	SLV	El Salvador	f
211	SXM	Sint Maarten (Dutch part)	f
212	SYR	Syrian Arab Republic	f
213	SWZ	Swaziland	f
214	TCA	Turks and Caicos Islands	f
215	TCD	Chad	f
216	ATF	French Southern Territories	f
217	TGO	Togo	f
218	THA	Thailand	f
219	TJK	Tajikistan	f
220	TKL	Tokelau	f
221	TLS	Timor-Leste	f
222	TKM	Turkmenistan	f
223	TUN	Tunisia	f
224	TON	Tonga	f
225	TUR	Turkey	f
226	TTO	Trinidad and Tobago	f
227	TUV	Tuvalu	f
228	TWN	Taiwan, Province of China	f
229	TZA	Tanzania, United Republic of	f
230	UKR	Ukraine	f
231	UGA	Uganda	f
232	UMI	United States Minor Outlying Islands	f
233	USA	United States	f
234	URY	Uruguay	f
235	UZB	Uzbekistan	f
236	VAT	Holy See (Vatican City State)	f
237	VCT	Saint Vincent and the Grenadines	f
238	VEN	Venezuela, Bolivarian Republic of	f
239	VGB	Virgin Islands, British	f
240	VIR	Virgin Islands, U.S.	f
241	VNM	Viet Nam	f
242	VUT	Vanuatu	f
243	WLF	Wallis and Futuna	f
244	WSM	Samoa	f
245	YEM	Yemen	f
246	MYT	Mayotte	f
247	ZAF	South Africa	f
248	ZMB	Zambia	f
249	ZWE	Zimbabwe	f
250	ZZZ	NA	f
\.


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ajax
--

SELECT pg_catalog.setval('countries_id_seq', 250, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: ajax
--

COPY users (id, name, last_name, email, address, city, country_id) FROM stdin;
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ajax
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


--
-- Name: countries_pkey; Type: CONSTRAINT; Schema: public; Owner: ajax; Tablespace: 
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: users_email_key; Type: CONSTRAINT; Schema: public; Owner: ajax; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: ajax; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ajax
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_country_id_fkey FOREIGN KEY (country_id) REFERENCES countries(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--
CREATE OR REPLACE VIEW public.users_view AS SELECT u.id,
                                                u.name AS first_name,
                                                u.last_name,
                                                u.email,
                                                u.address,
                                                u.city,
                                                c.name AS country
                                            FROM (users u
                                                LEFT JOIN countries c ON ((c.id = u.country_id)))
                                            WHERE (u.deleted = false);


CREATE OR REPLACE FUNCTION users_delete (_int4)
    RETURNS int4
AS
    $BODY$
  DECLARE _row_count INT4;
  BEGIN
  UPDATE users set deleted = TRUE WHERE id = ANY($1);
    GET DIAGNOSTICS _row_count = ROW_COUNT;
    RETURN _row_count;
END
$BODY$
LANGUAGE plpgsql VOLATILE;

CREATE OR REPLACE FUNCTION users_modify (_id int4, _name varchar, _last_name varchar, _email varchar, _country_id int4, _city varchar, _address text)
    RETURNS int4
AS
    $BODY$
  DECLARE
  message_error text;
  _row_count integer;
  BEGIN

          IF NOT validate_name(_name, 32)
             THEN RAISE EXCEPTION 'NOT VALID NAME';

          ELSEIF NOT validate_name(_last_name, 64)
            THEN RAISE EXCEPTION 'NOT VALID LAST_NAME';

          ELSEIF NOT validate_email(_email)
            THEN RAISE EXCEPTION 'NOT VALID EMAIL';

          ELSEIF NOT validate_country_id(_country_id)
            THEN RAISE EXCEPTION 'NOT COUNTRY_ID';

          ELSEIF NOT validate_varchar_length(_city, 255)
            THEN RAISE EXCEPTION 'NOT VALID CITY';

          ELSEIF NOT validate_text_length(_address, 1000)
            THEN RAISE EXCEPTION 'NOT VALID ADDRESS';

          ELSE
            BEGIN
              IF _id = 0 THEN
              INSERT INTO users
                (
                  name,
                  last_name,
                  email,
                  country_id,
                  city,
                  address
                )
                VALUES
                (
                  _name,
                  _last_name,
                  _email,
                  _country_id,
                  _city,
                  _address
                );
              ELSE UPDATE users SET
                name = _name,
                last_name = _last_name,
                email = _email,
                country_id = _country_id,
                city = _city,
                address = _address
                WHERE id = _id;
                GET DIAGNOSTICS _row_count = ROW_COUNT;
                RETURN _row_count;
                END IF;
              EXCEPTION WHEN  unique_violation
                THEN RAISE EXCEPTION 'NOT UNIQUE email';
            END;
        END IF;
            RETURN currval(pg_get_serial_sequence('users','id'));
            END
$BODY$
LANGUAGE plpgsql VOLATILE;

CREATE OR REPLACE FUNCTION validate_country_id (_country_id int4)
    RETURNS bool
AS
    $BODY$
  select exists(SELECT 1 from countries c where c.id = _country_id and NOT c.deleted);
$BODY$
LANGUAGE sql IMMUTABLE STRICT;


CREATE OR REPLACE FUNCTION validate_email (email varchar)
    RETURNS bool
AS
    $BODY$
  select $1 ~ '^[a-zA-Z0-9.!#$%&''*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$';
$BODY$
LANGUAGE sql IMMUTABLE STRICT;

CREATE OR REPLACE FUNCTION validate_name (name varchar, len int4)
    RETURNS bool
AS
    $BODY$
  select name ~* '^[a-zа-я0-9_]+$' AND length(name) <= len;
$BODY$
LANGUAGE sql IMMUTABLE STRICT;

CREATE OR REPLACE FUNCTION validate_text_length (_text text, len int4)
    RETURNS bool
AS
    $BODY$
  select length(_text) <= len;
$BODY$
LANGUAGE sql IMMUTABLE STRICT;

CREATE OR REPLACE FUNCTION validate_varchar_length (_str varchar, len int4)
    RETURNS bool
AS
    $BODY$
  select length(_str) <= len;
$BODY$
LANGUAGE sql IMMUTABLE STRICT;


