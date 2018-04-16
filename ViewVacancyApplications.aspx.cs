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
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fillvacancy();
        }
    }
    public void fillvacancy()
    {
        String selqry = "select * from tbl_vacanciapplication v inner join tbl_qualification q on v.quali_id=q.quali_id inner join tbl_district d on v.district_id=d.district_id inner join tbl_place p on v.place_id=p.place_id";
        obj.FillGridView(selqry, GridView1);
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "view")
        {
            Session["id"] = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("../Admin/ViewMoreVacanciApplication.aspx");
        }
    }
}