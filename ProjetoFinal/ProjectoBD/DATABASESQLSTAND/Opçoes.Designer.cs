namespace DATABASESQLSTAND
{
    partial class Opçoes
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Opçoes));
            Voltar = new Button();
            STANDS = new Button();
            button1 = new Button();
            button2 = new Button();
            button3 = new Button();
            button4 = new Button();
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
            // STANDS
            // 
            STANDS.Anchor = AnchorStyles.Left;
            STANDS.AutoSizeMode = AutoSizeMode.GrowAndShrink;
            STANDS.Location = new Point(1005, 101);
            STANDS.Margin = new Padding(5);
            STANDS.Name = "STANDS";
            STANDS.Size = new Size(275, 98);
            STANDS.TabIndex = 4;
            STANDS.Text = "Funções Funcionários";
            STANDS.UseVisualStyleBackColor = true;
            STANDS.Click += STANDS_Click;
            // 
            // button1
            // 
            button1.Anchor = AnchorStyles.Left;
            button1.AutoSizeMode = AutoSizeMode.GrowAndShrink;
            button1.Location = new Point(677, 101);
            button1.Margin = new Padding(5);
            button1.Name = "button1";
            button1.Size = new Size(275, 98);
            button1.TabIndex = 5;
            button1.Text = "Marcas Veículos";
            button1.UseVisualStyleBackColor = true;
            button1.Click += button1_Click;
            // 
            // button2
            // 
            button2.Anchor = AnchorStyles.Left;
            button2.AutoSizeMode = AutoSizeMode.GrowAndShrink;
            button2.Location = new Point(346, 101);
            button2.Margin = new Padding(5);
            button2.Name = "button2";
            button2.Size = new Size(275, 98);
            button2.TabIndex = 6;
            button2.Text = "Cores Veículos";
            button2.UseVisualStyleBackColor = true;
            button2.Click += button2_Click;
            // 
            // button3
            // 
            button3.Anchor = AnchorStyles.Left;
            button3.AutoSizeMode = AutoSizeMode.GrowAndShrink;
            button3.Location = new Point(14, 101);
            button3.Margin = new Padding(5);
            button3.Name = "button3";
            button3.Size = new Size(275, 98);
            button3.TabIndex = 7;
            button3.Text = "Categoria Veículos";
            button3.UseVisualStyleBackColor = true;
            button3.Click += button3_Click;
            // 
            // button4
            // 
            button4.Anchor = AnchorStyles.Left;
            button4.AutoSizeMode = AutoSizeMode.GrowAndShrink;
            button4.Location = new Point(1321, 101);
            button4.Margin = new Padding(5);
            button4.Name = "button4";
            button4.Size = new Size(275, 98);
            button4.TabIndex = 8;
            button4.Text = "Combustíveis";
            button4.UseVisualStyleBackColor = true;
            button4.Click += button4_Click;
            // 
            // Opçoes
            // 
            AutoScaleDimensions = new SizeF(13F, 32F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(1610, 240);
            Controls.Add(button4);
            Controls.Add(button3);
            Controls.Add(button2);
            Controls.Add(button1);
            Controls.Add(STANDS);
            Controls.Add(Voltar);
            Icon = (Icon)resources.GetObject("$this.Icon");
            Margin = new Padding(5);
            Name = "Opçoes";
            Text = "Opçoes";
            ResumeLayout(false);
        }

        #endregion

        private Button Voltar;
        private Button STANDS;
        private Button button1;
        private Button button2;
        private Button button3;
        private Button button4;
    }
}