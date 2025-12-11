using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Log_in
{
    public class Album
    {
        public int Id { get; }
        public string Titulo { get; }
        public int ArtistaId { get; } 
        public string NombreArtista { get; } 
        public string Genero { get; }
        public string Formato { get; }
        public decimal Precio { get; }

        public Album(int id, string titulo, int artistaId, string nombreArtista, string genero, string formato, decimal precio)
        {
            this.Id = id;
            this.Titulo = titulo;
            this.ArtistaId = artistaId;
            this.NombreArtista = nombreArtista;
            this.Genero = genero;
            this.Formato = formato;
            this.Precio = precio;
        }
    }
}