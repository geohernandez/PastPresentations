CREATE DATABASE SQLSaturday
GO


CREATE TABLE Country
(
  countryId SMALLINT IDENTITY,
  countryCode VARCHAR(2) NOT NULL DEFAULT '',
  countryName VARCHAR(100) NOT NULL DEFAULT '',
  CONSTRAINT PK_Country_countryID PRIMARY KEY(countryId)
);

--DROP TABLE SQLSatEvent
CREATE TABLE SQLSatEvent
(
   sqlSatEventID  INT NOT NULL IDENTITY,
   eventName      VARCHAR(100) NOT NULL,
   countryID      SMALLINT NOT NULL,
   EventDate      DATE NOT NULL,
   place          VARCHAR(100) NOT NULL,
   organizer      VARCHAR(150) NOT NULL,
   email          VARCHAR(60)  NOT NULL,
   website        VARCHAR(75)  NOT NULL,
   CONSTRAINT PK_SQLSatEvent_sqlSatEventID PRIMARY KEY (sqlSatEventID),
   CONSTRAINT FK_SQLSatEvent_Country FOREIGN KEY(countryId) REFERENCES Country(countryID)
);

--Creating speaker table

CREATE TABLE Speaker
(
  speakerID   INT NOT NULL IDENTITY,
  firstName   NVARCHAR(100) NOT NULL,
  lastName    NVARCHAR(100) NOT NULL,
  biography   VARCHAR(250)  NULL,
  email       VARCHAR(100)  NULL,
  website     VARCHAR(120)  NULL,
  linkedin    VARCHAR(100)  NULL,
  twitter     VARCHAR(120)  NULL,
  observation VARCHAR(200)  NULL,
  CONSTRAINT PK_Speaker PRIMARY KEY(speakerID)
);

-- Create level session
CREATE TABLE Level
(
  levelID  TINYINT IDENTITY NOT NULL,
  description VARCHAR(120) NOT NULL,
  CONSTRAINT PK_Level PRIMARY KEY(levelID)
);

-- Create track session
CREATE TABLE Track
(
  trackID  TINYINT IDENTITY NOT NULL,
  description VARCHAR(150) NOT NULL,
  CONSTRAINT PK_Track PRIMARY KEY(trackID)
);


--Creating a new Session table
DROP TABLE Session

CREATE TABLE Session
(
  sessionID    INT NOT NULL IDENTITY,
  title        NVARCHAR(100) NOT NULL,
  abstract     NVARCHAR(4000) NOT NULL,
  speakerID    INT NOT  NULL,
  dateSession  DATE NOT NULL,
  scheduleSession DATETIME NOT NULL,
  duration     SMALLINT NOT NULL,
  levelID      TINYINT NOT NULL,
  trackID      TINYINT NOT NULL,
  observation  VARCHAR(200)  NULL,
  CONSTRAINT FK_Session_Level FOREIGN KEY(levelID) REFERENCES Level(levelID),
  CONSTRAINT FK_Session_Track FOREIGN KEY(trackID) REFERENCES Track(trackID), 
  CONSTRAINT PK_Session PRIMARY KEY(sessionID)
);


--Populating data
-- Dumping data for table `Countries`

INSERT INTO Country VALUES ('AF', 'Afghanistan');
INSERT INTO Country VALUES ('AL', 'Albania');
INSERT INTO  Country VALUES ('DZ', 'Algeria');
INSERT INTO  Country VALUES ('DS', 'American Samoa');
INSERT INTO  Country VALUES ('AD', 'Andorra');
INSERT INTO  Country VALUES ('AO', 'Angola');
INSERT INTO  Country VALUES ('AI', 'Anguilla');
INSERT INTO  Country VALUES ('AQ', 'Antarctica');
INSERT INTO  Country VALUES ('AG', 'Antigua and Barbuda');
INSERT INTO  Country VALUES ('AR', 'Argentina');
INSERT INTO  Country VALUES ('AM', 'Armenia');
INSERT INTO  Country VALUES ('AW', 'Aruba');
INSERT INTO  Country VALUES ('AU', 'Australia');
INSERT INTO  Country VALUES ('AT', 'Austria');
INSERT INTO  Country VALUES ('AZ', 'Azerbaijan');
INSERT INTO  Country VALUES ('BS', 'Bahamas');
INSERT INTO  Country VALUES ('BH', 'Bahrain');
INSERT INTO  Country VALUES ('BD', 'Bangladesh');
INSERT INTO  Country VALUES ('BB', 'Barbados');
INSERT INTO  Country VALUES ('BY', 'Belarus');
INSERT INTO  Country VALUES ('BE', 'Belgium');
INSERT INTO  Country VALUES ('BZ', 'Belize');
INSERT INTO  Country VALUES ('BJ', 'Benin');
INSERT INTO  Country VALUES ('BM', 'Bermuda');
INSERT INTO  Country VALUES ('BT', 'Bhutan');
INSERT INTO  Country VALUES ('BO', 'Bolivia');
INSERT INTO  Country VALUES ('BA', 'Bosnia and Herzegovina');
INSERT INTO  Country VALUES ('BW', 'Botswana');
INSERT INTO  Country VALUES ('BV', 'Bouvet Island');
INSERT INTO  Country VALUES ('BR', 'Brazil');
INSERT INTO  Country VALUES ('IO', 'British Indian Ocean Territory');
INSERT INTO  Country VALUES ('BN', 'Brunei Darussalam');
INSERT INTO  Country VALUES ('BG', 'Bulgaria');
INSERT INTO  Country VALUES ('BF', 'Burkina Faso');
INSERT INTO  Country VALUES ('BI', 'Burundi');
INSERT INTO  Country VALUES ('KH', 'Cambodia');
INSERT INTO  Country VALUES ('CM', 'Cameroon');
INSERT INTO  Country VALUES ('CA', 'Canada');
INSERT INTO  Country VALUES ('CV', 'Cape Verde');
INSERT INTO  Country VALUES ('KY', 'Cayman Islands');
INSERT INTO  Country VALUES ('CF', 'Central African Republic');
INSERT INTO  Country VALUES ('TD', 'Chad');
INSERT INTO  Country VALUES ('CL', 'Chile');
INSERT INTO  Country VALUES ('CN', 'China');
INSERT INTO  Country VALUES ('CX', 'Christmas Island');
INSERT INTO  Country VALUES ('CC', 'Cocos (Keeling) Islands');
INSERT INTO  Country VALUES ('CO', 'Colombia');
INSERT INTO  Country VALUES ('KM', 'Comoros');
INSERT INTO  Country VALUES ('CG', 'Congo');
INSERT INTO  Country VALUES ('CK', 'Cook Islands');
INSERT INTO  Country VALUES ('CR', 'Costa Rica');
INSERT INTO  Country VALUES ('HR', 'Croatia (Hrvatska)');
INSERT INTO  Country VALUES ('CU', 'Cuba');
INSERT INTO  Country VALUES ('CY', 'Cyprus');
INSERT INTO  Country VALUES ('CZ', 'Czech Republic');
INSERT INTO  Country VALUES ('DK', 'Denmark');
INSERT INTO  Country VALUES ('DJ', 'Djibouti');
INSERT INTO  Country VALUES ('DM', 'Dominica');
INSERT INTO  Country VALUES ('DO', 'Dominican Republic');
INSERT INTO  Country VALUES ('TP', 'East Timor');
INSERT INTO  Country VALUES ('EC', 'Ecuador');
INSERT INTO  Country VALUES ('EG', 'Egypt');
INSERT INTO  Country VALUES ('SV', 'El Salvador');
INSERT INTO  Country VALUES ('GQ', 'Equatorial Guinea');
INSERT INTO  Country VALUES ('ER', 'Eritrea');
INSERT INTO  Country VALUES ('EE', 'Estonia');
INSERT INTO  Country VALUES ('ET', 'Ethiopia');
INSERT INTO  Country VALUES ('FK', 'Falkland Islands (Malvinas)');
INSERT INTO  Country VALUES ('FO', 'Faroe Islands');
INSERT INTO  Country VALUES ('FJ', 'Fiji');
INSERT INTO  Country VALUES ('FI', 'Finland');
INSERT INTO  Country VALUES ('FR', 'France');
INSERT INTO  Country VALUES ('FX', 'France, Metropolitan');
INSERT INTO  Country VALUES ('GF', 'French Guiana');
INSERT INTO  Country VALUES ('PF', 'French Polynesia');
INSERT INTO  Country VALUES ('TF', 'French Southern Territories');
INSERT INTO  Country VALUES ('GA', 'Gabon');
INSERT INTO  Country VALUES ('GM', 'Gambia');
INSERT INTO  Country VALUES ('GE', 'Georgia');
INSERT INTO  Country VALUES ('DE', 'Germany');
INSERT INTO  Country VALUES ('GH', 'Ghana');
INSERT INTO  Country VALUES ('GI', 'Gibraltar');
INSERT INTO  Country VALUES ('GK', 'Guernsey');
INSERT INTO  Country VALUES ('GR', 'Greece');
INSERT INTO  Country VALUES ('GL', 'Greenland');
INSERT INTO  Country VALUES ('GD', 'Grenada');
INSERT INTO  Country VALUES ('GP', 'Guadeloupe');
INSERT INTO  Country VALUES ('GU', 'Guam');
INSERT INTO  Country VALUES ('GT', 'Guatemala');
INSERT INTO  Country VALUES ('GN', 'Guinea');
INSERT INTO  Country VALUES ('GW', 'Guinea-Bissau');
INSERT INTO  Country VALUES ('GY', 'Guyana');
INSERT INTO  Country VALUES ('HT', 'Haiti');
INSERT INTO  Country VALUES ('HM', 'Heard and Mc Donald Islands');
INSERT INTO  Country VALUES ('HN', 'Honduras');
INSERT INTO  Country VALUES ('HK', 'Hong Kong');
INSERT INTO  Country VALUES ('HU', 'Hungary');
INSERT INTO  Country VALUES ('IS', 'Iceland');
INSERT INTO  Country VALUES ('IN', 'India');
INSERT INTO  Country VALUES ('IM', 'Isle of Man');
INSERT INTO  Country VALUES ('ID', 'Indonesia');
INSERT INTO  Country VALUES ('IR', 'Iran (Islamic Republic of)');
INSERT INTO  Country VALUES ('IQ', 'Iraq');
INSERT INTO  Country VALUES ('IE', 'Ireland');
INSERT INTO  Country VALUES ('IL', 'Israel');
INSERT INTO  Country VALUES ('IT', 'Italy');
INSERT INTO  Country VALUES ('CI', 'Ivory Coast');
INSERT INTO  Country VALUES ('JE', 'Jersey');
INSERT INTO  Country VALUES ('JM', 'Jamaica');
INSERT INTO  Country VALUES ('JP', 'Japan');
INSERT INTO  Country VALUES ('JO', 'Jordan');
INSERT INTO  Country VALUES ('KZ', 'Kazakhstan');
INSERT INTO  Country VALUES ('KE', 'Kenya');
INSERT INTO  Country VALUES ('KI', 'Kiribati');
INSERT INTO  Country VALUES ('KP', 'Korea, Democratic People''s Republic of');
INSERT INTO  Country VALUES ('KR', 'Korea, Republic of');
INSERT INTO  Country VALUES ('XK', 'Kosovo');
INSERT INTO  Country VALUES ('KW', 'Kuwait');
INSERT INTO  Country VALUES ('KG', 'Kyrgyzstan');
INSERT INTO  Country VALUES ('LA', 'Lao People''s Democratic Republic');
INSERT INTO  Country VALUES ('LV', 'Latvia');
INSERT INTO  Country VALUES ('LB', 'Lebanon');
INSERT INTO  Country VALUES ('LS', 'Lesotho');
INSERT INTO  Country VALUES ('LR', 'Liberia');
INSERT INTO  Country VALUES ('LY', 'Libyan Arab Jamahiriya');
INSERT INTO  Country VALUES ('LI', 'Liechtenstein');
INSERT INTO  Country VALUES ('LT', 'Lithuania');
INSERT INTO  Country VALUES ('LU', 'Luxembourg');
INSERT INTO  Country VALUES ('MO', 'Macau');
INSERT INTO  Country VALUES ('MK', 'Macedonia');
INSERT INTO  Country VALUES ('MG', 'Madagascar');
INSERT INTO  Country VALUES ('MW', 'Malawi');
INSERT INTO  Country VALUES ('MY', 'Malaysia');
INSERT INTO  Country VALUES ('MV', 'Maldives');
INSERT INTO  Country VALUES ('ML', 'Mali');
INSERT INTO  Country VALUES ('MT', 'Malta');
INSERT INTO  Country VALUES ('MH', 'Marshall Islands');
INSERT INTO  Country VALUES ('MQ', 'Martinique');
INSERT INTO  Country VALUES ('MR', 'Mauritania');
INSERT INTO  Country VALUES ('MU', 'Mauritius');
INSERT INTO  Country VALUES ('TY', 'Mayotte');
INSERT INTO  Country VALUES ('MX', 'Mexico');
INSERT INTO  Country VALUES ('FM', 'Micronesia, Federated States of');
INSERT INTO  Country VALUES ('MD', 'Moldova, Republic of');
INSERT INTO  Country VALUES ('MC', 'Monaco');
INSERT INTO  Country VALUES ('MN', 'Mongolia');
INSERT INTO  Country VALUES ('ME', 'Montenegro');
INSERT INTO  Country VALUES ('MS', 'Montserrat');
INSERT INTO  Country VALUES ('MA', 'Morocco');
INSERT INTO  Country VALUES ('MZ', 'Mozambique');
INSERT INTO  Country VALUES ('MM', 'Myanmar');
INSERT INTO  Country VALUES ('NA', 'Namibia');
INSERT INTO  Country VALUES ('NR', 'Nauru');
INSERT INTO  Country VALUES ('NP', 'Nepal');
INSERT INTO  Country VALUES ('NL', 'Netherlands');
INSERT INTO  Country VALUES ('AN', 'Netherlands Antilles');
INSERT INTO  Country VALUES ('NC', 'New Caledonia');
INSERT INTO  Country VALUES ('NZ', 'New Zealand');
INSERT INTO  Country VALUES ('NI', 'Nicaragua');
INSERT INTO  Country VALUES ('NE', 'Niger');
INSERT INTO  Country VALUES ('NG', 'Nigeria');
INSERT INTO  Country VALUES ('NU', 'Niue');
INSERT INTO  Country VALUES ('NF', 'Norfolk Island');
INSERT INTO  Country VALUES ('MP', 'Northern Mariana Islands');
INSERT INTO  Country VALUES ('NO', 'Norway');
INSERT INTO  Country VALUES ('OM', 'Oman');
INSERT INTO  Country VALUES ('PK', 'Pakistan');
INSERT INTO  Country VALUES ('PW', 'Palau');
INSERT INTO  Country VALUES ('PS', 'Palestine');
INSERT INTO  Country VALUES ('PA', 'Panama');
INSERT INTO  Country VALUES ('PG', 'Papua New Guinea');
INSERT INTO  Country VALUES ('PY', 'Paraguay');
INSERT INTO  Country VALUES ('PE', 'Peru');
INSERT INTO  Country VALUES ('PH', 'Philippines');
INSERT INTO  Country VALUES ('PN', 'Pitcairn');
INSERT INTO  Country VALUES ('PL', 'Poland');
INSERT INTO  Country VALUES ('PT', 'Portugal');
INSERT INTO  Country VALUES ('PR', 'Puerto Rico');
INSERT INTO  Country VALUES ('QA', 'Qatar');
INSERT INTO  Country VALUES ('RE', 'Reunion');
INSERT INTO  Country VALUES ('RO', 'Romania');
INSERT INTO  Country VALUES ('RU', 'Russian Federation');
INSERT INTO  Country VALUES ('RW', 'Rwanda');
INSERT INTO  Country VALUES ('KN', 'Saint Kitts and Nevis');
INSERT INTO  Country VALUES ('LC', 'Saint Lucia');
INSERT INTO  Country VALUES ('VC', 'Saint Vincent and the Grenadines');
INSERT INTO  Country VALUES ('WS', 'Samoa');
INSERT INTO  Country VALUES ('SM', 'San Marino');
INSERT INTO  Country VALUES ('ST', 'Sao Tome and Principe');
INSERT INTO  Country VALUES ('SA', 'Saudi Arabia');
INSERT INTO  Country VALUES ('SN', 'Senegal');
INSERT INTO  Country VALUES ('RS', 'Serbia');
INSERT INTO  Country VALUES ('SC', 'Seychelles');
INSERT INTO  Country VALUES ('SL', 'Sierra Leone');
INSERT INTO  Country VALUES ('SG', 'Singapore');
INSERT INTO  Country VALUES ('SK', 'Slovakia');
INSERT INTO  Country VALUES ('SI', 'Slovenia');
INSERT INTO  Country VALUES ('SB', 'Solomon Islands');
INSERT INTO  Country VALUES ('SO', 'Somalia');
INSERT INTO  Country VALUES ('ZA', 'South Africa');
INSERT INTO  Country VALUES ('GS', 'South Georgia South Sandwich Islands');
INSERT INTO  Country VALUES ('SS', 'South Sudan');
INSERT INTO  Country VALUES ('ES', 'Spain');
INSERT INTO  Country VALUES ('LK', 'Sri Lanka');
INSERT INTO  Country VALUES ('SH', 'St. Helena');
INSERT INTO  Country VALUES ('PM', 'St. Pierre and Miquelon');
INSERT INTO  Country VALUES ('SD', 'Sudan');
INSERT INTO  Country VALUES ('SR', 'Suriname');
INSERT INTO  Country VALUES ('SJ', 'Svalbard and Jan Mayen Islands');
INSERT INTO  Country VALUES ('SZ', 'Swaziland');
INSERT INTO  Country VALUES ('SE', 'Sweden');
INSERT INTO  Country VALUES ('CH', 'Switzerland');
INSERT INTO  Country VALUES ('SY', 'Syrian Arab Republic');
INSERT INTO  Country VALUES ('TW', 'Taiwan');
INSERT INTO  Country VALUES ('TJ', 'Tajikistan');
INSERT INTO  Country VALUES ('TZ', 'Tanzania, United Republic of');
INSERT INTO  Country VALUES ('TH', 'Thailand');
INSERT INTO  Country VALUES ('TG', 'Togo');
INSERT INTO  Country VALUES ('TK', 'Tokelau');
INSERT INTO  Country VALUES ('TO', 'Tonga');
INSERT INTO  Country VALUES ('TT', 'Trinidad and Tobago');
INSERT INTO  Country VALUES ('TN', 'Tunisia');
INSERT INTO  Country VALUES ('TR', 'Turkey');
INSERT INTO  Country VALUES ('TM', 'Turkmenistan');
INSERT INTO  Country VALUES ('TC', 'Turks and Caicos Islands');
INSERT INTO  Country VALUES ('TV', 'Tuvalu');
INSERT INTO  Country VALUES ('UG', 'Uganda');
INSERT INTO  Country VALUES ('UA', 'Ukraine');
INSERT INTO  Country VALUES ('AE', 'United Arab Emirates');
INSERT INTO  Country VALUES ('GB', 'United Kingdom');
INSERT INTO  Country VALUES ('US', 'United States');
INSERT INTO  Country VALUES ('UM', 'United States minor outlying islands');
INSERT INTO  Country VALUES ('UY', 'Uruguay');
INSERT INTO  Country VALUES ('UZ', 'Uzbekistan');
INSERT INTO  Country VALUES ('VU', 'Vanuatu');
INSERT INTO  Country VALUES ('VA', 'Vatican City State');
INSERT INTO  Country VALUES ('VE', 'Venezuela');
INSERT INTO  Country VALUES ('VN', 'Vietnam');
INSERT INTO  Country VALUES ('VG', 'Virgin Islands (British)');
INSERT INTO  Country VALUES ('VI', 'Virgin Islands (U.S.)');
INSERT INTO  Country VALUES ('WF', 'Wallis and Futuna Islands');
INSERT INTO  Country VALUES ('EH', 'Western Sahara');
INSERT INTO  Country VALUES ('YE', 'Yemen');
INSERT INTO  Country VALUES ('ZR', 'Zaire');
INSERT INTO  Country VALUES ('ZM', 'Zambia');
INSERT INTO  Country VALUES ('ZW', 'Zimbabwe');


--sqlSatEvents
INSERT INTO SQLSatEvent(eventName,countryID,EventDate,place,organizer,email,website)
VALUES('SQL Saturday Cork 2019',104,'20190629','University College, Western Rd, Mardyke, Cork','Sean Carr','sqlsaturday862@sqlsaturday.com','https://www.sqlsaturday.com/862/eventhome.aspx')


--Speaker
INSERT INTO Speaker(firstName,lastName,biography,email,website,linkedin,twitter,observation)
VALUES('Geovanny','Hernandez',
'Geovanny Hernandez is a Database Engineer and Microsoft Certified Trainer 
with more than twelve years of experience in software development, passionate 
for performance tuning in MS SQL Server, Unit Testing and Python.',
'geohernandez@gmail.com',
'www.geohernandez.net',
'https://www.linkedin.com/in/geovannyhernandez/',
'datawithgeo',
'Blessed and optimistic'
);


--Level
INSERT INTO Level([description])
VALUES('Beginner'),('Intermediate'),('Advanced');


--Track
INSERT INTO Track([description])
VALUES('PowerBI'),('Advanced Analysis Techniques'),('Application & Database Development'),
('BI Information Delivery'),('BI Platform Architecture, Development & Administration'),('Cloud Application Development & Deployment'),
('Enterprise Database Administration & Deployment'),('Professional Development'),('Strategy and Architecture');


--Session
  INSERT INTO Session(title,abstract,speakerID,dateSession,scheduleSession,duration,levelID,trackID,observation)
  VALUES('Keeping your SQL Code safe – An introduction to GIT and SSDT for DB professionals',
        'Imagine that you have been hard working in that amazing project, your SQL code has been tuned and contains new features 
         and followed the standard that will be crucial for the success of this project. The deploy date has arrived and you have 
         deployed early in the morning but some minutes after the deploy, the users started to call for reporting several issues
         in the different systems which are using the Databases that were part of your deployment, after stressful minutes, you 
         realized some SQL code deployed were not the same that were tested and you must rollback your code. 

         In this session, I''m going to show you how to avoid problems derived of mistakes during the development process through 
         the proper use of source control code strategy which can combine the potential of GIT and SQL Server Data Tools (SSDT) 
         for managing latest version, detecting changes, code review and deploying through environment without stress.',
        1,
        '2019-06-29 11:45:00.0000000',
        60,
        1,
        2,
        3,
        'Good luck'
  );

