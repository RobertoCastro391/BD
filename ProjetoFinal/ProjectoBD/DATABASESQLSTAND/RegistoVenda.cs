using Microsoft.Data.SqlClient;
using System.Text.RegularExpressions;
using MySqlX.XDevAPI.Relational;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Runtime.ConstrainedExecution;

namespace DATABASESQLSTAND
{

    public partial class RegistoVenda : Form
    {
        public string matricula = "";
        public string marca = "";
        public string modelo = "";
        public string ano = "";
        public string nomeStand = "";
        public string data = "";
        public string nif_vendedor = "";
        public string nif_cliente = "";
        public string precoVenda = "";

        public RegistoVenda()
        {
            InitializeComponent();
            loadStandNames();
        }

        public void vendaFromVeiculos(string matricula)
        {
            textBox2.Text = matricula;
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
            veiculosInterface.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {

            if (matricula != "" && nomeStand != "" && data != "" && precoVenda != "" && nif_vendedor != "" && nif_cliente != "")
            {
                try
                {
                    SqlConnection CN = new SqlConnection("data source = tcp:mednat.ieeta.pt\\SQLSERVER,8101; Initial Catalog = p8g4; uid = p8g4; password = TiagoBerto.2021; TrustServerCertificate=true");
                    CN.Open();
                    SqlCommand cmd = new SqlCommand("STAND_ResgistrarVenda", CN);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@matricula", matricula);
                    cmd.Parameters.AddWithValue("@stand", nomeStand);
                    cmd.Parameters.AddWithValue("@data", data);
                    cmd.Parameters.AddWithValue("@preco_venda", Decimal.Parse(precoVenda));
                    cmd.Parameters.AddWithValue("@NIF_vendedor", nif_vendedor);
                    cmd.Parameters.AddWithValue("@NIF_comprador", nif_cliente);
                    cmd.ExecuteNonQuery();
                    CN.Close();
                    MessageBox.Show("Venda registada com sucesso!");
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

        private void textBox7_TextChanged(object sender, EventArgs e)
        {
            precoVenda = textBox7.Text;
        }

        public void textBox2_TextChanged(object sender, EventArgs e)
        {
            matricula = textBox2.Text;

            if (string.IsNullOrWhiteSpace(matricula))
            {
                // If the matricula textbox is cleared, clear the other textboxes
                textBox1.Clear();
                textBox4.Clear();
                textBox6.Clear();
            }
            else
            {
                // Only load the vehicle details if the matricula is in the correct format
                Regex matriculaFormat = new Regex(@"^\w{2}-\w{2}-\w{2}$"); // Replace this regex if your matricula format is different
                if (matriculaFormat.IsMatch(matricula))
                {
                    loadDadosVeiculos(matricula);
                }
            }
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            marca = textBox1.Text;
        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {
            modelo = textBox4.Text;
        }
        private void textBox6_TextChanged(object sender, EventArgs e)
        {
            ano = textBox6.Text;
        }

        private void textBox17_TextChanged(object sender, EventArgs e)
        {
            nif_vendedor = textBox17.Text;
        }

        private void textBox5_TextChanged(object sender, EventArgs e)
        {
            nif_cliente = textBox5.Text;
        }

        public void loadDadosVeiculos(string matricula)
        {
            if (!string.IsNullOrWhiteSpace(matricula))
            {
                using (SqlConnection CN = new SqlConnection("data source = tcp:mednat.ieeta.pt\\SQLSERVER,8101; Initial Catalog = p8g4; uid = p8g4; password = TiagoBerto.2021; TrustServerCertificate=true"))
                {
                    CN.Open();
                    string query = "SELECT * FROM STAND_ViewEmStockVeiculos WHERE Matricula = @Matricula";

                    using (SqlCommand cmd = new SqlCommand(query, CN))
                    {
                        cmd.Parameters.AddWithValue("@Matricula", matricula);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                marca = reader["Marca"].ToString();
                                modelo = reader["Modelo"].ToString();
                                ano = reader["Ano"].ToString();
                                nomeStand = reader["Nome_Stand"].ToString();

                                textBox1.Text = marca;
                                textBox4.Text = modelo;
                                textBox6.Text = ano;
                                comboBox2.Text = nomeStand;
                            }
                            else
                            {
                                MessageBox.Show("Nenhum veículo foi encontrado com essa matrícula!");
                            }
                        }
                    }
                }
            }
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

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            nomeStand = comboBox2.SelectedItem.ToString();
        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {
            data = dateTimePicker1.Value.ToString("yyyy/MM/dd");
        }
    }
}
