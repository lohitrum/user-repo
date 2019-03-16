using System;
using System.Linq;
using System.Web.Script.Services;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI.WebControls;
using System.Collections.Generic;

namespace AppNueva
{
    public partial class Default : System.Web.UI.Page
    {

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string getMezclas()
        {
            ServiciosWCF.AlmHilados.AlmHiladosServiceClient c = new ServiciosWCF.AlmHilados.AlmHiladosServiceClient();
            c.IncluirCredenciales();
            var list = c.Obtener_MezclasInventario();
            c.CerrarConexion();

            return new JavaScriptSerializer().Serialize(list);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string getTitulos()
        {
            ServiciosWCF.AlmHilados.AlmHiladosServiceClient c = new ServiciosWCF.AlmHilados.AlmHiladosServiceClient();
            c.IncluirCredenciales();
            var list = c.Obtener_TitulosInventario();
            c.CerrarConexion();

            return new JavaScriptSerializer().Serialize(list);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string getHilados(string combMezclas, string combTitulos, string codColor)
        {
            String hilado = combMezclas + " " + combTitulos + " " + codColor;
            ServiciosWCF.AlmHilados.AlmHiladosServiceClient c = new ServiciosWCF.AlmHilados.AlmHiladosServiceClient();
            c.IncluirCredenciales();
            var list = c.Buscar_ColoresInventario(hilado.Trim(), 2);
            c.CerrarConexion();

            return new JavaScriptSerializer().Serialize(list);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string Login(string usuario, string clave)
        {
            try
            {
                ServiciosWCF.Catalogo.CatalogoServiceClient c = new ServiciosWCF.Catalogo.CatalogoServiceClient();
                c.IncluirCredenciales();

                var resultado = c.Iniciar_Sesion(usuario, clave);
                c.CerrarConexion();

                Dictionary<string, object> lista_acceso = new Dictionary<string, object>();

                lista_acceso.Add("token", resultado.Token);
                lista_acceso.Add("ac_hilados", resultado.PuedeVerInventario);


                return new JavaScriptSerializer().Serialize(lista_acceso);
            }
            catch (Exception ex)
            {
                return new JavaScriptSerializer().Serialize("{Error : " + ex.Message + "}");
            }
        }
        

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string showCategoria(string token)
        {
            //token = CorregirToken(token);
            ServiciosWCF.Catalogo.CatalogoServiceClient c = new ServiciosWCF.Catalogo.CatalogoServiceClient();
            c.IncluirCredenciales();

            var list = c.Obtener_Categorias(token).ToList();

            c.CerrarConexion();

            return new JavaScriptSerializer().Serialize(list);
        }
        private static string CorregirToken(string token)
        {
            string res = token.Replace("\"", "");
            return res;
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static string showProductos(int id, string token)
        {            
            ServiciosWCF.Catalogo.CatalogoServiceClient c = new ServiciosWCF.Catalogo.CatalogoServiceClient();
            c.IncluirCredenciales();

            var list = c.Obtener_ArticulosPorCategoria(id, token).ToList();
            c.CerrarConexion();

            return new JavaScriptSerializer().Serialize(list);
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static string showProdsByColor(int id, string token)
        {            
            ServiciosWCF.Catalogo.CatalogoServiceClient c = new ServiciosWCF.Catalogo.CatalogoServiceClient();
            c.IncluirCredenciales();

            var list = c.Obtener_ColoresPorArticulo(id, token).ToList();
            c.CerrarConexion();

            return new JavaScriptSerializer().Serialize(list);
        }




        [WebMethod]
        // [ScriptMethod(UseHttpGet = true)]
        public static string enviarMsj(string name, string email, string descrip)
        {
            ServiciosWCF.Mensajes.MensajesWebServiceClient c = new ServiciosWCF.Mensajes.MensajesWebServiceClient();
            c.IncluirCredenciales();
            c.Nuevo_MensajeWeb(name, email, descrip);
            c.CerrarConexion();

            return "Mensaje Enviado.";
        }
    }


}

