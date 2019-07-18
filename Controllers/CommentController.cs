using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using CommentsAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace CommentsAPI.Controllers
{
    [Route("api/comments")]
    [ApiController]
    public class CommentController : Controller
    {
        private readonly CommentContext _context;

        public CommentController(CommentContext context)
        {
            _context = context;
        }

        // //Use the below code to test.
        // [HttpGet]
        // public ActionResult<IEnumerable<Comment>> GetAll()
        // {
        //     return new List<Comment>{
        //         new Comment {
        //             Id=1,
        //             AppId="1",
        //             SheetId="1",
        //             UserName="Chirag",
        //             UserSelections="Category:74|",
        //             CommentText="This is a Comment",
        //             Mode="No",
        //             Importance="Default",
        //             Created= System.DateTime.UtcNow
        //         }
        //     };
        // }

        //Get all the comments by Sheet Id. 
        //Comments are always added per sheet. Sheet Id is a unique GUID and so is a good candidate to fetch comments.
        
        [HttpGet("{sheetId}")]
		public ActionResult<List<Comment>> GetCommentsBySheet(string sheetid)
		{
			var commentList = _context.Comment.Where(c => c.SheetId == sheetid).OrderByDescending(CommentItem => CommentItem.Id).ToList();
			if (commentList == null)
			{
				return NotFound();
			}

			return commentList;
		}

        //Create a new comment
        [HttpPost]
        public IActionResult Create(Comment item)
        {
			_context.Database.OpenConnection();
			try
			{
				//_context.Database.ExecuteSqlCommand("SET IDENTITY_INSERT [dbo].[CommentItems] ON");
				_context.Comment.Add(item);
				_context.SaveChanges();
				//_context.Database.ExecuteSqlCommand("SET IDENTITY_INSERT [dbo].[CommentItems] OFF");
			}
			catch (Exception ex)
			{
				throw ex.InnerException;
			}
			finally
			{
				_context.Database.CloseConnection();
			}
			return NoContent();
				
        }
        
        //Update a comment
        [HttpPut("{id}")]
        public IActionResult Update(int id, Comment item)
        {
            var commentItem = _context.Comment.Find(id);
            if (commentItem == null)
            {
                return NotFound();
            }

            commentItem.CommentText = item.CommentText;
            commentItem.Importance = item.Importance;
			commentItem.Created = DateTime.UtcNow;

            _context.Comment.Update(commentItem);
            _context.SaveChanges();
            return NoContent();
        }

        //Delete a comment
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            var commentItem = _context.Comment.Find(id);
            if (commentItem == null)
            {
                return NotFound();
            }

            _context.Comment.Remove(commentItem);
            _context.SaveChanges();
            return NoContent();
        }
    }
}