using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class User_Default : System.Web.UI.Page
{
    cls_project obj = new cls_project();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fillquali();
            filldistrict();
        }
    }
    public void fillquali()
    {
        obj.FillDrop(ddl_quali, "quali_name", "quali_id", "tbl_qualification");
    }
    public void filldistrict()
    {
        obj.FillDrop(ddl_district, "district_name", "district_id", "tbl_district");
    }
    public void fillplace()
    {
        String selqry = "select * from tbl_place where district_id='" + ddl_district.SelectedValue + "'";
        obj.fillDDL(ddl_place,"place_name","place_id",selqry);
    }
  
    protected void ddl_district_SelectedIndexChanged(object sender, EventArgs e)
    {
        fillplace();
    }
    protected void ddl_place_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void txt_save_Click(object sender, EventArgs e)
    {
        String img = Path.GetFileName(fu_resume.PostedFile.FileName.ToString());
        fu_resume.SaveAs(Server.MapPath("../admin/image/"+img));
        String insqry = "insert into tbl_vacanciapplication (vapp_firstname,vapp_lastname,vapp_gender,vapp_dob,quali_id,vapp_aggrigate,vapp_experi,vapp_hname,vapp_po,district_id,place_id,vapp_pin,vapp_mob,vapp_email,vapp_resume) values ('" + txt_fname.Text + "','" + txt_lname.Text + "','" + rbl_gender.SelectedValue + "','" + txt_dob.Text + "','" + ddl_quali.SelectedValue + "','" + txt_marks.Text + "','" + txt_expe.Text + "','" + txt_hname.Text + "','" + txt_po.Text + "','" + ddl_district.SelectedValue + "','" + ddl_place.SelectedValue + "','" + txt_pin.Text + "','" + txt_mobile.Text + "','" + txt_email.Text + "','" + img + "')";
        obj.ExceuteCommand(insqry);
        Response.Write("<script>alert('Successfully saved')</script>");
        txt_dob.Text = "";
       
        txt_email.Text = "";
        txt_expe.Text = "";
        txt_fname.Text = "";
        txt_hname.Text = "";
        txt_pin.Text = "";
        ddl_place.ClearSelection();
        txt_po.Text = "";

        txt_marks.Text = "";
        
        txt_mobile.Text = "";
        
        ddl_district.ClearSelection();
        ddl_quali.ClearSelection();
    }
}