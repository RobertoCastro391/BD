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
    public partial class Registo : Form
    {
        public Registo()
        {
            InitializeComponent();
        }

        private void Voltar_Click(object sender, EventArgs e)
        {
            this.Hide();
            Menu menu = new Menu();
            menu.Show(this);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            RegistoCompra registoCompra = new RegistoCompra();
            registoCompra.Show(this);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            RegistoVenda registoVenda = new RegistoVenda();
            registoVenda.Show(this);
        }

        private void button3_Click(object sender, EventArgs e)
        {
            this.Hide();
            RegistoRetoma registoRetoma = new RegistoRetoma();
            registoRetoma.Show(this);
        }
    }
}
