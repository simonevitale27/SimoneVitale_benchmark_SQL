-- Creo il DataBase per contenere le tabelle.
CREATE SCHEMA ToysGroup;

-- Indico al WorkBench di eseguire tutto all'interno del nuovo DB;
USE ToysGroup;

-- Creo le Tabelle che conterranno i dati, seguendo l'ordine logico delle PK e FK (padre - figlio;
CREATE TABLE Category (
id_Category INT PRIMARY KEY,
CategoryName VARCHAR(100) NOT NULL
);

CREATE TABLE Product (
id_Product INT PRIMARY KEY,
ProductName VARCHAR(100) NOT NULL,
id_Category INT,
CONSTRAINT FK_Product_Category FOREIGN KEY (id_Category) 
REFERENCES Category(id_Category)
);

CREATE TABLE Region (
id_Region INT PRIMARY KEY,
RegionName VARCHAR(100) NOT NULL
);

CREATE TABLE State (
id_State INT PRIMARY KEY,
StateName VARCHAR(100) NOT NULL,
id_Region INT,
CONSTRAINT FK_State_Region FOREIGN KEY (id_Region) 
REFERENCES Region(id_Region)
);

CREATE TABLE Sales (
id_Sales INT PRIMARY KEY,
SalesDate DATE NOT NULL,
Quantity INT NOT NULL,
UnitPrice DECIMAL(10, 2) NOT NULL,
id_Product INT,
id_State INT,
CONSTRAINT FK_Sales_Product FOREIGN KEY (id_Product) 
REFERENCES Product(id_Product),
CONSTRAINT FK_Sales_State FOREIGN KEY (id_State) 
REFERENCES State(id_State)
);

-- Popolo le tabelle con dati fittizzi.
INSERT INTO Category (id_Category, CategoryName) VALUES 
(1, 'Action Figures'), 
(2, 'Dolls'), 
(3, 'Board Games'), 
(4, 'Educational'), 
(5, 'Outdoor Toys');

INSERT INTO Product (id_Product, ProductName, id_Category) VALUES 
(1, 'Super Hero A', 1), (2, 'Space Warrior', 1), (3, 'Robot X', 1),
(4, 'Fashion Doll 1', 2), (5, 'Baby Doll', 2), (6, 'Doll House', 2),
(7, 'Monopoly Deluxe', 3), (8, 'Chess Set', 3), (9, 'Card Game Plus', 3),
(10, 'Math Quiz Kit', 4), (11, 'Science Lab Junior', 4), (12, 'Globe 3D', 4),
(13, 'Football Pro', 5), (14, 'Garden Swing', 5), (15, 'Water Gun Max', 5);

INSERT INTO Region (id_Region, RegionName) VALUES 
(1, 'WestEurope'), 
(2, 'SouthEurope'), 
(3, 'NorthAmerica'), 
(4, 'APAC');

INSERT INTO State (id_State, StateName, id_Region) VALUES 
(1, 'France', 1), (2, 'Germany', 1), (3, 'UK', 1),
(4, 'Italy', 2), (5, 'Spain', 2), (6, 'Greece', 2),
(7, 'USA', 3), (8, 'Canada', 3),
(9, 'Japan', 4), (10, 'Australia', 4);

INSERT INTO Sales (id_Sales, SalesDate, Quantity, UnitPrice, id_Product, id_State) VALUES 
(1, '2024-05-10', 10, 15.00, 1, 4),
(2, '2024-06-15', 5, 50.00, 7, 1),
(3, '2024-08-20', 2, 40.00, 4, 7),
(4, '2024-09-05', 1, 120.00, 14, 2),
(5, '2025-01-12', 3, 30.00, 10, 9),
(6, '2025-02-28', 12, 15.00, 9, 5),
(7, '2025-03-15', 4, 50.00, 2, 3),
(8, '2025-06-01', 1, 45.00, 13, 10),
(9, '2025-07-20', 8, 40.00, 11, 4),
(10, '2025-08-10', 2, 25.00, 3, 6),
(11, '2025-09-05', 10, 40.00, 12, 8),
(12, '2025-10-12', 5, 50.00, 8, 1),
(13, '2025-11-20', 3, 20.00, 5, 5),
(14, '2025-12-05', 1, 300.00, 6, 7),
(15, '2025-12-28', 20, 5.00, 15, 2);

-- Verifico la presenza dei dati nelle rispettive tabelle
SELECT*
FROM Category;

SELECT*
FROM Product;

SELECT*
FROM Region;

SELECT*
FROM State;

SELECT*
FROM Sales;
