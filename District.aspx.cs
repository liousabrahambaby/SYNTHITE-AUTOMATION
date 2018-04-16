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
            fillstate();
            fillgrid();
        }
        
    }
    protected void btn_save_Click(object sender, EventArgs e)
    {
        if (f == 1)
        {
            String upqry = "update tbl_district set state_id='" + ddl_state.SelectedValue + "',district_name='" + txt_district.Text + "' where district_id='" + eid + "'";
            obj.ExceuteCommand(upqry);
            fillgrid();
        }
        else
        {
            String insqry = "insert into tbl_district (district_name,state_id) values('" + txt_district.Text + "','" + ddl_state.SelectedValue + "')";
            obj.ExceuteCommand(insqry);
            Response.Write("<script>alert('Successfully saved')</script>");
            txt_district.Text = "";
            ddl_state.ClearSelection();
            fillgrid();
        }
    }
    public void fillstate()
    {
        obj.FillDrop(ddl_state, "state_name", "state_id", "tbl_state");
    }
    public void fillgrid()
    {
        String selqry = "select * from tbl_district d inner join tbl_state s on d.state_id=s.state_id";
        obj.FillGridView(selqry, GridView1);

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        eid = Convert.ToInt32(e.CommandArgument);
            if(e.CommandName=="ed")
            {
                String selqry = "select * from tbl_district where district_id='" + eid + "'";
                DataTable dt = obj.GetDataTable(selqry);
                fillstate();
                ddl_state.SelectedValue = dt.Rows[0]["state_id"].ToString();
                txt_district.Text = dt.Rows[0]["district_name"].ToString();
                f = 1;
            }
            if (e.CommandName == "del")
            {
                String delqry = "delete from tbl_district where district_id='" + eid + "'";
                obj.ExceuteCommand(delqry);
                fillgrid();
            }
    }
}