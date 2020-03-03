using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ExpenseManager.Models
{
    [Table("PaymentType", Schema = "dbo")]
    public class PaymentTypeModel
    {
        [Key]
        public int PaymentTypeId { get; set; }
        public string PaymentType { get; set; }
    }
}
