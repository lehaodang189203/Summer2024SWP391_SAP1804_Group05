﻿using Aqua.EnumerableExtensions;
using Microsoft.AspNetCore.Mvc.ApiExplorer;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using ODTLearning.Entities;
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
        public async Task<SignUpModelOfAccount> SignUpValidationOfAccount(SignUpModelOfAccount model) => await _context.Accounts.AnyAsync(a => a.Gmail == model.Email) ? null : model;
        public async Task<Account> SignUpOfAccount(SignUpModelOfAccount model)
        {

            var account = new Account
            {
                Id = Guid.NewGuid().ToString(),
                FullName = model.Fullname,
                Password = model.Password,
                PhoneNumber = model.Phone,
                AccountBalance = 0,
                Gmail = model.Email,
                Birthdate = model.date_of_birth,
                Gender = model.Gender,
                Role = "Student"
            };

            // Thêm Account vào context
            await _context.Accounts.AddAsync(account);
            await _context.SaveChangesAsync();
            return account;
        }

        public async Task<object> SignUpOftutor(string IdAccount, SignUpModelOfTutor model)
        {
            // Tìm kiếm account trong DB bằng id
            var existingUser = _context.Accounts.FirstOrDefault(a => a.Id == IdAccount);
            if (existingUser != null)
            {
                // Cập nhật vai trò của tài khoản thành "tutor"
                existingUser.Role = "Tutor";
                _context.Accounts.Update(existingUser);

                // Tạo mới đối tượng tutor
                var tutor = new Tutor
                {
                    Id = Guid.NewGuid().ToString(),
                    SpecializedSkills = model.SpecializedSkills,
                    Experience = model.Experience,
                    Status = "Operating",
                    IdAccount = existingUser.Id
                };

                // Tạo mới đối tượng educationalqualification
                var educationalQualification = new EducationalQualification
                {
                    Id = Guid.NewGuid().ToString(),
                    IdTutor = tutor.Id,
                    QualificationName = model.QualificationName,
                    Img = model.ImageQualification,
                    Type = model.Type,
                };

                // Kiểm tra xem subject có tồn tại không, nếu không thì tạo mới
                var subject = _context.Subjects.FirstOrDefault(s => s.SubjectName == model.Subject);
                if (subject == null)
                {
                    subject = new Subject
                    {
                        Id = Guid.NewGuid().ToString(),
                        SubjectName = model.Subject,
                    };
                    await _context.Subjects.AddAsync(subject);
                }

                // Tạo mới đối tượng TutorSubject
                var tutorSubject = new TutorSubject
                {
                    Id = Guid.NewGuid().ToString(),
                    IdSubject = subject.Id,
                    IdTutor = tutor.Id,
                };

                // Thêm các đối tượng vào DB
                await _context.Tutors.AddAsync(tutor);
                await _context.EducationalQualifications.AddAsync(educationalQualification);
                await _context.TutorSubjects.AddAsync(tutorSubject);

                try
                {
                    await _context.SaveChangesAsync();
                    // Trả về đối tượng tutor đã được tạo
                    return existingUser;
                }
                catch (Exception ex)
                {
                    // Ghi lại lỗi nếu có xảy ra
                    Console.WriteLine($"Error while saving changes: {ex.Message}");
                }
            }

            // Trường hợp không tìm thấy tài khoản
            return null;
        }


        public async Task<Account> SignInValidationOfAccount(SignInModel model) => await _context.Accounts.FirstOrDefaultAsync(u => u.Gmail == model.Email && u.Password == model.Password);

        public async Task<TokenModel> GenerateToken(Account user)
        {
            var jwttokenhandler = new JwtSecurityTokenHandler();
            var securitykey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["appsettings:secretkey"]));
            var credentials = new SigningCredentials(securitykey, SecurityAlgorithms.HmacSha256);

            var claims = new List<Claim>
            {
                 new Claim(ClaimTypes.Name, user.FullName + " " + user.Birthdate?.ToString("yyyy-MM-dd")),
                 new Claim(JwtRegisteredClaimNames.Email, user.Gmail),
                  new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                 new Claim(ClaimTypes.Role, user.Role),
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
                Access_Token = accesstoken,
                Refresh_Token = refreshtoken
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
    }
}
