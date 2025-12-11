using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static GestorDatos;

namespace Log_in
{
    public partial class Form3 : Form
    {
        private string _generoRecibido;
        private Manager _manager;

        public Form3(string genero)
        {
            InitializeComponent();

            _generoRecibido = genero;

            _manager = new Manager();
        }

        private void Form3_Load(object sender, EventArgs e)
        {
            lblTitulo.Text = "Resultados de: " + _generoRecibido;
            this.Text = _generoRecibido;

            try
            {
                // 2. Usamos el método que creamos antes en tu Manager
                // Ojo: Asegúrate que en tu clase Manager exista el método "ObtenerPorGenero"
                List<Album> listaDiscos = _manager.GetGenero(_generoRecibido);

                // 3. Llenamos la tabla
                dgvResultados.DataSource = listaDiscos;

                // 4. Ajustes visuales (opcional)

            }
            catch (Exception ex)
            {
                MessageBox.Show("Error al cargar Datos:" + ex.Message);
            }
            


        }
    }
}
