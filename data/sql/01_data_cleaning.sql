-- RETAIL SALES ANALYSIS WITH SQL : VISTACART DATA

USE vistacart;
GO

SELECT *
FROM vistacart;

---------------------------------------------------
-- DATA CLEANING
---------------------------------------------------

-- 1. CHECK FOR MISSING VALUES
SELECT
    SUM(CASE WHEN Item_Weight IS NULL THEN 1 ELSE 0 END) AS Missing_Item_Weight,
    SUM(CASE WHEN Item_Fat_Content IS NULL THEN 1 ELSE 0 END) AS Missing_Item_Fat_Content,
    SUM(CASE WHEN Item_Type IS NULL THEN 1 ELSE 0 END) AS Missing_Item_Type,
    SUM(CASE WHEN Outlet_Size IS NULL THEN 1 ELSE 0 END) AS Missing_Outlet_Size,
    SUM(CASE WHEN Item_Visibility IS NULL THEN 1 ELSE 0 END) AS Missing_Item_Visibility,
    SUM(CASE WHEN Total_Sales IS NULL THEN 1 ELSE 0 END) AS Missing_Total_Sales,
    SUM(CASE WHEN Rating IS NULL THEN 1 ELSE 0 END) AS Missing_Rating
FROM vistacart;

-- Remove rows with missing Item_Weight
DELETE FROM vistacart
WHERE Item_Weight IS NULL;

---------------------------------------------------
-- 2. STANDARDIZE CATEGORICAL VALUES (Item_Fat_Content)
---------------------------------------------------

UPDATE vistacart
SET Item_Fat_Content = 'Low Fat'
WHERE Item_Fat_Content IN ('LF', 'low fat', 'Low Fat');

UPDATE vistacart
SET Item_Fat_Content = 'Regular'
WHERE Item_Fat_Content = 'reg';

---------------------------------------------------
-- 3. REMOVE DUPLICATE RECORDS
---------------------------------------------------

WITH CTE AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY Item_Identifier,
                            Outlet_Identifier,
                            Item_Type,
                            Total_Sales
               ORDER BY Item_Identifier
           ) AS rn
    FROM vistacart
)
DELETE FROM CTE
WHERE rn > 1;
-- 0 ROWS AFFECTED, NO DUPLICATES

---------------------------------------------------
-- 4. TRIM EXTRA SPACES
---------------------------------------------------

UPDATE vistacart
SET
    Item_Type = LTRIM(RTRIM(Item_Type)),
    Outlet_Location_Type = LTRIM(RTRIM(Outlet_Location_Type)),
    Outlet_Size = LTRIM(RTRIM(Outlet_Size)),
    Outlet_Type = LTRIM(RTRIM(Outlet_Type));

---------------------------------------------------
-- DATASET OVERVIEW
---------------------------------------------------

-- 1. REMAINING ROWS
SELECT COUNT(*) AS Remaining_Rows
FROM vistacart;

-- 2. UNIQUE ITEMS
SELECT COUNT(DISTINCT Item_Identifier) AS Unique_Items
FROM vistacart;

-- 3. UNIQUE OUTLETS
SELECT COUNT(DISTINCT Outlet_Identifier) AS Unique_Outlets
FROM vistacart;

-- 4. UNIQUE ITEM TYPES
SELECT COUNT(DISTINCT Item_Type) AS Unique_Item_Types
FROM vistacart;