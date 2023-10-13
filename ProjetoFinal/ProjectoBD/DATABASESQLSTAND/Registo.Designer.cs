namespace DATABASESQLSTAND
{
    partial class Registo
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Registo));
            Voltar = new Button();
            button1 = new Button();
            button2 = new Button();
            button3 = new Button();
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
            // button1
            // 
            button1.Font = new Font("Segoe UI", 12F, FontStyle.Regular, GraphicsUnit.Point);
            button1.Location = new Point(20, 130);
            button1.Name = "button1";
            button1.Size = new Size(198, 81);
            button1.TabIndex = 4;
            button1.Text = "Compra";
            button1.UseVisualStyleBackColor = true;
            button1.Click += button1_Click;
            // 
            // button2
            // 
            button2.Font = new Font("Segoe UI", 12F, FontStyle.Regular, GraphicsUnit.Point);
            button2.Location = new Point(427, 130);
            button2.Name = "button2";
            button2.Size = new Size(198, 81);
            button2.TabIndex = 5;
            button2.Text = "Venda";
            button2.UseVisualStyleBackColor = true;
            button2.Click += button2_Click;
            // 
            // button3
            // 
            button3.Font = new Font("Segoe UI", 12F, FontStyle.Regular, GraphicsUnit.Point);
            button3.Location = new Point(820, 130);
            button3.Name = "button3";
            button3.Size = new Size(198, 81);
            button3.TabIndex = 6;
            button3.Text = "Retoma";
            button3.UseVisualStyleBackColor = true;
            button3.Click += button3_Click;
            // 
            // Registo
            // 
            AutoScaleDimensions = new SizeF(13F, 32F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(1040, 237);
            Controls.Add(button3);
            Controls.Add(button2);
            Controls.Add(button1);
            Controls.Add(Voltar);
            Icon = (Icon)resources.GetObject("$this.Icon");
            Margin = new Padding(5);
            Name = "Registo";
            Text = "Registo";
            ResumeLayout(false);
        }

        #endregion

        private Button Voltar;
        private Button button1;
        private Button button2;
        private Button button3;
    }
}