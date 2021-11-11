DROP TABLE Works;
DROP TABLE Dept;
DROP TABLE Emp;

CREATE TABLE Emp(  
eidE INT, 
ename CHAR (100), 
age INT, 
salary Float, 
PRIMARY KEY (eidE) 
);

CREATE TABLE Dept( 
didD INT, 
dname VARCHAR (100),  
budget Float, 
managerid INT, 
PRIMARY KEY (didD), 
FOREIGN KEY (managerid) REFERENCES Emp (eidE) 
);

CREATE TABLE Works( 
eidW INT, 
didW INT, 
pct_time INT, 
PRIMARY KEY (eidW,didW), 
FOREIGN KEY (eidW) REFERENCES Emp (eidE), 
FOREIGN KEY (didW) REFERENCES Dept (didD) 
);

/* Data input for database */

INSERT INTO Emp(eidE, ename, age, salary) VALUES (11564812,'John Williams',35,74098.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (15487874,'Gene Edwards',51,41008.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (15645489,'Daniel Evans',25,40312.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (51135593,'Maria White',22,24998.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (54879887,'Dorthy Lewis',33,41008.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (60839453,'Charles Harris',24,24998.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (74454898,'Scott Bell',23,70100.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (90873519,'Elizabeth Taylor',27,33055.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (98784544,'Eric Collins',23,41008.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (112348546,'Joseph Thompson',26,24998.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (115987938,'Christopher Garcia',60,24998.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (128778823,'William Ward',33,24998.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (132977562,'Angela Martinez',31,24998.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (141582651,'Mary Johnson',44,94011.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (141582657,'Stanley Browne',23,14093.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (142519864,'Susan Martin',39,56990.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (156465461,'Eric Cooper',26,24998.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (156489494,'Gil Richardson',32,70100.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (159542516,'Matt Nelson',33,48990.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (178949844,'Chad Stewart',29,24998.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (179887498,'Dorthy Howard',28,40312.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (242518965,'James Smith',68,27099.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (248965255,'Barbara Wilson',48,95021.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (254099823,'Patricia Jones',28,250000.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (254898318,'Gim Rogers',25,32175.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (267894232,'Paul Hall',25,24998.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (269734834,'Rick Carter',38,24998.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (274878974,'Harry Watson',30,24998.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (280158572,'Margaret Clark',40,24998.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (287321212,'Michael Miller',62,131072.0);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (289562686,'Thomas Robinson',34,32175.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (291795563,'Haywood Kelly',36,32175.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (298489484,'Lisa Gray',31,24998.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (301221823,'Juan Rodriguez',30,32175.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (310454876,'Milo Brooks',22,39910.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (318548912,'Ann Mitchell',23,32175.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (320874981,'Daniel Lee',23,32175.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (322654189,'Lisa Walker',38,32175.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (334568786,'William Moore',32,32175.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (348121549,'Trey Phillips',69,32175.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (351565322,'Nancy Allen',30,39910.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (355548984,'Tom Murphy',41,32175.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (356187925,'Robert Brown',28,35431.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (390487451,'Mark Coleman',42,39910.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (451519864,'Mark Young',34,39910.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (454565232,'Louis Jenkins',20,39910.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (455798411,'Luis Hernandez',44,39910.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (486512566,'David Anderson',20,25199.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (489221823,'Richard Jackson',33,32996.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (489456522,'Linda Davis',26,25971.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (548977562,'Donald King',43,92048.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (550156548,'George Wright',42,41008.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (552455318,'Ana Lopez',35,41008.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (556784565,'Kenneth Hill',81,41008.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (567354612,'Karen Scott',70,39910.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (573284895,'Steven Green',29,39910.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (574489456,'Betty Adams',39,39910.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (578875478,'Edward Baker',50,101071.0);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (619023588,'Jennifer Thomas',24,34654.00);

INSERT INTO Dept(didD, dname, budget, managerid) VALUES (1,'Hardware',1048572.12,141582651);
INSERT INTO Dept(didD, dname, budget, managerid) VALUES (2,'Operations',12099101.00,287321212);
INSERT INTO Dept(didD, dname, budget, managerid) VALUES (3,'Legal',222988.13,248965255);
INSERT INTO Dept(didD, dname, budget, managerid) VALUES (4,'Marketing',4380990.54,548977562);
INSERT INTO Dept(didD, dname, budget, managerid) VALUES (5,'Software',400011.12,141582651);
INSERT INTO Dept(didD, dname, budget, managerid) VALUES (6,'Production',12099101.00,578875478);
INSERT INTO Dept(didD, dname, budget, managerid) VALUES (7,'Shipping',5.00,141582651);
INSERT INTO Dept(didD, dname, budget, managerid) VALUES (8,'Shopping',50000000.00,489456522);

INSERT INTO Works(eidW, didW, pct_time) VALUES (11564812,3,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (15487874,6,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (15645489,6,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (51135593,2,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (54879887,6,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (60839453,2,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (74454898,6,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (90873519,2,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (98784544,6,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (112348546,2,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (115987938,2,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (128778823,6,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (132977562,2,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (141582651,1,50);
INSERT INTO Works(eidW, didW, pct_time) VALUES (141582651,5,50);
INSERT INTO Works(eidW, didW, pct_time) VALUES (141582657,1,25);
INSERT INTO Works(eidW, didW, pct_time) VALUES (141582657,5,75);
INSERT INTO Works(eidW, didW, pct_time) VALUES (142519864,2,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (156465461,6,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (156489494,6,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (159542516,4,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (178949844,6,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (179887498,6,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (242518965,1,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (248965255,3,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (254099823,3,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (267894232,6,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (269734834,2,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (274878974,6,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (280158572,2,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (287321212,2,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (289562686,6,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (291795563,6,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (298489484,6,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (301221823,2,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (310454876,6,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (318548912,2,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (320874981,2,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (322654189,2,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (334568786,6,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (348121549,2,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (351565322,2,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (355548984,6,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (356187925,2,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (390487451,6,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (451519864,2,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (454565232,6,50);
INSERT INTO Works(eidW, didW, pct_time) VALUES (455798411,2,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (486512566,4,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (489221823,2,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (489456522,7,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (548977562,4,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (550156548,2,50);
INSERT INTO Works(eidW, didW, pct_time) VALUES (552455318,2,25);
INSERT INTO Works(eidW, didW, pct_time) VALUES (556784565,2,25);
INSERT INTO Works(eidW, didW, pct_time) VALUES (567354612,2,75);
INSERT INTO Works(eidW, didW, pct_time) VALUES (573284895,2,50);
INSERT INTO Works(eidW, didW, pct_time) VALUES (574489456,2,50);
INSERT INTO Works(eidW, didW, pct_time) VALUES (578875478,6,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (619023588,1,100);


/* Problem 1
*/
SELECT E.ename,E.age
FROM Emp E, Works K, Dept D
WHERE E.eidE = K.eidW AND K.didW = D.didD
AND dname = 'Hardware'
INTERSECT
SELECT ename,age
FROM Emp E, Works K, Dept D
WHERE E.eidE = K.eidW AND K.didW = D.didD
AND dname = 'Software';


/* Problem 2
*/
SELECT didW, COUNT(eidW) AS numE
FROM Works
GROUP BY didW
HAVING SUM(pct_time) > 1000;


/* Problem 3 
*/
SELECT E.ename
FROM Emp E, (SELECT D.budget, K.eidW
            FROM Works K, Dept D
            WHERE K.didW = D.didD) G
WHERE E.eidE = G.eidW 
AND E.salary > G.budget;


/* Problem 4
*/
SELECT DISTINCT D.managerid
FROM Dept D
WHERE 1000000 <ALL (SELECT D1.budget
			    FROM Dept D1
			    WHERE D1.managerid = D.managerid);

			    
/* Problem 5
*/
SELECT E.ename
FROM Emp E
WHERE E.eidE IN (SELECT D.managerid
			    FROM Dept D
		    	WHERE D.budget = (SELECT MAX(D2.budget)
				                  FROM Dept D2));



/*
Second Set of Test Data
*/
DELETE FROM Works;
DELETE FROM Dept;
DELETE FROM Emp;



INSERT INTO Emp(eidE, ename, age, salary) VALUES (1,'John Williams',35,1500.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (2,'Fred Scott',57,400.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (3,'Greg Follows',75,800.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (4,'Henry Toffer',48,200.00);
INSERT INTO Emp(eidE, ename, age, salary) VALUES (5,'Albert Gore',24,100.00);

INSERT INTO Dept(didD, dname, budget, managerid) VALUES (1,'R&D',5000.00,3);
INSERT INTO Dept(didD, dname, budget, managerid) VALUES (2,'Farming',600000.00,5);
INSERT INTO Dept(didD, dname, budget, managerid) VALUES (3,'Filing',600000.00,4);

INSERT INTO Works(eidW, didW, pct_time) VALUES (2,2,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (3,1,100);
INSERT INTO Works(eidW, didW, pct_time) VALUES (4,1,25);
INSERT INTO Works(eidW, didW, pct_time) VALUES (4,3,75);
INSERT INTO Works(eidW, didW, pct_time) VALUES (5,2,50);
INSERT INTO Works(eidW, didW, pct_time) VALUES (5,3,50);
INSERT INTO Works(eidW, didW, pct_time) VALUES (1,2,100);

/*
Test Problem 5: Case where two departments budgets are the same maximum budget so it should brint both managers of the departments, Albert Gore and Henry Toffer.
*/
SELECT E.ename
FROM Emp E
WHERE E.eidE IN (SELECT D.managerid
			    FROM Dept D
		    	WHERE D.budget = (SELECT MAX(D2.budget)
				                  FROM Dept D2));
