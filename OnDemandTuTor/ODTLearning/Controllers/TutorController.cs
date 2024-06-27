﻿using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ODTLearning.Entities;
using ODTLearning.Models;
using ODTLearning.Repositories;

namespace ODTLearning.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class tutorController : ControllerBase
    {
        private readonly ITutorRepository _repo;
        private readonly IConfiguration _configuration;
        private readonly DbminiCapstoneContext _context;

        public tutorController(ITutorRepository repo, IConfiguration configuration, DbminiCapstoneContext context)
        {
            _repo = repo;
            _configuration = configuration;
            _context = context;
        }


        [HttpGet("profileTutor")]
        public async Task<IActionResult> GetTutorProfile(string id)
        {
            var result = await _repo.GetTutorProfile(id);

            if (result == null)
            {
                return NotFound(new
                {
                    Success = false,
                    Message = "Get profile tutor fail"
                });
            }

            return Ok(new
            {
                Success = true,
                Message = "get tutor profile successfully",
                Data = result
            });
        }

        [HttpPost("updateTutorProfile")]
        public async Task<IActionResult> UpdateTutorProfile(string idTutor, [FromBody] TutorProfileToUpdate model)
        {
            var result = await _repo.UpdateTutorProfile(idTutor, model);

            if (!result)
            {
                return BadRequest(new
                {
                    Success = false,
                    Message = "Update tutor profile failed"
                });
            }

            return Ok(new
            {
                Success = true,
                Message = "Update tutor profile successfully"
            });
        }

        //[HttpPost("searchTutor")]
        //public async Task<IActionResult> GetTutorList(SearchTutorModel model)
        //{
        //    var result = await _repo.SearchTutorList(model);

        //    if (result == null)
        //    {
        //        return NotFound(new
        //        {
        //            Success = false,
        //            Message = "Not found"
        //        });
        //    }

        //    return Ok(new
        //    {
        //        Success = true,
        //        Message = "Get list tutor successfully",
        //        Data = result
        //    });
        //}

        [HttpGet("viewRequest")]
        public async Task<IActionResult> ViewRequest()
        {
            try
            {
                var response = await _repo.GetApprovedRequests();

                if (response.Success)
                {
                    return StatusCode(200,new
                    {
                        Success = true,
                        response.Message,
                        response.Data
                    });
                }

                return BadRequest(new
                {
                    Success = false,
                    response.Message
                });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ApiResponse<string>
                {
                    Success = false,
                    Message = "An error occurred while retrieving the arrpoved requests.",
                    Data = ex.Message
                });
            }
        }

        [HttpPost("join-request")]
        public async Task<IActionResult> JoinRequest(string requestId, string id)
        {
            try
            {
                var response = await _repo.JoinRequest(requestId, id);

                if (response.Success)
                {
                    return StatusCode(200,
                        response.Message
                        );
                }

                return BadRequest(response);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ApiResponse<string>
                {
                    Success = false,
                    Message = "An error occurred while processing the request.",
                    Data = ex.Message
                });
            }
        }
    }
}