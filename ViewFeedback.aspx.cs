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
        if (!IsPostBack)
        {
            fillfeedback();
        }
    }
    public void fillfeedback()
    {
        String selqry = "select * from tbl_feedback f inner join tbl_userregistration u on f.user_id=u.user_id";
        obj.FillGridView(selqry, GridView1);
        
    }
}