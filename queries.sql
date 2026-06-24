-- 1. Get all expenses
SELECT * FROM Expenses
ORDER BY CreatedAt DESC;

-- 2. Get total amount spent per category
SELECT 
    Category,
    COUNT(*) AS TotalExpenses,
    SUM(Amount) AS TotalAmount
FROM Expenses
GROUP BY Category
ORDER BY TotalAmount DESC;

-- 3. Get all expenses above a certain amount
SELECT * FROM Expenses
WHERE Amount > 10
ORDER BY Amount DESC;