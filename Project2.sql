/*Jose Del Villar PSID:1609567
Summer2020
*/

/*1.a*/
/*1.Tables*/
/*1.Table Therapist*/
	CREATE TABLE Therapists(
	therapist_id char(5),
	lname char(10),
	fname char(10),
	street char(20),
	city      char(20),
	state     char(20),
	zipcode INTEGER,
	PRIMARY KEY(therapist_id)
	);
/*1.Table Therapies*/
	CREATE TABLE Therapies(
	therapy_code INTEGER,
	description char(128),
	billable_uot INTEGER,
	PRIMARY KEY(therapy_code)
	);	
/*1.Table Patients*/
	CREATE TABLE Patients(
	Patient_No INTEGER,
	lname char(10),
	fname char(10),
	address char(20),
	city      char(20),
	state     char(20),
	zipcode INTEGER,
	bill REAL,
	PRIMARY KEY(Patient_No)
	);
/*1.Table Sessions*/
	CREATE TABLE Sessions(
	Session_No INTEGER,
	Patient_No INTEGER,
	therapist_id char(5),
	therapy_code INTEGER,
	dates DATE,
	length INTEGER,
	PRIMARY KEY(Session_No),
	FOREIGN KEY(Patient_No) REFERENCES Patients(Patient_No),
	FOREIGN KEY(therapist_id) REFERENCES Therapists(therapist_id),
	FOREIGN KEY(therapy_code) REFERENCES Therapies(therapy_code)
	);
/*1.Table CodeUpdates*/
	CREATE TABLE CodeUpdates(
	date_change DATE,
	Session_No INTEGER,
	Patient_No INTEGER,
	old_code INTEGER,
	new_code INTEGER,
    PRIMARY KEY(new_code)
	);
/*1.VIEWS*/
/*1.View Schedule Report*/
	CREATE VIEW Schedule_Report AS
    SELECT S.dates, T.lname, T.fname
    FROM Sessions S, Therapists T
    ;
/*1.View Patients Report*/
	CREATE VIEW Patients_Report AS
	SELECT P.Patient_No,P.lname,P.fname,S.dates,S.Session_No
    FROM Patients P, Sessions S
    WHERE P.Patient_No = S.Patient_No
	;
/*1.View Therapist Report*//*had to create view col_names due to column name duplicates*/
	CREATE VIEW Therapist_Report(dates,TLname,TFname,PLname,PFname) AS
	SELECT S.dates,T.lname,T.fname,P.lname,P.fname
    FROM Sessions S, Therapists T, Patients P
    WHERE S.therapist_id=T.therapist_id AND S.Patient_No=P.Patient_No
	;
	
/*2 INSERTS*/
/*2.a INSERT PATIENTS*/
	INSERT INTO Patients
	VALUES  (1010,'Koehler','Robbie','119 WEST BAY Dr.','San Vista','TX',72510,1535.15);
    INSERT INTO Patients
	VALUES	(1011,'King','Joseph','941 Treemont','Oak Hills','TX',74081,212.80);
	INSERT INTO Patients
	VALUES 	(1012,'Houghland','Susan','7841 LakeSide Dr.','Munster','TX',72380,1955.40);
    INSERT INTO Patients
	VALUES  (1013,'Falls','Tierra','44 Applewood Ave.','Palm River','TX',72511,1000.35);
    INSERT INTO Patients
	VALUES  (1014,'Odepaul','Ben','546 WCR 150 South','Munster','TX',74093,525.00);
    INSERT INTO Patients
	VALUES  (1015,'Venabe','Isaiah','37 High School Road','Waterville','TX',74183,432.30);
    INSERT INTO Patients
	VALUES  (1016,'Waggoner','Brianna','2691 Westgrove St.','Delbert','TX',72381,714.25);
    INSERT INTO Patients
	VALUES  (1017,'Short','Tobey','1928 10th Ave.','Munster','TX',72512,967.60);
    INSERT INTO Patients
	VALUES  (1018,'Baptist','Joseph','300 Erin Dr.','Waterville','TX',76658,1846.75);
    INSERT INTO Patients
	VALUES  (1019,'Culling','Latisha','4238 East 71st St.','San Vista','TX',74071,1988.50);
    INSERT INTO Patients
	VALUES  (1020,'Marino','Andre','919 Horton Ave.','Georgetown','TX',72379,688.95);
    INSERT INTO Patients
	VALUES  (1021,'Wilson','Tammy','424 October Blvd.','Waterville','TX',76658,2015.30);
	
/*2.a INSERT THERAPISTS*/
    INSERT INTO Therapists
	VALUES ('AS648','Shields','Anthony','5222 Eagle Court','Palm Rivers','TX',72511);
    INSERT INTO Therapists
	VALUES ('BM273','McClain','Bridgette','385 West Mill St.','Waterville','TX',76658);
    INSERT INTO Therapists
	VALUES ('JR085','Risk','Jonathan','1010 650 North','Palm Rivers','TX',72511);
    INSERT INTO Therapists
	VALUES ('SN852','Nair','Saritha','25 North Elm St.','Livewood','TX',72512);
    INSERT INTO Therapists
	VALUES ('SW124','Wilder','Steven','7354 Rockville Road','San Vista','TX',72510);

/*2.a INSERT THERAPIES*/
    INSERT INTO Therapies
	VALUES (90901,'Biofeedback training by any modality',NULL);
    INSERT INTO Therapies
	VALUES (92240,'Shoulder strapping',NULL);
    INSERT INTO Therapies
	VALUES (92507,'Treatment of Speech',15);
    INSERT INTO Therapies
	VALUES (92530,'Knee strapping',NULL);
    INSERT INTO Therapies
	VALUES (92540,'Ankle and/or foot strapping',NULL);
    INSERT INTO Therapies
	VALUES (95831,'Extremity or trunk muscle teasting',NULL);
    INSERT INTO Therapies
	VALUES (97010,'Hot or cold pack application',NULL);
    INSERT INTO Therapies
	VALUES (97012,'Mechanical traction',NULL);
    INSERT INTO Therapies
	VALUES (97014,'Electrical stimulation',NULL);
    INSERT INTO Therapies
	VALUES (97016,'Vasopneumatic devices',NULL);
    INSERT INTO Therapies
	VALUES (97018,'Paraffin bath',NULL);
    INSERT INTO Therapies
	VALUES (97022,'Whirlpool',NULL);
    INSERT INTO Therapies
	VALUES (97026,'Infared',NULL);
    INSERT INTO Therapies
	VALUES (97032,'Electrical stimulation',15);
    INSERT INTO Therapies
	VALUES (97033,'Iontophoresis',15);
    INSERT INTO Therapies
	VALUES (97035,'Ultrasound',15);
    INSERT INTO Therapies
	VALUES (97039,'Unlisted modality',15);
    INSERT INTO Therapies
	VALUES (97110,'Therapeutic exercises to develop strength and endurance, range of motion, and flexibility',15);
    INSERT INTO Therapies
	VALUES (97112,'Neurimuscular re-education of movement,balance,coordination,etc.',15);
    INSERT INTO Therapies
	VALUES (97113,'Aquatic therapy with therapeutic exercises',15);
    INSERT INTO Therapies
	VALUES (97116,'Gait training',15);
    INSERT INTO Therapies
	VALUES (97124,'Massage',15);
    INSERT INTO Therapies
	VALUES (97139,'Unlisted therapeutic procedure',NULL);
    INSERT INTO Therapies
	VALUES (97140,'Manual therapy techniques',15);
    INSERT INTO Therapies
	VALUES (97150,'Group therapeutic procedure',15);
    INSERT INTO Therapies
	VALUES (97530,'Dynamic activities to improve functional performance,direct (one-on-one) with the patient',15);
    INSERT INTO Therapies
	VALUES (97535,'Self-care/home management training',15);
    INSERT INTO Therapies
	VALUES (97750,'Physical performance test or measurement',15);
    INSERT INTO Therapies
	VALUES (97799,'Unlisted physical medicine/rehabilitation service or procedure',NULL);
    INSERT INTO Therapies
	VALUES (98941,'CMT of the spine',NULL);
    INSERT INTO Therapies
	VALUES (98960,'Education and training for patient self-managment',30);
	
/*2.a INSERT SESSIONS*/
    INSERT INTO Sessions
	VALUES (27,1011,'JR085',92507,'10-OCT-2021',45);
    INSERT INTO Sessions
	VALUES (28,1016,'AS648',97010,'11-OCT-2021',30);
    INSERT INTO Sessions
	VALUES (29,1014,'SW124',97014,'11-OCT-2021',60);
    INSERT INTO Sessions
	VALUES (30,1013,'BM273',97033,'12-OCT-2021',30);
    INSERT INTO Sessions
	VALUES (31,1016,'AS648',98960,'15-OCT-2021',90);
    INSERT INTO Sessions
	VALUES (32,1018,'JR085',97035,'16-OCT-2021',15);
    INSERT INTO Sessions
	VALUES (33,1017,'SN852',97039,'17-OCT-2021',60);
    INSERT INTO Sessions
	VALUES (34,1015,'BM273',97112,'17-OCT-2021',45);
    INSERT INTO Sessions
	VALUES (35,1010,'SW124',97113,'18-OCT-2021',30);
    INSERT INTO Sessions
	VALUES (36,1019,'SN852',97116,'18-OCT-2021',75);
    INSERT INTO Sessions
	VALUES (37,1020,'BM273',97124,'19-OCT-2021',30);
    INSERT INTO Sessions
	VALUES (38,1021,'AS648',97535,'19-OCT-2021',60);

/*3.1*/
	SELECT *
	FROM Patients P
	ORDER BY P.city
	;

/*3.2*/
	SELECT P.lname
	FROM Patients P
	WHERE P.bill>1000
	;

/*3.3*/
	SELECT S.length
	FROM Sessions S, Patients P
	WHERE S.Patient_No=P.Patient_No AND P.lname='Shields'
	;

/*3.4*/
	SELECT COUNT(DISTINCT(description))
	FROM Therapies
	;

/*3.5*/
	SELECT T.description, T.billable_uot
	FROM Therapies T
	WHERE INSTR(T.description,'bath')>0 OR INSTR(T.description,'hot')>0 OR INSTR(T.description,'electrical')>0 OR
		  INSTR(T.description,'Bath')>0 OR INSTR(T.description,'Hot')>0 OR INSTR(T.description,'Electrical')>0 
	;

/*3.6*/
	SELECT S.dates, T.lname, T.fname
	FROM Sessions S, Therapists T
	WHERE S.therapist_id=T.therapist_id
	ORDER BY S.dates
	;

/*3.7*/
	SELECT P.Patient_No, P.lname, P.fname, S.dates, S.Session_No
	FROM Patients P, Sessions S
	WHERE P.Patient_No=S.Patient_No
	ORDER BY P.lname,P.fname
	;

/*3.8*/
	SELECT S.dates, S.lname
	FROM schedule_report S
	;

