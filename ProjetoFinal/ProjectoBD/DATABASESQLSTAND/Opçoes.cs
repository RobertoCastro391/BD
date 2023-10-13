using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DATABASESQLSTAND
{
    public partial class Opçoes : Form
    {
        public Opçoes()
        {
            InitializeComponent();
        }

        private void Voltar_Click(object sender, EventArgs e)
        {
            this.Hide();
            Menu menu = new Menu();
            menu.Show(this);
        }

        private void button3_Click(object sender, EventArgs e)
        {
            this.Hide();
            CategoriasVeiculos categoriasVeiculos = new CategoriasVeiculos();
            categoriasVeiculos.Show(this);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            CoresVeiculos corVeiculos = new CoresVeiculos();
            corVeiculos.Show(this);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            MarcasVeiculos marcasVeiculos = new MarcasVeiculos();
            marcasVeiculos.Show(this);
        }

        private void STANDS_Click(object sender, EventArgs e)
        {
            this.Hide();
            FuncaoFuncionario funcaoFuncionario = new FuncaoFuncionario();
            funcaoFuncionario.Show(this);
        }

        private void button4_Click(object sender, EventArgs e)
        {
            this.Hide();
            Combustiveis combustiveis = new Combustiveis();
            combustiveis.Show(this);
        }
    }
}
