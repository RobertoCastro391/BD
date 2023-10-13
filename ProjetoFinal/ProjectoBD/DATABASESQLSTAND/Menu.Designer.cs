namespace DATABASESQLSTAND
{
    partial class Menu
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Menu));
            STANDS = new Button();
            CLIENTES = new Button();
            FUNCIONÁRIOS = new Button();
            FORNECEDORES = new Button();
            REGISTO = new Button();
            OPÇÕES = new Button();
            VEICULOS = new Button();
            SuspendLayout();
            // 
            // STANDS
            // 
            STANDS.AutoSizeMode = AutoSizeMode.GrowAndShrink;
            STANDS.Location = new Point(34, 157);
            STANDS.Margin = new Padding(5);
            STANDS.Name = "STANDS";
            STANDS.Size = new Size(275, 98);
            STANDS.TabIndex = 0;
            STANDS.Text = "STANDS";
            STANDS.UseVisualStyleBackColor = true;
            STANDS.Click += STANDS_Click;
            // 
            // CLIENTES
            // 
            CLIENTES.Location = new Point(351, 157);
            CLIENTES.Margin = new Padding(5);
            CLIENTES.Name = "CLIENTES";
            CLIENTES.Size = new Size(275, 98);
            CLIENTES.TabIndex = 1;
            CLIENTES.Text = "CLIENTES";
            CLIENTES.UseVisualStyleBackColor = true;
            CLIENTES.Click += CLIENTES_Click;
            // 
            // FUNCIONÁRIOS
            // 
            FUNCIONÁRIOS.Location = new Point(663, 157);
            FUNCIONÁRIOS.Margin = new Padding(5);
            FUNCIONÁRIOS.Name = "FUNCIONÁRIOS";
            FUNCIONÁRIOS.Size = new Size(275, 98);
            FUNCIONÁRIOS.TabIndex = 2;
            FUNCIONÁRIOS.Text = "FUNCIONÁRIOS";
            FUNCIONÁRIOS.UseVisualStyleBackColor = true;
            FUNCIONÁRIOS.Click += FUNCIONÁRIOS_Click;
            // 
            // FORNECEDORES
            // 
            FORNECEDORES.Location = new Point(978, 157);
            FORNECEDORES.Margin = new Padding(5);
            FORNECEDORES.Name = "FORNECEDORES";
            FORNECEDORES.Size = new Size(275, 98);
            FORNECEDORES.TabIndex = 3;
            FORNECEDORES.Text = "FORNECEDORES";
            FORNECEDORES.UseVisualStyleBackColor = true;
            FORNECEDORES.Click += FORNECEDORES_Click;
            // 
            // REGISTO
            // 
            REGISTO.Location = new Point(512, 400);
            REGISTO.Margin = new Padding(5);
            REGISTO.Name = "REGISTO";
            REGISTO.Size = new Size(275, 98);
            REGISTO.TabIndex = 5;
            REGISTO.Text = "REGISTO";
            REGISTO.UseVisualStyleBackColor = true;
            REGISTO.Click += REGISTO_Click;
            // 
            // OPÇÕES
            // 
            OPÇÕES.AutoSize = true;
            OPÇÕES.Location = new Point(830, 400);
            OPÇÕES.Margin = new Padding(5);
            OPÇÕES.Name = "OPÇÕES";
            OPÇÕES.Size = new Size(306, 98);
            OPÇÕES.TabIndex = 6;
            OPÇÕES.Text = "OPÇÕES";
            OPÇÕES.UseVisualStyleBackColor = true;
            OPÇÕES.Click += OPÇÕES_Click;
            // 
            // VEICULOS
            // 
            VEICULOS.Location = new Point(184, 400);
            VEICULOS.Margin = new Padding(5);
            VEICULOS.Name = "VEICULOS";
            VEICULOS.Size = new Size(275, 98);
            VEICULOS.TabIndex = 7;
            VEICULOS.Text = "VEICULOS";
            VEICULOS.UseVisualStyleBackColor = true;
            VEICULOS.Click += VEICULOS_Click;
            // 
            // Menu
            // 
            AutoScaleDimensions = new SizeF(13F, 32F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(1331, 720);
            Controls.Add(VEICULOS);
            Controls.Add(OPÇÕES);
            Controls.Add(REGISTO);
            Controls.Add(FORNECEDORES);
            Controls.Add(FUNCIONÁRIOS);
            Controls.Add(CLIENTES);
            Controls.Add(STANDS);
            Icon = (Icon)resources.GetObject("$this.Icon");
            Margin = new Padding(5);
            Name = "Menu";
            Text = "Menu";
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Button STANDS;
        private Button CLIENTES;
        private Button FUNCIONÁRIOS;
        private Button FORNECEDORES;
        private Button REGISTO;
        private Button OPÇÕES;
        private Button VEICULOS;
    }
}