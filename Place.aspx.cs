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
            fillstate();
            fillgrid();
        }
    }
    protected void btn_save_Click(object sender, EventArgs e)
    {
        if (f == 1)
        {
            String upqry = "update tbl_place set district_id='" + ddl_district.SelectedValue + "',place_name='" + txt_place.Text + "' where place_id='" + eid + "'";
            obj.ExceuteCommand(upqry);
            f = 0;
            Response.Write("<script>alert('updated succesfully')</script>");
            fillgrid();
        }
        else
        {
            String insqry = "insert into tbl_place (district_id,place_name) values ('" + ddl_district.SelectedValue + "','" + txt_place.Text + "')";
            obj.ExceuteCommand(insqry);
            Response.Write("<script>alert('saved succesfully')</script>");
            fillgrid();
        }
    }
    public void fillstate()
    {
        obj.FillDrop(ddl_state, "state_name", "state_id", "tbl_state");
    }
    public void filldistrict()
    {
        String selqry = "select * from tbl_district where state_id='" + ddl_state.SelectedValue + "'";
        obj.fillDDL(ddl_district, "district_name", "district_id", selqry);
    }
    protected void ddl_state_SelectedIndexChanged(object sender, EventArgs e)
    {
        filldistrict();
    }
    public void fillgrid()
    {
        String selqry = "select * from tbl_place p inner join tbl_district d on p.district_id=d.district_id inner join tbl_state s on d.state_id=s.state_id";
        obj.FillGridView(selqry, GridView1);
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        eid = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName == "ed")
        {
            String selqry="select * from tbl_place p inner join tbl_district d on p.district_id = d.district_id inner join tbl_state s on d.state_id =s.state_id where p.place_id='"+eid+"'";
            DataTable dt = obj.GetDataTable(selqry);
            fillstate();
            ddl_state.SelectedValue = dt.Rows[0]["state_id"].ToString();
            filldistrict();
            ddl_district.SelectedValue = dt.Rows[0]["district_id"].ToString();
            txt_place.Text = dt.Rows[0]["place_name"].ToString();
            f = 1;
        }
        if (e.CommandName == "del")
        {
            String delqry = "delete from tbl_place where place_id='" + eid + "'";
            obj.ExceuteCommand(delqry);
            fillgrid();
        }

    }
}