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
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_save_Click(object sender, EventArgs e)
    {
        String insqry="insert into tbl_state (state_name) values('"+txt_state.Text+"')";
            obj.ExceuteCommand(insqry);
        Response.Write("<script>alert('Successfully saved')</script>");
        txt_state.Text = "";
    }
}