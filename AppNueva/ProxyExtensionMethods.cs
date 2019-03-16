using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Threading.Tasks;
using System.Web;

namespace AppNueva
{
    public static class ProxyExtensionMethods
    {
        public static void IncluirCredenciales<TChannel>(this ClientBase<TChannel> proxy) where TChannel : class
        {
            proxy.ClientCredentials.Windows.ClientCredential.UserName = "UsuarioCatalogo";
            proxy.ClientCredentials.Windows.ClientCredential.Password = "CatalogoNT19";
        }


        public static void CerrarConexion<TChannel>(this ClientBase<TChannel> proxy) where TChannel : class
        {
            try
            {
                if (proxy.State == CommunicationState.Faulted)
                { proxy.Abort(); }
                else
                { proxy.Close(); }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

    }
}