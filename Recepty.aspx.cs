using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Recepty : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["New"] == null)
        {
            Response.Redirect("Logowanie.aspx");
        }
    }

    protected void Submit_Dodaj_recepte_Click(object sender, EventArgs e)
    {
        if (String.IsNullOrEmpty(DropDownList1.Text) || String.IsNullOrEmpty(DropDownList2.Text) || String.IsNullOrEmpty(DropDownList3.Text) || String.IsNullOrEmpty(TextBox8.Text))
        {
            var alert = "Nie zostały wypełnione wszystkie pola";
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + alert + "');", true);
        }
        else
        {
            try
            {
                List<int> id_pacjenci = new List<int>();
                List<string> imiona = new List<string>();
                List<string> nazwiska = new List<string>();
                List<int> id_leki = new List<int>();
                List<string> nazwy = new List<string>();
                List<int> zalecane_dawki = new List<int>();
                List<int> przyjete_dawki = new List<int>();
                int dawka = int.Parse(TextBox8.Text);

                if (dawka <= 0)
                {
                    var alert = "Dawka leku nie może być równa lub mniejsza od 0";
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + alert + "');", true);
                }

                using (SqlConnection con = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = C:\Users\Cezary\Documents\Visual Studio 2015\WebSites\TELM\App_Data\Database.mdf; Integrated Security = True"))
                {
                    SqlCommand cmd1 = con.CreateCommand();
                    cmd1.CommandType = CommandType.Text;
                    cmd1.CommandText = "SELECT * from Pacjenci";
                    con.Open();
                    SqlDataReader reader1 = cmd1.ExecuteReader();

                    while (reader1.Read())
                    {
                        id_pacjenci.Add(reader1.GetInt32(0));
                        imiona.Add(reader1.GetString(1));
                        nazwiska.Add(reader1.GetString(2));
                    }
                    reader1.Close();

                    SqlCommand cmd2 = con.CreateCommand();
                    cmd2.CommandType = CommandType.Text;
                    cmd2.CommandText = "SELECT * from Leki";
                    SqlDataReader reader2 = cmd2.ExecuteReader();

                    while (reader2.Read())
                    {
                        id_leki.Add(reader2.GetInt32(0));
                        nazwy.Add(reader2.GetString(1));
                        zalecane_dawki.Add(reader2.GetInt32(2));
                    }
                    reader2.Close();

                    int temp = 0;
                    for (int i = 0; i < imiona.Count; i++)
                    {              
                        if (DropDownList1.Text == imiona[i] && DropDownList2.Text == nazwiska[i])
                        {
                            for (int k = 0; k < nazwy.Count; k++)
                            {
                                if (DropDownList3.Text == nazwy[k])
                                {
                                    SqlCommand cmd3 = con.CreateCommand();
                                    cmd3.CommandType = CommandType.Text;
                                    cmd3.CommandText = "SELECT Dawka from Recepty where Id_leku = @lek and Id_pacjenta = @pacjent";
                                    cmd3.Parameters.AddWithValue("@lek", id_leki[k]);
                                    cmd3.Parameters.AddWithValue("@pacjent", id_pacjenci[i]);
                                    SqlDataReader reader3 = cmd3.ExecuteReader();

                                    while (reader3.Read())
                                    {
                                        przyjete_dawki.Add(reader3.GetInt32(0));
                                    }
                                    reader3.Close();

                                    if ((przyjete_dawki.Sum() + dawka) > zalecane_dawki[k])
                                    {
                                        var alert1 = "Przekroczona dawkę " + nazwy[k] + " dla " + imiona[i] + " " + nazwiska[i];
                                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + alert1 + "');", true);
                                    }
                                    else
                                    {
                                        temp = 1; 
                                        var doctor = Session["New"].ToString();
                                        SqlCommand cmd4 = con.CreateCommand();
                                        cmd4.CommandType = CommandType.Text;
                                        cmd4.CommandText = "INSERT INTO Recepty (Id_pacjenta, Id_leku, Dawka, Data, Lekarz) VALUES (@text1,@text2,@text3,@text4,@text5)";
                                        cmd4.Parameters.AddWithValue("@text1", id_pacjenci[i]);
                                        cmd4.Parameters.AddWithValue("@text2", id_leki[k]);
                                        cmd4.Parameters.AddWithValue("@text3", dawka);
                                        cmd4.Parameters.AddWithValue("@text4", DateTime.Now);
                                        cmd4.Parameters.AddWithValue("@text5", doctor);
                                        cmd4.ExecuteNonQuery();

                                        ScriptManager.RegisterStartupScript(this, this.GetType(),
                                        "alert",
                                        "alert('Recepta została dodana');window.location ='Pacjenci.aspx';", true);
                                    }
                                }
                            }
                        }
                    }
                    if (temp == 0)
                    {
                        var alert = "Podany pacjent nie istnieje";
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + alert + "');", true);
                    }
                }
            }
            catch (Exception ex)
            {
                var alert = "Wystąpił błąd: " + ex + " Prosimy spróbować ponownie lub/i zgłosić problem do IT";
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + alert + "');", true);
            }
        }
    }
    protected void Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("Pacjenci.aspx");
    }
}