-- Expense Table Schema
CREATE TABLE Expenses (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(255) NOT NULL,
    Amount DECIMAL(18,2) NOT NULL,
    Category NVARCHAR(100) NOT NULL,
    CreatedAt DATETIME DEFAULT GETUTCDATE()
);

-- Index on Category column
CREATE INDEX IX_Expenses_Category ON Expenses(Category);

-- Why this index is useful:
-- Our summary endpoint groups expenses by Category frequently.
-- Without an index, the database scans every row in the table.
-- With this index, GROUP BY Category and WHERE Category queries
-- become significantly faster as the number of expenses grows.