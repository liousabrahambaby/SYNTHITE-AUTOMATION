using AjaxControlToolkit;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;

public partial class User_PurchasePhoto_PhotoList : System.Web.UI.Page
{
    cls_project obj = new cls_project();
    static int cardid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            obj.FillDrop(ddl_category, "pcat_name", "pcat_id", "tbl_productcategory");
            filldetails();
            Panel1.Visible = false;
        }
    }
    protected void filldetails()
    {
        string selqry = "select * from tbl_product p";
        obj.FillDataList(selqry,DataList1);
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        
    
        if (e.CommandName == "com")
        {
            cardid = Convert.ToInt32(e.CommandArgument.ToString());
            Panel1.Visible = true;
            txtcomm.Focus();
            fillcomm();
        }
    //    if(e.CommandName=="view")
    //        {
    //            Image1.ImageUrl = "~/Admin/water/" + e.CommandArgument.ToString();
    //          HiddenField2_ModalPopupExtender.Show();
    //}
    }
    protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        HiddenField h = (HiddenField)e.Item.FindControl("HiddenField1");
        Rating re = (Rating)e.Item.FindControl("Rating1");
        string sel = "select AVG(rate_value) as rating from tbl_rating where product_id=" + h.Value + "";
        DataTable dt = new DataTable();
        dt = obj.GetDataTable(sel);
        if (dt != null)
        {
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["rating"] != DBNull.Value)
                {
                    re.CurrentRating = Convert.ToInt32(dt.Rows[0]["rating"]);
                }
            }
        }
    }
    protected void Rating1_Changed(object sender, RatingEventArgs e)
    {
        string s = "select * from tbl_rating where user_id=" + Session["usid"] + " and product_id='"+e.Tag+"'";
        DataTable dt = obj.GetDataTable(s);
        if (dt.Rows.Count > 0)
        {
        }
        else
        {

            string insqry = "insert into tbl_rating(user_id,product_id,rate_value)values(" + Session["usid"] + "," + e.Tag + "," + e.Value + ")";
            obj.ExceuteCommand(insqry);
        
            filldetails();
        }



    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {

    }
    protected void btnpost_Click(object sender, EventArgs e)
    {
        string insqry = "insert into tbl_comment(product_id,user_id,comment,date)values(" + cardid + ",'" + Session["usid"] + "','" + txtcomm.Text + "','" + DateTime.Now.ToShortDateString() + "')";
        obj.ExceuteCommand(insqry);
        fillcomm();
    }
    protected void fillcomm()
    {
        string s = "select * from tbl_comment c,tbl_userregistration u where c.user_id=u.user_id and product_id='"+cardid+"'";
        DataTable dt = obj.GetDataTable(s);
        if (dt.Rows.Count > 0)
        {
            obj.FillGridView(s,GridView1);
            GridView1.Visible = true;
        }
        else
        {
            GridView1.Visible = false;
        }
    }
    protected void btncan_Click(object sender, EventArgs e)
    {
        txtcomm.Text = "";
        Panel1.Visible = false;
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        GridView1.PageIndex = e.NewPageIndex;
        fillcomm();
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string s = "select * from tbl_product where pcat_id='" + ddl_category.SelectedValue + "'";         
        obj.FillDataList(s, DataList1);
    }
}