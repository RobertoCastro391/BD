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
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;

namespace DATABASESQLSTAND
{
    public partial class RegistoCompra : Form
    {
        private string matricula = "";
        private string marca = "";
        private string modelo = "";
        private string cor = "";
        private string cilindrada = "";
        private string ano = "";
        private string quilometros = "";
        private string combustivel = "";
        private string categoria = "";
        private string preco_anunciado = "";
        private string preco_compra = "";
        private string nomeStand = "";
        private string obs = "";
        private string nif_fornecedor = "";
        private string data_movimento = "";

        public RegistoCompra()
        {
            InitializeComponent();
            loadMarcas();
            loadCores();
            loadCombustiveis();
            loadCategorias();
            loadStandNames();
        }

        private void Voltar_Click(object sender, EventArgs e)
        {
            this.Hide();
            Registo registo = new Registo();
            registo.Show(this);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            VeiculosInterface veiculosInterface = new VeiculosInterface();
            veiculosInterface.Show(this);
        }
        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {
            data_movimento = dateTimePicker1.Value.ToString("yyyy/MM/dd");
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            preco_compra = textBox1.Text;
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {
            matricula = textBox2.Text;
        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {
            modelo = textBox4.Text;
        }

        private void textBox6_TextChanged(object sender, EventArgs e)
        {
            ano = textBox6.Text;
        }

        private void textBox7_TextChanged(object sender, EventArgs e)
        {
            quilometros = textBox7.Text;
        }

        private void textBox10_TextChanged(object sender, EventArgs e)
        {
            cilindrada = textBox10.Text;
        }

        private void textBox11_TextChanged(object sender, EventArgs e)
        {
            preco_anunciado = textBox11.Text;
        }
        private void textBox13_TextChanged(object sender, EventArgs e)
        {
            obs = textBox13.Text;
        }

        private void textBox17_TextChanged(object sender, EventArgs e)
        {
            nif_fornecedor = textBox17.Text;
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            marca = comboBox1.SelectedItem.ToString();
        }

        private void comboBox4_SelectedIndexChanged(object sender, EventArgs e)
        {
            categoria = comboBox4.SelectedItem.ToString();
        }

        private void comboBox3_SelectedIndexChanged(object sender, EventArgs e)
        {
            cor = comboBox3.SelectedItem.ToString();
        }

        private void comboBox5_SelectedIndexChanged(object sender, EventArgs e)
        {
            combustivel = comboBox5.SelectedItem.ToString();
        }

        private void comboBox6_SelectedIndexChanged(object sender, EventArgs e)
        {
            nomeStand = comboBox6.SelectedItem.ToString();
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
                comboBox6.Items.Add(standName);
            }

            reader.Close();
            CN.Close();
        }

        public void loadMarcas()
        {
            SqlConnection CN = new SqlConnection("data source = tcp:mednat.ieeta.pt\\SQLSERVER,8101; Initial Catalog = p8g4; uid = p8g4; password = TiagoBerto.2021; TrustServerCertificate=true");
            CN.Open();
            SqlCommand cmd = new SqlCommand("SELECT Marca FROM STAND_ViewMarcasVeiculos", CN);
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                string standName = reader["Marca"].ToString();
                comboBox1.Items.Add(standName);
            }

            reader.Close();
            CN.Close();
        }

        public void loadCores()
        {
            SqlConnection CN = new SqlConnection("data source = tcp:mednat.ieeta.pt\\SQLSERVER,8101; Initial Catalog = p8g4; uid = p8g4; password = TiagoBerto.2021; TrustServerCertificate=true");
            CN.Open();
            SqlCommand cmd = new SqlCommand("SELECT Cor FROM STAND_ViewCorVeiculos", CN);
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                string standName = reader["Cor"].ToString();
                comboBox3.Items.Add(standName);
            }

            reader.Close();
            CN.Close();
        }

        public void loadCombustiveis()
        {
            SqlConnection CN = new SqlConnection("data source = tcp:mednat.ieeta.pt\\SQLSERVER,8101; Initial Catalog = p8g4; uid = p8g4; password = TiagoBerto.2021; TrustServerCertificate=true");
            CN.Open();
            SqlCommand cmd = new SqlCommand("SELECT Combustivel FROM STAND_ViewCombustiveis", CN);
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                string standName = reader["Combustivel"].ToString();
                comboBox5.Items.Add(standName);
            }

            reader.Close();
            CN.Close();
        }

        public void loadCategorias()
        {
            SqlConnection CN = new SqlConnection("data source = tcp:mednat.ieeta.pt\\SQLSERVER,8101; Initial Catalog = p8g4; uid = p8g4; password = TiagoBerto.2021; TrustServerCertificate=true");
            CN.Open();
            SqlCommand cmd = new SqlCommand("SELECT Categoria FROM STAND_ViewCategoriaVeiculos", CN);
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                string standName = reader["Categoria"].ToString();
                comboBox4.Items.Add(standName);
            }

            reader.Close();
            CN.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (matricula != "" && marca != "" && modelo != "" && cor != "" && cilindrada != "" && ano != "" && quilometros != "" && combustivel != "" && categoria != "" && preco_anunciado != "" && preco_compra != "" && nomeStand != "" && obs != "" && nif_fornecedor != "" && data_movimento != "")
            {
                try
                {
                    SqlConnection CN = new SqlConnection("data source = tcp:mednat.ieeta.pt\\SQLSERVER,8101; Initial Catalog = p8g4; uid = p8g4; password = TiagoBerto.2021; TrustServerCertificate=true");
                    CN.Open();
                    SqlCommand cmd = new SqlCommand("STAND_AdicionarCarro", CN);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@matricula", matricula);
                    cmd.Parameters.AddWithValue("@marca", marca);
                    cmd.Parameters.AddWithValue("@stand", nomeStand);
                    cmd.Parameters.AddWithValue("@modelo", modelo);
                    cmd.Parameters.AddWithValue("@categoria", categoria);
                    cmd.Parameters.AddWithValue("@ano", ano);
                    cmd.Parameters.AddWithValue("@cilindrada", cilindrada);
                    cmd.Parameters.AddWithValue("@cor", cor);
                    cmd.Parameters.AddWithValue("@km", quilometros);
                    cmd.Parameters.AddWithValue("@combustivel", combustivel);
                    cmd.Parameters.AddWithValue("@preco_anunciado", Decimal.Parse(preco_anunciado));
                    cmd.Parameters.AddWithValue("@observações", obs);
                    cmd.Parameters.AddWithValue("@NIF_fornecedor", nif_fornecedor);
                    cmd.Parameters.AddWithValue("@data", data_movimento);
                    cmd.Parameters.AddWithValue("@preco_compra", Decimal.Parse(preco_compra));
                    cmd.ExecuteNonQuery();
                    CN.Close();
                    MessageBox.Show("Carro adicionado com sucesso!");
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
        }
    }
}