-- RETAIL SALES ANALYSIS WITH SQL : VISTACART DATA

USE vistacart;
GO

SELECT *
FROM vistacart;

---------------------------------------------------
-- BUSINESS QUESTIONS AND SQL QUERIES
---------------------------------------------------

-- 1. WHAT IS THE TOTAL REVENUE GENERATED ACROSS ALL OUTLETS?
SELECT
    ROUND(SUM(Total_Sales), 2) AS Total_Revenue
FROM vistacart;

-- 2. WHICH OUTLET HAS THE HIGHEST TOTAL SALES?
SELECT TOP 1
    Outlet_Identifier,
    ROUND(SUM(Total_Sales), 2) AS Total_Sales
FROM vistacart
GROUP BY Outlet_Identifier
ORDER BY Total_Sales DESC;

-- 3. WHAT ARE THE TOP 5 BEST-SELLING ITEMS BY REVENUE?
SELECT TOP 5
    Item_Type,
    ROUND(SUM(Total_Sales), 2) AS Total_Sales
FROM vistacart
GROUP BY Item_Type
ORDER BY Total_Sales DESC;

-- 4. HOW DO SALES VARY BY OUTLET TYPE?
SELECT
    Outlet_Type,
    ROUND(SUM(Total_Sales), 2) AS Total_Sales
FROM vistacart
GROUP BY Outlet_Type
ORDER BY Total_Sales DESC;

---------------------------------------------------
-- 11. IS THERE A CORRELATION BETWEEN ITEM VISIBILITY AND SALES?
---------------------------------------------------

SELECT
    CASE
        WHEN Item_Visibility < 0.05 THEN 'Low Visibility'
        WHEN Item_Visibility BETWEEN 0.05 AND 0.15 THEN 'Medium Visibility'
        ELSE 'High Visibility'
    END AS Visibility_Category,
    ROUND(AVG(Total_Sales), 2) AS Avg_Sales
FROM vistacart
GROUP BY
    CASE
        WHEN Item_Visibility < 0.05 THEN 'Low Visibility'
        WHEN Item_Visibility BETWEEN 0.05 AND 0.15 THEN 'Medium Visibility'
        ELSE 'High Visibility'
    END
ORDER BY Avg_Sales DESC;

---------------------------------------------------
-- 12. WHAT IS THE AVERAGE WEIGHT OF ITEMS BY ITEM TYPE?
---------------------------------------------------

SELECT
    Item_Type,
    ROUND(AVG(Item_Weight), 2) AS Average_Weight
FROM vistacart
GROUP BY Item_Type
ORDER BY Average_Weight DESC;

---------------------------------------------------
-- 13. WHICH OUTLET CONTRIBUTES THE MOST TO OVERALL REVENUE (PERCENTAGE-WISE)?
---------------------------------------------------

SELECT
    Outlet_Identifier,
    ROUND(SUM(Total_Sales), 2) AS Outlet_Sales,
    ROUND(
        SUM(Total_Sales) * 100.0 /
        (SELECT SUM(Total_Sales) FROM vistacart),
        2
    ) AS Sales_Percentage
FROM vistacart
GROUP BY Outlet_Identifier
ORDER BY Outlet_Sales DESC;
