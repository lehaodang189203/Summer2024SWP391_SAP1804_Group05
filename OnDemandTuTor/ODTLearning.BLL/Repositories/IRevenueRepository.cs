﻿using ODTLearning.Models;

namespace ODTLearning.BLL.Repositories
{
    public interface IRevenueRepository
    {       
        public Task<ApiResponse<object>> GetRevenueByMonth(int year);
        public Task<ApiResponse<object>> GetRevenueByWeek(int month, int year);
        public Task<ApiResponse<object>> GetRevenueByYear(int year);
        public Task<ApiResponse<object>> GetRevenueThisMonth();
        public Task<ApiResponse<object>> GetRevenueToday();
    }
}