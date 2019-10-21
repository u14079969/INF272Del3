using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using INF272Del3.Models;

namespace INF272Del3.ViewModels
{
    public class WithdrawalViewModel
    {
        private int mWithdrawalMade;

        public int MWithdrawalMade
        {
            get
            {
                return mWithdrawalMade;
            }

            set
            {
                mWithdrawalMade = value;
            }
        }
    }
}