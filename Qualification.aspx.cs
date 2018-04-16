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
    public static int f, eid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fillgrid();
        }
    }
    protected void btn_save_Click(object sender, EventArgs e)
    {
        if (f == 1)
        {
            String upqry = "update tbl_qualification set quali_name='" + txt_quali.Text + "' where quali_id='" + eid + "'";
            obj.ExceuteCommand(upqry);
            Response.Write("<script>alert('Updated Successfully')</script>");
            txt_quali.Text = "";
            f = 0;
            fillgrid();
        }
        else
        {
            String insqry = "insert into tbl_qualification (quali_name) values ('" + txt_quali.Text + "')";
            obj.ExceuteCommand(insqry);
            Response.Write("<script>alert('Successfully saved')</script>");
            txt_quali.Text = "";
            fillgrid();
        }
    }
    public void fillgrid()
    {
        String selqry = "select * from tbl_qualification";
        obj.FillGridView(selqry, GridView1);
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        eid = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName == "ed")
        {
            String selqry = "select * from tbl_qualification where quali_id='" + eid + "'";
            DataTable dt = obj.GetDataTable(selqry);
            txt_quali.Text = dt.Rows[0]["quali_name"].ToString();
            f = 1;
        }
        if (e.CommandName == "del")
        {
            String delqry = "delete from tbl_qualification where quali_id='" + eid + "'";
            obj.ExceuteCommand(delqry);
            fillgrid();
        }
    }
}