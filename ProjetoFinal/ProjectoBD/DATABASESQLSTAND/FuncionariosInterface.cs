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
    public partial class FuncionariosInterface : Form
    {
        private string NIF = "";
        private string nomeFuncionario = "";
        private string nomeStand = "";
        private string funcaoFuncionario = "";
        private string endereco = "";
        private string telefone = "";
        private string email = "";
        public FuncionariosInterface()
        {
            InitializeComponent();
            loadData();
            loadStandNames();
            loadFuncaoFuncionario();
            dataGridView1.CellClick += DataGridView1_CellClick;
        }

        private void DataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                // Get the selected row
                DataGridViewRow row = dataGridView1.Rows[e.RowIndex];

                // Extract the category name from the selected row
                textBox2.Text = row.Cells["NIF"].Value.ToString();
                textBox3.Text = row.Cells["Nome_Funcionário"].Value.ToString();
                comboBox2.SelectedItem = row.Cells["Nome_Stand"].Value.ToString();
                comboBox3.SelectedItem = row.Cells["Função"].Value.ToString();
                textBox4.Text = row.Cells["Telefone"].Value.ToString();
                textBox7.Text = row.Cells["Endereço"].Value.ToString();
                textBox5.Text = row.Cells["Email"].Value.ToString();
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Menu menu = new Menu();
            menu.Show(this);
        }

        private void button4_Click_1(object sender, EventArgs e)
        {
            if (NIF != "" && nomeFuncionario != "" && nomeStand != "" && funcaoFuncionario != "" && endereco != "" && telefone != "" && email != "")
            {
                try
                {
                    SqlConnection CN = new SqlConnection("data source = tcp:mednat.ieeta.pt\\SQLSERVER,8101; Initial Catalog = p8g4; uid = p8g4; password = TiagoBerto.2021; TrustServerCertificate=true");
                    CN.Open();
                    SqlCommand cmd = new SqlCommand("dbo.STAND_AdicionarFuncionario", CN);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@NIF", NIF);
                    cmd.Parameters.AddWithValue("@nome", nomeFuncionario);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@telefone", telefone);
                    cmd.Parameters.AddWithValue("@endereco", endereco);
                    cmd.Parameters.AddWithValue("@funcao", funcaoFuncionario);
                    cmd.Parameters.AddWithValue("@stand", nomeStand);
                    cmd.ExecuteNonQuery();
                    CN.Close();
                    MessageBox.Show("Funcionário adicionado com sucesso!");
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

        private void button3_Click(object sender, EventArgs e)
        {
        }

        private void button2_Click(object sender, EventArgs e)
        {
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

        private void textBox2_TextChanged(object sender, EventArgs e)
        {
            NIF = textBox2.Text;
        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {
            nomeFuncionario = textBox3.Text;
        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {
            telefone = textBox4.Text;
        }

        private void textBox5_TextChanged(object sender, EventArgs e)
        {
            email = textBox5.Text;
        }

        private void textBox7_TextChanged(object sender, EventArgs e)
        {
            endereco = textBox7.Text;
        }
        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            nomeStand = comboBox2.SelectedItem.ToString();
        }

        private void comboBox3_SelectedIndexChanged(object sender, EventArgs e)
        {
            funcaoFuncionario = comboBox3.SelectedItem.ToString();
        }

        private void loadStandNames()
        {
            SqlConnection CN = new SqlConnection("data source = tcp:mednat.ieeta.pt\\SQLSERVER,8101; Initial Catalog = p8g4; uid = p8g4; password = TiagoBerto.2021; TrustServerCertificate=true");
            CN.Open();
            SqlCommand cmd = new SqlCommand("SELECT Nome FROM STAND_ViewStands", CN);
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                string standName = reader["Nome"].ToString();
                comboBox2.Items.Add(standName);
            }

            reader.Close();
            CN.Close();
        }

        private void loadFuncaoFuncionario()
        {
            SqlConnection CN = new SqlConnection("data source = tcp:mednat.ieeta.pt\\SQLSERVER,8101; Initial Catalog = p8g4; uid = p8g4; password = TiagoBerto.2021; TrustServerCertificate=true");
            CN.Open();
            SqlCommand cmd = new SqlCommand("SELECT Funcao FROM STAND_ViewFuncaoFuncionarios", CN);
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                string funcao = reader["Funcao"].ToString();
                comboBox3.Items.Add(funcao);
            }

            reader.Close();
            CN.Close();
        }

        public void loadData(string column = "", string searchText = "")
        {
            SqlConnection CN = new SqlConnection("data source = tcp:mednat.ieeta.pt\\SQLSERVER,8101; Initial Catalog = p8g4; uid = p8g4; password = TiagoBerto.2021; TrustServerCertificate=true");
            CN.Open();
            string query = "SELECT * FROM STAND_ViewFuncionarios";

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

        //private void button3_Click_1(object sender, EventArgs e)
        //{
        //    if (NIF != "" && nomeFuncionario != "" && nomeStand != "" && funcaoFuncionario != "" && endereco != "" && telefone != "" && email != "")
        //    {
        //        try
        //        {
        //            SqlConnection CN = new SqlConnection("data source = tcp:mednat.ieeta.pt\\SQLSERVER,8101; Initial Catalog = p8g4; uid = p8g4; password = TiagoBerto.2021; TrustServerCertificate=true");
        //            CN.Open();
        //            SqlCommand cmd = new SqlCommand("dbo.STAND_EliminarFuncionário", CN);
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.Parameters.AddWithValue("@NIF", NIF);
        //            cmd.ExecuteNonQuery();
        //            CN.Close();
        //            MessageBox.Show("Funcionário eliminado com sucesso!");

        //            NIF = "";
        //            nomeFuncionario = "";
        //            nomeStand = "";
        //            funcaoFuncionario = "";
        //            endereco = "";
        //            telefone = "";
        //            email = "";
        //            textBox2.Text = "";
        //            textBox3.Text = "";
        //            textBox4.Text = "";
        //            textBox5.Text = "";
        //            textBox7.Text = "";
        //            comboBox2.SelectedItem = "Stand";
        //            comboBox3.SelectedItem = "Função";
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

        private void button2_Click_1(object sender, EventArgs e)
        {
            if (NIF != "" && nomeFuncionario != "" && nomeStand != "" && funcaoFuncionario != "" && endereco != "" && telefone != "" && email != "")
            {
                try
                {
                    SqlConnection CN = new SqlConnection("data source = tcp:mednat.ieeta.pt\\SQLSERVER,8101; Initial Catalog = p8g4; uid = p8g4; password = TiagoBerto.2021; TrustServerCertificate=true");
                    CN.Open();
                    SqlCommand cmd = new SqlCommand("STAND_AlterarFuncionario", CN);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@NIF", NIF);
                    cmd.Parameters.AddWithValue("@nome", nomeFuncionario);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@telefone", telefone);
                    cmd.Parameters.AddWithValue("@endereco", endereco);
                    cmd.Parameters.AddWithValue("@funcao", funcaoFuncionario);
                    cmd.Parameters.AddWithValue("@stand", nomeStand);
                    cmd.ExecuteNonQuery();
                    CN.Close();
                    MessageBox.Show("Funcionário alterado com sucesso!");
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
    }
}
