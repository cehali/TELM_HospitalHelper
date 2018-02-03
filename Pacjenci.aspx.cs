using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

public partial class Pacjenci : System.Web.UI.Page
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
                cmd.CommandText = "SELECT * FROM Pacjenci WHERE Nazwisko LIKE '%' + @Nazwisko + '%' OR Imie LIKE '%' + @Imie + '%'";
                cmd.Parameters.AddWithValue("@Nazwisko", txtSearch.Text.Trim());
                cmd.Parameters.AddWithValue("@Imie", txtSearch.Text.Trim());
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
        catch(Exception ex)
        {
            var alert = "Wystąpił błąd: " + ex + " Prosimy spróbować ponownie lub/i zgłosić problem do IT";
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + alert + "');", true);
        }
    }

    protected void Submit_Dodaj_pacjenta_Click(object sender, EventArgs e)
    {
        if (String.IsNullOrEmpty(TextBox1.Text) || String.IsNullOrEmpty(TextBox2.Text) || String.IsNullOrEmpty(TextBox6.Text))
        {
            var alert = "Nie zostały wypełnione wszystkie pola";
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + alert + "');", true);
        }
        try
        {
            using (SqlConnection con = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = C:\Users\Cezary\Documents\Visual Studio 2015\WebSites\TELM\App_Data\Database.mdf; Integrated Security = True"))
            {
                con.Open();
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "INSERT INTO [Pacjenci] (Imie, Nazwisko, Wiek, Plec) VALUES (@text1,@text2,@text3,@text4)";
                cmd.Parameters.AddWithValue("@text1", TextBox1.Text);
                cmd.Parameters.AddWithValue("@text2", TextBox2.Text);
                cmd.Parameters.AddWithValue("@text3", TextBox6.Text);
                cmd.Parameters.AddWithValue("@text4", DropDownList1.Text);
                cmd.ExecuteNonQuery();
            }
        }
        catch(Exception ex)
        {
            var alert = "Wystąpił błąd: " + ex + " Prosimy spróbować ponownie lub/i zgłosić problem do IT";
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + alert + "');", true);
        }

        Response.Redirect("Pacjenci.aspx");
    }

    protected void Dodaj_pacjenta_Click(object sender, EventArgs e)
    {
        addpat.Visible = true;
        Submit_Dodaj_pacjenta.Visible = true;
        TextBox1.Visible = true;
        TextBox2.Visible = true;
        TextBox3.Visible = true;
        TextBox4.Visible = true;
        TextBox5.Visible = true;
        TextBox6.Visible = true;
        TextBox7.Visible = true;
        DropDownList1.Visible = true;
        Dodaj_pacjenta.Visible = false;
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "Select")
            {
                int k;
                int i;
                List<string> imiona = new List<string>();
                List<string> nazwiska = new List<string>();
                List<string> nazwy = new List<string>();
                List<int> dawki = new List<int>();
                List<string> jednostki = new List<string>();
                List<DateTime> daty1 = new List<DateTime>();
                List<string> daty2 = new List<string>();
                List<string> lekarze = new List<string>();

                GridView1.Visible = false;
                GridView2.Visible = true;
                Dodaj_recepte.Visible = true;
                Submit_Dodaj_pacjenta.Visible = false;
                Back1.Visible = false;
                Back2.Visible = true;
                TextBox1.Visible = false;
                TextBox2.Visible = false;
                TextBox3.Visible = false;
                TextBox4.Visible = false;
                TextBox5.Visible = false;
                TextBox6.Visible = false;
                TextBox7.Visible = false;
                addpat.Visible = false;
                txtSearch.Visible = false;
                txtSearch_btn.Visible = false;
                DropDownList1.Visible = false;
                Dodaj_pacjenta.Visible = false;

                Int16 num = Convert.ToInt16(e.CommandArgument);
                using (SqlConnection con = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = C:\Users\Cezary\Documents\Visual Studio 2015\WebSites\TELM\App_Data\Database.mdf; Integrated Security = True"))
                {
                    SqlCommand cmd = con.CreateCommand();
                    cmd.CommandType = CommandType.Text;

                    GridViewRow row = GridView1.SelectedRow;

                    cmd.CommandText = "SELECT Pacjenci.Imie, Pacjenci.Nazwisko, Leki.Nazwa, Recepty.Dawka, Leki.Jednostka, Recepty.Data, Recepty.Lekarz FROM Recepty inner join Pacjenci on Pacjenci.Id = Recepty.Id_pacjenta inner join Leki on Leki.Id = Recepty.Id_leku where Recepty.Id_pacjenta = @id";
                    cmd.Parameters.AddWithValue("@id", GridView1.Rows[num].Cells[1].Text);
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        imiona.Add(reader.GetString(0));
                        nazwiska.Add(reader.GetString(1));
                        nazwy.Add(reader.GetString(2));
                        dawki.Add(reader.GetInt32(3));
                        jednostki.Add(reader.GetString(4));
                        daty1.Add(reader.GetDateTime(5));
                        lekarze.Add(reader.GetString(6));
                    }

                    DataTable tabela = new DataTable();
                    tabela.Columns.Add("Imie");
                    tabela.Columns.Add("Nazwisko");
                    tabela.Columns.Add("Nazwa leku");
                    tabela.Columns.Add("Dawka");
                    tabela.Columns.Add("Jednostka");
                    tabela.Columns.Add("Data");
                    tabela.Columns.Add("Lekarz");

                    for (i = 0; i < daty1.Count; i++)
                    {
                        daty2.Add(daty1[i].ToString("dd/MM/yyyy"));
                    }

                    for (k = 0; k < imiona.Count; k++)
                    {
                        tabela.Rows.Add(imiona[k], nazwiska[k], nazwy[k], dawki[k], jednostki[k], daty2[k], lekarze[k]);
                    }

                    GridView2.DataSource = tabela;
                    GridView2.DataBind();

                    reader.Close();
                }
            }
        }
        catch(Exception ex)
        {
            var alert = "Wystąpił błąd: " + ex + " Prosimy spróbować ponownie lub/i zgłosić problem do IT";
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + alert + "');", true);
        }
    }

    protected void Back1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Glowna.aspx");
    }
    protected void Back2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Pacjenci.aspx");
    }

    protected void Dodaj_recepte_Click(object sender, EventArgs e)
    {
        Response.Redirect("Recepty.aspx");
    }
}