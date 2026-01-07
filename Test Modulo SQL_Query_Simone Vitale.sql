-- 1) Verifico che i campi definiti come PK siano univoci.
SELECT id_Category
, COUNT(*)
FROM Category
GROUP BY id_Category
HAVING COUNT(*) > 1;

SELECT id_Product
, COUNT(*)
FROM Product
GROUP BY id_Product
HAVING COUNT(*) > 1;

SELECT id_Region
, COUNT(*)
FROM Region
GROUP BY id_Region
HAVING COUNT(*) > 1;

SELECT id_State
, COUNT(*)
FROM State
GROUP BY id_State
HAVING COUNT(*) > 1;

SELECT id_Sales
, COUNT(*)
FROM Sales
GROUP BY id_Sales
HAVING COUNT(*) > 1;

-- 2) Creo un report dettagliato;

SELECT s.id_Sales AS ID
, s.SalesDate AS SalesDate
, p.ProductName AS Product
, c.CategoryName AS Category
, st.StateName AS State
, r.RegionName AS Region
, CASE
	WHEN DATEDIFF(CURRENT_DATE, SalesDate) > 180 THEN 'True'
    ELSE 'False'
END AS Over_180_Days
FROM Category AS c
INNER JOIN Product AS p
ON p.id_Category = c.id_Category
INNER JOIN Sales AS s
ON s.id_Product = p.id_Product
INNER JOIN State AS st
ON st.id_State = s.id_State
INNER JOIN Region AS r
ON r.id_Region = st.id_Region;

-- 3) Elenco prodotti venduti oltre la media;
SELECT p.id_Product AS IDProduct
, SUM(s.Quantity) AS TotSales
FROM Sales AS s
INNER JOIN Product AS p
ON p.id_Product = s.id_Product
GROUP BY p.id_Product
HAVING SUM(s.Quantity) > (
SELECT AVG(Quantity)
FROM Sales
WHERE YEAR(SalesDate) = (
SELECT MAX(YEAR(SalesDate))
FROM Sales));

-- 4) 4)Espongo l’elenco dei soli prodotti venduti e per ognuno di questi il fatturato totale per anno.
SELECT p.id_Product AS IDProduct
, p.ProductName
, SUM(s.Quantity * s.UnitPrice) AS TotSales
, YEAR(s.SalesDate) AS Year
FROM Product AS p
INNER JOIN Sales AS s
ON s.id_Product = p.id_Product
GROUP BY p.id_Product, p.ProductName, YEAR(s.SalesDate);

-- 5) Espongo il fatturato totale per stato per anno. Ordina il risultato per data e per fatturato decrescente.

SELECT st.id_State AS ID
, st.StateName AS State
, SUM(s.Quantity * s.UnitPrice) AS TotSales
, YEAR(s.SalesDate) AS Year
FROM Sales AS s
INNER JOIN State AS st
ON st.id_State = s.id_State
GROUP BY st.id_State, st.StateName, YEAR(s.SalesDate)
ORDER BY Year ASC, TotSales DESC;

-- 6) La categoria di articoli maggiormente richiesta dal mercato.

SELECT c.id_Category AS ID
, c.CategoryName AS Category
, SUM(s.Quantity) AS TotQuantity
FROM Category AS c
INNER JOIN Product AS p
ON p.id_Category = c.id_Category
INNER JOIN Sales AS s
ON s.id_Product = p.id_Product
GROUP BY c.id_Category, c.CategoryName
ORDER BY TotQuantity DESC
LIMIT 1;

-- 7) Prodotti invenduti. Due approcci risolutivi differenti.

-- PRIMO
SELECT p.ProductName AS ProductName
FROM Product AS p
LEFT JOIN Sales AS s
ON s.id_Product = p.id_Product
WHERE s.id_Product IS NULL;

-- SECONDO
SELECT ProductName AS ProductName
FROM Product
WHERE id_Product NOT IN (
SELECT id_Product
FROM Sales
WHERE id_Product IS NOT NULL);

-- 8) View su prodotti e relativa categoria.
CREATE VIEW ProductCategory AS
SELECT p.id_Product AS IDProduct
, p.ProductName AS ProductName
, c.CategoryName AS CategoryName
FROM Category AS c
INNER JOIN Product AS p
ON p.id_Category = c.id_Category;

-- 9) View per le informazioni geografiche. 

CREATE VIEW InfoTerritory AS
SELECT s.id_State AS IDStato
, s.StateName AS StateName
, r.id_Region AS IDRegion
, r.RegionName AS RegionName
FROM Region AS r
INNER JOIN State AS s
ON s.id_Region = r.id_Region;
