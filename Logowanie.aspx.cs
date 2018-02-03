using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button_Login_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = C:\Users\Cezary\Documents\Visual Studio 2015\WebSites\TELM\App_Data\Database.mdf; Integrated Security = True"))
        {
            List<string> loginy = new List<string>();
            con.Open();
            SqlCommand cmd1 = con.CreateCommand();
            cmd1.CommandType = CommandType.Text;
            cmd1.CommandText = "SELECT count(*) from Uzytkownicy where Login = @login";
            cmd1.Parameters.AddWithValue("@login", TextBoxLogin.Text);
            cmd1.Parameters.AddWithValue("@haslo", TextBoxHaslo.Text);
            int temp = Convert.ToInt32(cmd1.ExecuteScalar().ToString());

            if (temp == 1)
            {
                SqlCommand cmd2 = con.CreateCommand();
                cmd2.CommandType = CommandType.Text;
                cmd2.CommandText = "select Haslo from Uzytkownicy where Login = @login";
                cmd2.Parameters.AddWithValue("@login", TextBoxLogin.Text);
                string password = cmd2.ExecuteScalar().ToString();

                if (password == TextBoxHaslo.Text)
                {
                    SqlCommand cmd3 = con.CreateCommand();
                    cmd3.CommandType = CommandType.Text;
                    cmd3.CommandText = "UPDATE Uzytkownicy SET OstatnieLogowanie = @date WHERE Login = @login";
                    DateTime Date = DateTime.Now;
                    cmd3.Parameters.AddWithValue("@date", Date);
                    cmd3.Parameters.AddWithValue("@login", TextBoxLogin.Text);
                    cmd3.ExecuteNonQuery();

                    Session["New"] = TextBoxLogin.Text;
                    Response.Redirect("Glowna.aspx");

                }
                else
                {
                    var alert = "Haslo niepoprawne";
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + alert + "');", true);
                }
            }
            else
            {
                var alert = "Login niepoprawny";
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + alert + "');", true);
            }
        }
    }
}