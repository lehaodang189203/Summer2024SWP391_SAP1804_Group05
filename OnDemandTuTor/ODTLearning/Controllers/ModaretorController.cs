using Microsoft.AspNetCore.Mvc;
using ODTLearning.BLL.Repositories;

namespace ODTLearning.Controllers
{
    public class ModaretorController : Controller
    {
        private readonly ModeratorRepository _repo;

        public ModaretorController(ModeratorRepository repo)
        {
            _repo = repo;
        }


        [HttpDelete("DeleteRequest")]
        // [Authorize(Roles = "Kiểm duyệt viên")]
        public async Task<IActionResult> DeleteRequest(string idRequest)
        {
            var result = await _repo.DeleteRequest(idRequest);

            if (!result.Success)
            {
                return NotFound(new
                {
                    Success = false,
                    Message = result.Message
                });
            }

            return Ok(new
            {
                Success = true,
                Message = result.Message
            });
        }
    }
}
