using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Log_in
{
    public class Ticket
    {
        public Album Producto { get; }
        public int Cantidad { get; }

        public decimal Subtotal => Producto.Precio * Cantidad;
    }
}
