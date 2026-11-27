-- Zepto inventory: PostgreSQL setup
-- Create a database named zepto_inventory in pgAdmin and connect to it.
-- Run this script once, then import Zepto_Inventory_Dataset.csv.
CREATE TABLE IF NOT EXISTS zepto (
    sku_id SERIAL PRIMARY KEY,
    category VARCHAR(120),
    name VARCHAR(150) NOT NULL,
    mrp NUMERIC(8, 2),
    discountPercent NUMERIC(5, 2),
    availableQuantity INTEGER,
    discountedSellingPrice NUMERIC(8, 2),
    weightInGms INTEGER,
    outOfStock BOOLEAN,
    quantity INTEGER
);

-- pgAdmin: right-click zepto > Import/Export Data > Import.
-- Select Zepto_Inventory_Dataset.csv; format CSV; Header Yes;
-- Encoding WIN1252; delimiter comma; quote double quote.
-- In Columns, deselect sku_id so PostgreSQL generates it automatically.
-- Import only into an empty table; do not import twice.
-- Alternatively, in psql (edit path as required):
-- \copy zepto(category,name,mrp,discountPercent,availableQuantity,discountedSellingPrice,weightInGms,outOfStock,quantity) FROM 'Zepto_Inventory_Dataset.csv' WITH (FORMAT csv, HEADER true, ENCODING 'WIN1252');
-- After import run the following separately: expected 3732.
SELECT COUNT(*) AS imported_rows FROM zepto;
-- Then run Inventory_Analysis.sql once. It removes one zero-price row
-- and converts paise to rupees. Expected remaining rows: 3731.
