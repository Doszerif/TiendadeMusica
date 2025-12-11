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
    public partial class PerroMalix : Form
    {
        public PerroMalix()
        {
            InitializeComponent();
        }


        private void btnmusicaenespanol_Click(object sender, EventArgs e)
        {

            Form3 ventanaResultados = new Form3("Musica en Español");
            ventanaResultados.ShowDialog();
        }

        private void btnrockalternativo_Click(object sender, EventArgs e)
        {
            Form3 ventanaResultados = new Form3("Rock Alternativo");
            ventanaResultados.ShowDialog();
        }

        private void btnpop_Click(object sender, EventArgs e)
        {
            Form3 ventanaResultados = new Form3("Pop");
            ventanaResultados.ShowDialog();
        }

        private void btnjazzfusion_Click(object sender, EventArgs e)
        {
            Form3 ventanaResultados = new Form3("Jazz Fusion");
            ventanaResultados.ShowDialog();
        }

        private void btnindiepop_Click(object sender, EventArgs e)
        {
            Form3 ventanaResultados = new Form3("Indie Pop");
            ventanaResultados.ShowDialog();
        }


    }
}
