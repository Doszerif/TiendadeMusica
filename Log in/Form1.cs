using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Log_in
{
    public partial class Form1 : Form
    {
        List<Vendedor> vendedores;
        public Form1()
        {
            InitializeComponent();

            // Crear lista de vendedores
            vendedores = new List<Vendedor>()
        {
            new Vendedor(1001, "Mario", "Lopez", "1234", 10),
            new Vendedor(1002, "Ana", "Perez", "abcd", 20),
            new Vendedor(2001, "Juan", "Diaz", "pass", 5)
        };
        }


        private void txtUsuario_TextChanged(object sender, EventArgs e)
        {
            btnLogIn.Enabled = txtUsuario.Text.Trim().Length > 0 &&
                                   txtPassword.Text.Trim().Length > 0;
        }

        private void txtPassword_TextChanged(object sender, EventArgs e)
        {
            btnLogIn.Enabled = txtUsuario.Text.Trim().Length > 0 &&
                                  txtPassword.Text.Trim().Length > 0;
        }

        private void btnLogIn_Click(object sender, EventArgs e)
        {
            int usuarioIngresado;

            // Validar que usuario sea número
            if (!int.TryParse(txtUsuario.Text, out usuarioIngresado))
            {
                MessageBox.Show("El usuario debe ser un número.");
                return;
            }

            string passIngresado = txtPassword.Text;

            // Buscar usuario en la lista
            var vendedor = vendedores.FirstOrDefault(v =>
                v.Usuario == usuarioIngresado && v.Password == passIngresado);

            if (vendedor != null)
            {
                // Login correcto → abrir Form2
                PerroMalix menu = new PerroMalix();
                menu.Show();
                this.Hide();   // oculta el Form1
            }
            else
            {
                MessageBox.Show("Usuario o contraseña incorrectos");
            }
        }


        private void Form1_Load(object sender, EventArgs e)
        {

        }
    }
}
