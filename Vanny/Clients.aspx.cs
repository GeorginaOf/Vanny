using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlServerCe;
using System.Data;
using System.Web.UI.HtmlControls;

namespace Vanny {
    public partial class Clients : System.Web.UI.Page {

        // Local
        public SqlCeConnection con = new SqlCeConnection(@"Data source= " + AppDomain.CurrentDomain.BaseDirectory + "App_Data\\vanny.sdf");
        Login login = new Login();
        int idEmpleat, idEmpresa;

        protected void Page_Load(object sender, EventArgs e) {

            if (!IsPostBack) {
                
                string userName = User.Identity.Name;
                var list = login.obtenerUsuario(userName);

                idEmpleat = list.idEmpleat;
                idEmpresa = list.idEmpresa;
                listaClientes();
            }

        }

        public void listaClientes() {

            // setup dataset
            DataSet dsClientes = new DataSet();
            dsClientes.Tables.Add("Clientes");  // matches our model or could use dbtable attribute to specify
           
            //Cargar lista clientes actuales (dataBaja IS NOT NULL)
            con.Open();

            string query = "select * from client where idEmpresa = @empresa";
            SqlCeCommand command = new SqlCeCommand(query, con);
            command.Parameters.AddWithValue("@empresa", idEmpresa);

            //SqlCeDataReader reader = command.ExecuteResultSet(ResultSetOptions.Scrollable);

            SqlCeDataAdapter adapter = new SqlCeDataAdapter(command);
            adapter.Fill(dsClientes.Tables["Clientes"]);

            con.Close();

            gridClientes.DataSource = dsClientes;
            gridClientes.DataMember = "Clientes";
            gridClientes.DataBind();

        }

        protected void nuevoCliente_Click(object sender, EventArgs e) {



        }



    }
}