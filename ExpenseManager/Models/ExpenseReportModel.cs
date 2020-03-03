using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ExpenseManager.Models
{
    [Table("ExpenseReport", Schema="dbo")]
    public class ExpenseReportModel
    {
        [Key]
        public int ExpenseId { get; set; }
        [Required]
        public string ExpenseName { get; set; }

        [Required]
        [DataType(DataType.Currency)]
        [Column(TypeName = "decimal(18, 2)")]
        [Range(1, Int32.MaxValue, ErrorMessage = "Please enter the amount greater than 1.")]
        public decimal Amount { get; set; }

        [DataType(DataType.Date)]
        //[DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        [Display(Name = "Date of Expense")]
        [Required]
        public DateTime ExpenseDate { get; set; }

        public DateTime? ExpenseUpdateDate { get; set; }
        [Display(Name = "Expsense Description")]
        public string ExpenseDesc { get; set; }

        [Required]
        public string ExpenseBy { get; set; }

        [Required(ErrorMessage = "Please select the Category, it is required.")]
        public int CategoryId { get; set; }

        [ForeignKey("CategoryId")]
        [Display(Name = "Expense Category")]        
        public virtual CategoryModel Category { get; set; }

        [NotMapped]
        public IList<CategoryModel> ListOfCategories { get; set; }

        [Required(ErrorMessage = "Please select Payment type, it is required.")]
        public int PaymentTypeId { get; set; }

        [ForeignKey("PaymentTypeId")]
        [Display(Name = "Expense Payment Type")]        
        public virtual PaymentTypeModel PaymentType { get; set; }

        [NotMapped]
        public IList<PaymentTypeModel> ListOfPaymentTypes { get; set; }
    }
}
