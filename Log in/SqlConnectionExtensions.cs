using Microsoft.Data.Sqlite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLiteUtil
{
    public static class SqlConnectionExtensions
    {
        public static int ExecuteNonQuery(this SqliteConnection conn, string commandText)
        {
            var cmd = conn.CreateCommand();
            cmd.CommandText = commandText;
            return cmd.ExecuteNonQuery();
        }

        public static int ExecuteNonQuery(this SqliteConnection conn,
                                          string commandText,
                                          params (string, object)[] parameters)
        {
            var cmd = conn.CreateCommand();
            cmd.CommandText = commandText;

            foreach (var (name, value) in parameters)
            {
                cmd.Parameters.AddWithValue(name, value);
            }

            return cmd.ExecuteNonQuery();
        }

        public static SqliteDataReader ExecuteReader(this SqliteConnection conn,
                                                     string commandText)
        {
            var cmd = conn.CreateCommand();
            cmd.CommandText = commandText;
            return cmd.ExecuteReader();
        }

        public static SqliteDataReader ExecuteReader(this SqliteConnection conn,
                                                     string commandText,
                                                     params (string, object)[] parameters)
        {
            var cmd = conn.CreateCommand();
            cmd.CommandText = commandText;

            foreach (var (name, value) in parameters)
            {
                cmd.Parameters.AddWithValue(name, value);
            }

            return cmd.ExecuteReader();
        }

        public static string GetString(this SqliteDataReader reader, string name)
            => reader.GetString(reader.GetOrdinal(name));

        public static int GetInt(this SqliteDataReader reader, string name)
            => reader.GetInt32(reader.GetOrdinal(name));

        public static double GetDouble(this SqliteDataReader reader, string name)
            => reader.GetDouble(reader.GetOrdinal(name));
    }
}
