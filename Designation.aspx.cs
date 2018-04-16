using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Default : System.Web.UI.Page
{
    cls_project obj = new cls_project();
    public static int eid,f;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
        fillgrid();
        }
    }
    protected void btn_save_Click(object sender, EventArgs e)
    {
        if (f == 1)
        {
            String upqry = "update tbl_designation set desig_name='" + txt_desig.Text + "' where desig_id='" + eid + "'";
            obj.ExceuteCommand(upqry);
            Response.Write("<script>alert('updated succesfully')</script>");
            txt_desig.Text = "";
            fillgrid();
            f = 0;

        }
        else
        {
            String insqry = "insert into tbl_designation (desig_name) values ('" + txt_desig.Text + "')";
            obj.ExceuteCommand(insqry);
            Response.Write("<script>alert('inserted succesfully')</script>");
            txt_desig.Text = "";
            fillgrid();
        }
    }
          public void fillgrid()
    {
        String selqry = "select * from tbl_designation";
        obj.FillGridView(selqry, GridView1);
    }
        
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
{
                eid = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName == "ed")
        {
            String selqry = "select * from tbl_designation where desig_id='" + eid + "'";
            DataTable dt = obj.GetDataTable(selqry);
            txt_desig.Text = dt.Rows[0]["desig_name"].ToString();
            f = 1;
        }
        if (e.CommandName == "del")
        {
            String delqry = "delete from tbl_designation where desig_id='" + eid + "'";
            obj.ExceuteCommand(delqry);
            fillgrid();
        }
    
}
}