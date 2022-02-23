CREATE TABLE STAFF(
ssn INT NOT NULL UNIQUE ,
staffName VARCHAR(30) NOT NULL,
phoneNumber VARCHAR(15) NOT NULL,
address VARCHAR(100),
salary INT,
dayShift VARCHAR(3) NOT NULL CHECK(dayShift IN ('YES','NO')),
nightShift VARCHAR(3) NOT NULL CHECK(nightShift IN ('YES','NO')),
degree VARCHAR(50) NOT NULL,
jopPosition VARCHAR(50),
DOB DATE,
department VARCHAR(25) NOT NULL CHECK(department IN ('Service','Kitchen','Management')),
PRIMARY KEY(ssn)
);
CREATE TABLE SERVICE(
ssn INT NOT NULL,
tableNumber INT
);

CREATE TABLE ITEM(
item_ID   VARCHAR(30) NOT NULL,
price     INT,
itemName  VARCHAR(10),
PRIMARY KEY(Item_ID),

);
CREATE TABLE INGREDIENTS(
ingredientID   VARCHAR(30) NOT NULL,
Amount     INT,
purchaseDate  DATETIME,
expiryDate  DATETIME,
Unit VARCHAR(15),
PRIMARY KEY(ingredientID),
);

CREATE TABLE SUPPLIERS(
supplierID   VARCHAR(30) NOT NULL,
supplierName     VARCHAR(20),
phoneNumber  VARCHAR(15),
email  VARCHAR(100),
supplierAddress VARCHAR(100),
managementSSN VARCHAR(15), 
PRIMARY KEY(supplierID),
);
CREATE TABLE FOODORDER(
orederNumber    INT NOT NULL, 
timeCreated     TIMESTAMP NOT NULL,
PRIMARY KEY(OrederNumber),

);
CREATE TABLE SUPPLY(
supplierID   VARCHAR(30) NOT NULL,
ingredientID   VARCHAR(30) NOT NULL,
Price	INT,
PRIMARY KEY(supplierID, ingredientID),
);


CREATE TABLE MAKE(
ssn INT NOT NULL,
itemID VARCHAR(30) NOT NULL,
PRIMARY KEY(ssn, itemID),

FOREIGN KEY(itemID) REFERENCES ITEM(item_ID)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(ssn) REFERENCES STAFF(ssn)
ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE MAKES_UP(
OrderNumber INT,
itemID VARCHAR(30) NOT NULL,
PRIMARY KEY(OrderNumber,ItemID),

FOREIGN KEY(itemID) REFERENCES ITEM(item_ID)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(OrderNumber) REFERENCES FOODORDER(OrederNumber)
ON DELETE CASCADE ON UPDATE CASCADE

);


CREATE TABLE CONSISTS_OF(
itemID     VARCHAR(30) NOT NULL,
ingredientID   VARCHAR(30) ,
PRIMARY KEY(itemID, ingredientID),
FOREIGN KEY (ingredientID) REFERENCES  INGREDIENTS (ingredientID),
FOREIGN KEY (itemID) REFERENCES  ITEM (item_ID)
);


ALTER TABLE SUPPLY 
ADD CONSTRAINT supplyIngredients FOREIGN KEY (ingredientID) REFERENCES  INGREDIENTS(ingredientID)
ON UPDATE CASCADE ON DELETE CASCADE

ALTER TABLE SUPPLY 
ADD CONSTRAINT supplySuppliers FOREIGN KEY (supplierID) REFERENCES SUPPLIERS(supplierID)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE CONSISTS_OF
ADD CONSTRAINT consistofIngredients FOREIGN KEY (ingredientID) REFERENCES INGREDIENTS (ingredientID)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE CONSISTS_OF
ADD CONSTRAINT consistofItems FOREIGN KEY (itemID) REFERENCES ITEM (item_ID)
ON UPDATE CASCADE ON DELETE CASCADE;
/*
ALTER TABLE MAKE
ADD CONSTRAINT make_itemref FOREIGN KEY(itemID) REFERENCES ITEM(item_ID)
ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE MAKE
ADD CONSTRAINT make_kithchenref FOREIGN KEY(ssn) REFERENCES STAFF(ssn)
ON DELETE CASCADE ON UPDATE CASCADE;




ALTER TABLE MAKES_UP
ADD CONSTRAINT itemref FOREIGN KEY(itemID) REFERENCES ITEM(item_ID)
ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE MAKES_UP
ADD CONSTRAINT ordernumref FOREIGN KEY(OrderNumber) REFERENCES FOODORDER(OrederNumber)
ON DELETE CASCADE ON UPDATE CASCADE;
*/
INSERT INTO STAFF (ssn,staffName,phoneNumber,
address, salary, degree,dayShift, nightShift,DOB,department)
values(132456,'Omar Abdullah','01011179003','paris',3000,'CHIF','YES', 'NO','1999-10-01','Kitchen');

ALTER TABLE STAFF ALTER COLUMN salary INT NOT NULL;
INSERT INTO STAFF(ssn, staffName, phoneNumber, address, salary, dayShift, nightShift, degree, jopPosition, DOB, department)
VALUES (8888, 'Abdurrahman Eshibiny', '77777777', '42 wallabi st, Sydney', 500, 'yes', 'yes', 'Primary education', 'Sous chef', '1999-8-5', 'Kitchen'),
(1234, 'Merna Khaled', '07775000', '4 Siwa st, Cairo', 2000, 'yes', 'no', 'Bsc of Engineering, Ain Shams', 'Dish washer', '1999-5-5', 'Kitchen'),
(5555, 'Omar Abdallah', '66666666', '68 Elsalam city', 100000, 'yes', 'no', 'Bachelor of engineering', 'Restaurant Manager', '1999-10-10', 'Management'),
(3333, 'Mariam Hany', '87654321', NULL, 1000, 'no', 'yes', 'Bsc of Engineering', 'Waiter', '1999-8-8', 'Service'),
(4444, 'Mariam Aggour', '12345678', NULL, 2677, 'yes', 'no', 'Bachelor of Engineering, AinshamsU', 'Accountant', '1998-2-2', 'Management');

INSERT INTO STAFF VALUES
(6666, 'HOSSAM','011234564','PARIS',10200,'yes','yes','COOKING PHD, Ain shames', 'Cleaner', '1960-3-5','Service');

INSERT INTO SERVICE
VALUES (3333, 1),
(3333, 2),
(3333, 3),
(3333, 4),
(3333, 5),
(3333, 6),
(3333, 7),
(3333, 8);
ALTER TABLE ITEM 
ALTER COLUMN itemName  VARCHAR(50);
INSERT INTO ITEM
VALUES (1, 150, 'Kabab 1kg'),
(2, 130, 'Kofta 1kg'),
(3, 150, 'Mix 1kg'),
(4, 100, 'Grilled Chicken');
INSERT INTO ITEM
VALUES
(5,120,'green tea'),
(6,120,'ice coffes');

INSERT INTO MAKE
VALUES (8888, 1),
(8888, 2),
(8888, 4),
(1234, 3);
INSERT INTO MAKE
VALUES (6666, 5),
 (4444, 6);
INSERT INTO FOODORDER
VALUES (1, DEFAULT);
INSERT INTO FOODORDER
VALUES (2, DEFAULT),
(3, DEFAULT),
(4, DEFAULT),
(5, DEFAULT),
(6, DEFAULT);
INSERT INTO MAKES_UP
VALUES (1, 1),
(1, 4),
(2, 3),
(3, 3),
(4, 4),
(5, 4),
(6, 2);
/*
ALTER TABLE INGREDIENTS
ALTER COLUMN ingredientID VARCHAR(30) NOT NULL;
*/
INSERT INTO INGREDIENTS
VALUES ('Meat', 30, '2021-12-30', '2022-1-30', 'kg'),
('Chicken', 30, '2021-12-30', '2022-1-30', 'whole chickens'),
('Salt', 5, '2021-12-30', '2022-12-30', 'kg'),
('Pepper', 5, '2021-12-30', '2022-12-30', 'kg'),
('Meat spice blend', 3, '2021-12-30', '2022-12-30', 'kg'),
('Chicken spice blend', 3, '2021-12-30', '2022-12-30', 'kg');

INSERT INTO INGREDIENTS
VALUES ('Sugar', 30, '2021-12-30', '2022-1-30', 'kg'),
('Tea', 30, '2021-12-30', '2022-1-30', 'kg');
INSERT INTO INGREDIENTS
VALUES
('Coffee', 30, '2021-12-30', '2022-1-30', 'kg');
ALTER TABLE CONSISTS_OF
ALTER COLUMN ingredientId VARCHAR(30) NOT NULL;
INSERT INTO CONSISTS_OF
VALUES (1, 'Meat'),
(1, 'Salt'),
(1, 'Pepper'),
(1, 'Meat spice blend'),
(4, 'Chicken'),
(4, 'Salt'),
(4, 'Pepper'),
(4, 'Chicken spice blend'),
(3, 'Meat'),
(3, 'Salt'),
(3, 'Pepper'),
(3, 'Meat spice blend'),
(2, 'Meat'),
(2, 'Salt'),
(2, 'Pepper'),
(2, 'Meat spice blend');
INSERT INTO CONSISTS_OF
VALUES
(5,'Tea'),
(6,'Coffee'),
(5,'Sugar'),
(6,'Sugar');
INSERT INTO SUPPLIERS
VALUES (1, 'Wataneya', '33333333', 'wataneya_sales@gmail.com', '21 Salah salem st.', 5555),
(2, 'Elsallab', '42424242', 'sales@elsallab.com', '43 Makram Ebeid st.', 5555);
ALTER TABLE SUPPLY
ALTER COLUMN ingredientID VARCHAR(30) NOT NULL;

INSERT INTO SUPPLY
VALUES (1, 'Meat', 100),
(1, 'Chicken', 80),
(1, 'Meat spice blend', 20),
(2, 'Meat', 110),
(2, 'Chicken spice blend', 23),
(2, 'Salt', 10),
(2, 'Pepper', 15);

/*give me every thing about staff*/
SELECT * FROM STAFF;

/*give all dishes and drinks and the people who make them and the price*/
SELECT staffName, itemName as Dish,price FROM STAFF AS S,ITEM AS I, MAKE AS M
WHERE M.ssn=S.ssn AND M.itemID =I.item_ID;

/*give staffName, degree, salary and order them by salary*/
SELECT staffName, degree, salary FROM STAFF
ORDER BY salary;

/*give all dishes and drinks and the people who make them and contents*/
SELECT staffName,itemName , phoneNumber 
FROM STAFF AS S,ITEM AS I, MAKE AS M
WHERE M.ssn=S.ssn AND M.itemID =I.item_ID AND  I.itemName='Grilled Chicken';

/*give all dishes and drinks than contains k*/
SELECT * FROM ITEM WHERE itemName LIKE '%K%'


/*give the orders than contains ingrediants has nearest expiry date*/
SELECT orederNumber , I.ingredientID,I.expiryDate
FROM INGREDIENTS AS I , ITEM AS T, FOODORDER AS F, CONSISTS_OF AS C, MAKES_UP AS M
WHERE C.ingredientID=I.ingredientID AND C.itemID=T.item_ID
AND F.orederNumber=M.OrderNumber AND M.ItemID=T.item_ID
AND I.expiryDate < ALL(SELECT expiryDate
						FROM INGREDIENTS AS ING
						WHERE I.expiryDate != expiryDate)  
ORDER  BY I.expiryDate;

/*Dishes done by Abdurrahman Eshibiny*/
SELECT itemName as Dishes
FROM ITEM AS I,STAFF AS S, MAKE AS M
WHERE M.ssn = S.ssn AND M.itemID = I.item_ID
AND s.staffName = 'Abdurrahman Eshibiny';

/*people works in night shift only */
SELECT staffName,salary
FROM STAFF
WHERE nightShift='yes' AND dayShift='no';

/*give me the suppliers and the conents who works with the highst salary above than 10k*/
SELECT supplierName , email
From (SUPPLIERS AS I LEFT OUTER JOIN  STAFF AS J 
	ON I.managementSSN = J.ssn)
WHERE J.salary>10000;

/*give the person that has the max salary*/
SELECT staffName, salary as maxSalary/**/
FROM STAFF
WHERE salary in ( SELECT MAX(salary)
				fROM STAFF)

/*give the price of the ingredients that comes from el sallab*/
SELECT I.ingredientID ,price,SU.supplierName
FROM SUPPLY AS S, INGREDIENTS AS I, SUPPLIERS AS SU
WHERE S.ingredientID = I.ingredientID AND S.supplierID = SU.supplierID 
AND SU.supplierName = 'Elsallab';

/*give the price of that i paid to every suppliers*/
SELECT SU.supplierName ,SUM(price) as totalPrice
FROM SUPPLY AS S, INGREDIENTS AS I, SUPPLIERS AS SU
WHERE S.ingredientID = I.ingredientID AND S.supplierID = SU.supplierID 
GROUP BY SU.supplierID, SU.supplierName;

/*give the price for every orders*/
SELECT M.OrderNumber ,SUM(price) AS TotalPrice
FROM ITEM AS I,FOODORDER AS O,MAKES_UP AS M
WHERE M.OrderNumber = O.orederNumber AND I.item_ID = M.ItemID
GROUP BY M.OrderNumber;