select *
from 
[dbo].[Sheet2$]
SELECT top 10 *
from [dbo].[Sheet2$]
SELECT COUNT(*) AS Total_Orders
FROM [dbo].[Sheet2$];
SELECT 
    COUNT(OrderID)      AS Total_Orders,
    SUM(TotalPrice)     AS Total_Revenue,
    AVG(TotalPrice)     AS Mean_Order_Value
FROM [dbo].[Sheet2$];
SELECT 
    Product,
    COUNT(OrderID)    AS Order_Count,
    SUM(TotalPrice)   AS Total_Revenue,
    AVG(TotalPrice)   AS Avg_Order_Value
FROM [dbo].[Sheet2$]
GROUP BY Product
ORDER BY Total_Revenue DESC;
SELECT 
    OrderStatus,
    COUNT(OrderID)    AS Order_Count
FROM [dbo].[Sheet2$]
GROUP BY OrderStatus
ORDER BY Order_Count DESC;
SELECT *
FROM [dbo].[Sheet2$]
WHERE OrderStatus = 'Cancelled';
SELECT 
    Product,
    COUNT(OrderID)    AS Cancelled_Orders
FROM [dbo].[Sheet2$]
WHERE OrderStatus = 'Cancelled'
GROUP BY Product
ORDER BY Cancelled_Orders DESC;
SELECT 
    CouponCode,
    COUNT(OrderID)    AS Times_Used,
    SUM(TotalPrice)   AS Revenue_Generated
FROM [dbo].[Sheet2$]
GROUP BY CouponCode
ORDER BY Times_Used DESC;
SELECT 
    ReferralSource,
    COUNT(OrderID)    AS Total_Customers,
    SUM(TotalPrice)   AS Total_Revenue
FROM [dbo].[Sheet2$]
GROUP BY ReferralSource
ORDER BY Total_Customers DESC;
SELECT 
    PaymentMethod,
    COUNT(OrderID)    AS Order_Count,
    SUM(TotalPrice)   AS Total_Revenue
FROM [dbo].[Sheet2$]
GROUP BY PaymentMethod
ORDER BY Total_Revenue DESC;
SELECT 
    OrderID,
    Product,
    Quantity,
    UnitPrice,
    TotalPrice
FROM [dbo].[Sheet2$]
WHERE TotalPrice > 3333
ORDER BY TotalPrice DESC;
SELECT 
    FORMAT(Date, 'MMM-yy')    AS Month,
    COUNT(OrderID)             AS Total_Orders,
    SUM(TotalPrice)            AS Monthly_Revenue,
    AVG(TotalPrice)            AS Avg_Order_Value
FROM [dbo].[Sheet2$]
GROUP BY FORMAT(Date, 'MMM-yy'), YEAR(Date), MONTH(Date)
ORDER BY YEAR(Date), MONTH(Date);
SELECT 
    CASE 
        WHEN CouponCode = 'NIL' THEN 'No Coupon'
        ELSE 'With Coupon'
    END                   AS Coupon_Used,
    COUNT(OrderID)        AS Total_Orders,
    AVG(TotalPrice)       AS Avg_Order_Value,
    SUM(TotalPrice)       AS Total_Revenue
FROM [dbo].[Sheet2$]
GROUP BY 
    CASE 
        WHEN CouponCode = 'NIL' THEN 'No Coupon'
        ELSE 'With Coupon'
    END;
