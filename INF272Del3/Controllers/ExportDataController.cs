using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using INF272Del3.Models;
using ClosedXML;
using ClosedXML.Excel;
using System.IO;
using INF272Del3.ViewModels;

namespace ExportDataTableToExcelInMVC4.Controllers
{
    public class ExportDataController : Controller
    {
        public ActionResult Index()
        {
            SqlConnection myConnection = new SqlConnection("Data Source=DESKTOP-QM8VPEI\\SQLEXPRESS;Initial Catalog=INF272D3;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
            SqlCommand myInsertCommand = new SqlCommand("select * From Users", myConnection);
           
            
            string query = "select * From Users";
            DataTable dt = new DataTable();
            myConnection.Open();
            SqlDataAdapter da = new SqlDataAdapter(query, myConnection);
            da.Fill(dt);
            myConnection.Close();
            IList<ExportDataTableToExcelModel> model = new List<ExportDataTableToExcelModel>();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                model.Add(new ExportDataTableToExcelModel()
                {
                    UserID = Convert.ToInt32(dt.Rows[i]["UserID"]),
                    UserName = dt.Rows[i]["UserName"].ToString(),
                    UserSurname = dt.Rows[i]["UserSurname"].ToString(),
                    UserEmail = dt.Rows[i]["UserEmail"].ToString(),
                    UserPhone = dt.Rows[i]["UserPhone"].ToString(),
                    UserAdded = Convert.ToDateTime(dt.Rows[i]["UserAdded"]),
                    UN = dt.Rows[i]["UN"].ToString(),
                    PW = dt.Rows[i]["PW"].ToString(),
                    UserTypeID = Convert.ToInt32(dt.Rows[i]["UserTypeID"]),
                    UserPoints = Convert.ToInt32(dt.Rows[i]["UserPoints"]),
                    GenderID = Convert.ToInt32(dt.Rows[i]["GenderID"]),
                    UserStatusID = Convert.ToInt32(dt.Rows[i]["UserStatusID"]),
                    GUID = dt.Rows[i]["GUID"].ToString(),
                    GUIDExpiry = Convert.ToDateTime(dt.Rows[i]["GUIDExpiry"]),
                });
            }
            return View(model);
        }

        public ActionResult ExportData()
        {
            String constring = ConfigurationManager.ConnectionStrings["RConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            string query = "select * From Employee";
            DataTable dt = new DataTable();
            dt.TableName = "Employee";
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(query, con);
            da.Fill(dt);
            con.Close();

            using (XLWorkbook wb = new XLWorkbook())
            {
                wb.Worksheets.Add(dt);
                wb.Style.Alignment.Horizontal = XLAlignmentHorizontalValues.Center;
                wb.Style.Font.Bold = true;

                Response.Clear();
                Response.Buffer = true;
                Response.Charset = "";
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment;filename= EmployeeReport.xlsx");

                using (MemoryStream MyMemoryStream = new MemoryStream())
                {
                    wb.SaveAs(MyMemoryStream);
                    MyMemoryStream.WriteTo(Response.OutputStream);
                    Response.Flush();
                    Response.End();
                }
            }
            return RedirectToAction("Index", "ExportData");
        }

        private void releaseObject(object obj)
        {
            try
            {
                System.Runtime.InteropServices.Marshal.ReleaseComObject(obj);
                obj = null;
            }
            catch
            {
                obj = null;
            }
            finally
            {
                GC.Collect();
            }
        }
    }
}