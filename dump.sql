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
-- Name: core_countries; Type: TABLE; Schema: public; Owner: ajax; Tablespace: 
--

CREATE TABLE core_countries (
    iso1_code character(2) NOT NULL,
    numeric_code smallint NOT NULL,
    iso3_code character(3) NOT NULL,
    name character(50) NOT NULL,
    deleted boolean DEFAULT false NOT NULL
);


ALTER TABLE public.core_countries OWNER TO ajax;

--
-- Name: countries; Type: TABLE; Schema: public; Owner: ajax; Tablespace: 
--

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
    country_id smallint NOT NULL
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
-- Data for Name: core_countries; Type: TABLE DATA; Schema: public; Owner: ajax
--

COPY core_countries (iso1_code, numeric_code, iso3_code, name, deleted) FROM stdin;
AD	20	AND	Andorra                                           	f
AE	784	ARE	United Arab Emirates                              	f
AF	4	AFG	Afghanistan                                       	f
AG	28	ATG	Antigua and Barbuda                               	f
AI	660	AIA	Anguilla                                          	f
AL	8	ALB	Albania                                           	f
AM	51	ARM	Armenia                                           	f
AO	24	AGO	Angola                                            	f
AQ	10	ATA	Antarctica                                        	f
AR	32	ARG	Argentina                                         	f
AS	16	ASM	American Samoa                                    	f
AT	40	AUT	Austria                                           	f
AU	36	AUS	Australia                                         	f
AW	533	ABW	Aruba                                             	f
AX	248	ALA	Aland Islands                                     	f
AZ	31	AZE	Azerbaijan                                        	f
BA	70	BIH	Bosnia and Herzegovina                            	f
BB	52	BRB	Barbados                                          	f
BD	50	BGD	Bangladesh                                        	f
BE	56	BEL	Belgium                                           	f
BF	854	BFA	Burkina Faso                                      	f
BG	100	BGR	Bulgaria                                          	f
BH	48	BHR	Bahrain                                           	f
BI	108	BDI	Burundi                                           	f
BJ	204	BEN	Benin                                             	f
BL	652	BLM	Saint Barthelemy                                  	f
BM	60	BMU	Bermuda                                           	f
BN	96	BRN	Brunei Darussalam                                 	f
BO	68	BOL	Bolivia, Plurinational State of                   	f
BQ	535	BES	Bonaire, Sint Eustatius and Saba                  	f
BR	76	BRA	Brazil                                            	f
BS	44	BHS	Bahamas                                           	f
BT	64	BTN	Bhutan                                            	f
BV	74	BVT	Bouvet Island                                     	f
BW	72	BWA	Botswana                                          	f
BY	112	BLR	Belarus                                           	f
BZ	84	BLZ	Belize                                            	f
CA	124	CAN	Canada                                            	f
CC	166	CCK	Cocos (Keeling) Islands                           	f
CD	180	COD	Congo, the Democratic Republic of the             	f
CF	140	CAF	Central African Republic                          	f
CG	178	COG	Congo                                             	f
CH	756	CHE	Switzerland                                       	f
CI	384	CIV	Cote d'Ivoire                                     	f
CK	184	COK	Cook Islands                                      	f
CL	152	CHL	Chile                                             	f
CM	120	CMR	Cameroon                                          	f
CN	156	CHN	China                                             	f
CO	170	COL	Colombia                                          	f
CR	188	CRI	Costa Rica                                        	f
CU	192	CUB	Cuba                                              	f
CV	132	CPV	Cape Verde                                        	f
CW	531	CUW	Curacao                                           	f
CX	162	CXR	Christmas Island                                  	f
CY	196	CYP	Cyprus                                            	f
CZ	203	CZE	Czech Republic                                    	f
DE	276	DEU	Germany                                           	f
DJ	262	DJI	Djibouti                                          	f
DK	208	DNK	Denmark                                           	f
DM	212	DMA	Dominica                                          	f
DO	214	DOM	Dominican Republic                                	f
DZ	12	DZA	Algeria                                           	f
EC	218	ECU	Ecuador                                           	f
EE	233	EST	Estonia                                           	f
EG	818	EGY	Egypt                                             	f
EH	732	ESH	Western Sahara                                    	f
ER	232	ERI	Eritrea                                           	f
ES	724	ESP	Spain                                             	f
ET	231	ETH	Ethiopia                                          	f
FI	246	FIN	Finland                                           	f
FJ	242	FJI	Fiji                                              	f
FK	238	FLK	Falkland Islands (Malvinas)                       	f
FM	583	FSM	Micronesia, Federated States of                   	f
FO	234	FRO	Faroe Islands                                     	f
FR	250	FRA	France                                            	f
GA	266	GAB	Gabon                                             	f
GB	826	GBR	United Kingdom                                    	f
GD	308	GRD	Grenada                                           	f
GE	268	GEO	Georgia                                           	f
GF	254	GUF	French Guiana                                     	f
GG	831	GGY	Guernsey                                          	f
GH	288	GHA	Ghana                                             	f
GI	292	GIB	Gibraltar                                         	f
GL	304	GRL	Greenland                                         	f
GM	270	GMB	Gambia                                            	f
GN	324	GIN	Guinea                                            	f
GP	312	GLP	Guadeloupe                                        	f
GQ	226	GNQ	Equatorial Guinea                                 	f
GR	300	GRC	Greece                                            	f
GS	239	SGS	South Georgia and the South Sandwich Islands      	f
GT	320	GTM	Guatemala                                         	f
GU	316	GUM	Guam                                              	f
GW	624	GNB	Guinea-Bissau                                     	f
GY	328	GUY	Guyana                                            	f
HK	344	HKG	Hong Kong                                         	f
HM	334	HMD	Heard Island and McDonald Islands                 	f
HN	340	HND	Honduras                                          	f
HR	191	HRV	Croatia                                           	f
HT	332	HTI	Haiti                                             	f
HU	348	HUN	Hungary                                           	f
ID	360	IDN	Indonesia                                         	f
IE	372	IRL	Ireland                                           	f
IL	376	ISR	Israel                                            	f
IM	833	IMN	Isle of Man                                       	f
IN	356	IND	India                                             	f
IO	86	IOT	British Indian Ocean Territory                    	f
IQ	368	IRQ	Iraq                                              	f
IR	364	IRN	Iran, Islamic Republic of                         	f
IS	352	ISL	Iceland                                           	f
IT	380	ITA	Italy                                             	f
JE	832	JEY	Jersey                                            	f
JM	388	JAM	Jamaica                                           	f
JO	400	JOR	Jordan                                            	f
JP	392	JPN	Japan                                             	f
KE	404	KEN	Kenya                                             	f
KG	417	KGZ	Kyrgyzstan                                        	f
KH	116	KHM	Cambodia                                          	f
KI	296	KIR	Kiribati                                          	f
KM	174	COM	Comoros                                           	f
KN	659	KNA	Saint Kitts and Nevis                             	f
KP	408	PRK	Korea, Democratic People's Republic of            	f
KR	410	KOR	Korea, Republic of                                	f
KW	414	KWT	Kuwait                                            	f
KY	136	CYM	Cayman Islands                                    	f
KZ	398	KAZ	Kazakhstan                                        	f
LA	418	LAO	Lao People's Democratic Republic                  	f
LB	422	LBN	Lebanon                                           	f
LC	662	LCA	Saint Lucia                                       	f
LI	438	LIE	Liechtenstein                                     	f
LK	144	LKA	Sri Lanka                                         	f
LR	430	LBR	Liberia                                           	f
LS	426	LSO	Lesotho                                           	f
LT	440	LTU	Lithuania                                         	f
LU	442	LUX	Luxembourg                                        	f
LV	428	LVA	Latvia                                            	f
LY	434	LBY	Libyan Arab Jamahiriya                            	f
MA	504	MAR	Morocco                                           	f
MC	492	MCO	Monaco                                            	f
MD	498	MDA	Moldova, Republic of                              	f
ME	499	MNE	Montenegro                                        	f
MF	663	MAF	Saint Martin (French part)                        	f
MG	450	MDG	Madagascar                                        	f
MH	584	MHL	Marshall Islands                                  	f
MK	807	MKD	Macedonia, the former Yugoslav Republic of        	f
ML	466	MLI	Mali                                              	f
MM	104	MMR	Myanmar                                           	f
MN	496	MNG	Mongolia                                          	f
MO	446	MAC	Macao                                             	f
MP	580	MNP	Northern Mariana Islands                          	f
MQ	474	MTQ	Martinique                                        	f
MR	478	MRT	Mauritania                                        	f
MS	500	MSR	Montserrat                                        	f
MT	470	MLT	Malta                                             	f
MU	480	MUS	Mauritius                                         	f
MV	462	MDV	Maldives                                          	f
MW	454	MWI	Malawi                                            	f
MX	484	MEX	Mexico                                            	f
MY	458	MYS	Malaysia                                          	f
MZ	508	MOZ	Mozambique                                        	f
NA	516	NAM	Namibia                                           	f
NC	540	NCL	New Caledonia                                     	f
NE	562	NER	Niger                                             	f
NF	574	NFK	Norfolk Island                                    	f
NG	566	NGA	Nigeria                                           	f
NI	558	NIC	Nicaragua                                         	f
NL	528	NLD	Netherlands                                       	f
NO	578	NOR	Norway                                            	f
NP	524	NPL	Nepal                                             	f
NR	520	NRU	Nauru                                             	f
NU	570	NIU	Niue                                              	f
NZ	554	NZL	New Zealand                                       	f
OM	512	OMN	Oman                                              	f
PA	591	PAN	Panama                                            	f
PE	604	PER	Peru                                              	f
PF	258	PYF	French Polynesia                                  	f
PG	598	PNG	Papua New Guinea                                  	f
PH	608	PHL	Philippines                                       	f
PK	586	PAK	Pakistan                                          	f
PL	616	POL	Poland                                            	f
PM	666	SPM	Saint Pierre and Miquelon                         	f
PN	612	PCN	Pitcairn                                          	f
PR	630	PRI	Puerto Rico                                       	f
PS	275	PSE	Palestinian Territory, Occupied                   	f
PT	620	PRT	Portugal                                          	f
PW	585	PLW	Palau                                             	f
PY	600	PRY	Paraguay                                          	f
QA	634	QAT	Qatar                                             	f
RE	638	REU	Reunion                                           	f
RO	642	ROU	Romania                                           	f
RS	688	SRB	Serbia                                            	f
RU	643	RUS	Russian Federation                                	f
RW	646	RWA	Rwanda                                            	f
SA	682	SAU	Saudi Arabia                                      	f
SB	90	SLB	Solomon Islands                                   	f
SC	690	SYC	Seychelles                                        	f
SD	729	SDN	Sudan                                             	f
SE	752	SWE	Sweden                                            	f
SG	702	SGP	Singapore                                         	f
SH	654	SHN	Saint Helena, Ascension and Tristan da Cunha      	f
SI	705	SVN	Slovenia                                          	f
SJ	744	SJM	Svalbard and Jan Mayen                            	f
SK	703	SVK	Slovakia                                          	f
SL	694	SLE	Sierra Leone                                      	f
SM	674	SMR	San Marino                                        	f
SN	686	SEN	Senegal                                           	f
SO	706	SOM	Somalia                                           	f
SR	740	SUR	Suriname                                          	f
SS	728	SSD	South Sudan                                       	f
ST	678	STP	Sao Tome and Principe                             	f
SV	222	SLV	El Salvador                                       	f
SX	534	SXM	Sint Maarten (Dutch part)                         	f
SY	760	SYR	Syrian Arab Republic                              	f
SZ	748	SWZ	Swaziland                                         	f
TC	796	TCA	Turks and Caicos Islands                          	f
TD	148	TCD	Chad                                              	f
TF	260	ATF	French Southern Territories                       	f
TG	768	TGO	Togo                                              	f
TH	764	THA	Thailand                                          	f
TJ	762	TJK	Tajikistan                                        	f
TK	772	TKL	Tokelau                                           	f
TL	626	TLS	Timor-Leste                                       	f
TM	795	TKM	Turkmenistan                                      	f
TN	788	TUN	Tunisia                                           	f
TO	776	TON	Tonga                                             	f
TR	792	TUR	Turkey                                            	f
TT	780	TTO	Trinidad and Tobago                               	f
TV	798	TUV	Tuvalu                                            	f
TW	158	TWN	Taiwan, Province of China                         	f
TZ	834	TZA	Tanzania, United Republic of                      	f
UA	804	UKR	Ukraine                                           	f
UG	800	UGA	Uganda                                            	f
UM	581	UMI	United States Minor Outlying Islands              	f
US	840	USA	United States                                     	f
UY	858	URY	Uruguay                                           	f
UZ	860	UZB	Uzbekistan                                        	f
VA	336	VAT	Holy See (Vatican City State)                     	f
VC	670	VCT	Saint Vincent and the Grenadines                  	f
VE	862	VEN	Venezuela, Bolivarian Republic of                 	f
VG	92	VGB	Virgin Islands, British                           	f
VI	850	VIR	Virgin Islands, U.S.                              	f
VN	704	VNM	Viet Nam                                          	f
VU	548	VUT	Vanuatu                                           	f
WF	876	WLF	Wallis and Futuna                                 	f
WS	882	WSM	Samoa                                             	f
YE	887	YEM	Yemen                                             	f
YT	175	MYT	Mayotte                                           	f
ZA	710	ZAF	South Africa                                      	f
ZM	894	ZMB	Zambia                                            	f
ZW	716	ZWE	Zimbabwe                                          	f
ZZ	1000	ZZZ	NA                                                	f
\.


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
44	CIV	Cote d'Ivoire	f
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
121	PRK	Korea, Democratic People's Republic of	f
122	KOR	Korea, Republic of	f
123	KWT	Kuwait	f
124	CYM	Cayman Islands	f
125	KAZ	Kazakhstan	f
126	LAO	Lao People's Democratic Republic	f
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
CREATE OR REPLACE FUNCTION validate_varchar_length (_str varchar, len int8)
    RETURNS bool
AS
    $BODY$
  select length(_str) <= len;
$BODY$
LANGUAGE sql IMMUTABLE STRICT;


CREATE OR REPLACE FUNCTION validate_text_length (_text text, len int8)
    RETURNS bool
AS
    $BODY$
  select length(_text) <= len;
$BODY$
LANGUAGE sql IMMUTABLE STRICT;

CREATE OR REPLACE FUNCTION validate_text_length (_text TEXT, len INT8)
    RETURNS bool
AS
    $BODY$
  select length(_text) <= len;
$BODY$
LANGUAGE sql IMMUTABLE STRICT;

CREATE OR REPLACE FUNCTION validate_email (email varchar)
    RETURNS bool
AS
    $BODY$
  select $1 ~ '^[a-zA-Z0-9.!#$%&''*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$';
$BODY$
LANGUAGE sql IMMUTABLE STRICT;

CREATE OR REPLACE FUNCTION validate_country_id (_country_id int4)
    RETURNS bool
AS
    $BODY$
  select exists(SELECT 1 from countries c where c.id = _country_id and NOT c.deleted);
$BODY$
LANGUAGE sql IMMUTABLE STRICT;

CREATE OR REPLACE FUNCTION users_insert (
    _name varchar,
    _last_name varchar,
    _email varchar,
    _country_id int4,
    _city varchar,
    _address text
)
    RETURNS INTEGER
AS
    $BODY$
DECLARE
  message_error text;
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
              EXCEPTION WHEN  unique_violation
                THEN RAISE EXCEPTION 'NOT UNIQUE email';
            END;
        END IF;
            RETURN currval(pg_get_serial_sequence('users','id'));
            END
$BODY$
LANGUAGE plpgsql VOLATILE;
