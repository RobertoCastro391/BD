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
    public partial class ClientesInterface : Form
    {
        private string NIF = "";
        private string nome = "";
        private string endereco = "";
        private string telefone = "";
        private string email = "";

        public ClientesInterface()
        {
            InitializeComponent();
            loadData();
            dataGridView1.CellClick += DataGridView1_CellClick;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Menu menu = new Menu();
            menu.Show(this);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (nome != "" && endereco != "" && telefone != "" && email != "")
            {
                try
                {
                    SqlConnection CN = new SqlConnection("data source = tcp:mednat.ieeta.pt\\SQLSERVER,8101; Initial Catalog = p8g4; uid = p8g4; password = TiagoBerto.2021; TrustServerCertificate=true");
                    CN.Open();
                    SqlCommand cmd = new SqlCommand("STAND_AlterarCliente", CN);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@NIF", NIF);
                    cmd.Parameters.AddWithValue("@nome", nome);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@telefone", telefone);
                    cmd.Parameters.AddWithValue("@endereco", endereco);
                    cmd.ExecuteNonQuery();
                    CN.Close();
                    MessageBox.Show("Cliente alterado com sucesso!");
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

        private void button4_Click(object sender, EventArgs e)
        {
            if (NIF != "" && nome != "" && endereco != "" && telefone != "" && email != "")
            {
                try
                {
                    SqlConnection CN = new SqlConnection("data source = tcp:mednat.ieeta.pt\\SQLSERVER,8101; Initial Catalog = p8g4; uid = p8g4; password = TiagoBerto.2021; TrustServerCertificate=true");
                    CN.Open();
                    SqlCommand cmd = new SqlCommand("dbo.STAND_AdicionarCliente", CN);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@NIF", NIF);
                    cmd.Parameters.AddWithValue("@nome", nome);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@telefone", telefone);
                    cmd.Parameters.AddWithValue("@endereco", endereco);
                    cmd.ExecuteNonQuery();
                    CN.Close();
                    MessageBox.Show("Cliente adicionado com sucesso!");
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

        //private void button3_Click(object sender, EventArgs e)
        //{
        //    if (NIF != "" && nome != "" && endereco != "" && telefone != "" && email != "")
        //    {
        //        try
        //        {
        //            SqlConnection CN = new SqlConnection("data source = tcp:mednat.ieeta.pt\\SQLSERVER,8101; Initial Catalog = p8g4; uid = p8g4; password = TiagoBerto.2021; TrustServerCertificate=true");
        //            CN.Open();
        //            SqlCommand cmd = new SqlCommand("dbo.STAND_EliminarCliente", CN);
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.Parameters.AddWithValue("@NIF", NIF);
        //            cmd.ExecuteNonQuery();
        //            CN.Close();
        //            MessageBox.Show("Cliente eliminado com sucesso!");

        //            NIF = "";
        //            nome = "";
        //            endereco = "";
        //            telefone = "";
        //            email = "";
        //            textBox2.Text = "";
        //            textBox3.Text = "";
        //            textBox4.Text = "";
        //            textBox5.Text = "";
        //            textBox6.Text = "";
        //        }
        //        catch (Exception ex)
        //        {
        //            MessageBox.Show("Erro: \r\n" + ex.Message, "ERRO", MessageBoxButtons.OK);
        //        }
        //    }
        //    else
        //    {
        //        MessageBox.Show("Por favor não deixe opções em branco!");
        //    }
        //    loadData();
        //}

        private void DataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                // Get the selected row
                DataGridViewRow row = dataGridView1.Rows[e.RowIndex];

                // Extract the category name from the selected row
                textBox2.Text = row.Cells["NIF"].Value.ToString();
                textBox3.Text = row.Cells["Nome"].Value.ToString();
                textBox4.Text = row.Cells["Email"].Value.ToString();
                textBox5.Text = row.Cells["Telefone"].Value.ToString();
                textBox6.Text = row.Cells["Endereço"].Value.ToString();

            }
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {
            NIF = textBox2.Text;
        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {
            nome = textBox3.Text;
        }

        private void textBox5_TextChanged(object sender, EventArgs e)
        {
            telefone = textBox5.Text;
        }
        private void textBox4_TextChanged(object sender, EventArgs e)
        {
            email = textBox4.Text;
        }
        private void textBox6_TextChanged(object sender, EventArgs e)
        {
            endereco = textBox6.Text;
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string searchColumn = comboBox1.SelectedItem.ToString();
                string searchText = textBox1.Text;
                loadData(searchColumn, searchText);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Erro: \r\n" + ex.Message, "ERRO", MessageBoxButtons.OK);

            }
        }
        public void loadData(string column = "", string searchText = "")
        {
            SqlConnection CN = new SqlConnection("data source = tcp:mednat.ieeta.pt\\SQLSERVER,8101; Initial Catalog = p8g4; uid = p8g4; password = TiagoBerto.2021; TrustServerCertificate=true");
            CN.Open();
            string query = "SELECT * FROM STAND_ViewClientes";

            if (!string.IsNullOrEmpty(column) && !string.IsNullOrEmpty(searchText))
            {
                query += " WHERE " + column + " LIKE '%" + searchText + "%'";
            }

            SqlCommand cmd = new SqlCommand(query, CN);

            DataTable detailsTable = new DataTable();
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(cmd);

            sqlDataAdapter.Fill(detailsTable);
            dataGridView1.DataSource = detailsTable;
            dataGridView1.Visible = true;
            CN.Close();
        }
    }
}
