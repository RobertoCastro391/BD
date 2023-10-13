namespace DATABASESQLSTAND
{
    partial class LogIn
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(LogIn));
            label1 = new Label();
            label5 = new Label();
            label2 = new Label();
            button1 = new Button();
            label3 = new Label();
            textBox3 = new TextBox();
            label4 = new Label();
            textBox2 = new TextBox();
            textBox1 = new TextBox();
            SuspendLayout();
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Font = new Font("Segoe UI", 13F, FontStyle.Bold, GraphicsUnit.Point);
            label1.Location = new Point(71, 37);
            label1.Name = "label1";
            label1.Size = new Size(748, 47);
            label1.TabIndex = 9;
            label1.Text = "Sistema de Gestão de uma Cadeia de Stands";
            // 
            // label5
            // 
            label5.AutoSize = true;
            label5.Font = new Font("Segoe UI", 12F, FontStyle.Regular, GraphicsUnit.Point);
            label5.Location = new Point(240, 94);
            label5.Name = "label5";
            label5.Size = new Size(384, 45);
            label5.TabIndex = 17;
            label5.Text = "Ligue-se à Base de Dados";
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.Font = new Font("Segoe UI", 12F, FontStyle.Regular, GraphicsUnit.Point);
            label2.Location = new Point(45, 246);
            label2.Name = "label2";
            label2.Size = new Size(170, 45);
            label2.TabIndex = 10;
            label2.Text = "Username:";
            // 
            // button1
            // 
            button1.Font = new Font("Segoe UI Black", 9F, FontStyle.Bold, GraphicsUnit.Point);
            button1.Location = new Point(357, 391);
            button1.Margin = new Padding(3, 2, 3, 2);
            button1.Name = "button1";
            button1.Size = new Size(201, 60);
            button1.TabIndex = 16;
            button1.Text = "Log-In";
            button1.UseVisualStyleBackColor = true;
            button1.Click += button1_Click_1;
            // 
            // label3
            // 
            label3.AutoSize = true;
            label3.Font = new Font("Segoe UI", 12F, FontStyle.Regular, GraphicsUnit.Point);
            label3.Location = new Point(71, 171);
            label3.Name = "label3";
            label3.Size = new Size(144, 45);
            label3.TabIndex = 11;
            label3.Text = "Servidor:";
            // 
            // textBox3
            // 
            textBox3.Location = new Point(268, 324);
            textBox3.Margin = new Padding(3, 2, 3, 2);
            textBox3.Name = "textBox3";
            textBox3.PasswordChar = '*';
            textBox3.Size = new Size(535, 39);
            textBox3.TabIndex = 15;
            textBox3.Text = "TiagoBerto.2021";
            // 
            // label4
            // 
            label4.AutoSize = true;
            label4.Font = new Font("Segoe UI", 12F, FontStyle.Regular, GraphicsUnit.Point);
            label4.Location = new Point(55, 317);
            label4.Name = "label4";
            label4.Size = new Size(160, 45);
            label4.TabIndex = 12;
            label4.Text = "Password:";
            // 
            // textBox2
            // 
            textBox2.Location = new Point(268, 253);
            textBox2.Margin = new Padding(3, 2, 3, 2);
            textBox2.Name = "textBox2";
            textBox2.Size = new Size(535, 39);
            textBox2.TabIndex = 14;
            textBox2.Text = "p8g4";
            // 
            // textBox1
            // 
            textBox1.Location = new Point(268, 178);
            textBox1.Margin = new Padding(3, 2, 3, 2);
            textBox1.Name = "textBox1";
            textBox1.Size = new Size(535, 39);
            textBox1.TabIndex = 13;
            textBox1.Text = "tcp:mednat.ieeta.pt\\\\SQLSERVER,8101";
            // 
            // LogIn
            // 
            AutoScaleDimensions = new SizeF(13F, 32F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(874, 467);
            Controls.Add(label1);
            Controls.Add(label5);
            Controls.Add(label2);
            Controls.Add(button1);
            Controls.Add(label3);
            Controls.Add(textBox3);
            Controls.Add(label4);
            Controls.Add(textBox2);
            Controls.Add(textBox1);
            Icon = (Icon)resources.GetObject("$this.Icon");
            Margin = new Padding(3, 2, 3, 2);
            Name = "LogIn";
            Text = "LogIn";
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Label label1;
        private Label label5;
        private Label label2;
        private Button button1;
        private Label label3;
        private TextBox textBox3;
        private Label label4;
        private TextBox textBox2;
        private TextBox textBox1;
    }
}