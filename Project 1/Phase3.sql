/*
Kyle Harding and Botao Han
Phase 3 CS3431 Project
*/

/*
Table Setup
*/

DROP TABLE StayIn CASCADE CONSTRAINTS;
DROP TABLE Examine CASCADE CONSTRAINTS;
DROP TABLE Admission CASCADE CONSTRAINTS;
DROP TABLE Patient CASCADE CONSTRAINTS;
DROP TABLE RoomAccess CASCADE CONSTRAINTS;
DROP TABLE RoomService CASCADE CONSTRAINTS;
DROP TABLE CanRepairEquip CASCADE CONSTRAINTS;
DROP TABLE EquipmentTech CASCADE CONSTRAINTS;
DROP TABLE Equipment CASCADE CONSTRAINTS;
DROP TABLE EquipmentType CASCADE CONSTRAINTS;
DROP TABLE Doctor CASCADE CONSTRAINTS;
DROP TABLE Room CASCADE CONSTRAINTS;
DROP TABLE Emp CASCADE CONSTRAINTS;


CREATE TABLE Emp(
	ID INT,
	FName CHAR(40),
	LName CHAR(40),
	Street CHAR(75),
	Town CHAR(75),
	Zip INT,
	OfficeNum INT,
	empRank INT,
	supervisorID INT,
	Salary Float,
	jobtitle CHAR(75),
	PRIMARY KEY (ID)
);

CREATE TABLE Doctor(
	empID INT,
	gender CHAR(10),
	specialty CHAR(50),
	MedSchool CHAR(75),
	PRIMARY KEY (empID),
	FOREIGN KEY (empID) REFERENCES Emp(ID)
);

CREATE TABLE EquipmentTech(
	empID INT,
	PRIMARY KEY (empID),
	FOREIGN KEY (empID) REFERENCES Emp (ID)
);

CREATE TABLE EquipmentType(
	ID INT,
	Descrip CHAR(200),
	Model CHAR(50),
	Instructions CHAR(1000),
	PRIMARY KEY (ID)
);

CREATE TABLE CanRepairEquip(
	empID INT,
	EquipType INT,
	PRIMARY KEY (empID, EquipType),
	FOREIGN KEY (empID) REFERENCES EquipmentTech (empID),
	FOREIGN KEY (EquipType) REFERENCES EquipmentType (ID)
);	

CREATE TABLE Room(
	Num INT,
	occupied INT,
	PRIMARY KEY (Num)
);

CREATE TABLE Equipment(
	SerialNum CHAR(30),
	TypeID INT,
	PurchaseYear INT,
	InspecLast DATE,
	RoomNum INT,
	PRIMARY KEY (SerialNum),
	FOREIGN KEY (TypeID) REFERENCES EquipmentType (ID),
	FOREIGN KEY (RoomNum) REFERENCES Room (Num)
);

CREATE TABLE RoomService(
	RoomNum INT,
	Service CHAR(50),
	PRIMARY KEY (RoomNum, Service),
	FOREIGN KEY (RoomNum) REFERENCES Room (Num)
);

CREATE TABLE RoomAccess(
	RoomNum INT,
	empID INT,
	PRIMARY KEY (RoomNum, empID),
	FOREIGN KEY (RoomNum) REFERENCES Room (Num)
);

CREATE TABLE Patient(
	SSN INT,
	FName CHAR(50),
	LName CHAR(50),
	Address CHAR(100),
	TelNum INT,
	PRIMARY KEY (SSN)
);

CREATE TABLE Admission(
	Num INT,
	ADate DATE,
	LDate DATE,
	TotalPayment Float,
	InsurPayment Float,
	PatientSSN INT,
	FVDate DATE,
	PRIMARY KEY (Num),
	FOREIGN KEY (PatientSSN) REFERENCES Patient (SSN)
);

CREATE TABLE Examine(
	DocID INT,
	AdmissionNum INT,
	Comments CHAR(1000),
	PRIMARY KEY (DocID, AdmissionNum),
	FOREIGN KEY (DocID) REFERENCES Doctor (empID),
	FOREIGN KEY (AdmissionNum) REFERENCES Admission (Num)
);

CREATE TABLE StayIn(
	AdmissionNum INT,
	RoomNum INT,
	StartDate DATE,
	EndDate DATE,
	PRIMARY KEY (AdmissionNum, RoomNum, StartDate),
	FOREIGN KEY (AdmissionNum) REFERENCES Admission (Num),
	FOREIGN KEY (RoomNum) REFERENCES Room (Num)
);


/*
Part 3 - Populate Tables
*/

INSERT INTO Emp(ID, FName, LName, Street, Town, Zip, OfficeNum, empRank, supervisorID, Salary, jobtitle) VALUES (1, 'John', 'Michaels', 'Oakland Avenue', 'Auburn', 13576, 101, 2, NULL, 500000.00, 'President');
INSERT INTO Emp(ID, FName, LName, Street, Town, Zip, OfficeNum, empRank, supervisorID, Salary, jobtitle) VALUES (2, 'Amanda', 'Teagen', 'Gore Street', 'Newton', 56437, 102, 0, 4, 125000.00, 'Station Technician');
INSERT INTO Emp(ID, FName, LName, Street, Town, Zip, OfficeNum, empRank, supervisorID, Salary, jobtitle) VALUES (3, 'Greg', 'Wargen', 'Fellows Road', 'Auburn', 13576, 103, 0, 10, 200000.00, 'ER Doctor');
INSERT INTO Emp(ID, FName, LName, Street, Town, Zip, OfficeNum, empRank, supervisorID, Salary, jobtitle) VALUES (4, 'Maya', 'Larson', 'Harvard Avenue', 'Worcester', 01609, 104, 1, 7, 150000.00, 'Station Manager');
INSERT INTO Emp(ID, FName, LName, Street, Town, Zip, OfficeNum, empRank, supervisorID, Salary, jobtitle) VALUES (5, 'Sheldon', 'Lewis', 'Pop Avenue', 'Auburn', 13576, 105, 1, 7, 150000.00, 'File Manager');
INSERT INTO Emp(ID, FName, LName, Street, Town, Zip, OfficeNum, empRank, supervisorID, Salary, jobtitle) VALUES (6, 'Penny', 'Stevens', 'Youth Street', 'Leem', 90143, 106, 0, 5, 100000.00, 'File Technician');
INSERT INTO Emp(ID, FName, LName, Street, Town, Zip, OfficeNum, empRank, supervisorID, Salary, jobtitle) VALUES (7, 'Raj', 'Dandekar', 'Columbia Avenue', 'Auburn', 13576, 107, 2, NULL, 300000.00, 'Floor Manager');
INSERT INTO Emp(ID, FName, LName, Street, Town, Zip, OfficeNum, empRank, supervisorID, Salary, jobtitle) VALUES (8, 'Sarah', 'Corine', 'Mary Avenue', 'Newton', 56437, 108, 12, 12, 200000.00, 'Surgeon');
INSERT INTO Emp(ID, FName, LName, Street, Town, Zip, OfficeNum, empRank, supervisorID, Salary, jobtitle) VALUES (9, 'Jakob', 'Refly', 'Young Road', 'Leem', 90143, 109, 0, 10, 120000.00, ' ER Technician');
INSERT INTO Emp(ID, FName, LName, Street, Town, Zip, OfficeNum, empRank, supervisorID, Salary, jobtitle) VALUES (10, 'Sam', 'Oshgo', 'Kulb Street', 'Newton', 56437, 110, 1, 1, 250000.00, 'ER Manager');
INSERT INTO Emp(ID, FName, LName, Street, Town, Zip, OfficeNum, empRank, supervisorID, Salary, jobtitle) VALUES (11, 'Joe', 'Tanner', 'Lander Avenue', 'Worcester', 01609, 111, 0, 12, 100000.00, 'Surgery Technician');
INSERT INTO Emp(ID, FName, LName, Street, Town, Zip, OfficeNum, empRank, supervisorID, Salary, jobtitle) VALUES (12, 'Kayla', 'Shun', 'Pastor Avenue', 'Auburn', 13576, 112, 1, 1, 250000.00, 'Surgery Manager');
INSERT INTO Emp(ID, FName, LName, Street, Town, Zip, OfficeNum, empRank, supervisorID, Salary, jobtitle) VALUES (13, 'John', 'Hargrove', 'Raelish Street', 'Leem', 90143, 113, 0, 10, 180000.00, 'ER Doctor');
INSERT INTO Emp(ID, FName, LName, Street, Town, Zip, OfficeNum, empRank, supervisorID, Salary, jobtitle) VALUES (14, 'Marsha', 'Grove', 'Froth Avenue', 'Auburn', 13576, 114, 0, 10, 100000.00, 'ER Technician');
INSERT INTO Emp(ID, FName, LName, Street, Town, Zip, OfficeNum, empRank, supervisorID, Salary, jobtitle) VALUES (15, 'Yuval', 'Phillips', 'Cambridge Street', 'Worcester', 01609, 115, 0, 12, 160000.00, 'Surgeon');
INSERT INTO Emp(ID, FName, LName, Street, Town, Zip, OfficeNum, empRank, supervisorID, Salary, jobtitle) VALUES (16, 'Faith', 'Laseur', 'Small Street', 'Auburn', 13576, 116, 0, 10, 160000.00, 'ER Doctor');
INSERT INTO Emp(ID, FName, LName, Street, Town, Zip, OfficeNum, empRank, supervisorID, Salary, jobtitle) VALUES (17, 'Cory', 'Peters', 'Weary Street', 'Worcester', 01609, 117, 0, 5, 120000.00, 'General Staff');
INSERT INTO Emp(ID, FName, LName, Street, Town, Zip, OfficeNum, empRank, supervisorID, Salary, jobtitle) VALUES (18, 'Susie', 'Aleen', 'Hall Street', 'Newton', 56437, 118, 0, 5, 110000.00, 'General Staff');
INSERT INTO Emp(ID, FName, LName, Street, Town, Zip, OfficeNum, empRank, supervisorID, Salary, jobtitle) VALUES (19, 'Fred', 'Jones', 'Orb Street', 'Leem', 90143, 119, 0, 4, 100000.00, 'General Staff');
INSERT INTO Emp(ID, FName, LName, Street, Town, Zip, OfficeNum, empRank, supervisorID, Salary, jobtitle) VALUES (20, 'Amanda', 'Gass', 'Davis Street', 'Worcester', 01609, 120, 0, 4, 100000.00, 'General Staff');
INSERT INTO Emp(ID, FName, LName, Street, Town, Zip, OfficeNum, empRank, supervisorID, Salary, jobtitle) VALUES (21, 'Owen', 'Hans', 'Coolidge Street', 'Newton', 56437, 121, 0, 4, 100000.00, 'General Staff');
INSERT INTO Emp(ID, FName, LName, Street, Town, Zip, OfficeNum, empRank, supervisorID, Salary, jobtitle) VALUES (22, 'Carl', 'Sanders', 'Alvin Street', 'Worcester', 01609, 122, 0, 10, 100000.00, 'General Staff');

INSERT INTO Doctor(empID,gender,specialty,MedSchool) VALUES (3,'Male','Emergency medicine','Yale');
INSERT INTO Doctor(empID,gender,specialty,MedSchool) VALUES (8,'Female','Internal medicine','WPI');
INSERT INTO Doctor(empID,gender,specialty,MedSchool) VALUES (13,'Male','Cardiology','WPI');
INSERT INTO Doctor(empID,gender,specialty,MedSchool) VALUES (15,'Male','Anesthesiology','Harvard');
INSERT INTO Doctor(empID,gender,specialty,MedSchool) VALUES (16,'Female','Emergency medicine','Columbia');


INSERT INTO EquipmentTech(empID) VALUES (2);
INSERT INTO EquipmentTech(empID) VALUES (6);
INSERT INTO EquipmentTech(empID) VALUES (9);
INSERT INTO EquipmentTech(empID) VALUES (11);
INSERT INTO EquipmentTech(empID) VALUES (14);

INSERT INTO EquipmentType(ID,Descrip,Model,Instructions) VALUES (1,'X-ray Machine','AG-2000','Consult Instruction Manual attached to device');
INSERT INTO EquipmentType(ID,Descrip,Model,Instructions) VALUES (2,'EKG','KK-555','Consult Instruction Manual attached to device');
INSERT INTO EquipmentType(ID,Descrip,Model,Instructions) VALUES (3,'Defibulator','FLO-344','Consult Instruction Manual attached to device');

INSERT INTO CanRepairEquip(empID,EquipType) VALUES (2, 1);
INSERT INTO CanRepairEquip(empID,EquipType) VALUES (2, 2);
INSERT INTO CanRepairEquip(empID,EquipType) VALUES (6, 2);
INSERT INTO CanRepairEquip(empID,EquipType) VALUES (6, 3);
INSERT INTO CanRepairEquip(empID,EquipType) VALUES (9, 2);
INSERT INTO CanRepairEquip(empID,EquipType) VALUES (9, 3);
INSERT INTO CanRepairEquip(empID,EquipType) VALUES (11, 2);
INSERT INTO CanRepairEquip(empID,EquipType) VALUES (14, 2);
INSERT INTO CanRepairEquip(empID,EquipType) VALUES (14, 3);

INSERT INTO Room(Num, occupied) VALUES (1, 0);
INSERT INTO Room(Num, occupied) VALUES (2, 1);
INSERT INTO Room(Num, occupied) VALUES (3, 0);
INSERT INTO Room(Num, occupied) VALUES (4, 1);
INSERT INTO Room(Num, occupied) VALUES (5, 1);
INSERT INTO Room(Num, occupied) VALUES (6, 0);
INSERT INTO Room(Num, occupied) VALUES (7, 0);
INSERT INTO Room(Num, occupied) VALUES (8, 1);
INSERT INTO Room(Num, occupied) VALUES (9, 1);
INSERT INTO Room(Num, occupied) VALUES (10, 0);

INSERT INTO Equipment(SerialNum,TypeID,PurchaseYear,InspecLast,RoomNum) VALUES ('A01-01X',1,2004,TO_DATE('2020-03-10','YYYY-MM-DD'),2);
INSERT INTO Equipment(SerialNum,TypeID,PurchaseYear,InspecLast,RoomNum) VALUES ('A01-02X',1,2008,TO_DATE('2019-11-06','YYYY-MM-DD'),6);
INSERT INTO Equipment(SerialNum,TypeID,PurchaseYear,InspecLast,RoomNum) VALUES ('A01-03X',1,2016,TO_DATE('2020-09-23','YYYY-MM-DD'),8);
INSERT INTO Equipment(SerialNum,TypeID,PurchaseYear,InspecLast,RoomNum) VALUES ('B02-01E',2,2006,TO_DATE('2020-07-20','YYYY-MM-DD'),1);
INSERT INTO Equipment(SerialNum,TypeID,PurchaseYear,InspecLast,RoomNum) VALUES ('B02-02E',2,2012,TO_DATE('2021-01-19','YYYY-MM-DD'),2);
INSERT INTO Equipment(SerialNum,TypeID,PurchaseYear,InspecLast,RoomNum) VALUES ('B02-03E',2,2018,TO_DATE('2020-08-12','YYYY-MM-DD'),3);
INSERT INTO Equipment(SerialNum,TypeID,PurchaseYear,InspecLast,RoomNum) VALUES ('B02-04E',2,2006,TO_DATE('2020-07-20','YYYY-MM-DD'),4);
INSERT INTO Equipment(SerialNum,TypeID,PurchaseYear,InspecLast,RoomNum) VALUES ('B02-05E',2,2012,TO_DATE('2021-01-19','YYYY-MM-DD'),5);
INSERT INTO Equipment(SerialNum,TypeID,PurchaseYear,InspecLast,RoomNum) VALUES ('B02-06E',2,2018,TO_DATE('2020-04-12','YYYY-MM-DD'),6);
INSERT INTO Equipment(SerialNum,TypeID,PurchaseYear,InspecLast,RoomNum) VALUES ('B02-07E',2,2006,TO_DATE('2020-07-11','YYYY-MM-DD'),7);
INSERT INTO Equipment(SerialNum,TypeID,PurchaseYear,InspecLast,RoomNum) VALUES ('B02-08E',2,2012,TO_DATE('2021-01-02','YYYY-MM-DD'),8);
INSERT INTO Equipment(SerialNum,TypeID,PurchaseYear,InspecLast,RoomNum) VALUES ('B02-09E',2,2018,TO_DATE('2020-10-10','YYYY-MM-DD'),9);
INSERT INTO Equipment(SerialNum,TypeID,PurchaseYear,InspecLast,RoomNum) VALUES ('C03-01D',3,2004,TO_DATE('2020-10-03','YYYY-MM-DD'),1);
INSERT INTO Equipment(SerialNum,TypeID,PurchaseYear,InspecLast,RoomNum) VALUES ('C03-02D',3,2006,TO_DATE('2020-02-22','YYYY-MM-DD'),2);
INSERT INTO Equipment(SerialNum,TypeID,PurchaseYear,InspecLast,RoomNum) VALUES ('C03-03D',3,2007,TO_DATE('2020-10-03','YYYY-MM-DD'),3);
INSERT INTO Equipment(SerialNum,TypeID,PurchaseYear,InspecLast,RoomNum) VALUES ('C03-04D',3,2010,TO_DATE('2020-02-22','YYYY-MM-DD'),4);
INSERT INTO Equipment(SerialNum,TypeID,PurchaseYear,InspecLast,RoomNum) VALUES ('C03-05D',3,2010,TO_DATE('2020-07-13','YYYY-MM-DD'),5);
INSERT INTO Equipment(SerialNum,TypeID,PurchaseYear,InspecLast,RoomNum) VALUES ('C03-06D',3,2011,TO_DATE('2020-10-03','YYYY-MM-DD'),6);
INSERT INTO Equipment(SerialNum,TypeID,PurchaseYear,InspecLast,RoomNum) VALUES ('C03-07D',3,2014,TO_DATE('2020-07-13','YYYY-MM-DD'),7);
INSERT INTO Equipment(SerialNum,TypeID,PurchaseYear,InspecLast,RoomNum) VALUES ('C03-08D',3,2018,TO_DATE('2020-02-22','YYYY-MM-DD'),8);
INSERT INTO Equipment(SerialNum,TypeID,PurchaseYear,InspecLast,RoomNum) VALUES ('C03-09D',3,2018,TO_DATE('2020-07-13','YYYY-MM-DD'),9);
INSERT INTO Equipment(SerialNum,TypeID,PurchaseYear,InspecLast,RoomNum) VALUES ('C03-10D',3,2019,TO_DATE('2020-07-13','YYYY-MM-DD'),10);

INSERT INTO RoomService(RoomNum,Service) VALUES (1, 'Ward Room');
INSERT INTO RoomService(RoomNum,Service) VALUES (3, 'Ward Room');
INSERT INTO RoomService(RoomNum,Service) VALUES (4, 'Ward Room');
INSERT INTO RoomService(RoomNum,Service) VALUES (5, 'Ward Room');
INSERT INTO RoomService(RoomNum,Service) VALUES (7, 'Ward Room');
INSERT INTO RoomService(RoomNum,Service) VALUES (9, 'Ward Room');
INSERT INTO RoomService(RoomNum,Service) VALUES (10, 'Ward Room');
INSERT INTO RoomService(RoomNum,Service) VALUES (2, 'Operating Room');
INSERT INTO RoomService(RoomNum,Service) VALUES (6, 'Operating Room');
INSERT INTO RoomService(RoomNum,Service) VALUES (8, 'Operating Room');
INSERT INTO RoomService(RoomNum,Service) VALUES (4, 'Intensive care unit (ICU)');
INSERT INTO RoomService(RoomNum,Service) VALUES (5, 'Intensive care unit (ICU)');
INSERT INTO RoomService(RoomNum,Service) VALUES (7, 'Intensive care unit (ICU)');
INSERT INTO RoomService(RoomNum,Service) VALUES (1, 'Consulting Room');
INSERT INTO RoomService(RoomNum,Service) VALUES (3, 'Consulting Room');
INSERT INTO RoomService(RoomNum,Service) VALUES (9, 'Emergency Room');
INSERT INTO RoomService(RoomNum,Service) VALUES (10, 'Emergency Room');

INSERT INTO RoomAccess(RoomNum,empID) VALUES (1,1);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (3,1);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (1,2);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (3,2);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (4,2);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (5,2);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (7,2);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (9,2);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (10,2);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (9,3);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (10,3);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (1,4);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (3,4);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (4,4);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (5,4);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (7,4);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (9,4);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (10,4);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (1,5);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (3,5);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (1,6);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (3,6);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (1,7);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (2,7);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (3,7);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (4,7);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (5,7);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (6,7);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (7,7);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (8,7);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (9,7);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (10,7);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (2,8);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (6,8);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (8,8);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (9,9);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (10,9);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (9,10);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (10,10);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (2,11);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (6,11);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (8,11);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (2,12);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (6,12);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (8,12);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (9,13);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (10,13);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (9,14);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (10,14);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (2,15);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (6,15);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (8,15);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (9,16);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (10,16);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (1,17);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (3,17);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (1,18);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (3,18);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (1,19);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (3,19);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (4,19);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (5,19);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (7,19);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (9,19);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (10,19);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (1,20);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (3,20);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (4,20);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (5,20);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (7,20);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (9,20);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (10,20);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (1,21);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (3,21);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (4,21);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (5,21);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (7,21);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (9,21);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (10,21);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (9,22);
INSERT INTO RoomAccess(RoomNum,empID) VALUES (10,22);

INSERT INTO Patient(SSN,Fname,Lname,Address,TelNum) VALUES (111223333,'Laurice','Ford','7245 Park Court',18012128712);
INSERT INTO Patient(SSN,Fname,Lname,Address,TelNum) VALUES (214533085,'Madalyn','Laun','430 Prospect Street',15928371499);
INSERT INTO Patient(SSN,Fname,Lname,Address,TelNum) VALUES (140829345,'Waldo','Full','9177 Bohemia St.',11617453059);
INSERT INTO Patient(SSN,Fname,Lname,Address,TelNum) VALUES (760262693,'Marvin','Hass','150 Henry Smith Ave.',11385397472);
INSERT INTO Patient(SSN,Fname,Lname,Address,TelNum) VALUES (770504879,'Yahaira','Fann','8523 Division Ave.',18202667357);
INSERT INTO Patient(SSN,Fname,Lname,Address,TelNum) VALUES (401834113,'Tobi','Cully','355 Chestnut Dr.',16416320436);
INSERT INTO Patient(SSN,Fname,Lname,Address,TelNum) VALUES (797290472,'Thomas','Olsen','993 Thompson Street',19104704484);
INSERT INTO Patient(SSN,Fname,Lname,Address,TelNum) VALUES (682453864,'Doria','Lena','7294 Rockwell St.',16553351451);
INSERT INTO Patient(SSN,Fname,Lname,Address,TelNum) VALUES (575162457,'Viviana','Fuller','8635 Academy St.',16327552104);
INSERT INTO Patient(SSN,Fname,Lname,Address,TelNum) VALUES (139649791,'Emelia','Doge','12 Cedarwood Lane',19679185400);

INSERT INTO Admission(Num,ADate,LDate,TotalPayment,InsurPayment,PatientSSN,FVDate) VALUES (1,TO_DATE('2019-07-26','YYYY-MM-DD'),TO_DATE('2019-08-05','YYYY-MM-DD'),317309,0.3,111223333,TO_DATE('2019-08-22','YYYY-MM-DD'));
INSERT INTO Admission(Num,ADate,LDate,TotalPayment,InsurPayment,PatientSSN,FVDate) VALUES (2,TO_DATE('2019-08-03','YYYY-MM-DD'),TO_DATE('2019-08-05','YYYY-MM-DD'),653678,0.25,214533085,NULL);
INSERT INTO Admission(Num,ADate,LDate,TotalPayment,InsurPayment,PatientSSN,FVDate) VALUES (3,TO_DATE('2019-08-05','YYYY-MM-DD'),TO_DATE('2019-08-13','YYYY-MM-DD'),251836,0.8,140829345,NULL);
INSERT INTO Admission(Num,ADate,LDate,TotalPayment,InsurPayment,PatientSSN,FVDate) VALUES (4,TO_DATE('2019-08-08','YYYY-MM-DD'),TO_DATE('2019-08-15','YYYY-MM-DD'),376289,0.25,760262693,NULL);
INSERT INTO Admission(Num,ADate,LDate,TotalPayment,InsurPayment,PatientSSN,FVDate) VALUES (5,TO_DATE('2019-08-08','YYYY-MM-DD'),TO_DATE('2019-08-13','YYYY-MM-DD'),391666,0.3,770504879,NULL);
INSERT INTO Admission(Num,ADate,LDate,TotalPayment,InsurPayment,PatientSSN,FVDate) VALUES (6,TO_DATE('2019-08-13','YYYY-MM-DD'),TO_DATE('2019-08-18','YYYY-MM-DD'),407268,0.25,401834113,NULL);
INSERT INTO Admission(Num,ADate,LDate,TotalPayment,InsurPayment,PatientSSN,FVDate) VALUES (7,TO_DATE('2019-08-15','YYYY-MM-DD'),TO_DATE('2019-08-22','YYYY-MM-DD'),976122,0.8,797290472,TO_DATE('2019-09-04','YYYY-MM-DD'));
INSERT INTO Admission(Num,ADate,LDate,TotalPayment,InsurPayment,PatientSSN,FVDate) VALUES (8,TO_DATE('2019-08-22','YYYY-MM-DD'),TO_DATE('2019-08-25','YYYY-MM-DD'),606975,0.3,111223333,TO_DATE('2019-10-01','YYYY-MM-DD'));
INSERT INTO Admission(Num,ADate,LDate,TotalPayment,InsurPayment,PatientSSN,FVDate) VALUES (9,TO_DATE('2019-08-22','YYYY-MM-DD'),TO_DATE('2019-08-29','YYYY-MM-DD'),348588,0.25,682453864,TO_DATE('2019-09-08','YYYY-MM-DD'));
INSERT INTO Admission(Num,ADate,LDate,TotalPayment,InsurPayment,PatientSSN,FVDate) VALUES (10,TO_DATE('2019-08-30','YYYY-MM-DD'),TO_DATE('2019-09-08','YYYY-MM-DD'),774590,0.6,575162457,TO_DATE('2019-09-28','YYYY-MM-DD'));
INSERT INTO Admission(Num,ADate,LDate,TotalPayment,InsurPayment,PatientSSN,FVDate) VALUES (11,TO_DATE('2019-09-03','YYYY-MM-DD'),TO_DATE('2019-09-13','YYYY-MM-DD'),861404,0.5,139649791,TO_DATE('2019-10-27','YYYY-MM-DD'));
INSERT INTO Admission(Num,ADate,LDate,TotalPayment,InsurPayment,PatientSSN,FVDate) VALUES (12,TO_DATE('2019-09-08','YYYY-MM-DD'),TO_DATE('2019-09-10','YYYY-MM-DD'),729410,0.25,682453864,TO_DATE('2019-11-03','YYYY-MM-DD'));
INSERT INTO Admission(Num,ADate,LDate,TotalPayment,InsurPayment,PatientSSN,FVDate) VALUES (13,TO_DATE('2019-09-28','YYYY-MM-DD'),TO_DATE('2019-09-29','YYYY-MM-DD'),577675,0.6,575162457,TO_DATE('2019-10-15','YYYY-MM-DD'));
INSERT INTO Admission(Num,ADate,LDate,TotalPayment,InsurPayment,PatientSSN,FVDate) VALUES (14,TO_DATE('2019-10-27','YYYY-MM-DD'),TO_DATE('2019-10-29','YYYY-MM-DD'),891574,0.5,139649791,TO_DATE('2019-11-06','YYYY-MM-DD'));
INSERT INTO Admission(Num,ADate,LDate,TotalPayment,InsurPayment,PatientSSN,FVDate) VALUES (15,TO_DATE('2019-10-01','YYYY-MM-DD'),TO_DATE('2019-10-09','YYYY-MM-DD'),796872,0.3,111223333,TO_DATE('2019-11-02','YYYY-MM-DD'));
INSERT INTO Admission(Num,ADate,LDate,TotalPayment,InsurPayment,PatientSSN,FVDate) VALUES (16,TO_DATE('2019-09-04','YYYY-MM-DD'),TO_DATE('2019-09-07','YYYY-MM-DD'),371917,0.8,797290472,TO_DATE('2019-11-07','YYYY-MM-DD'));

INSERT INTO Examine(DocID,AdmissionNum,Comments) VALUES (8,1,'2 weeks of rest and morphine perscribed');
INSERT INTO Examine(DocID,AdmissionNum,Comments) VALUES (3,2,'Fixed broken arm, 2 weeks rest');
INSERT INTO Examine(DocID,AdmissionNum,Comments) VALUES (13,3,'Pumped stomach, stayed night');
INSERT INTO Examine(DocID,AdmissionNum,Comments) VALUES (15,4,'Patient Feeling better');
INSERT INTO Examine(DocID,AdmissionNum,Comments) VALUES (16,5,'Fixed leg fracture');
INSERT INTO Examine(DocID,AdmissionNum,Comments) VALUES (13,6,'Prescribed Adderol');
INSERT INTO Examine(DocID,AdmissionNum,Comments) VALUES (15,7,'Checked hearing and vision, further tests needed');
INSERT INTO Examine(DocID,AdmissionNum,Comments) VALUES (8,8,'Second visit, Patient doing well. Prescribed more morphine.');
INSERT INTO Examine(DocID,AdmissionNum,Comments) VALUES (13,9,'Prescribed oils');
INSERT INTO Examine(DocID,AdmissionNum,Comments) VALUES (8,10,'Checked Patients reflexes');
INSERT INTO Examine(DocID,AdmissionNum,Comments) VALUES (15,11,'Looked at patients skin');
INSERT INTO Examine(DocID,AdmissionNum,Comments) VALUES (13,12,'Second Visit, Patient is doing well');
INSERT INTO Examine(DocID,AdmissionNum,Comments) VALUES (8,13,'Second Visit, Patient is doing well');
INSERT INTO Examine(DocID,AdmissionNum,Comments) VALUES (15,14,'Second Visit, Patient is doing well');
INSERT INTO Examine(DocID,AdmissionNum,Comments) VALUES (8,15,'Third Visit, Patient is doing well, one more visit required');
INSERT INTO Examine(DocID,AdmissionNum,Comments) VALUES (15,16,'Second Visit, Patient is doing well');

INSERT INTO StayIn(AdmissionNum,RoomNum,StartDate,EndDate) VALUES (1,1,TO_DATE('7/26/2019','MM/DD/YYYY'),TO_DATE('8/5/2019','MM/DD/YYYY'));
INSERT INTO StayIn(AdmissionNum,RoomNum,StartDate,EndDate) VALUES (2,3,TO_DATE('8/3/2019','MM/DD/YYYY'),TO_DATE('8/5/2019','MM/DD/YYYY'));
INSERT INTO StayIn(AdmissionNum,RoomNum,StartDate,EndDate) VALUES (3,4,TO_DATE('8/5/2019','MM/DD/YYYY'),TO_DATE('8/13/2019','MM/DD/YYYY'));
INSERT INTO StayIn(AdmissionNum,RoomNum,StartDate,EndDate) VALUES (4,5,TO_DATE('8/8/2019','MM/DD/YYYY'),TO_DATE('8/15/2019','MM/DD/YYYY'));
INSERT INTO StayIn(AdmissionNum,RoomNum,StartDate,EndDate) VALUES (5,7,TO_DATE('8/8/2019','MM/DD/YYYY'),TO_DATE('8/13/2019','MM/DD/YYYY'));
INSERT INTO StayIn(AdmissionNum,RoomNum,StartDate,EndDate) VALUES (6,9,TO_DATE('8/13/2019','MM/DD/YYYY'),TO_DATE('8/18/2019','MM/DD/YYYY'));
INSERT INTO StayIn(AdmissionNum,RoomNum,StartDate,EndDate) VALUES (7,3,TO_DATE('8/15/2019','MM/DD/YYYY'),TO_DATE('8/22/2019','MM/DD/YYYY'));
INSERT INTO StayIn(AdmissionNum,RoomNum,StartDate,EndDate) VALUES (8,1,TO_DATE('8/22/2019','MM/DD/YYYY'),TO_DATE('8/25/2019','MM/DD/YYYY'));
INSERT INTO StayIn(AdmissionNum,RoomNum,StartDate,EndDate) VALUES (9,5,TO_DATE('8/22/2019','MM/DD/YYYY'),TO_DATE('8/29/2019','MM/DD/YYYY'));
INSERT INTO StayIn(AdmissionNum,RoomNum,StartDate,EndDate) VALUES (10,4,TO_DATE('8/30/2019','MM/DD/YYYY'),TO_DATE('9/8/2019','MM/DD/YYYY'));
INSERT INTO StayIn(AdmissionNum,RoomNum,StartDate,EndDate) VALUES (11,3,TO_DATE('9/3/2019','MM/DD/YYYY'),TO_DATE('9/13/2019','MM/DD/YYYY'));
INSERT INTO StayIn(AdmissionNum,RoomNum,StartDate,EndDate) VALUES (12,5,TO_DATE('9/8/2019','MM/DD/YYYY'),TO_DATE('9/10/2019','MM/DD/YYYY'));
INSERT INTO StayIn(AdmissionNum,RoomNum,StartDate,EndDate) VALUES (13,4,TO_DATE('9/28/2019','MM/DD/YYYY'),TO_DATE('9/29/2019','MM/DD/YYYY'));
INSERT INTO StayIn(AdmissionNum,RoomNum,StartDate,EndDate) VALUES (14,9,TO_DATE('10/27/2019','MM/DD/YYYY'),TO_DATE('10/29/2019','MM/DD/YYYY'));
INSERT INTO StayIn(AdmissionNum,RoomNum,StartDate,EndDate) VALUES (15,1,TO_DATE('10/01/2019','MM/DD/YYYY'),TO_DATE('10/09/2019','MM/DD/YYYY'));
INSERT INTO StayIn(AdmissionNum,RoomNum,StartDate,EndDate) VALUES (16,9,TO_DATE('9/4/2019','MM/DD/YYYY'),TO_DATE('9/7/2019','MM/DD/YYYY'));

/*
Part 1 - Views ---------------------------------------------------------------------------
*/

/*
Q1
*/

DROP VIEW CriticalCases;

CREATE VIEW CriticalCases(Patient_SSN,firstName,lastName,numberOfAdmissionsToICU)
AS SELECT P.SSN, P.FName, P.LName, H.NumAdmissions
FROM Patient P, (SELECT A.PatientSSN, COUNT(A.Num) AS NumAdmissions
						FROM Admission A, (SELECT S.AdmissionNum 
											FROM StayIn S, RoomService J
											WHERE S.RoomNum = J.RoomNum AND J.Service = 'Intensive care unit (ICU)') T
						WHERE A.Num = T.AdmissionNum
						GROUP BY A.PatientSSN) H
WHERE P.SSN = H.PatientSSN AND H.NumAdmissions >= 2;

/*
Q2
*/

DROP VIEW DoctorsLoad;

CREATE VIEW DoctorsLoad(DoctorID,graduatedFrom,load)
AS SELECT D.empID, D.MedSchool, CASE 
									WHEN totalload > 10 THEN 'Overloaded' 
									ELSE 'Underloaded'
								END AS load
FROM Doctor D, (SELECT DocID, COUNT(AdmissionNum) AS totalload
				FROM Examine
				GROUP BY DocID) H
WHERE D.empID = H.DocID;

/*
Q3
*/

SELECT *
FROM CriticalCases
WHERE numberOfAdmissionsToICU > 4;

/*
Q4
*/

SELECT E.ID, E.FName, E.LName
FROM  Emp E, DoctorsLoad L
WHERE E.ID = L.DoctorID
AND L.load = 'Overloaded'
AND L.graduatedFrom = 'WPI';

/*
Q4
*/

SELECT G.PatientSSN, G.DoctorID, G.Comments
FROM CriticalCases C, (SELECT A.PatientSSN, S.DoctorID, S.Comments
						FROM Admission A, (SELECT *
											FROM DoctorsLoad D, Examine E
											WHERE D.DoctorID = E.DocID
											AND D.load = 'Underloaded') S
						WHERE S.AdmissionNum = A.Num) G
WHERE G.PatientSSN = C.Patient_SSN;

/*
Part 2 - Triggers --------------------------------------------------------------------------
*/

/*
Q1 - If a doctor visits a patient who has been in the ICU during their current
admission, they must leave a comment
*/

DROP TRIGGER checkComments;

CREATE TRIGGER checkComments
BEFORE INSERT OR UPDATE ON Examine
FOR EACH ROW
DECLARE
	temp INT;
	CURSOR C1 IS (SELECT S.AdmissionNum
					FROM StayIn S, RoomService J
					WHERE S.RoomNum = J.RoomNum AND J.Service = 'Intensive care unit (ICU)');
BEGIN
	OPEN C1;
	LOOP
		FETCH C1 INTO temp;
		IF(C1%FOUND)THEN
			IF(:new.AdmissionNum = temp)THEN
				IF(:new.Comments IS NULL)THEN
					RAISE_APPLICATION_ERROR(-20004, 'Error Comments field missing, Comments must be included for ICU patients');
				END IF;
			END IF;
		END IF;
		EXIT WHEN C1%NOTFOUND;
	END LOOP;
	CLOSE C1;
END;
/

/*
Q3 - Ensure that regular employees (with rank 0) must have their supervisors as
division managers (with rank 1).
Q4 - Similarly, division managers (with rank 1) must have their supervisors as general
managers (with rank 2).
*/

DROP TRIGGER SupervisorCheck;

CREATE TRIGGER SupervisorCheck
BEFORE INSERT OR UPDATE ON Emp
FOR EACH ROW
DECLARE
	tempRank INT;
BEGIN
	IF(:new.empRank = 0)THEN
		IF(:new.supervisorID IS NULL)THEN
			RAISE_APPLICATION_ERROR(-20004, 'Invalid Supervisor ID');
		END IF;
		IF(:new.supervisorID IS NOT NULL)THEN
			SELECT empRank into tempRank
			FROM Emp
			WHERE ID = :new.supervisorID;
			
			IF(tempRank != 1)THEN
				RAISE_APPLICATION_ERROR(-20004, 'Regular employees can only be supervised by a division manager');
			END IF;
		END IF;
	END IF;
	
	IF(:new.empRank = 1)THEN
		IF(:new.supervisorID IS NULL)THEN
			RAISE_APPLICATION_ERROR(-20004, 'Invalid Supervisor ID');
		END IF;
		IF(:new.supervisorID IS NOT NULL)THEN
			SELECT empRank into tempRank
			FROM Emp
			WHERE ID = :new.supervisorID;
			
			IF(tempRank != 2)THEN
				RAISE_APPLICATION_ERROR(-20004, 'Division managers can only be managed by a general manager');
			END IF;
		END IF;
	END IF;
	
	IF(:new.empRank = 2)THEN
		IF(:new.supervisorID IS NOT NULL)THEN
			RAISE_APPLICATION_ERROR(-20004, 'Invalid Supervisor ID');
		END IF;
	END IF;
END;
/

/*
Q5 - • When a patient is admitted to an Emergency Room (a room with an Emergency
service) on date D, the futureVisitDate should be automatically set to 2 months
after that date, i.e., D + 2 months.
*/

DROP TRIGGER autoFVdate;

CREATE TRIGGER autoFVdate
BEFORE INSERT ON Admission
FOR EACH ROW
DECLARE
	tempService CHAR(10);
	tempRoom INT;
	tempDate DATE;
BEGIN
	SELECT RoomNum INTO tempRoom
	FROM StayIn
	WHERE AdmissionNum = :new.Num;
	
	SELECT Service INTO tempService
	FROM RoomService
	WHERE RoomNum = tempRoom;
	
	IF(tempService = 'Emergency Room')THEN
		:new.FVDate := :new.ADate + INTERVAL '2' MONTH;
	END IF;
END;
/

/*
Q6 - When a new piece of equipment is purchased and it has not been inspected for
over a month, check if there is an equipment technician who can service it. If
there is, update the inspection date
*/

DROP TRIGGER InspectionCheck;

CREATE TRIGGER InspectionCheck
BEFORE INSERT ON Equipment
FOR EACH ROW
DECLARE
	tempType INT;
	CURSOR C1 IS (SELECT EquipType
					FROM CanRepairEquip
					GROUP BY EquipType); 
BEGIN
	IF(:new.InspecLast < SYSDATE - INTERVAL '1' MONTH)THEN
		OPEN C1;	
		LOOP
			FETCH C1 INTO tempType;
			IF(C1%FOUND)THEN
				IF(:new.TypeID = tempType)THEN
					:new.InspecLast := SYSDATE;
				END IF;
			END IF;
			EXIT WHEN C1%NOTFOUND;
		END LOOP;
		CLOSE C1;
	END IF;
END;
/

/*
Q2 -  The insurance payment should be calculated automatically as 65% of the total payment.
Q7 - When a patient leaves the hospital (admission leave time is set), print out the
patient’s first and last name, address, all of the comments from doctors involved
in that admission, and which doctor (name) left each comment.
*/

DROP TRIGGER PatientLeavesInsurPercent;
SET serveroutput ON;

CREATE TRIGGER PatientLeavesInsurPercent
BEFORE INSERT OR UPDATE ON Admission
FOR EACH ROW
DECLARE
	tempFName CHAR(50);
	tempLName CHAR(50);
	tempAddress CHAR(100);
	tempComments CHAR(1000);
	tempDocName CHAR(50);
BEGIN
	IF(:new.InsurPayment <> .65)THEN
		:new.InsurPayment := .65
	END IF;

	IF(:new.LDate IS NOT NULL)THEN
		SELECT FName, LName, Address INTO tempFName, tempLName, tempAddress
		FROM Patient
		WHERE SSN = :new.PatientSSN;
		
		SELECT Examine.Comments, Emp.FName INTO tempComments, tempDocName
		FROM Examine, Emp
		WHERE Examine.DocID = Emp.ID
		AND Examine.AdmissionNum = :new.Num;
		
		dbms_output.put_line(tempFName || ' ' || tempLName || ' ' || tempAddress || ' ' || tempComments || ' ' || tempDocName);
	END IF;
END;
/

