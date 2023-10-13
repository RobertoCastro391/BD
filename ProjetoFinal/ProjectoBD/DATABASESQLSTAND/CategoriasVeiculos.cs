using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace DATABASESQLSTAND
{
    public partial class CategoriasVeiculos : Form
    {
        private string Categoria_Veiculos = "";
        public CategoriasVeiculos()
        {
            InitializeComponent();
            loadData();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Opçoes opçoes = new Opçoes();
            opçoes.Show(this);
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            Categoria_Veiculos = textBox1.Text;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (Categoria_Veiculos != "")
            {
                try
                {
                    SqlConnection CN = new SqlConnection("data source = tcp:mednat.ieeta.pt\\SQLSERVER,8101; Initial Catalog = p8g4; uid = p8g4; password = TiagoBerto.2021; TrustServerCertificate=true");
                    CN.Open();
                    SqlCommand cmd = new SqlCommand("dbo.STAND_AdicionarCategoriarVeiculo", CN);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@categoria", Categoria_Veiculos);
                    cmd.ExecuteNonQuery();
                    CN.Close();
                    MessageBox.Show("Categória adicionada com sucesso!");
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro: \r\n" + ex.Message, "ERRO", MessageBoxButtons.OK);
                }
            }
            else
            {
                MessageBox.Show("Por favor não deixe opções em branco!");
            }
            loadData();
        }

        public void loadData()
        {
            SqlConnection CN = new SqlConnection("data source = tcp:mednat.ieeta.pt\\SQLSERVER,8101; Initial Catalog = p8g4; uid = p8g4; password = TiagoBerto.2021; TrustServerCertificate=true");
            CN.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM STAND_ViewCategoriaVeiculos", CN);

            DataTable detailsTable = new DataTable();
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(cmd);

            sqlDataAdapter.Fill(detailsTable);
            dataGridView1.DataSource = detailsTable;
            dataGridView1.Visible = true;
            CN.Close();
        }

        private void DataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count > 0)
            {
                // Get the selected row
                DataGridViewRow row = dataGridView1.SelectedRows[0];

                // Extract the category name from the selected row
                string categoria = row.Cells["Categoria"].Value.ToString();

                // Set the category name in the textBox1 input field
                textBox1.Text = categoria;
            }
        }
    }
}
