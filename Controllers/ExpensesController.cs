using Microsoft.AspNetCore.Mvc;
using ExpenseTracker.Models;

namespace ExpenseTracker.Controllers
{
    [ApiController]
    [Route("api/expenses")]
    public class ExpensesController : ControllerBase
    {
        private static List<Expense> _expenses = new List<Expense>();
        private static int _nextId = 1;

        // GET all expenses
        [HttpGet]
        public ActionResult<List<Expense>> GetAll()
        {
            return Ok(_expenses);
        }

        // POST add new expense
        [HttpPost]
        public ActionResult<Expense> Create([FromBody] Expense expense)
        {
            if (string.IsNullOrWhiteSpace(expense.Title))
                return BadRequest("Title cannot be empty");

            if (expense.Amount <= 0)
                return BadRequest("Amount must be greater than zero");

            if (string.IsNullOrWhiteSpace(expense.Category))
                return BadRequest("Category cannot be empty");

            expense.Id = _nextId++;
            expense.CreatedAt = DateTime.UtcNow;
            _expenses.Add(expense);

            return CreatedAtAction(nameof(GetAll), new { id = expense.Id }, expense);
        }

        // DELETE expense by id
        [HttpDelete("{id}")]
        public ActionResult Delete(int id)
        {
            var expense = _expenses.FirstOrDefault(e => e.Id == id);

            if (expense == null)
                return NotFound($"Expense with ID {id} not found");

            _expenses.Remove(expense);
            return NoContent();
        }
    }
}