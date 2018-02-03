using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Leki : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["New"] == null)
        { 
            Response.Redirect("Logowanie.aspx");
        }
    }

    protected void Search(object sender, EventArgs e)
    {
        this.BindGrid();
    }

    private void BindGrid()
    {
        try
        {
            using (SqlConnection con = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = C:\Users\Cezary\Documents\Visual Studio 2015\WebSites\TELM\App_Data\Database.mdf; Integrated Security = True"))
            {
                con.Open();
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT * FROM Leki WHERE Nazwa LIKE '%' + @Nazwa + '%' ";
                cmd.Parameters.AddWithValue("@Nazwa", txtSearch.Text.Trim());
                DataTable dt = new DataTable();
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    sda.Fill(dt);
                    GridView1.DataSourceID = null;
                    GridView1.DataBind();
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
        }
        catch (Exception ex)
        {
            var alert = "Wystąpił błąd: " + ex + " Prosimy spróbować ponownie lub/i zgłosić problem do IT";
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + alert + "');", true);
        }
    }


    protected void Submit_Dodaj_lek_Click(object sender, EventArgs e)
    {
        if (String.IsNullOrEmpty(TextBox1.Text) || String.IsNullOrEmpty(TextBox2.Text))
        {
            var alert = "Nie zostały wypełnione wszystkie pola";
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + alert + "');", true);
        }

        try
        {
            int zalecana_dawka = int.Parse(TextBox2.Text);
            if (zalecana_dawka <= 0)
            {
                var alert = "Zalecana dawka leku nie może być równa lub mniejsza od 0";
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + alert + "');", true);
            }

            using (SqlConnection con = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = C:\Users\Cezary\Documents\Visual Studio 2015\WebSites\TELM\App_Data\Database.mdf; Integrated Security = True"))
            {
                con.Open();
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "INSERT INTO [Leki] (Nazwa, Zalecana_dawka, Jednostka) VALUES (@text1,@text2,@text3)";
                cmd.Parameters.AddWithValue("@text1", TextBox1.Text);
                cmd.Parameters.AddWithValue("@text2", zalecana_dawka);
                cmd.Parameters.AddWithValue("@text3", DropDownList1.Text);
                cmd.ExecuteNonQuery();

                Response.Redirect("Leki.aspx");
            }
        }
        catch (Exception ex)
        {
            var alert = "Wystąpił błąd: " + ex + " Prosimy spróbować ponownie lub/i zgłosić problem do IT";
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + alert + "');", true);
        }
    }

    protected void Dodaj_lek_Click(object sender, EventArgs e)
    {

        addtable.Visible = true;
        Submit_Dodaj_lek.Visible = true;
        TextBox1.Visible = true;
        TextBox2.Visible = true;
        TextBox3.Visible = true;
        TextBox4.Visible = true;
        DropDownList1.Visible = true;
        TextBox5.Visible = true;
        Dodaj_lek.Visible = false;
    }

    protected void Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("Glowna.aspx");
    }
}