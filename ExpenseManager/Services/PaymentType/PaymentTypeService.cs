using ExpenseManager.Models;
using System;
using System.Collections.Generic;
using System.Linq;

namespace ExpenseManager.Services.PaymentType
{
    public class PaymentTypeService : IPaymentTypeService
    {
        #region Fields
        private readonly ExpenseDBContext dbContext;
        #endregion

        #region Ctor
        public PaymentTypeService(ExpenseDBContext dbContext)
        {
            this.dbContext = dbContext;
        }
        #endregion

        #region Methods
        public IList<PaymentTypeModel> GetAllPaymentTypes()
        {
            try
            {
                return dbContext.PaymentTypes.ToList();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public PaymentTypeModel GetPaymentTypeById(int paymentTypeId)
        {
            try
            {
                return dbContext.PaymentTypes.Find(paymentTypeId);
            }
            catch (Exception)
            {
                throw;
            }
        }

        #endregion
    }
}
