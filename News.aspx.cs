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
            lbl_date.Text = DateTime.Now.ToShortDateString();
            fillgrid();
        }
    }
    public void fillgrid()
    {
        String selqry = "select * from tbl_newses";
        obj.FillGridView(selqry, GridView1);
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        eid = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName == "ed")
        {
            String selqry = "select * from tbl_newses where news_id='" + eid + "'";
            DataTable dt = obj.GetDataTable(selqry);
            lbl_date.Text = dt.Rows[0]["date"].ToString();
            txt_head.Text = dt.Rows[0]["headline"].ToString();
            txt_news.Text = dt.Rows[0]["news"].ToString();
            f = 1;
        }
        if (e.CommandName == "del")
        {
            String delqry = "delete from tbl_newses where news_id='" + eid + "'";
            obj.ExceuteCommand(delqry);
            fillgrid();
        }

    }
    protected void btn_save_Click(object sender, EventArgs e)
    {
        if (f == 1)
        {
            String upqry = "update tbl_newses set date='" + lbl_date.Text + "',headline='"+txt_head.Text+"',news='"+txt_news.Text+"' where news_id='" + eid + "'";
            obj.ExceuteCommand(upqry);
            Response.Write("<script>alert('updated succesfully')</script>");
            lbl_date.Text = "";
            txt_head.Text = "";
            txt_news.Text = "";
            fillgrid();
            f = 0;

        }
        else
        {
            String insqry = "insert into tbl_newses (date,headline,news) values ('" + lbl_date.Text + "','"+txt_head.Text+"','"+txt_news.Text+"')";
            obj.ExceuteCommand(insqry);
            Response.Write("<script>alert('inserted succesfully')</script>");
            
            txt_head.Text = "";
            txt_news.Text = "";
            fillgrid();
        }
    }
    protected void txt_date_TextChanged(object sender, EventArgs e)
    {

    }
}