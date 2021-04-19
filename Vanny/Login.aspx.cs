using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Security;
using System.Data.SqlServerCe;

namespace Vanny {

    public struct Usuario {
        public int idEmpleat;
        public int idEmpresa;
        public string usu;
        public string nom;
        public string email;
    }

    public partial class Login : System.Web.UI.Page {

        // SQL Server Express
        //public SqlConnection con = new SqlConnection("Data Source=ALEX-PC\\SQLSERVERGOF;Initial Catalog=vannyBD;Integrated Security=True");

        // Local
        public SqlCeConnection con = new SqlCeConnection(@"Data source= " + AppDomain.CurrentDomain.BaseDirectory + "App_Data\\vanny.sdf");

        protected void Page_Load(object sender, EventArgs e) {

            //Primero verificamos si el usuario está autenticado usando la propiedad IsAuthenticated. 
            //Si el usuario no está autenticado, se le redirige de nuevo a la página de inicio de sesión utilizando 
            //el método RedirectToLoginPage de FormsAuthentication.

            if (this.Page.User.Identity.IsAuthenticated) {
                Response.Redirect(FormsAuthentication.DefaultUrl);
            }

            // Añado pista en los textbox de login
            txtbUser.Attributes.Add("placeholder", "Usuario");
            txtbPass.Attributes.Add("placeholder", "Contraseña");
        }

        protected void btnLogin_Click(object sender, EventArgs e) {

            con.Open();

            string query = "select * from empleat where usu = @usuario and psw = @password and dataBaixa IS NOT NULL";
            SqlCeCommand command = new SqlCeCommand(query, con);
            command.Parameters.AddWithValue("@usuario", txtbUser.Text);
            command.Parameters.AddWithValue("@password", txtbPass.Text);

            //SqlCeDataReader reader = command.ExecuteReader();
            //SqlCeDataReader reader = command.ExecuteResultSet(ResultSetOptions.Scrollable);

            SqlCeResultSet results = command.ExecuteResultSet(ResultSetOptions.Scrollable);

            if (results.HasRows) {  //Si el usuario existe lo redireccionamos a la pagina Home

                results.ReadFirst();
                Session["idEmpleat"] = results.GetInt32(0);
                Session["idEmpresa"] = results.GetInt32(1);

                FormsAuthentication.RedirectFromLoginPage(txtbUser.Text, chkRecuerda.Checked);

            } else { //Si el usuario no existe

                lblMensaje.Text = "Usuario y/o contraseña incorrectos.";
                dvMensaje.Visible = true;

                txtbUser.Text = "";
                txtbPass.Text = "";
                txtbUser.Focus();
            }
            con.Close();
        }


        public Usuario obtenerUsuario(string userName) {

            con.Open();

            Usuario usuario = new Usuario();

            string query = "select * from empleat where usu = @user";
            SqlCeCommand command = new SqlCeCommand(query, con);
            command.Parameters.AddWithValue("@user", userName);

            SqlCeResultSet results = command.ExecuteResultSet(ResultSetOptions.Scrollable);

            if (results.HasRows) {

                results.ReadFirst();
                usuario.idEmpleat = results.GetInt32(0);
                usuario.idEmpresa = results.GetInt32(1);
                usuario.usu = results.GetString(2);
                usuario.nom = results.GetString(4);
                usuario.email = results.GetString(5);

                return usuario;
            }

            con.Close();

            return usuario;

        }


    }
}