namespace Unibook.UnibookTeacher
{
    partial class TeacherMainPage
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

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(TeacherMainPage));
            panelOptions = new System.Windows.Forms.Panel();
            buttonInformation = new System.Windows.Forms.Button();
            buttonGroup = new System.Windows.Forms.Button();
            pictureBox1 = new System.Windows.Forms.PictureBox();
            panelMain = new System.Windows.Forms.Panel();
            buttonLogOut = new System.Windows.Forms.Button();
            labelUserName = new System.Windows.Forms.Label();
            pictureBox2 = new System.Windows.Forms.PictureBox();
            panel1 = new System.Windows.Forms.Panel();
            panelOptions.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)pictureBox1).BeginInit();
            ((System.ComponentModel.ISupportInitialize)pictureBox2).BeginInit();
            panel1.SuspendLayout();
            SuspendLayout();
            // 
            // panelOptions
            // 
            panelOptions.BackColor = System.Drawing.Color.Lavender;
            panelOptions.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            panelOptions.Controls.Add(buttonInformation);
            panelOptions.Controls.Add(buttonGroup);
            panelOptions.Controls.Add(pictureBox1);
            panelOptions.Location = new System.Drawing.Point(0, 0);
            panelOptions.Name = "panelOptions";
            panelOptions.Size = new System.Drawing.Size(120, 200);
            panelOptions.TabIndex = 5;
            // 
            // buttonInformation
            // 
            buttonInformation.BackColor = System.Drawing.Color.SteelBlue;
            buttonInformation.FlatAppearance.BorderSize = 0;
            buttonInformation.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            buttonInformation.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            buttonInformation.ForeColor = System.Drawing.Color.White;
            buttonInformation.Location = new System.Drawing.Point(0, 140);
            buttonInformation.Name = "buttonInformation";
            buttonInformation.Size = new System.Drawing.Size(120, 52);
            buttonInformation.TabIndex = 2;
            buttonInformation.Text = "Information";
            buttonInformation.UseVisualStyleBackColor = false;
            buttonInformation.Click += buttonInformation_Click;
            // 
            // buttonGroup
            // 
            buttonGroup.BackColor = System.Drawing.Color.SteelBlue;
            buttonGroup.FlatAppearance.BorderSize = 0;
            buttonGroup.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            buttonGroup.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            buttonGroup.ForeColor = System.Drawing.Color.White;
            buttonGroup.Location = new System.Drawing.Point(0, 80);
            buttonGroup.Name = "buttonGroup";
            buttonGroup.Size = new System.Drawing.Size(120, 52);
            buttonGroup.TabIndex = 2;
            buttonGroup.Text = "Groups";
            buttonGroup.UseVisualStyleBackColor = false;
            buttonGroup.Click += buttonGroup_Click;
            // 
            // pictureBox1
            // 
            pictureBox1.BackColor = System.Drawing.Color.Lavender;
            pictureBox1.Image = (System.Drawing.Image)resources.GetObject("pictureBox1.Image");
            pictureBox1.Location = new System.Drawing.Point(0, 0);
            pictureBox1.Name = "pictureBox1";
            pictureBox1.Size = new System.Drawing.Size(85, 61);
            pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            pictureBox1.TabIndex = 0;
            pictureBox1.TabStop = false;
            pictureBox1.Click += pictureBox1_Click;
            pictureBox1.MouseEnter += pictureBox1_MouseEnter;
            pictureBox1.MouseLeave += pictureBox1_MouseLeave;
            // 
            // panelMain
            // 
            panelMain.Dock = System.Windows.Forms.DockStyle.Fill;
            panelMain.Location = new System.Drawing.Point(0, 62);
            panelMain.Name = "panelMain";
            panelMain.Size = new System.Drawing.Size(1168, 588);
            panelMain.TabIndex = 6;
            // 
            // buttonLogOut
            // 
            buttonLogOut.BackColor = System.Drawing.Color.FromArgb(192, 0, 0);
            buttonLogOut.FlatAppearance.BorderColor = System.Drawing.Color.White;
            buttonLogOut.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            buttonLogOut.Font = new System.Drawing.Font("Times New Roman", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            buttonLogOut.ForeColor = System.Drawing.Color.White;
            buttonLogOut.Location = new System.Drawing.Point(370, 12);
            buttonLogOut.Name = "buttonLogOut";
            buttonLogOut.Size = new System.Drawing.Size(94, 37);
            buttonLogOut.TabIndex = 2;
            buttonLogOut.Text = "Log Out";
            buttonLogOut.UseVisualStyleBackColor = false;
            buttonLogOut.Click += buttonLogOut_Click;
            // 
            // labelUserName
            // 
            labelUserName.AutoSize = true;
            labelUserName.Font = new System.Drawing.Font("Times New Roman", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelUserName.ForeColor = System.Drawing.Color.White;
            labelUserName.Location = new System.Drawing.Point(196, 17);
            labelUserName.Name = "labelUserName";
            labelUserName.Size = new System.Drawing.Size(165, 26);
            labelUserName.TabIndex = 0;
            labelUserName.Text = "Musa Baxşiyev";
            // 
            // pictureBox2
            // 
            pictureBox2.Image = (System.Drawing.Image)resources.GetObject("pictureBox2.Image");
            pictureBox2.Location = new System.Drawing.Point(125, 5);
            pictureBox2.Name = "pictureBox2";
            pictureBox2.Size = new System.Drawing.Size(68, 51);
            pictureBox2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            pictureBox2.TabIndex = 1;
            pictureBox2.TabStop = false;
            // 
            // panel1
            // 
            panel1.BackColor = System.Drawing.Color.LightSteelBlue;
            panel1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            panel1.Controls.Add(buttonLogOut);
            panel1.Controls.Add(labelUserName);
            panel1.Controls.Add(pictureBox2);
            panel1.Dock = System.Windows.Forms.DockStyle.Top;
            panel1.Location = new System.Drawing.Point(0, 0);
            panel1.Name = "panel1";
            panel1.Size = new System.Drawing.Size(1168, 62);
            panel1.TabIndex = 7;
            // 
            // TeacherMainPage
            // 
            AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            Controls.Add(panelOptions);
            Controls.Add(panelMain);
            Controls.Add(panel1);
            Name = "TeacherMainPage";
            Size = new System.Drawing.Size(1168, 650);
            panelOptions.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)pictureBox1).EndInit();
            ((System.ComponentModel.ISupportInitialize)pictureBox2).EndInit();
            panel1.ResumeLayout(false);
            panel1.PerformLayout();
            ResumeLayout(false);
        }

        #endregion

        private System.Windows.Forms.Panel panelOptions;
        private System.Windows.Forms.Button buttonInformation;
        private System.Windows.Forms.Button buttonGroup;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Panel panelMain;
        private System.Windows.Forms.Button buttonLogOut;
        public System.Windows.Forms.Label labelUserName;
        private System.Windows.Forms.PictureBox pictureBox2;
        private System.Windows.Forms.Panel panel1;
    }
}
