using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class Admin_Default : System.Web.UI.Page
{
    cls_project obj = new cls_project();
    protected void Page_Load(object sender, EventArgs e)
    {
        String selqry="select * from tbl_vacanciapplication v inner join tbl_qualification q on v.quali_id=q.quali_id inner join tbl_district d on v.district_id=d.district_id inner join tbl_place p on v.place_id=p.place_id where v.vapp_id='"+Session["id"]+"'";
        DataTable dt=obj.GetDataTable(selqry);
        if (dt.Rows.Count > 0)
        {

            lbl_fname.Text = dt.Rows[0]["vapp_firstname"].ToString();
            lbl_lname.Text = dt.Rows[0]["vapp_lastname"].ToString();
            lbl_gender.Text = dt.Rows[0]["vapp_gender"].ToString(); ;
            lbl_quali.Text = dt.Rows[0]["quali_id"].ToString(); ;
            lbl_dob.Text = dt.Rows[0]["vapp_dob"].ToString();
            lbl_hname.Text = dt.Rows[0]["vapp_hname"].ToString();
            lbl_marks.Text = dt.Rows[0]["vapp_aggrigate"].ToString();
            lbl_mobile.Text = dt.Rows[0]["vapp_mob"].ToString();
            lbl_pin.Text = dt.Rows[0]["vapp_pin"].ToString();
            lbl_place.Text = dt.Rows[0]["place_name"].ToString();
            lbl_po.Text = dt.Rows[0]["vapp_po"].ToString();
            lbl_district.Text = dt.Rows[0]["district_name"].ToString();
            lbl_expe.Text = dt.Rows[0]["vapp_experi"].ToString();
            lbl_email.Text = dt.Rows[0]["vapp_email"].ToString();
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        String selqry = "select * from tbl_vacanciapplication where vapp_id='" + Session["id"] + "'";
        DataTable dt = obj.GetDataTable(selqry);
        if (dt.Rows.Count > 0)
        {
            String up = dt.Rows[0]["vapp_resume"].ToString();
            DownloadFile1(up, true);
        }
    }
    private void DownloadFile1(string fname, bool forceDownload)
    {
        string path = Server.MapPath("~/Admin/image/" + fname);
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