//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace INF272Del3.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Withdrawal
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Withdrawal()
        {
            this.WithdrawalDetails = new HashSet<WithdrawalDetail>();
        }
    
        public int WithdrawalID { get; set; }
        public int UserID { get; set; }
        public System.DateTime WithdrawalDate { get; set; }
        public int TotalPoints { get; set; }
    
        public virtual User User { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<WithdrawalDetail> WithdrawalDetails { get; set; }
    }
}