﻿using Aqua.EnumerableExtensions;
using Microsoft.AspNetCore.Mvc.ApiExplorer;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using ODTLearning.Entities;
using ODTLearning.Helpers;
using ODTLearning.Models;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;

namespace ODTLearning.Repositories
{
    public class AccountRepository : IAccountRepository
    {
        private readonly DbminiCapstoneContext _context;
        private readonly IConfiguration _configuration;

        public AccountRepository(DbminiCapstoneContext context, IConfiguration configuration)
        {
            _context = context;
            _configuration = configuration;
        }

        ImageLibrary imgLib = new ImageLibrary();
        EmailLibrary emailLib = new EmailLibrary();


        public async Task<bool> IsEmailExist(string email)
        {
            return await _context.Accounts.AnyAsync(a => a.Email == email);
        }

        public async Task<UserResponse> SignUpOfAccount(SignUpModelOfAccount model)
        {

            var user = new Account
            {
                Id = Guid.NewGuid().ToString(),
                FullName = model.FullName,
                Password = model.Password,
                Phone = model.Phone,
                AccountBalance = 0,
                Email = model.Email,
                DateOfBirth = model.date_of_birth,
                Gender = model.Gender,
                Roles = "Học sinh"
            };
            // Thêm Account vào context
            await _context.Accounts.AddAsync(user);
            await _context.SaveChangesAsync();
            return new UserResponse
            {
                Id = user.Id,
                FullName = user.FullName,
                Email = user.Email,
                Date_of_birth = user.DateOfBirth,
                Gender = user.Gender,
                Roles = user.Roles,
                Avatar = user.Avatar,
                Address = user.Address,
                Phone = user.Phone,
                AccountBalance = user.AccountBalance
            };

        }

        public async Task<ApiResponse<TutorResponse>> SignUpOftutor(string IdAccount, SignUpModelOfTutor model)
        {
            // Tìm kiếm account trong DB bằng id
            var existingUser = _context.Accounts.FirstOrDefault(a => a.Id == IdAccount);
            if (existingUser != null)
            {
                // Tạo mới đối tượng tutor
                var tutor = new Tutor
                {
                    Id = Guid.NewGuid().ToString(),
                    SpecializedSkills = model.SpecializedSkills,
                    Experience = model.Experience,
                    Status = "Chưa duyệt",
                    IdAccount = existingUser.Id
                };

                // Tạo mới đối tượng educationalqualification
                var educationalQualification = new EducationalQualification
                {
                    Id = Guid.NewGuid().ToString(),
                    IdTutor = tutor.Id,
                    QualificationName = model.QualificationName,
                    Type = model.Type,
                };

                // Upload ảnh
                var upload = await imgLib.UploadImage(model.ImageQualification);

                if (!upload.Success)
                {
                    return new ApiResponse<TutorResponse>
                    {
                        Success = false,
                        Message = upload.Message
                    };                    
                }

                educationalQualification.Img = model.ImageQualification.FileName;

                var subjectModel = await _context.Subjects
                                              .FirstOrDefaultAsync(lm => lm.SubjectName == model.Subject);

                if (subjectModel == null)
                {
                    return new ApiResponse<TutorResponse>
                    {
                        Success = false,
                        Message = "Không tìm thấy môn học nào với tên này",
                        Data = null
                    };
                }

                // Tạo mới đối tượng TutorSubject
                var tutorSubject = new TutorSubject
                {
                    Id = Guid.NewGuid().ToString(),
                    IdSubject = subjectModel.Id,
                    IdTutor = tutor.Id,
                };

                // Thêm các đối tượng vào DB
                await _context.Tutors.AddAsync(tutor);
                await _context.EducationalQualifications.AddAsync(educationalQualification);
                await _context.TutorSubjects.AddAsync(tutorSubject);

                try
                {
                    await _context.SaveChangesAsync();
                    // Trả về ID của tutor đã được tạo với tên là idTutor
                    return new ApiResponse<TutorResponse>
                    {
                        Success = true,
                        Message = "Đăng ký gia sư thành công. Bạn vui lòng chờ duyệt",
                        Data = new TutorResponse { IdTutor = tutor.Id }
                    };
                }
                catch (Exception ex)
                {
                    // Ghi lại lỗi nếu có xảy ra
                    Console.WriteLine($"Error while saving changes: {ex.Message}");
                    return new ApiResponse<TutorResponse>
                    {
                        Success = false,
                        Message = "Đã xảy ra lỗi trong quá trình lưu dữ liệu",
                        Data = null
                    };
                }
            }

            // Trường hợp không tìm thấy tài khoản
            return new ApiResponse<TutorResponse>
            {
                Success = false,
                Message = "Không tìm thấy tài khoản với ID này",
                Data = null
            };
        }

        public async Task<ApiResponse<TutorResponse>> SignUpOftutorFB(string IdAccount, SignUpModelOfTutorFB model)
        {
            // Tìm kiếm account trong DB bằng id
            var existingUser = await _context.Accounts.FirstOrDefaultAsync(a => a.Id == IdAccount);
            if (existingUser == null)
            {
                // Trường hợp không tìm thấy tài khoản
                return new ApiResponse<TutorResponse>
                {
                    Success = false,
                    Message = "Không tìm thấy tài khoản với ID này",
                };
            }

            // Tạo mới đối tượng tutor
            var tutor = new Tutor
            {
                Id = Guid.NewGuid().ToString(),
                SpecializedSkills = model.SpecializedSkills,
                Experience = model.Experience,
                Status = "Chưa duyệt",
                IdAccount = existingUser.Id
            };

            // Tạo mới đối tượng educationalqualification
            var educationalQualification = new EducationalQualification
            {
                Id = Guid.NewGuid().ToString(),
                IdTutor = tutor.Id,
                QualificationName = model.QualificationName,
                Type = model.Type,
                Img = model.ImageQualification
            };

            // Tìm môn học theo tên
            var subjectModel = await _context.Subjects.FirstOrDefaultAsync(lm => lm.SubjectName == model.Subject);
            if (subjectModel == null)
            {
                return new ApiResponse<TutorResponse>
                {
                    Success = false,
                    Message = "Không tìm thấy môn học nào với tên này. Vui lòng thử lại!",
                };
            }

            // Tạo mới đối tượng TutorSubject
            var tutorSubject = new TutorSubject
            {
                Id = Guid.NewGuid().ToString(),
                IdSubject = subjectModel.Id,
                IdTutor = tutor.Id,
            };

            // Thêm các đối tượng vào DB
            await _context.Tutors.AddAsync(tutor);
            await _context.EducationalQualifications.AddAsync(educationalQualification);
            await _context.TutorSubjects.AddAsync(tutorSubject);

            try
            {
                await _context.SaveChangesAsync();
                // Trả về ID của tutor đã được tạo với tên là idTutor
                return new ApiResponse<TutorResponse>
                {
                    Success = true,
                    Message = "Đăng ký gia sư thành công. Bạn vui lòng chờ duyệt",
                    Data = new TutorResponse { IdTutor = tutor.Id }
                };
            }
            catch (Exception ex)
            {
                // Ghi lại lỗi nếu có xảy ra
                Console.WriteLine($"Error while saving changes: {ex.Message}");
                return new ApiResponse<TutorResponse>
                {
                    Success = false,
                    Message = "Đã xảy ra lỗi trong quá trình lưu dữ liệu",
                    Data = null
                };
            }
        }


        public async Task<ApiResponse<UserResponse>> SignInValidationOfAccount(SignInModel model)
        {
            // Kiểm tra tài khoản theo email
            var account = await _context.Accounts
                .FirstOrDefaultAsync(u => u.Email == model.Email);

            // Nếu tài khoản không tồn tại hoặc password sai, trả về thông báo lỗi
            if (account == null || account.Password != model.Password)
            {
                return new ApiResponse<UserResponse>
                {
                    Success = false,
                    Message = "Email hoặc password không đúng",
                };
            }

            string idTutor = null;

            if (account.Roles == "gia sư" )
            {
                idTutor = _context.Tutors.Where(x => account.Id == x.IdAccount).Select(x => x.Id).ToString();
            }
            // Nếu tài khoản tồn tại và password đúng, trả về thông tin người dùng
            return new ApiResponse<UserResponse>
            {
                Success = true,
                Message = "Đăng nhập thành công",
                Data = new UserResponse
                {
                    Id = account.Id,
                    IdTutor = idTutor,
                    FullName = account.FullName,
                    Email = account.Email,
                    Date_of_birth = account.DateOfBirth,
                    Gender = account.Gender,
                    Roles = account.Roles,
                    Avatar = account.Avatar,
                    Address = account.Address,
                    Phone = account.Phone,
                    AccountBalance = account.AccountBalance
                }
            };
        }



        public async Task<TokenModel> GenerateToken(UserResponse user)
        {
            var jwttokenhandler = new JwtSecurityTokenHandler();
            var securitykey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["appsettings:secretkey"]));
            var credentials = new SigningCredentials(securitykey, SecurityAlgorithms.HmacSha256);

            var claims = new List<Claim>
            {
                 new Claim(ClaimTypes.Name, user.FullName + " " + user.Date_of_birth?.ToString("yyyy-MM-dd")),
                 new Claim(JwtRegisteredClaimNames.Email, user.Email),
                  new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                 new Claim(ClaimTypes.Role, user.Roles),
                 new Claim("id", user.Id )

            };


            var tokendescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(claims),
                Expires = DateTime.Now.AddMinutes(15),
                SigningCredentials = credentials
            };

            var token = jwttokenhandler.CreateToken(tokendescriptor);
            var accesstoken = jwttokenhandler.WriteToken(token);
            var refreshtoken = await GenerateRefreshtoken();

            var refreshtokenentity = new RefreshToken
            {
                Id = Guid.NewGuid().ToString(),
                IdAccount = user.Id,
                JwtId = token.Id,
                Token = refreshtoken,
                IsUsed = false,
                IsRevoked = false,
                IssuedAt = DateTime.UtcNow,
                ExpiredAt = DateTime.UtcNow,
            };

            await _context.AddAsync(refreshtokenentity);
            await _context.SaveChangesAsync();

            return new TokenModel
            {
                Access_token = accesstoken,
                Refresh_token = refreshtoken
            };
        }

        public async Task<string> GenerateRefreshtoken()
        {
            var random = new byte[32];
            using (var rng = RandomNumberGenerator.Create())
            {
                rng.GetBytes(random);

                return Convert.ToBase64String(random);
            }
        }

        public async Task<List<Account>> GetAllUsers()
        {
            var list = await _context.Accounts.ToListAsync();
            return list;
        }


        public async Task<ApiResponse<object>> UpdateAvatar(string id, IFormFile file)

        {
            var response = new ApiResponse<bool>();

            var user = await _context.Accounts.SingleOrDefaultAsync(x => x.Id == id);
            if (user == null)
            {

                return new ApiResponse<object>
                {
                    Success = false,
                    Message = "Không tìm thấy người dùng nào với ID này"
                }; 

            }

            if (user.Avatar != null)
            {
                var delete = await imgLib.DeleteImage(user.Avatar);
                if (!delete)
                {

                    return new ApiResponse<object>
                    {
                        Success = false,
                        Message = "Xoá avatar cũ thất bại"
                    }; 

                }
            }

            var upload = await imgLib.UploadImage(file);

            if (!upload.Success)
            {
                return new ApiResponse<object>
                {
                    Success = false,
                    Message = upload.Message
                }; 

            }

            user.Avatar = file.FileName;
            await _context.SaveChangesAsync();

            return new ApiResponse<object>
            {
                Success = true,
                Message = "Thành công"
            }; 

        }





        public async Task<string> ChangePassword(string id, ChangePasswordModel model)
        {
            var user = await _context.Accounts.SingleOrDefaultAsync(x => x.Id == id);

            if (user == null)
            {
                return "Không tìm thấy người dùng";
            }

            if (model.Password != user.Password)
            {
                return "Không đúng mật khẩu";
            }

            user.Password = model.New_password;
            await _context.SaveChangesAsync();
            return "Thay đổi mật khẩu thành công";
        }

        public async Task<string> ForgotPassword(string Email)
        {
            try
            {
                var user = await _context.Accounts.SingleOrDefaultAsync(x => x.Email == Email);
                
                if (user == null)
                {
                    return "Email không tồn tại trong hệ thống";
                }

                var password = new Random().Next(100000, 999999);

                var result = await emailLib.SendMail("ODTLearning", "Lấy lại mật khẩu", $"Mật khẩu mới là: {password}", Email);

                if (!result)
                {
                    return "Gửi mail không thành công";
                }

                user.Password = password.ToString();
                await _context.SaveChangesAsync();
            }

            catch (Exception ex)
            {
                return "Đã có một số lỗi xảy ra: " + ex.Message;
            }

            return "Gửi mật khẩu mới thành công";
        }
        public async Task<ApiResponse<UpdateProfile>> UpdateProfile(string id, UpdateProfile model)
        {
            var user = await _context.Accounts.SingleOrDefaultAsync(x => x.Id == id);

            if (user == null)
            {
                return new ApiResponse<UpdateProfile>
                {
                    Success = false,
                    Message = "Không tìm thấy người dùng nào với ID này",
                };
            }

            user.FullName = model.FullName;
            user.DateOfBirth = model.date_of_birth;
            user.Gender = model.Gender;
            user.Avatar = model.avatar;
            user.Address = model.Address;
            user.Phone = model.Phone;

            await _context.SaveChangesAsync();

            var updatedUserResponse = new UpdateProfile
            {
                FullName = user.FullName,
                date_of_birth = user.DateOfBirth,
                Gender = user.Gender,
                avatar = user.Avatar,
                Address = user.Address,
                Phone = user.Phone
            };

            return new ApiResponse<UpdateProfile>
            {
                Success = true,
                Message = "Cập nhật thông tin người dùng thành công",
                Data = updatedUserResponse
            };
        }



        public async Task<ApiResponse<object>> GetProfile(string id)
        {
            var account = await _context.Accounts.SingleOrDefaultAsync(x => x.Id == id);

            if (account == null)
            {
                return new ApiResponse<object>
                {
                    Success = false,
                    Message = "Không tìm thấy người dùng nào với ID này",
                };
            }

            var userProfile = new
            {
                Id = account.Id,
                account.Email,
                FullName = account.FullName,
                Date_of_birth = account.DateOfBirth,
                Gender = account.Gender,
                Avatar = imgLib.GetImanges(account.Avatar),
                Address = account.Address,
                Phone = account.Phone,
                AccountBalance = account.AccountBalance
            };

            return new ApiResponse<object>
            {
                Success = true,
                Message = "Lấy thông tin người dùng thành công",
                Data = userProfile
            };
        }



        public async Task<ApiResponse<bool>> SaveGoogleUserAsync(UserResponse user)
        {
            var existingUser = await _context.Accounts.FirstOrDefaultAsync(a => a.Email == user.Email);

            if (existingUser == null)
            {
                var newUser = new Account
                {
                    Id = user.Id,
                    FullName = user.FullName,
                    Email = user.Email,
                    Roles = "Học sinh"
                };

                await _context.Accounts.AddAsync(newUser);
                await _context.SaveChangesAsync();

                return new ApiResponse<bool>
                {
                    Success = true,
                    Message = "User registered successfully",
                    Data = true
                };
            }

            return new ApiResponse<bool>
            {
                Success = true,
                Message = "User already exists",
                Data = true
            };
        }

    }
}