using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class User_Default : System.Web.UI.Page
{
    cls_project obj=new cls_project();
    public static int eid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fillproduct();
        }
    }
    public void fillproduct()
    {
        obj.FillDrop(ddl_category, "pcat_name", "pcat_id", "tbl_productcategory");
    }
    protected void ddl_category_SelectedIndexChanged(object sender, EventArgs e)
    {
        String selqry = "select * from tbl_product where pcat_id='" + ddl_category.SelectedValue + "'";
        obj.FillDataList(selqry, DataList1);
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        eid = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName == "buy")
        {
            Session["pid"] = eid;
            Response.Redirect("UserCart.aspx");
        }
    }
}
