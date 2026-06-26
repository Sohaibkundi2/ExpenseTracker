-- 1. Get all expenses with their category name
SELECT Id, Title, Amount, Category, CreatedAt
FROM Expenses
ORDER BY CreatedAt DESC;

-- 2. Get total amount per category
SELECT 
    Category,
    COUNT(*) AS TotalExpenses,
    SUM(Amount) AS TotalAmount
FROM Expenses
GROUP BY Category
ORDER BY TotalAmount DESC;

-- 3. Get the single most expensive entry
SELECT TOP 1 *
FROM Expenses
ORDER BY Amount DESC;