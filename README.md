# ExpenseTracker API

A RESTful API built with ASP.NET Core Web API for managing personal expenses.
Built as part of Friendsware Solutions Summer Internship 2026 — Week Zero.

## Tech Stack
- ASP.NET Core Web API (.NET 8)
- C#
- Swagger (OpenAPI)
- In-memory storage (static List)

## How to Run

1. Clone the repository
```bash
git clone https://github.com/sohai/ExpenseTracker.git
```

2. Navigate to project folder
```bash
cd ExpenseTracker
```

3. Run the project
```bash
dotnet run
```

4. Open Swagger in your browser
```
http://localhost:5000/swagger
```
## API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | /api/expenses | Get all expenses |
| POST | /api/expenses | Add a new expense with validation |
| DELETE | /api/expenses/{id} | Delete an expense by ID |
| GET | /api/expenses/summary | Get total summary grouped by category ⭐ Bonus |

## Validation Rules
- Title cannot be empty → returns 400
- Amount must be greater than zero → returns 400
- Category cannot be empty → returns 400

## Example Request

POST /api/expenses
```json
{
  "title": "Lunch",
  "amount": 15.50,
  "category": "Food"
}
```

## Example Response

GET /api/expenses/summary
```json
{
  "totalExpenses": 2,
  "totalAmount": 23.50,
  "byCategory": [
    { "category": "Food", "count": 1, "total": 15.50 },
    { "category": "Transport", "count": 1, "total": 8.00 }
  ]
}
```

## Postman Collection
Import `ExpenseTracker.postman_collection.json` to test all endpoints instantly.