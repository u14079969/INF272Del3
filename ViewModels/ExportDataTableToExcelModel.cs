using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace INF272Del3.ViewModels
{
    public class ExportDataTableToExcelModel
    {
        public int UserID
        {
            get;
            set;
        }
        public string UserName
        {
            get;
            set;
        }
        public string UserSurname
        {
            get;
            set;
        }
        public string UserEmail
        {
            get;
            set;
        }
        public string UserPhone
        {
            get;
            set;
        }

        public DateTime UserAdded
        {
            get;
            set;
        }

        public string UN
        {
            get;
            set;
        }

        public string PW
        {
            get;
            set;
        }

        public int UserTypeID
        {
            get;
            set;
        }

        public int UserPoints
        {
            get;
            set;
        }

        public int GenderID
        {
            get;
            set;
        }

        public int UserStatusID
        {
            get;
            set;
        }

        public string GUID
        {
            get;
            set;
        }

        public DateTime GUIDExpiry
        {
            get;
            set;
        }
    }
}
