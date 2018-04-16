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
            filldistrict();
            fillgrid();
        }
    }
    protected void btn_save_Click(object sender, EventArgs e)
    {
        if (f == 1)
        {
            String upqry = "update tbl_supplier set supplier_name='" + txt_name.Text + "',supplier_mob='" + txt_mobile.Text + "',supplier_email='" + txt_email.Text + "',district_id='" + ddl_district.SelectedValue + "',place_id='" + ddl_place.SelectedValue + "' where supplier_id='"+eid+"'";
            obj.ExceuteCommand(upqry);
            Response.Write("<script>alert('Successfully updated')</script>");
            txt_name.Text = "";
            txt_mobile.Text = "";
            txt_email.Text = "";
            ddl_place.ClearSelection();
            ddl_district.ClearSelection();
            f = 0;
            fillgrid();

        }
        else
        {
            String insqry = "insert into tbl_supplier (supplier_name,supplier_mob,supplier_email,district_id,place_id) values ('" + txt_name.Text + "','" + txt_mobile.Text + "','" + txt_email.Text + "','" + ddl_district.SelectedValue + "','" + ddl_place.SelectedValue + "')";
            obj.ExceuteCommand(insqry);
            Response.Write("<script>alert('Successfully saved')</script>");
            txt_name.Text = "";
            txt_mobile.Text = "";
            txt_email.Text = "";
            ddl_place.ClearSelection();
            ddl_district.ClearSelection();
            fillgrid();
        }

    }
    public void filldistrict()
    {
        obj.FillDrop(ddl_district, "district_name", "district_id", "tbl_district");
    }
    public void fillplace()
    {
        String selqry = "select * from tbl_place where district_id='"+ddl_district.SelectedValue+"'";
        obj.fillDDL(ddl_place, "place_name", "place_id", selqry);
    }
    protected void ddl_district_SelectedIndexChanged(object sender, EventArgs e)
    {
        fillplace();
    }
    public void fillgrid()
    {
        String selqry="select * from tbl_supplier s inner join tbl_place p on s.place_id=p.place_id inner join tbl_district d on s.district_id=d.district_id";
            obj.FillGridView(selqry,GridView1);
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        eid = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName == "ed")
        {
            String selqry="select * from tbl_supplier where supplier_id='"+eid+"'";
                DataTable dt=obj.GetDataTable(selqry);
                txt_name.Text = dt.Rows[0]["supplier_name"].ToString();
                txt_mobile.Text = dt.Rows[0]["supplier_mob"].ToString();
                txt_email.Text = dt.Rows[0]["supplier_email"].ToString();
                filldistrict();
                ddl_district.SelectedValue = dt.Rows[0]["district_id"].ToString();
                fillplace();
                ddl_place.SelectedValue = dt.Rows[0]["place_id"].ToString();
                f = 1;
        }
                if (e.CommandName == "del")
                {
                    String delqry = "delete from tbl_supplier where supplier_id='" + eid + "'";
                    obj.ExceuteCommand(delqry);
                    fillgrid();
                }

        
    }
}