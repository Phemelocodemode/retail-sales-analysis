-- RETAIL SALES ANALYSIS WITH SQL : VISTACART DATA

USE vistacart;
GO

SELECT *
FROM vistacart;

---------------------------------------------------
-- KEY PERFORMANCE INDICATORS
-- (TOTAL SALES, AVERAGE SALES, NO OF ITEMS, AVERAGE RATING)
---------------------------------------------------

SELECT
    ROUND(SUM(Total_Sales), 2) AS Total_Sales,
    ROUND(AVG(Total_Sales), 2) AS Average_Sales,
    COUNT(*) AS No_Of_Items,
    ROUND(AVG(Rating), 2) AS Average_Rating
FROM vistacart;

