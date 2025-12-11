using Log_in;
using Microsoft.Data.Sqlite;
using SQLiteUtil;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

public class GestorDatos
{
    public class Manager
    {
        private SqliteConnection conn;

        public Manager()
        {
            conn = new SqliteConnection("Data Source=PerroMalish.db");
            conn.Open();
        }

        public List<Album> GetCatalogo(string search = "")
        {
            var albumes = new List<Album>();

            string query = "SELECT A.Id, A.Titulo, A.Artista_Id, Art.Nombre AS Artista, " +
                           "G.Descripcion AS Genero, F.Descripcion AS Formato, F.Costo AS Precio " +
                           "FROM Albumes A " +
                           "INNER JOIN Artistas Art ON (A.Artista_Id = Art.Id) " +
                           "INNER JOIN Generos G ON (A.Genero_Id = G.Id) " +
                           "INNER JOIN Formatos F ON (A.Formato_Id = F.Id) " +
                           (search == "" ? "" : $"WHERE A.Titulo LIKE '%{search}%' OR Art.Nombre LIKE '%{search}%' ") +
                           "ORDER BY A.Titulo;";

            using (var cmd = new SqliteCommand(query, conn))
            {
                using (var rs = cmd.ExecuteReader())
                {
                    while (rs.Read())
                    {

                        var album = new Album(
                            Convert.ToInt32(rs["Id"]),
                            rs["Titulo"].ToString(),
                            Convert.ToInt32(rs["Artista_Id"]),
                            rs["Artista"].ToString(),
                            rs["Genero"].ToString(),
                            rs["Formato"].ToString(),
                            Convert.ToDecimal(rs["Precio"])
                        );

                        albumes.Add(album);
                    }
                }
            }

            return albumes;
        }

        public List<Album> GetGenero(string generoRecibido)
        {
            throw new NotImplementedException();
        }
    }
}

