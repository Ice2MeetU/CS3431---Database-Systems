/*
Kyle Harding's Homework 5 SQL FILE
*/

DROP TABLE PC;
DROP TABLE Laptop;
DROP TABLE Product;

CREATE TABLE Product(
	manufacturer CHAR(10),
    model CHAR(10),
	type CHAR(10)
);

CREATE TABLE PC(
	model CHAR(10),
	speed INT,
	ram INT,
	hd INT,
	rd CHAR(10),
	price INT
);


CREATE TABLE Laptop(
	model CHAR(10),
	speed INT,
	ram INT,
	hd INT,
	screen number(4,2),
	price INT
);


INSERT INTO Product VALUES('E','1000','PC');

INSERT INTO Product VALUES('A','2002','Laptop');

INSERT INTO Product VALUES('A','2004','Laptop');

INSERT INTO Product VALUES('A','2006','Laptop');

INSERT INTO Product VALUES('B','1002','PC');

INSERT INTO Product VALUES('B','1003','PC');

INSERT INTO Product VALUES('C','1004','PC');

INSERT INTO Product VALUES('B','2005','Laptop');

INSERT INTO PC VALUES('1000',700,64,10,'48xCD',799);

INSERT INTO PC VALUES('1002',1500,128,60,'12xDVD',2499);

INSERT INTO PC VALUES('1003',700,64,10,'8xDVD',899);

INSERT INTO PC VALUES('1004',700,64,10,'6xDVD',759);

INSERT INTO Laptop VALUES('2002',700,64,5,12.1,1488);

INSERT INTO Laptop VALUES('2004',850,64,10,15.1,2583);

INSERT INTO Laptop VALUES('2005',800,96,10,15.1,1999);

INSERT INTO Laptop VALUES('2006',850,64,10,15.1,2584);


/*
Problem 1 - Constraints ------------------------------------------------------------------------
*/

/*
Q1
*/
														
ALTER TABLE Product
ADD CONSTRAINT checkType
CHECK (type = 'PC' OR type = 'Laptop');

/* 
Test CONSTRAINT - Attempting to  use iPhone as a type for Product -> should error return for
"check constraint"
 */

INSERT INTO Product VALUES('B','2005','iPhone');

/*
Show error which occurs from last insert to confirm constraint.
*/

SHOW ERRORS;

/*
Q2
*/

ALTER TABLE Laptop
ADD CONSTRAINT checkPrice CHECK (price >= 500);

/* Test CONSTRAINT - Attempting to enter 250 as price -> should error return for "check constraint"*/


INSERT INTO Laptop VALUES('2006',850,64,10,15.1,250);

/*
Show error which occurs from last insert to confirm constraint.
*/

SHOW ERRORS;

/*
Q3
*/

/* This constraint cannot be created because in order to check the price and model of different
Laptops against each other, a query must be created to compare different rows in the Laptop table
based on their price and model. Sadly, Oracle SQL does not allow subqueries in their constraint/check 
so the table can not be altered to have the constraint.
*/ 

/*
Q4
*/
ALTER TABLE Product
ADD CONSTRAINT pModel PRIMARY KEY (model);

ALTER TABLE PC
ADD CONSTRAINT checkPC 
FOREIGN KEY (model) REFERENCES Product(model);

ALTER TABLE Laptop
ADD CONSTRAINT checkLaptop
FOREIGN KEY (model) REFERENCES Product(model);

/*
Test solution works
*/

/* Show Connection between Product and Laptop through model*/

SELECT P.model, L.model
FROM Product P, Laptop L
WHERE P.model = L.model;

/* Show Connection between Product and PC through model*/

SELECT P.model, C.model
FROM Product P, PC C
WHERE P.model = C.model;

/*
Q5
*/

/* This constraint cannot be created because in order to get the amount of manufacturers in the Product
Table database, a subquery must be created to GROUP the Product's manufacturers and COUNT(manufacturer).
Oracle SQL does not allow subqueries in their constraint/check statements. An Assertion could possibly 
work in this case but CREATE ASSERTION not supported in Oracle SQL. 
*/


/*
Problem 2 - Triggers --------------------------------------------------------------------------
*/

DROP TABLE PC;
DROP TABLE Laptop;
DROP TABLE Product;

CREATE TABLE Product(
	manufacturer CHAR(10),
    model CHAR(10) PRIMARY KEY,
	type CHAR(10)
);

CREATE TABLE PC(
	model CHAR(10) PRIMARY KEY,
	speed INT,
	ram INT,
	hd INT,
	rd CHAR(10),
	price INT
);


CREATE TABLE Laptop(
	model CHAR(10)PRIMARY KEY,
	speed INT,
	ram INT,
	hd INT,
	screen number(4,2),
	price INT
);

INSERT INTO Product VALUES('E','1000','PC');

INSERT INTO Product VALUES('A','2002','Laptop');

INSERT INTO Product VALUES('A','2004','Laptop');

INSERT INTO Product VALUES('A','2006','Laptop');

INSERT INTO Product VALUES('B','1002','PC');

INSERT INTO Product VALUES('B','1003','PC');

INSERT INTO Product VALUES('C','1004','PC');

INSERT INTO Product VALUES('B','2005','Laptop');

INSERT INTO PC VALUES('1000',700,64,10,'48xCD',799);

INSERT INTO PC VALUES('1002',1500,128,60,'12xDVD',2499);

INSERT INTO PC VALUES('1003',700,64,10,'8xDVD',899);

INSERT INTO PC VALUES('1004',700,64,10,'6xDVD',759);

INSERT INTO Laptop VALUES('2002',700,64,5,12.1,1488);

INSERT INTO Laptop VALUES('2004',850,64,10,15.1,2583);

INSERT INTO Laptop VALUES('2005',800,96,10,15.1,1999);

INSERT INTO Laptop VALUES('2006',850,64,10,15.1,2584);

/*
Q1
*/

CREATE OR REPLACE TRIGGER checkdupModPC
BEFORE INSERT ON Laptop 
FOR EACH ROW
DECLARE
	temp CHAR(10);
	CURSOR C1 IS SELECT model FROM PC;
BEGIN
	OPEN C1;
	LOOP
		FETCH C1 INTO temp;
		IF(C1%FOUND)THEN 
			IF (temp = :new.model)THEN
				RAISE_APPLICATION_ERROR(-20004, 'Model field not correct, duplicate');
			END IF;
		END IF;
		EXIT WHEN C1%NOTFOUND;
	END LOOP;
	CLOSE C1;
END;
/

CREATE OR REPLACE TRIGGER checkdupModLaptop
BEFORE INSERT ON PC
FOR EACH ROW
DECLARE
	temp CHAR(10);
	CURSOR C1 IS SELECT model FROM Laptop;
BEGIN
	OPEN C1;
	LOOP
		FETCH C1 INTO temp;
		IF (temp = :new.model)THEN
			RAISE_APPLICATION_ERROR(-20004, 'Model field not correct, duplicate');
		END IF;
		EXIT WHEN C1%NotFound;
	END LOOP;
	CLOSE C1;
END;
/

/* 
Test TRIGGER - Attempting to use duplicate model, '1004' for Laptop tuple and '2002' for PC tuple
-> should error return for 'Model field not correct, duplicate'.
 */

INSERT INTO Laptop VALUES('1004',700,64,5,12.1,1488);
INSERT INTO PC VALUES('2002',700,64,10,'6xDVD',759);

/*
Show error which occurs from last insert to confirm constraint.
*/

SHOW ERRORS;

/*
Q2
*/

CREATE OR REPLACE TRIGGER checkHD
BEFORE INSERT OR UPDATE ON PC
FOR EACH ROW
BEGIN
	IF (:new.hd * 1000 >= :new.ram * 100)THEN
		RAISE_APPLICATION_ERROR(-20004, 'HD and RAM size are incorrect');
	END IF;
END;
/

/* 
Test TRIGGER - Attempting to use PC tuple with incorrect hd and ram requirements, 100000 = hd and 
10 = ram -> should error return for 'HD and RAM size are incorrect'.
 */

INSERT INTO PC VALUES('1009',700,10,100000,'6xDVD',759);

/*
Show error which occurs from last insert to confirm constraint.
*/

SHOW ERRORS;

/*
Q3
*/
DROP TABLE ProductMonitoring;

CREATE TABLE ProductMonitoring(
	model CHAR(10),
	type CHAR(10),
	oldPrice INT,
	newPrice INT,
	modTime CHAR(30)
);


CREATE OR REPLACE TRIGGER logPricesPC
AFTER UPDATE OF price ON PC
FOR EACH ROW
BEGIN
	INSERT INTO ProductMonitoring(model,type,oldPrice,newPrice,modTime) 
	VALUES (:old.model,'PC',:old.price,:new.price,TO_CHAR(sysdate,'DD-MM-YYYY HH24:MI')); 
END;
/

CREATE OR REPLACE TRIGGER logPricesLap
AFTER UPDATE OF price ON Laptop
FOR EACH ROW
BEGIN
	INSERT INTO ProductMonitoring(model,type,oldPrice,newPrice,modTime)
	VALUES (:old.model,'Laptop',:old.price,:new.price,TO_CHAR(sysdate,'DD-MM-YYYY:HH24:MI')); 
END;
/

/* 
Test TRIGGER - Updating PC tuple(model = 1003) so price is now equal to 1099, raised from 899
-> action should be logged in ProductMonitoring table.
 */

UPDATE PC SET price = 1099 WHERE model = '1003';
UPDATE Laptop SET price = 1500 WHERE model = '2002';


/*
Show actions logged in ProductMonitoring table.
*/

SELECT * FROM ProductMonitoring;

/*
Q4
*/

CREATE OR REPLACE TRIGGER consistentCheckProd
BEFORE INSERT OR UPDATE OR DELETE ON Product
FOR EACH ROW
DECLARE
	temp1 CHAR(10);
	temp2 CHAR(10);
BEGIN
	SELECT model INTO temp1 FROM Laptop;
	SELECT model INTO temp2 FROM PC;
	IF(INSERTING)THEN
		IF(:new.model <> temp1 OR :new.model <> temp2)THEN
			RAISE_APPLICATION_ERROR(-20004, 'Model does not exist as a PC or Laptop');
		END IF;
		IF(:new.type <> 'Laptop' OR :new.type <> 'PC')THEN
			RAISE_APPLICATION_ERROR(-20004, 'Product Type is incorrect. Supported Types are PC and Laptop');
		END IF;
	END IF;
	IF(UPDATING)THEN
		IF(:new.model <> temp1 OR :new.model <> temp2)THEN
			RAISE_APPLICATION_ERROR(-20004, 'Model does not exist as a PC or Laptop');
		END IF;
		IF(:new.type <> 'Laptop' OR :new.type <> 'PC')THEN
			RAISE_APPLICATION_ERROR(-20004, 'Product Type is incorrect. Supported Types are PC and Laptop');
		END IF;
	END IF;
	IF(DELETING)THEN
		IF(:new.model = temp1 OR :new.model = temp2)THEN
			RAISE_APPLICATION_ERROR(-20004, 'Cannot delete due to tuple with same model in PC or Laptop database');
		END IF;
	END IF; 
END;
/


CREATE OR REPLACE TRIGGER insertCheckPC
BEFORE INSERT OR UPDATE ON PC
FOR EACH ROW
DECLARE
	temp CHAR(10);
BEGIN
	SELECT model INTO temp FROM Product;
	IF(INSERTING)THEN
		IF(:new.model <> temp)THEN
			INSERT INTO Product(model, manufacturer, type) VALUES (:new.model, NULL, 'PC');
		END IF;
	END IF;
	IF(UPDATING)THEN
		IF(:new.model <> temp)THEN
			RAISE_APPLICATION_ERROR(-20004, 'Tuple is not a correct model');
		END IF;
	END IF;
END;
/

CREATE OR REPLACE TRIGGER insertCheckLap
BEFORE INSERT OR UPDATE ON Laptop
FOR EACH ROW
DECLARE
	temp CHAR(10);
BEGIN
	SELECT model INTO temp FROM Product;
	IF(INSERTING)THEN
		IF(:new.model <> temp)THEN
			INSERT INTO Product(model, manufacturer, type) VALUES (:new.model, NULL, 'Laptop');
		END IF;
	END IF;
	IF(UPDATING)THEN
		IF(:new.model <> temp)THEN
			RAISE_APPLICATION_ERROR(-20004, 'Tuple is not a correct model');
		END IF;
	END IF;
END;
/



/*
Show all created TRIGGERS 
*/

SELECT * FROM USER_TRIGGERS;

/*
Problem 3 - Views --------------------------------------------------------------------------
*/

/*
Q1
*/

DROP VIEW PCPriceList;

CREATE VIEW PCPriceList  AS SELECT model, price FROM PC;

SELECT *
FROM PCPriceList
WHERE price = (SELECT MIN(price)
               FROM PCPriceList);

/*
It is possible to delete from this view but only the tuple with the minimum price because it 
is the only one included in PCPriceList. The delete would occur on the PC table.
*/

DELETE FROM PCPriceList WHERE model = '1004';
			   
/*
Q2
*/

INSERT INTO PCPriceList(model) VALUES (2012);

/*
This INSERT statement will compute correctly by inserting in the PC table a tuple containing 
model = 2005 (primary key for PC table) and the remaining columnns containing NULL values. This 
statement would not work if say there was additional primary key in PC table, like serial num, 
the insert statement would return an error because only one primary key was provided. 
*/

/* Show inserted value in table below */

SELECT * FROM PCPriceList;

/*
Q3
*/

INSERT INTO PCPriceList (price) VALUES (1700);

/*
This INSERT statement will not compute correctly because the primary key of PC table is model, 
which is not provided in this insert statement. This price could be inserted if it had a proper
model characteristic, for example the statement could look like INSERT INTO PCPriceList 
(model, price) VALUES (4002, 1700);. The original statement could also work if the primary key constraint
model in PC table was removed.
*/

/*
Show error which occurs from last insert.
*/

SHOW ERRORS;

/*
Q4
*/

CREATE VIEW extendedPC(manufacturer,model,speed,ram,hd,rd,price,type) 
AS SELECT manufacturer,PC.model,speed,ram,hd,rd,price,type
FROM PC, Product
WHERE PC.model = Product.model;

/*
The delete statement below will function properly by deleting the tuple(model = 1002) from the
PC table, but not from the Product table. This would leave a Product without a PC tuple confirguartion
but the system should still be valid.
*/

SELECT *
FROM extendedPC;

DELETE FROM extendedPC WHERE (model = '1002');

SELECT *
FROM extendedPC;



