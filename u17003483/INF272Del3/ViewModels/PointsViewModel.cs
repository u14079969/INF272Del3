using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using INF272Del3.Models;

namespace INF272Del3.ViewModels
{
    public class PointsViewModel
    {
        private int mPointsAvailable;

        public int MPointsAvailable
        {
            get
            {
                return mPointsAvailable;
            }

            set
            {
                mPointsAvailable = value;
            }
        }
    }
}