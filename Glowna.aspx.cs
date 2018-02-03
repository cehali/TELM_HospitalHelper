using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;

public partial class Logowanie : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["New"] != null)
        {
           
        }
        else
        {
            Response.Redirect("Logowanie.aspx");
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Pacjenci.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Leki.aspx");
    }

    protected void Button_Logout_Click(object sender, EventArgs e)
    {
        Session["New"] = null;
        Response.Redirect("Logowanie.aspx");
    }
}