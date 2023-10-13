namespace DATABASESQLSTAND
{
    partial class FornecedoresInterface
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FornecedoresInterface));
            Voltar = new Button();
            button4 = new Button();
            textBox1 = new TextBox();
            dataGridView1 = new DataGridView();
            label2 = new Label();
            label3 = new Label();
            label4 = new Label();
            label5 = new Label();
            label6 = new Label();
            label7 = new Label();
            textBox2 = new TextBox();
            textBox3 = new TextBox();
            textBox4 = new TextBox();
            textBox5 = new TextBox();
            textBox6 = new TextBox();
            comboBox1 = new ComboBox();
            button1 = new Button();
            ((System.ComponentModel.ISupportInitialize)dataGridView1).BeginInit();
            SuspendLayout();
            // 
            // Voltar
            // 
            Voltar.Location = new Point(20, 19);
            Voltar.Margin = new Padding(5);
            Voltar.Name = "Voltar";
            Voltar.Size = new Size(153, 46);
            Voltar.TabIndex = 3;
            Voltar.Text = "VOLTAR";
            Voltar.UseVisualStyleBackColor = true;
            Voltar.Click += Voltar_Click;
            // 
            // button4
            // 
            button4.AutoSize = true;
            button4.Location = new Point(254, 120);
            button4.Name = "button4";
            button4.Size = new Size(207, 46);
            button4.TabIndex = 9;
            button4.Text = "Adicionar";
            button4.UseVisualStyleBackColor = true;
            button4.Click += button4_Click;
            // 
            // textBox1
            // 
            textBox1.Anchor = AnchorStyles.Top | AnchorStyles.Right;
            textBox1.Location = new Point(1414, 124);
            textBox1.Multiline = true;
            textBox1.Name = "textBox1";
            textBox1.PlaceholderText = "Pesquisar";
            textBox1.Size = new Size(330, 40);
            textBox1.TabIndex = 11;
            textBox1.TextChanged += textBox1_TextChanged;
            // 
            // dataGridView1
            // 
            dataGridView1.Anchor = AnchorStyles.Top | AnchorStyles.Bottom | AnchorStyles.Left | AnchorStyles.Right;
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridView1.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridView1.Location = new Point(12, 186);
            dataGridView1.Name = "dataGridView1";
            dataGridView1.RowHeadersWidth = 82;
            dataGridView1.RowTemplate.Height = 41;
            dataGridView1.Size = new Size(1732, 480);
            dataGridView1.TabIndex = 12;
            // 
            // label2
            // 
            label2.Anchor = AnchorStyles.Bottom | AnchorStyles.Left;
            label2.AutoSize = true;
            label2.Font = new Font("Segoe UI", 12F, FontStyle.Regular, GraphicsUnit.Point);
            label2.Location = new Point(12, 706);
            label2.Name = "label2";
            label2.Size = new Size(76, 45);
            label2.TabIndex = 14;
            label2.Text = "NIF:";
            // 
            // label3
            // 
            label3.AutoSize = true;
            label3.Font = new Font("Segoe UI", 12F, FontStyle.Regular, GraphicsUnit.Point);
            label3.Location = new Point(941, 424);
            label3.Name = "label3";
            label3.Size = new Size(0, 45);
            label3.TabIndex = 15;
            // 
            // label4
            // 
            label4.Anchor = AnchorStyles.Bottom | AnchorStyles.Left;
            label4.AutoSize = true;
            label4.Font = new Font("Segoe UI", 12F, FontStyle.Regular, GraphicsUnit.Point);
            label4.Location = new Point(1224, 706);
            label4.Name = "label4";
            label4.Size = new Size(159, 45);
            label4.TabIndex = 16;
            label4.Text = "Endereço:";
            // 
            // label5
            // 
            label5.Anchor = AnchorStyles.Bottom | AnchorStyles.Left;
            label5.AutoSize = true;
            label5.Font = new Font("Segoe UI", 12F, FontStyle.Regular, GraphicsUnit.Point);
            label5.Location = new Point(631, 800);
            label5.Name = "label5";
            label5.Size = new Size(103, 45);
            label5.TabIndex = 17;
            label5.Text = "Email:";
            // 
            // label6
            // 
            label6.Anchor = AnchorStyles.Bottom | AnchorStyles.Left;
            label6.AutoSize = true;
            label6.Font = new Font("Segoe UI", 12F, FontStyle.Regular, GraphicsUnit.Point);
            label6.Location = new Point(631, 706);
            label6.Name = "label6";
            label6.Size = new Size(147, 45);
            label6.TabIndex = 18;
            label6.Text = "Telefone:";
            // 
            // label7
            // 
            label7.Anchor = AnchorStyles.Bottom | AnchorStyles.Left;
            label7.AutoSize = true;
            label7.Font = new Font("Segoe UI", 12F, FontStyle.Regular, GraphicsUnit.Point);
            label7.Location = new Point(12, 800);
            label7.Name = "label7";
            label7.Size = new Size(115, 45);
            label7.TabIndex = 19;
            label7.Text = "Nome:";
            // 
            // textBox2
            // 
            textBox2.Anchor = AnchorStyles.Bottom | AnchorStyles.Left;
            textBox2.Location = new Point(143, 713);
            textBox2.Multiline = true;
            textBox2.Name = "textBox2";
            textBox2.Size = new Size(273, 38);
            textBox2.TabIndex = 20;
            textBox2.TextChanged += textBox2_TextChanged;
            // 
            // textBox3
            // 
            textBox3.Anchor = AnchorStyles.Bottom | AnchorStyles.Left;
            textBox3.Location = new Point(836, 713);
            textBox3.Multiline = true;
            textBox3.Name = "textBox3";
            textBox3.Size = new Size(273, 38);
            textBox3.TabIndex = 21;
            textBox3.TextChanged += textBox3_TextChanged;
            // 
            // textBox4
            // 
            textBox4.Anchor = AnchorStyles.Bottom | AnchorStyles.Left;
            textBox4.Location = new Point(836, 807);
            textBox4.Multiline = true;
            textBox4.Name = "textBox4";
            textBox4.Size = new Size(273, 38);
            textBox4.TabIndex = 22;
            textBox4.TextChanged += textBox4_TextChanged;
            // 
            // textBox5
            // 
            textBox5.Anchor = AnchorStyles.Bottom | AnchorStyles.Left;
            textBox5.Location = new Point(143, 807);
            textBox5.Multiline = true;
            textBox5.Name = "textBox5";
            textBox5.Size = new Size(273, 38);
            textBox5.TabIndex = 23;
            textBox5.TextChanged += textBox5_TextChanged;
            // 
            // textBox6
            // 
            textBox6.Anchor = AnchorStyles.Bottom | AnchorStyles.Left;
            textBox6.Location = new Point(1401, 713);
            textBox6.Multiline = true;
            textBox6.Name = "textBox6";
            textBox6.Size = new Size(273, 38);
            textBox6.TabIndex = 24;
            textBox6.TextChanged += textBox6_TextChanged;
            // 
            // comboBox1
            // 
            comboBox1.Anchor = AnchorStyles.Top | AnchorStyles.Right;
            comboBox1.FormattingEnabled = true;
            comboBox1.Items.AddRange(new object[] { "NIF", "nome", "telefone", "endereco", "email" });
            comboBox1.Location = new Point(1071, 124);
            comboBox1.Name = "comboBox1";
            comboBox1.Size = new Size(327, 40);
            comboBox1.TabIndex = 28;
            comboBox1.Text = "Filtrar";
            // 
            // button1
            // 
            button1.AutoSize = true;
            button1.Location = new Point(20, 118);
            button1.Name = "button1";
            button1.Size = new Size(207, 46);
            button1.TabIndex = 29;
            button1.Text = "Alterar";
            button1.UseVisualStyleBackColor = true;
            button1.Click += button1_Click;
            // 
            // FornecedoresInterface
            // 
            AutoScaleDimensions = new SizeF(13F, 32F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(1756, 892);
            Controls.Add(button1);
            Controls.Add(comboBox1);
            Controls.Add(textBox6);
            Controls.Add(textBox5);
            Controls.Add(textBox4);
            Controls.Add(textBox3);
            Controls.Add(textBox2);
            Controls.Add(label7);
            Controls.Add(label6);
            Controls.Add(label5);
            Controls.Add(label4);
            Controls.Add(label3);
            Controls.Add(label2);
            Controls.Add(dataGridView1);
            Controls.Add(textBox1);
            Controls.Add(button4);
            Controls.Add(Voltar);
            Icon = (Icon)resources.GetObject("$this.Icon");
            Margin = new Padding(5);
            Name = "FornecedoresInterface";
            Text = "Fornecedores";
            ((System.ComponentModel.ISupportInitialize)dataGridView1).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Button Voltar;
        private Button button2;
        private Button button4;
        private TextBox textBox1;
        private DataGridView dataGridView1;
        private Label label2;
        private Label label3;
        private Label label4;
        private Label label5;
        private Label label6;
        private Label label7;
        private TextBox textBox2;
        private TextBox textBox3;
        private TextBox textBox4;
        private TextBox textBox5;
        private TextBox textBox6;
        private ComboBox comboBox1;
        private Button button1;
    }
}