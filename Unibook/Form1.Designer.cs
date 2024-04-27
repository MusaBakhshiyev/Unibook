namespace Unibook
{
    partial class Form1
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
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
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            panelMain = new System.Windows.Forms.Panel();
            panelLogin2 = new System.Windows.Forms.Panel();
            pictureBoxLogin2 = new System.Windows.Forms.PictureBox();
            panelLogin1 = new System.Windows.Forms.Panel();
            pictureBoxShow = new System.Windows.Forms.PictureBox();
            pictureBoxHide = new System.Windows.Forms.PictureBox();
            pictureBoxLogin1 = new System.Windows.Forms.PictureBox();
            labelWelcome = new System.Windows.Forms.Label();
            labelLoginWith = new System.Windows.Forms.Label();
            buttonLogin = new System.Windows.Forms.Button();
            textBoxPassword = new System.Windows.Forms.TextBox();
            textBoxUsername = new System.Windows.Forms.TextBox();
            labelPassword = new System.Windows.Forms.Label();
            labelUsername = new System.Windows.Forms.Label();
            panelMain.SuspendLayout();
            panelLogin2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)pictureBoxLogin2).BeginInit();
            panelLogin1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)pictureBoxShow).BeginInit();
            ((System.ComponentModel.ISupportInitialize)pictureBoxHide).BeginInit();
            ((System.ComponentModel.ISupportInitialize)pictureBoxLogin1).BeginInit();
            SuspendLayout();
            // 
            // panelMain
            // 
            panelMain.Controls.Add(panelLogin2);
            panelMain.Controls.Add(panelLogin1);
            panelMain.Dock = System.Windows.Forms.DockStyle.Fill;
            panelMain.Location = new System.Drawing.Point(0, 0);
            panelMain.Name = "panelMain";
            panelMain.Size = new System.Drawing.Size(914, 499);
            panelMain.TabIndex = 0;
            // 
            // panelLogin2
            // 
            panelLogin2.BackColor = System.Drawing.SystemColors.GradientActiveCaption;
            panelLogin2.Controls.Add(pictureBoxLogin2);
            panelLogin2.Dock = System.Windows.Forms.DockStyle.Fill;
            panelLogin2.Location = new System.Drawing.Point(344, 0);
            panelLogin2.Name = "panelLogin2";
            panelLogin2.Size = new System.Drawing.Size(570, 499);
            panelLogin2.TabIndex = 3;
            // 
            // pictureBoxLogin2
            // 
            pictureBoxLogin2.Image = (System.Drawing.Image)resources.GetObject("pictureBoxLogin2.Image");
            pictureBoxLogin2.Location = new System.Drawing.Point(3, 33);
            pictureBoxLogin2.Name = "pictureBoxLogin2";
            pictureBoxLogin2.Size = new System.Drawing.Size(565, 432);
            pictureBoxLogin2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            pictureBoxLogin2.TabIndex = 0;
            pictureBoxLogin2.TabStop = false;
            // 
            // panelLogin1
            // 
            panelLogin1.BackColor = System.Drawing.Color.White;
            panelLogin1.Controls.Add(pictureBoxShow);
            panelLogin1.Controls.Add(pictureBoxHide);
            panelLogin1.Controls.Add(pictureBoxLogin1);
            panelLogin1.Controls.Add(labelWelcome);
            panelLogin1.Controls.Add(labelLoginWith);
            panelLogin1.Controls.Add(buttonLogin);
            panelLogin1.Controls.Add(textBoxPassword);
            panelLogin1.Controls.Add(textBoxUsername);
            panelLogin1.Controls.Add(labelPassword);
            panelLogin1.Controls.Add(labelUsername);
            panelLogin1.Dock = System.Windows.Forms.DockStyle.Left;
            panelLogin1.Location = new System.Drawing.Point(0, 0);
            panelLogin1.Name = "panelLogin1";
            panelLogin1.Size = new System.Drawing.Size(344, 499);
            panelLogin1.TabIndex = 2;
            // 
            // pictureBoxShow
            // 
            pictureBoxShow.Image = (System.Drawing.Image)resources.GetObject("pictureBoxShow.Image");
            pictureBoxShow.Location = new System.Drawing.Point(248, 346);
            pictureBoxShow.Name = "pictureBoxShow";
            pictureBoxShow.Size = new System.Drawing.Size(22, 21);
            pictureBoxShow.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            pictureBoxShow.TabIndex = 6;
            pictureBoxShow.TabStop = false;
            pictureBoxShow.Visible = false;
            pictureBoxShow.Click += pictureBoxShow_Click;
            pictureBoxShow.MouseEnter += pictureBoxShow_MouseEnter;
            pictureBoxShow.MouseLeave += pictureBoxShow_MouseLeave;
            // 
            // pictureBoxHide
            // 
            pictureBoxHide.Image = (System.Drawing.Image)resources.GetObject("pictureBoxHide.Image");
            pictureBoxHide.Location = new System.Drawing.Point(248, 346);
            pictureBoxHide.Name = "pictureBoxHide";
            pictureBoxHide.Size = new System.Drawing.Size(22, 21);
            pictureBoxHide.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            pictureBoxHide.TabIndex = 5;
            pictureBoxHide.TabStop = false;
            pictureBoxHide.Click += pictureBoxHide_Click;
            pictureBoxHide.MouseEnter += pictureBoxHide_MouseEnter;
            pictureBoxHide.MouseLeave += pictureBoxHide_MouseLeave;
            // 
            // pictureBoxLogin1
            // 
            pictureBoxLogin1.Image = (System.Drawing.Image)resources.GetObject("pictureBoxLogin1.Image");
            pictureBoxLogin1.Location = new System.Drawing.Point(114, 18);
            pictureBoxLogin1.Name = "pictureBoxLogin1";
            pictureBoxLogin1.Size = new System.Drawing.Size(116, 82);
            pictureBoxLogin1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            pictureBoxLogin1.TabIndex = 5;
            pictureBoxLogin1.TabStop = false;
            // 
            // labelWelcome
            // 
            labelWelcome.AutoSize = true;
            labelWelcome.Font = new System.Drawing.Font("Segoe UI", 24F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelWelcome.ForeColor = System.Drawing.Color.SteelBlue;
            labelWelcome.Location = new System.Drawing.Point(84, 103);
            labelWelcome.Name = "labelWelcome";
            labelWelcome.Size = new System.Drawing.Size(176, 45);
            labelWelcome.TabIndex = 4;
            labelWelcome.Text = "WELCOME";
            // 
            // labelLoginWith
            // 
            labelLoginWith.Anchor = System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right;
            labelLoginWith.AutoSize = true;
            labelLoginWith.Font = new System.Drawing.Font("Segoe UI", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelLoginWith.ForeColor = System.Drawing.Color.SteelBlue;
            labelLoginWith.Location = new System.Drawing.Point(26, 189);
            labelLoginWith.Name = "labelLoginWith";
            labelLoginWith.Size = new System.Drawing.Size(292, 32);
            labelLoginWith.TabIndex = 4;
            labelLoginWith.Text = "Login with your account";
            // 
            // buttonLogin
            // 
            buttonLogin.BackColor = System.Drawing.Color.SlateGray;
            buttonLogin.Font = new System.Drawing.Font("Century751 SeBd BT", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            buttonLogin.ForeColor = System.Drawing.Color.White;
            buttonLogin.Location = new System.Drawing.Point(71, 400);
            buttonLogin.Name = "buttonLogin";
            buttonLogin.Size = new System.Drawing.Size(203, 46);
            buttonLogin.TabIndex = 3;
            buttonLogin.Text = "LOGIN";
            buttonLogin.UseVisualStyleBackColor = false;
            buttonLogin.Click += buttonLogin_Click;
            buttonLogin.KeyDown += buttonLogin_KeyDown;
            // 
            // textBoxPassword
            // 
            textBoxPassword.Location = new System.Drawing.Point(73, 345);
            textBoxPassword.Name = "textBoxPassword";
            textBoxPassword.Size = new System.Drawing.Size(199, 23);
            textBoxPassword.TabIndex = 2;
            textBoxPassword.UseSystemPasswordChar = true;
            // 
            // textBoxUsername
            // 
            textBoxUsername.Location = new System.Drawing.Point(71, 272);
            textBoxUsername.Name = "textBoxUsername";
            textBoxUsername.Size = new System.Drawing.Size(203, 23);
            textBoxUsername.TabIndex = 1;
            // 
            // labelPassword
            // 
            labelPassword.AutoSize = true;
            labelPassword.Font = new System.Drawing.Font("Century751 SeBd BT", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            labelPassword.Location = new System.Drawing.Point(73, 320);
            labelPassword.Name = "labelPassword";
            labelPassword.Size = new System.Drawing.Size(94, 22);
            labelPassword.TabIndex = 0;
            labelPassword.Text = "Password";
            // 
            // labelUsername
            // 
            labelUsername.AutoSize = true;
            labelUsername.Font = new System.Drawing.Font("Century751 SeBd BT", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            labelUsername.ForeColor = System.Drawing.Color.Black;
            labelUsername.Location = new System.Drawing.Point(70, 247);
            labelUsername.Name = "labelUsername";
            labelUsername.Size = new System.Drawing.Size(102, 22);
            labelUsername.TabIndex = 0;
            labelUsername.Text = "Username";
            // 
            // Form1
            // 
            AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            ClientSize = new System.Drawing.Size(914, 499);
            Controls.Add(panelMain);
            MinimumSize = new System.Drawing.Size(930, 538);
            Name = "Form1";
            StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            Text = "Unibook";
            WindowState = System.Windows.Forms.FormWindowState.Maximized;
            FormClosed += Form1_FormClosed;
            ClientSizeChanged += Form1_ClientSizeChanged;
            panelMain.ResumeLayout(false);
            panelLogin2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)pictureBoxLogin2).EndInit();
            panelLogin1.ResumeLayout(false);
            panelLogin1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)pictureBoxShow).EndInit();
            ((System.ComponentModel.ISupportInitialize)pictureBoxHide).EndInit();
            ((System.ComponentModel.ISupportInitialize)pictureBoxLogin1).EndInit();
            ResumeLayout(false);
        }

        #endregion

        private System.Windows.Forms.Panel panelMain;
        private System.Windows.Forms.Panel panelLogin1;
        private System.Windows.Forms.Button buttonLogin;
        private System.Windows.Forms.TextBox textBoxPassword;
        private System.Windows.Forms.TextBox textBoxUsername;
        private System.Windows.Forms.Label labelPassword;
        private System.Windows.Forms.Label labelUsername;
        private System.Windows.Forms.Label labelLoginWith;
        private System.Windows.Forms.PictureBox pictureBoxLogin1;
        private System.Windows.Forms.Label labelWelcome;
        private System.Windows.Forms.Panel panelLogin2;
        private System.Windows.Forms.PictureBox pictureBoxLogin2;
        private System.Windows.Forms.PictureBox pictureBoxHide;
        private System.Windows.Forms.PictureBox pictureBoxShow;
    }
}
