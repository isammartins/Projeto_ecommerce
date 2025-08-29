-- CREATE TABLE ecommerce(
-- InvoiceNo VARCHAR(200),
-- StockCode VARCHAR(200),
-- Quantity INT,
-- InvoiceDate TIMESTAMP,
-- UnitPrice DECIMAL(10,2),
-- CustomerID INT,
-- Country VARCHAR(200),
-- Description_official TEXT
-- );

-- CREATE TABLE countries(
-- id SERIAL PRIMARY KEY,
-- country VARCHAR(200)
-- );

-- INSERT INTO countries (country)
-- SELECT DISTINCT
-- e.Country
-- FROM ecommerce AS e
-- ORDER BY e.country ASC;

-- SELECT * FROM countries

-- CREATE TABLE customers(
-- id INT PRIMARY KEY
-- );

-- INSERT INTO customers(id)
-- SELECT DISTINCT e.CustomerID
-- FROM ecommerce as e;

-- SELECT * FROM customers

-- SELECT e.CustomerID, c.id FROM ecommerce e
-- INNER JOIN countries c ON c.country = e.Country 
-- ORDER BY e.CustomerID ASC;

-- CREATE TABLE customer_country AS
-- SELECT DISTINCT 
-- c.id AS "id_country",
-- e.CustomerID AS "id_customer"
-- FROM ecommerce AS e
-- INNER JOIN 
-- countries c ON c.country = e.country
-- ORDER BY e.CustomerID ASC;

-- SELECT * FROM customer_country

-- SELECT *
-- FROM customer_country
-- WHERE id_customer = 12457;

-- CREATE TABLE products(
-- id VARCHAR(200) PRIMARY KEY,
-- description TEXT
-- );

-- INSERT INTO products(id, description)
-- SELECT DISTINCT
-- e.StockCode,
-- e.Description_official
-- FROM ecommerce e

-- SELECT * FROM products

-- CREATE TABLE invoices(
-- id VARCHAR(200) PRIMARY KEY
-- );

-- INSERT INTO invoices(id)
-- SELECT DISTINCT 
-- e.InvoiceNo
-- FROM ecommerce e

-- SELECT * FROM invoices

CREATE TABLE prod_inv AS 
SELECT DISTINCT 
i.id AS "id_invoice", 
e.Quantity AS "quantity",
e.InvoiceDate AS "date",
e.UnitPrice AS "price",
p.id AS "id_product"
FROM products p
INNER JOIN ecommerce e 
ON p.id = e.stockcode
INNER JOIN invoices i
ON i.id = e.invoiceno

SELECT * FROM prod_inv

