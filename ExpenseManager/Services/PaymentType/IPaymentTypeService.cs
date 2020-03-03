using ExpenseManager.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ExpenseManager.Services.PaymentType
{
    public interface IPaymentTypeService
    {
        IList<PaymentTypeModel> GetAllPaymentTypes();
        PaymentTypeModel GetPaymentTypeById(int paymentTypeId);
    }
}
