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
    public int eid, f;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fillquali();
            filldistrict();
            filldesig();
            fillgrid();
        }
    }
    public void fillquali()
    {
        
        obj.FillDrop(ddl_qualification, "quali_name", "quali_id", "tbl_qualification");
    }
    public void filldistrict()
    {
        obj.FillDrop(ddl_district, "district_name", "district_id", "tbl_district");
    }


 
    public void filldesig()
    {
        obj.FillDrop(ddl_designation, "desig_name", "desig_id", "tbl_designation");
    }
    protected void btn_save_Click(object sender, EventArgs e)
    {
        String img = Path.GetFileName(fu_img.PostedFile.FileName.ToString());
        fu_img.SaveAs(Server.MapPath("../admin/image/"+img));
        String insqry = "insert into tbl_staffss (staff_fname,staff_lname,desig_id,staff_gender,staff_dob,staff_mstatus,staff_hname,staff_po,staff_place,district_id,staff_pin,staff_mob,staff_email,staff_doj,staff_salary,quali_id,staff_expe,staff_uname,staff_pwd,staff_image) values ('" + txt_fname.Text + "','" + txt_lname.Text + "','" + ddl_designation.SelectedValue + "','" + rbl_gender.SelectedValue + "','" + txt_dob.Text + "','" + rbl_mstatus.SelectedValue + "','" + txt_hname.Text + "','" + txt_po.Text + "','" + txt_place.Text + "','" + ddl_district.SelectedValue + "','" + txt_pin.Text + "','" + txt_mobile.Text + "','" + txt_email.Text + "','" + txt_doj.Text + "','" + txt_salary.Text + "','" + ddl_qualification.SelectedValue + "','" + txt_experience.Text + "','" + txt_uname.Text + "','" + txt_pwd.Text + "','" + img + "')";
        obj.ExceuteCommand(insqry);
        Response.Write("<script>alert('Successfully saved')</script>");
        txt_dob.Text = "";
        txt_doj.Text = "";
        txt_email.Text = "";
        txt_experience.Text="";
        txt_fname.Text = "";
        txt_hname.Text = "";
        txt_pin.Text = "";
        txt_place.Text = "";
        txt_po.Text = "";
        txt_pwd.Text = "";
        txt_salary.Text = "";
        txt_uname.Text = "";
        txt_mobile.Text = "";
        ddl_designation.ClearSelection();
        ddl_district.ClearSelection();
        ddl_qualification.ClearSelection();
    }
    public void fillgrid()
    {
        String selqry = "select * from tbl_staffss s inner join tbl_district d on s.district_id=d.district_id inner join tbl_qualification q on s.quali_id=q.quali_id inner join tbl_designation e on s.desig_id=e.desig_id";
        obj.FillGridView(selqry, GridView1);
    }
}