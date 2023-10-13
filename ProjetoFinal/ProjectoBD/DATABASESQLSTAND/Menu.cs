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
    public partial class Menu : Form
    {
        public Menu()
        {
            InitializeComponent();
        }

        private void STANDS_Click(object sender, EventArgs e)
        {
            this.Hide();
            StandsInterface stands = new StandsInterface();
            stands.Show(this);
        }

        private void CLIENTES_Click(object sender, EventArgs e)
        {
            this.Hide();
            ClientesInterface clientes = new ClientesInterface();
            clientes.Show(this);
        }

        private void FUNCIONÁRIOS_Click(object sender, EventArgs e)
        {
            this.Hide();
            FuncionariosInterface funcionarios = new FuncionariosInterface();
            funcionarios.Show(this);
        }

        private void FORNECEDORES_Click(object sender, EventArgs e)
        {
            this.Hide();
            FornecedoresInterface fornecedores = new FornecedoresInterface();
            fornecedores.Show(this);

        }

        private void REGISTO_Click(object sender, EventArgs e)
        {
            this.Hide();
            Registo registo = new Registo();
            registo.Show(this);

        }

        private void OPÇÕES_Click(object sender, EventArgs e)
        {
            this.Hide();
            Opçoes opcoes = new Opçoes();
            opcoes.Show(this);
        }

        private void VEICULOS_Click(object sender, EventArgs e)
        {
            this.Hide();
            VeiculosInterface veiculos = new VeiculosInterface();
            veiculos.Show(this);

        }
    }
}
