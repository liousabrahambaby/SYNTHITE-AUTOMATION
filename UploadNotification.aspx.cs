using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class Staff_Default : System.Web.UI.Page
{
    cls_Traffic obj = new cls_Traffic();
    public static int eid, f;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fillgrid();
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int laonfile =Convert.ToInt32( e.CommandArgument);
       
        if (e.CommandName == "dw")
        {
            string str ="select * from tbl_upload where upload_id='"+laonfile+"'";
            DataTable dt = obj.GetDataTable(str);
            if (dt.Rows.Count > 0)
            {
                string up = dt.Rows[0]["upload_filename"].ToString();

                DownloadFile1(up, true);
            }
        }
    }
    public void fillgrid()
    {
        string sel = "select * from tbl_upload up inner join tbl_student s on up.student_id=s.student_id inner join tbl_AssignProject a on s.student_id=a.student_id inner join tbl_staff st on a.staff_id=st.staff_id where st.staff_id='" + Session["uid"] + "'";
        obj.FillGridView(sel, GridView1);
    }
    private void DownloadFile1(string fname, bool forceDownload)
    {
        string path = Server.MapPath("~/Student/UploadImage/" + fname);
        string name = Path.GetFileName(path);
        string ext = Path.GetExtension(path);
        string type = "";
        if (ext != null)
        {
            switch (ext.ToLower())
            {
                case ".htm":
                case ".html":
                    type = "text/HTML";
                    break;

                case ".txt":
                    type = "text/notepad";
                    break;

                case ".doc":
                case ".rtf":
                    type = "Application/msword";
                    break;

                case ".jpg":
                case ".jpeg":
                    type = "images/Windows Picture and Fax Viewer";
                    break;
            }
        }
        if (forceDownload)
        {
            Response.AppendHeader("content-disposition", "attachment; filename=" + name);
        }
        if (type != "")
            Response.ContentType = type;
        Response.WriteFile(path);
        Response.End();
    }


}