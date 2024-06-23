﻿using Microsoft.EntityFrameworkCore;
using ODTLearning.Entities;
using ODTLearning.Helpers;
using ODTLearning.Models;
using System.Globalization;
using System.Net;

namespace ODTLearning.Repositories
{
    public class StudentRepository : IStudentRepository
    {
        private readonly DbminiCapstoneContext _context;
        public StudentRepository(DbminiCapstoneContext context)
        {
            _context = context;
        }

        ImageLibrary imgLib = new ImageLibrary();

        public async Task<ApiResponse<bool>> CreateRequestLearning(string IDAccount, RequestLearningModel model)
        {
            // Tìm sinh viên theo IdStudent
            var student = await _context.Accounts
                                  .Include(s => s.Requests)
                                  .FirstOrDefaultAsync(s => s.Id == IDAccount);

            if (student == null)
            {
                return new ApiResponse<bool>
                {
                    Success = false,
                    Message = "Không tìm thấy học sinh nào"
                };
            }

            // Tìm LearningModel theo tên
            var Class = await _context.Classes
                                              .FirstOrDefaultAsync(cl => cl.ClassName== model.Class);

            if (Class == null)
            {
                return new ApiResponse<bool>
                {
                    Success = false,
                    Message = "Không tìm thấy lớp nào với tên này. Vui lòng chọn lớp 10,11,12"
                };
            }
            var subjectModel = await _context.Subjects
                                              .FirstOrDefaultAsync(lm => lm.SubjectName== model.Subject);

            if (subjectModel == null)
            {
                return new ApiResponse<bool>
                {
                    Success = false,
                    Message = "Không tìm thấy môn học nào với tên này"
                };
            }

            // Validate và phân tích chuỗi thời gian để đảm bảo nó có định dạng đúng
            TimeOnly? parsedTimeStart = null;
            TimeOnly? parsedTimeEnd = null;
            if (!string.IsNullOrEmpty(model.TimeStart))
            {
                if (TimeOnly.TryParseExact(model.TimeStart, "HH:mm", CultureInfo.InvariantCulture, DateTimeStyles.None, out var time))
                {
                    parsedTimeStart = time;
                }
                else
                {
                    return new ApiResponse<bool>
                    {
                        Success = false,
                        Message = "Ngày bắt đầu sai định dạng hh:mm"
                    };
                }
            }
            if (!string.IsNullOrEmpty(model.TimeEnd))
            {
                if (TimeOnly.TryParseExact(model.TimeEnd, "HH:mm", CultureInfo.InvariantCulture, DateTimeStyles.None, out var time))
                {
                    parsedTimeEnd = time;
                }
                else
                {
                    return new ApiResponse<bool>
                    {
                        Success = false,
                        Message = "Ngày kết thúc sai định dạng hh:mm"
                    };
                }
            }

            // Tạo một đối tượng Request mới từ model
            var requestOfStudent = new Request
            {
                Id = Guid.NewGuid().ToString(),
                Title = model.Title,
                Price = model.Price,
                Description = model.Description,
                Status = "Chưa duyệt",
                LearningMethod = model.LearningMethod,
                IdAccount = IDAccount, // Đảm bảo ID tài khoản được đặt
                IdSubject = subjectModel.Id,
                IdClass = Class.Id // Đảm bảo thuộc tính này được đặt
            };

            // Thêm Request vào context
            await _context.Requests.AddAsync(requestOfStudent);
            await _context.SaveChangesAsync();

            // Tạo một đối tượng Schedule mới nếu có thông tin về lịch trình
            if (model.Date.HasValue && parsedTimeStart.HasValue && parsedTimeEnd.HasValue)
            {
                var schedule = new Schedule
                {
                    Id = Guid.NewGuid().ToString(),
                    Date = model.Date.Value,
                    TimeStart = parsedTimeStart.Value,
                    TimeEnd = parsedTimeEnd.Value,
                    IdService = null, 
                    IdRequest = requestOfStudent.Id,
                };

                // Thêm Schedule vào context
                await _context.Schedules.AddAsync(schedule);
                await _context.SaveChangesAsync();
            }

            return new ApiResponse<bool>
            {
                Success = true,
                Message = "Tạo yêu cầu thành công",
            };
        }



       public async Task<ApiResponse<bool>> UpdateRequestLearning(string requestId, RequestLearningModel model)
{
    try
    {
        // Tìm request theo requestId
        var requestToUpdate = await _context.Requests
                                      .Include(r => r.Schedules)
                                      .FirstOrDefaultAsync(r => r.Id == requestId);

        if (requestToUpdate == null)
        {
            return new ApiResponse<bool>
            {
                Success = false,
                Message = "Không tìm thấy yêu cầu nào"
            };
        }

        // Tìm Class theo tên nếu cần cập nhật
        var classEntity = await _context.Classes
                                        .FirstOrDefaultAsync(cl => cl.ClassName == model.Class);

        if (classEntity == null)
        {
            return new ApiResponse<bool>
            {
                Success = false,
                Message = "Không tìm thấy lớp nào với tên này. Vui lòng chọn lớp 10,11,12"
            };
        }

        // Tìm Subject theo tên nếu cần cập nhật
        var subjectEntity = await _context.Subjects
                                          .FirstOrDefaultAsync(s => s.SubjectName == model.Subject);

        if (subjectEntity == null)
        {
            return new ApiResponse<bool>
            {
                Success = false,
                Message = "Không tìm thấy môn học nào với tên này"
            };
        }

        // Validate và phân tích chuỗi thời gian để đảm bảo nó có định dạng đúng
        TimeOnly? parsedTimeStart = null;
        TimeOnly? parsedTimeEnd = null;
        if (!string.IsNullOrEmpty(model.TimeStart))
        {
            if (TimeOnly.TryParseExact(model.TimeStart, "HH:mm", CultureInfo.InvariantCulture, DateTimeStyles.None, out var time))
            {
                parsedTimeStart = time;
            }
            else
            {
                return new ApiResponse<bool>
                {
                    Success = false,
                    Message = "Ngày bắt đầu sai định dạng hh:mm"
                };
            }
        }
        if (!string.IsNullOrEmpty(model.TimeEnd))
        {
            if (TimeOnly.TryParseExact(model.TimeEnd, "HH:mm", CultureInfo.InvariantCulture, DateTimeStyles.None, out var time))
            {
                parsedTimeEnd = time;
            }
            else
            {
                return new ApiResponse<bool>
                {
                    Success = false,
                    Message = "Ngày kết thúc sai định dạng hh:mm"
                };
            }
        }

        // Cập nhật các thuộc tính của request từ model
        requestToUpdate.Title = model.Title ?? requestToUpdate.Title;
        requestToUpdate.Price = model.Price ?? requestToUpdate.Price;
        requestToUpdate.Description = model.Description ?? requestToUpdate.Description;
        requestToUpdate.IdSubject = subjectEntity.Id;
        requestToUpdate.IdClass = classEntity.Id;
        requestToUpdate.LearningMethod = model.LearningMethod ?? requestToUpdate.LearningMethod;

        // Cập nhật schedule nếu có thông tin về lịch trình
        if (model.Date.HasValue && parsedTimeStart.HasValue && parsedTimeEnd.HasValue)
        {
            var scheduleToUpdate = requestToUpdate.Schedules.FirstOrDefault();
            if (scheduleToUpdate != null)
            {
                scheduleToUpdate.Date = model.Date.Value;
                scheduleToUpdate.TimeStart = parsedTimeStart.Value;
                scheduleToUpdate.TimeEnd = parsedTimeEnd.Value;
                scheduleToUpdate.IdService = scheduleToUpdate.IdService; // Placeholder, replace with actual service ID if needed
            }
            else
            {
                // Tạo mới schedule nếu chưa tồn tại
                var newSchedule = new Schedule
                {
                    Id = Guid.NewGuid().ToString(),
                    Date = model.Date.Value,
                    TimeStart = parsedTimeStart.Value,
                    TimeEnd = parsedTimeEnd.Value,
                    IdRequest = requestToUpdate.Id,
                    IdService = null // Placeholder, replace with actual service ID if needed
                };
                await _context.Schedules.AddAsync(newSchedule);
            }
        }

        // Lưu các thay đổi vào context
        await _context.SaveChangesAsync();

        return new ApiResponse<bool>
        {
            Success = true,
            Message = "Cập nhật yêu cầu thành công"
        };
    }
    catch (Exception ex)
    {
        return new ApiResponse<bool>
        {
            Success = false,
            Message = "An error occurred while updating the request learning: " + ex.Message
        };
    }
}

        public async Task<bool> DeleteRequestLearning(string requestId)
        {
            // Tìm request theo requestId
            var requestToDelete = await _context.Requests
                                          .Include(r => r.Schedules)
                                          .FirstOrDefaultAsync(r => r.Id == requestId);

            if (requestToDelete == null)
            {
                throw new ArgumentException("Request not found");
            }

            // Xóa các schedules liên quan
            if (requestToDelete.Schedules != null)
            {
                _context.Schedules.RemoveRange(requestToDelete.Schedules);
            }

            // Xóa request
            _context.Requests.Remove(requestToDelete);
            await _context.SaveChangesAsync();

            return true; // Trả về true nếu việc xóa thành công
        }

        public async Task<ApiResponse<List<RequestLearningModel>>> GetPendingRequestsByAccountId(string accountId)
        {
            var requests = await _context.Requests
                .Include(r => r.Schedules)
                .Include(r => r.IdSubjectNavigation)
                .Include(r => r.IdClassNavigation)
                .Where(r => r.IdAccount == accountId && r.Status == "Chưa duyệt")
                .ToListAsync();

            if (requests == null || !requests.Any())
            {
                return new ApiResponse<List<RequestLearningModel>>
                {
                    Success = false,
                    Message = "Không tìm thấy tài khoảng nào với ID này",
                    Data = null
                };
            }

            var requestLearningModels = requests.SelectMany(r => r.Schedules.Select(s => new RequestLearningModel
            {
                Title = r.Title,
                Price = r.Price,
                Description = r.Description,
                Subject = r.IdSubjectNavigation.SubjectName,
                LearningMethod = r.LearningMethod,
                Class = r.IdClassNavigation.ClassName,
                Date = s.Date,
                TimeStart = s.TimeStart.HasValue ? s.TimeStart.Value.ToString("HH:mm") : null,
                TimeEnd = s.TimeEnd.HasValue ? s.TimeEnd.Value.ToString("HH:mm") : null
            })).ToList();

            return new ApiResponse<List<RequestLearningModel>>
            {
                Success = true,
                Message = "Danh sách yêu cầu đang chờ xử lý đã được truy xuất thành công",
                Data = requestLearningModels
            };
        }
        public async Task<ApiResponse<List<RequestLearningModel>>> GetApprovedRequestsByAccountId(string accountId)
        {
            var requests = await _context.Requests
                .Include(r => r.Schedules)
                .Include(r => r.IdSubjectNavigation)
                .Include(r => r.IdClassNavigation)
                .Where(r => r.IdAccount == accountId && r.Status == "Đã duyệt")
                .ToListAsync();

            if (requests == null || !requests.Any())
            {
                return new ApiResponse<List<RequestLearningModel>>
                {
                    Success = false,
                    Message = "Không tìm thấy tài khoảng nào với ID này",
                    Data = null
                };
            }

            var requestLearningModels = requests.SelectMany(r => r.Schedules.Select(s => new RequestLearningModel
            {
                Title = r.Title,
                Price = r.Price,
                Description = r.Description,
                Subject = r.IdSubjectNavigation.SubjectName,
                LearningMethod = r.LearningMethod,
                Class = r.IdClassNavigation.ClassName,
                Date = s.Date,
                TimeStart = s.TimeStart.HasValue ? s.TimeStart.Value.ToString("HH:mm") : null,
                TimeEnd = s.TimeEnd.HasValue ? s.TimeEnd.Value.ToString("HH:mm") : null
            })).ToList();

            return new ApiResponse<List<RequestLearningModel>>
            {
                Success = true,
                Message = "Danh sách yêu cầu đã xử lý đã được truy xuất thành công",
                Data = requestLearningModels
            };
        }
        public async Task<ApiResponse<List<RequestLearningModel>>> GetRejectRequestsByAccountId(string accountId)
        {
            var requests = await _context.Requests
                .Include(r => r.Schedules)
                .Include(r => r.IdSubjectNavigation)
                .Include(r => r.IdClassNavigation)
                .Where(r => r.IdAccount == accountId && r.Status == "Reject")
                .ToListAsync();

            if (requests == null || !requests.Any())
            {
                return new ApiResponse<List<RequestLearningModel>>
                {
                    Success = false,
                    Message = "Không tìm thấy tài khoảng nào với ID này",
                    Data = null
                };
            }

            var requestLearningModels = requests.SelectMany(r => r.Schedules.Select(s => new RequestLearningModel
            {
                Title = r.Title,
                Price = r.Price,
                Description = r.Description,
                Subject = r.IdSubjectNavigation.SubjectName,
                LearningMethod = r.LearningMethod,
                Class = r.IdClassNavigation.ClassName,
                Date = s.Date,
                TimeStart = s.TimeStart.HasValue ? s.TimeStart.Value.ToString("HH:mm") : null,
                TimeEnd = s.TimeEnd.HasValue ? s.TimeEnd.Value.ToString("HH:mm") : null
            })).ToList();

            return new ApiResponse<List<RequestLearningModel>>
            {
                Success = true,
                Message = "Danh sách yêu cầu từ chối xử lý đã được truy xuất thành công",
                Data = requestLearningModels
            };
        }
        
       
        public async Task<ApiResponse<List<TutorListModel>>> ViewAllTutorJoinRequest(string requestId)
        {
            // Tìm request theo requestId
            var request = await _context.Requests
                                        .Include(r => r.RequestLearnings)
                                        .ThenInclude(rl => rl.IdTutorNavigation)
                                            .ThenInclude(t => t.EducationalQualifications)
                                        .Include(r => r.RequestLearnings)
                                        .ThenInclude(rl => rl.IdTutorNavigation)
                                            .ThenInclude(t => t.IdAccountNavigation)
                                        .Include(r => r.RequestLearnings)
                                        .ThenInclude(rl => rl.IdTutorNavigation)
                                            .ThenInclude(t => t.TutorSubjects)
                                                .ThenInclude(ts => ts.IdSubjectNavigation)
                                        .FirstOrDefaultAsync(r => r.Id == requestId);

            if (request == null)
            {
                return new ApiResponse<List<TutorListModel>>
                {
                    Success = false,
                    Message = "Không tìm thấy yêu cầu nào với ID này",
                    Data = null
                };
            }

            // Lấy danh sách gia sư tham gia yêu cầu
            var tutors = request.RequestLearnings.Select(rl => new TutorListModel
            {
                FullName = rl.IdTutorNavigation.IdAccountNavigation.FullName,
                Gender = rl.IdTutorNavigation.IdAccountNavigation.Gender,
                SpecializedSkills = rl.IdTutorNavigation.SpecializedSkills,
                Experience = rl.IdTutorNavigation.Experience,
                Subject = rl.IdTutorNavigation.TutorSubjects.FirstOrDefault()?.IdSubjectNavigation.SubjectName,
                QualificationName = rl.IdTutorNavigation.EducationalQualifications.FirstOrDefault()?.QualificationName
            }).ToList();

            return new ApiResponse<List<TutorListModel>>
            {
                Success = true,
                Message = "Danh sách gia sư đã tham gia vào yêu cầu",
                Data = tutors
            };
        }

        public async Task<ApiResponse<SelectTutorModel>> SelectTutor(string idRequest, string idAccountTutor)
        {
            var request = await _context.Requests.SingleOrDefaultAsync(x => x.Id == idRequest);

            if (request == null)
            {
                return new ApiResponse<SelectTutorModel>
                {
                    Success = false,
                    Message = "Không tìm thấy request trong hệ thống",
                    Data = null
                };
            }

            var tutor = await _context.Accounts.SingleOrDefaultAsync(x => x.Id == idAccountTutor);

            if (tutor == null || tutor.Roles != "gia sư")
            {
                return new ApiResponse<SelectTutorModel>
                {
                    Success = false,
                    Message = "Không tìm thấy gia sư trong hệ thống",
                    Data = null
                };
            }
            
            var user = await _context.Accounts.SingleOrDefaultAsync(x => x.Id == request.IdAccount);

            if (user.AccountBalance < request.Price)
            {
                return new ApiResponse<SelectTutorModel>
                {
                    Success = false,
                    Message = "Tài khoản user không đủ tiền yêu cầu",
                    Data = null
                };
            }

            var rent = new Rent
            {
                Id = Guid.NewGuid().ToString(),
                Price = request.Price,
                IdSubject = request.IdSubject,
                IdRequest = idRequest,
                IdAccount = request.IdAccount,
                IdTutor = idAccountTutor
            };

            user.AccountBalance = user.AccountBalance - request.Price;
            await _context.AddAsync(rent);
            await _context.SaveChangesAsync();

            var data = new SelectTutorModel
            {
                Tutor = new
                {
                    Name = tutor.FullName,
                    Email = tutor.Email,
                    DateOfBirth = tutor.DateOfBirth,
                    Gender = tutor.Gender,
                    Avatar = imgLib.GetImanges(tutor.Avatar),
                    Address = tutor.Address,
                    Phone = tutor.Phone
                },
                User = new
                {
                    Name = user.FullName,
                    Email = user.Email,
                    DateOfBirth = user.DateOfBirth,
                    Gender = user.Gender,
                    Avatar = imgLib.GetImanges(user.Avatar),
                    Address = user.Address,
                    Phone = user.Phone
                }
            };

            return new ApiResponse<SelectTutorModel>
            {
                Success = true,
                Message = "Thành công",
                Data = data
            };            
        }
    }
}