using System;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace projectc_.Amal
{
    public partial class showallroom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) // ✅ لمنع تحميل البيانات أكثر من مرة
            {
                LoadRoomData();
            }
        }

        private void LoadRoomData()
        {
            string file = Server.MapPath("addroomfile.txt");
            if (File.Exists(file))
            {
                string[] da = File.ReadAllLines(file);
                tableBody.InnerHtml = ""; // ✅ تنظيف الجدول قبل إضافة البيانات الجديدة

                foreach (string d in da)
                {
                    string[] dataSplit = d.Split(',');

                    // ✅ التأكد من أن البيانات ليست فارغة قبل الإضافة
                    if (dataSplit.Length >= 4)
                    {
                        tableBody.InnerHtml += $"<tr><td>{dataSplit[0]}</td> <td>{dataSplit[1]}</td> <td>{dataSplit[2]}</td> <td>{dataSplit[3]}</td></tr>";
                    }
                }
            }
        }

        protected void back2_Click(object sender, EventArgs e)
        {
            Response.Redirect("page1.aspx");
        }
    }
}
