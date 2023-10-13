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

namespace DATABASESQLSTAND
{
    public partial class Combustiveis : Form
    {
        public string combustivel = "";
        public Combustiveis()
        {
            InitializeComponent();
            loadData();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            this.Hide();
            Opçoes Opçoes = new Opçoes();
            Opçoes.Show(this);
        }
        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            combustivel = textBox1.Text;
        }

        private void DataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count > 0)
            {
                // Get the selected row
                DataGridViewRow row = dataGridView1.SelectedRows[0];

                // Set the category name in the textBox1 input field
                textBox1.Text = row.Cells["Combustivel"].Value.ToString();
            }
        }
        private void button2_Click(object sender, EventArgs e)
        {
            if (combustivel != "")
            {
                try
                {
                    SqlConnection CN = new SqlConnection("data source = tcp:mednat.ieeta.pt\\SQLSERVER,8101; Initial Catalog = p8g4; uid = p8g4; password = TiagoBerto.2021; TrustServerCertificate=true");
                    CN.Open();
                    SqlCommand cmd = new SqlCommand("dbo.STAND_AdicionarComustivel", CN);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@combustivel", combustivel);
                    cmd.ExecuteNonQuery();
                    CN.Close();
                    MessageBox.Show("Combustivel adicionado com sucesso!");
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro: \r\n" + ex.Message, "ERRO", MessageBoxButtons.OK);
                }
            }
            else
            {
                MessageBox.Show("Por favor preencha o combustíevl!");
            }
            loadData();
        }
        public void loadData()
        {
            SqlConnection CN = new SqlConnection("data source = tcp:mednat.ieeta.pt\\SQLSERVER,8101; Initial Catalog = p8g4; uid = p8g4; password = TiagoBerto.2021; TrustServerCertificate=true");
            CN.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM STAND_ViewCombustiveis", CN);

            DataTable detailsTable = new DataTable();
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(cmd);

            sqlDataAdapter.Fill(detailsTable);
            dataGridView1.DataSource = detailsTable;
            dataGridView1.Visible = true;
            CN.Close();
        }
    }
}
