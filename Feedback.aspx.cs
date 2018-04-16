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
    cls_project obj = new cls_project();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_post_Click(object sender, EventArgs e)
    {
        String insqry = "insert into tbl_feedback (user_id,feedback,date) values ('" + Session["usid"] + "','" + txt_feedback.Text + "','" + DateTime.Now.ToShortDateString() +"')";
        obj.ExceuteCommand(insqry);
        Response.Write("<script>alert('inserted successfully')</script>");
    }
}