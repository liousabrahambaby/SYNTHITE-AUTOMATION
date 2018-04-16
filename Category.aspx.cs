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
        eid = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName == "ed")
        {
            String selqry = "select * from tbl_productcategory where pcat_id='" + eid + "'";
            DataTable dt = obj.GetDataTable(selqry);
            txt_category.Text = dt.Rows[0]["pcat_name"].ToString();
            f = 1;
        }
        if (e.CommandName == "del")
        {
            String delqry = "delete from tbl_productcategory where pcat_id='" + eid + "'";
            obj.ExceuteCommand(delqry);
            fillgrid();
        }
    
    }
    protected void btn_save_Click(object sender, EventArgs e)
    {
                if (f == 1)
        {
            String upqry = "update tbl_productcategory set pcat_name='" + txt_category.Text + "' where pcat_id='" + eid + "'";
            obj.ExceuteCommand(upqry);
            Response.Write("<script>alert('updated succesfully')</script>");
            txt_category.Text = "";
            fillgrid();
            f = 0;

        }
        else
        {
            String insqry = "insert into tbl_productcategory (pcat_name) values ('" + txt_category.Text + "')";
            obj.ExceuteCommand(insqry);
            Response.Write("<script>alert('inserted succesfully')</script>");
            txt_category.Text = "";
            fillgrid();
        }
    }
          public void fillgrid()
    {
        String selqry = "select * from tbl_productcategory";
        obj.FillGridView(selqry, GridView1);
        
    }
}