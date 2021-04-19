using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Vanny {
    public partial class Home : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            
            //Primero verificamos si el usuario está autenticado usando la propiedad IsAuthenticated. 
            //Si el usuario se autentica, se le redirige directamente a la página de inicio, que se configura como DefaultUrl 
            //en la configuración de autenticación de formularios del archivo Web.Config.

            if (!this.Page.User.Identity.IsAuthenticated) {
                FormsAuthentication.RedirectToLoginPage();
            }
        }
    }
}