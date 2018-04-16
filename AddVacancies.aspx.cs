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
            fillquali();
            fillgrid();
        }
    }
    public void fillquali()
    {
        obj.FillDrop(ddl_quali, "quali_name", "quali_id", "tbl_qualification");
    }
    protected void btn_save_Click(object sender, EventArgs e)
    {
        if (f == 1)
        {
            String upqry = "update tbl_vacancies set vacanci_postname='" + txt_position.Text + "',quali_id='" + ddl_quali.SelectedValue + "',vacanci_basicpay='"+txt_pay.Text+"',vacanci_novacancies='"+txt_number.Text+"',vacanci_postddate='"+txt_date.Text+"' where vacanci_id='" + eid + "'";
            obj.ExceuteCommand(upqry);
            f = 0;
            Response.Write("<script>alert('updated succesfully')</script>");
            fillgrid();
        }
        else
        {
            String insqry = "insert into tbl_vacancies (vacanci_postname,quali_id,vacanci_basicpay,vacanci_novacancies,vacanci_postddate) values ('" + txt_position.Text + "','" + ddl_quali.SelectedValue + "','" + txt_pay.Text + "','" + txt_number.Text + "','" + txt_date.Text + "')";
            obj.ExceuteCommand(insqry);
            Response.Write("<script>alert('saved succesfully')</script>");
            fillgrid();
        }
    }
    public void fillgrid()
    {
        String selqry = "select * from tbl_vacancies v inner join tbl_qualification q on v.quali_id=q.quali_id";
        obj.FillGridView(selqry, GridView1);
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        eid = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName == "ed")
        {
            String selqry = "select * from tbl_vacancies v inner join tbl_qualification q on v.quali_id=q.quali_id where vacanci_id='" + eid + "'";
            DataTable dt = obj.GetDataTable(selqry);
            fillquali();
            ddl_quali.SelectedValue = dt.Rows[0]["quali_id"].ToString();
            txt_number.Text = dt.Rows[0]["vacanci_novacancies"].ToString();
            txt_date.Text = dt.Rows[0]["vacanci_postddate"].ToString();
            txt_position.Text = dt.Rows[0]["vacanci_postname"].ToString();
            txt_pay.Text = dt.Rows[0]["vacanci_basicpay"].ToString();
            f = 1;
        }
        if (e.CommandName == "del")
        {
            String delqry = "delete from tbl_vacancies where vacanci_id='" + eid + "'";
            obj.ExceuteCommand(delqry);
            fillgrid();
        }

    }
}