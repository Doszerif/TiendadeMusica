using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Log_in
{
    public class Vendedor
    {
        public int Usuario { get; }
        public string Nombre { get; }
        public string Apellido { get; }
        public string Password { get; }
        public int Ventas { get; }

        public Vendedor(int usuario, string nombre, string apellido, string password, int ventas)
        {
            Usuario = usuario;
            Nombre = nombre;
            Password = password;
            Ventas = ventas;
        }

        public Vendedor(int usuario)
        {
            Usuario = usuario;
        }
    }
}
