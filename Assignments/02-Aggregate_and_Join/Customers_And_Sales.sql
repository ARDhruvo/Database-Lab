CREATE DATABASE assignment02;

-- 1. For the tables salesman (sId, sName, sCity, sCommission) and customer (cId,
-- cName, cCity, sId), write a query to find the names of the Customers and
-- Salespersons who reside in the same city.

CREATE TABLE salesman
(
    sID INT PRIMARY KEY,
    sName VARCHAR(200),
    sCity VARCHAR(200),
    sCommission FLOAT
);

CREATE TABLE customer
(
    cID INT PRIMARY KEY,
    cName VARCHAR(200),
    cCity VARCHAR(200),
    sID INT
);

SELECT cName, sName
FROM customer INNER JOIN salesman ON customer.cCity = salesman.sCity;

-- 2. For the tables salesman (sId, sName, sCity, sCommission) and customer (cId,
-- cName, cCity, sId), write a query to find the names of the Customers a Salesman
-- represents.

SELECT sName, cName
FROM salesman LEFT JOIN customer ON salesman.sID = customer.sID;

-- 3. For the tables salesman (sId, sName, sCity, sCommission) and customer (cId,
-- cName, cCity, sId), write a query to find the names of the Salespersons who do not
-- live in the same city as the Customers they represent.

SELECT sName
FROM salesman INNER JOIN customer ON customer.sID = salesman.sID
WHERE salesman.sCity <> customer.cCity;

-- 4. For the tables salesman (sId, sName, sCity, sCommission) and customer (cId,
-- cName, cCity, sId), write a query to display the names of all customers along with
-- their representing salespersons.

SELECT cName, sName
FROM customer LEFT JOIN salesman ON salesman.sID = customer.sID;

-- 5. For the tables salesman (sId, sName, sCity, sCommission) and customer (cId,
-- cName, cCity, sId), write a query to display the names of all salespersons who
-- represents one or more customers or still have not started representing any.

SELECT sName
FROM salesman;

-- 6. For the tables company (cId, cName) and products (pId, pName, price, cId),
-- write a query to display the products names, prices and producing company names.

CREATE TABLE company
(
    cID INT PRIMARY KEY,
    cName VARCHAR(200)
);

CREATE TABLE products
(
    pID INT PRIMARY KEY,
    pName VARCHAR(200),
    price INT,
    cID INT FOREIGN KEY REFERENCES company(cID)
);

SELECT pID, pName, price, cName
FROM products INNER JOIN company ON products.cID = company.cID;

-- 7. For the tables company (cId, cName) and products (pId, pName, price, cId),
-- write a query to display names of companies along with their products average price.

SELECT cName, AVG(price) as avgCost
FROM company LEFT JOIN products ON company.cID = products.cID
GROUP BY cName;

-- 8. For the tables department (dId, dName, dBudget) and employee (eId, fName,
-- lName, dId), write a query to display names of the employees along with their
-- department name.

CREATE TABLE department
(
    dId INT PRIMARY KEY,
    dName VARCHAR(200),
    dBudget INT
)

CREATE TABLE employee
(
    eId INT PRIMARY KEY,
    fName VARCHAR(200),
    lName VARCHAR(200),
    dId INT FOREIGN KEY REFERENCES department(dId)
)

SELECT fName, lName, dName
FROM employee INNER JOIN department ON employee.dId = department.dId;

-- 9. For the tables department (dId, dName, dBudget) and employee (eId, fName,
-- lName, dId), write a query to display names of the employees whose departments
-- budgets are greater than fifty thousand.

SELECT fName, lName
FROM employee INNER JOIN department ON employee.dId = department.dId
WHERE (department.dBudget > 5000);

-- 10. For the tables department (dId, dName, dBudget) and employee (eId, fName,
-- lName, dId), write a query to display names of the departments that has more than
-- two employees

SELECT dName
FROM department INNER JOIN employee ON department.dId = employee.dId
GROUP BY department.dName
HAVING COUNT(employee.eId) > 2