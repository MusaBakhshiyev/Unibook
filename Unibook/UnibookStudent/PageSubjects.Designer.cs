namespace Unibook.UnibookStudent
{
    partial class PageSubjects
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(PageSubjects));
            panelMainSubject = new System.Windows.Forms.Panel();
            panel2 = new System.Windows.Forms.Panel();
            pictureBox2 = new System.Windows.Forms.PictureBox();
            buttonGrades = new System.Windows.Forms.Button();
            panel1 = new System.Windows.Forms.Panel();
            pictureBox1 = new System.Windows.Forms.PictureBox();
            buttonParticipation = new System.Windows.Forms.Button();
            panel3 = new System.Windows.Forms.Panel();
            panel2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)pictureBox2).BeginInit();
            panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)pictureBox1).BeginInit();
            panel3.SuspendLayout();
            SuspendLayout();
            // 
            // panelMainSubject
            // 
            panelMainSubject.AutoScroll = true;
            panelMainSubject.BackColor = System.Drawing.Color.Lavender;
            panelMainSubject.Dock = System.Windows.Forms.DockStyle.Fill;
            panelMainSubject.Location = new System.Drawing.Point(0, 66);
            panelMainSubject.Name = "panelMainSubject";
            panelMainSubject.Size = new System.Drawing.Size(1215, 639);
            panelMainSubject.TabIndex = 48;
            // 
            // panel2
            // 
            panel2.BackColor = System.Drawing.Color.SteelBlue;
            panel2.Controls.Add(pictureBox2);
            panel2.Controls.Add(buttonGrades);
            panel2.Dock = System.Windows.Forms.DockStyle.Right;
            panel2.Location = new System.Drawing.Point(960, 0);
            panel2.Name = "panel2";
            panel2.Size = new System.Drawing.Size(255, 66);
            panel2.TabIndex = 49;
            // 
            // pictureBox2
            // 
            pictureBox2.Dock = System.Windows.Forms.DockStyle.Left;
            pictureBox2.Image = (System.Drawing.Image)resources.GetObject("pictureBox2.Image");
            pictureBox2.Location = new System.Drawing.Point(0, 0);
            pictureBox2.Name = "pictureBox2";
            pictureBox2.Size = new System.Drawing.Size(86, 66);
            pictureBox2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            pictureBox2.TabIndex = 49;
            pictureBox2.TabStop = false;
            // 
            // buttonGrades
            // 
            buttonGrades.BackColor = System.Drawing.Color.SteelBlue;
            buttonGrades.Dock = System.Windows.Forms.DockStyle.Right;
            buttonGrades.FlatAppearance.BorderSize = 0;
            buttonGrades.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            buttonGrades.Font = new System.Drawing.Font("Segoe UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            buttonGrades.ForeColor = System.Drawing.Color.White;
            buttonGrades.Location = new System.Drawing.Point(83, 0);
            buttonGrades.Name = "buttonGrades";
            buttonGrades.Size = new System.Drawing.Size(172, 66);
            buttonGrades.TabIndex = 47;
            buttonGrades.Text = "Grades";
            buttonGrades.UseVisualStyleBackColor = false;
            buttonGrades.Click += buttonGrades_Click;
            // 
            // panel1
            // 
            panel1.BackColor = System.Drawing.Color.SteelBlue;
            panel1.Controls.Add(pictureBox1);
            panel1.Controls.Add(buttonParticipation);
            panel1.Dock = System.Windows.Forms.DockStyle.Left;
            panel1.Location = new System.Drawing.Point(0, 0);
            panel1.Name = "panel1";
            panel1.Size = new System.Drawing.Size(255, 66);
            panel1.TabIndex = 0;
            // 
            // pictureBox1
            // 
            pictureBox1.Dock = System.Windows.Forms.DockStyle.Right;
            pictureBox1.Image = (System.Drawing.Image)resources.GetObject("pictureBox1.Image");
            pictureBox1.Location = new System.Drawing.Point(169, 0);
            pictureBox1.Name = "pictureBox1";
            pictureBox1.Size = new System.Drawing.Size(86, 66);
            pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            pictureBox1.TabIndex = 48;
            pictureBox1.TabStop = false;
            // 
            // buttonParticipation
            // 
            buttonParticipation.BackColor = System.Drawing.Color.SteelBlue;
            buttonParticipation.Dock = System.Windows.Forms.DockStyle.Left;
            buttonParticipation.FlatAppearance.BorderSize = 0;
            buttonParticipation.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            buttonParticipation.Font = new System.Drawing.Font("Segoe UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            buttonParticipation.ForeColor = System.Drawing.Color.White;
            buttonParticipation.Location = new System.Drawing.Point(0, 0);
            buttonParticipation.Name = "buttonParticipation";
            buttonParticipation.Size = new System.Drawing.Size(166, 66);
            buttonParticipation.TabIndex = 47;
            buttonParticipation.Text = "Participation\r\n";
            buttonParticipation.UseVisualStyleBackColor = false;
            buttonParticipation.Click += buttonParticipation_Click;
            // 
            // panel3
            // 
            panel3.BackColor = System.Drawing.Color.FromArgb(192, 192, 255);
            panel3.Controls.Add(panel1);
            panel3.Controls.Add(panel2);
            panel3.Dock = System.Windows.Forms.DockStyle.Top;
            panel3.Location = new System.Drawing.Point(0, 0);
            panel3.Name = "panel3";
            panel3.Size = new System.Drawing.Size(1215, 66);
            panel3.TabIndex = 50;
            // 
            // PageSubjects
            // 
            AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            AutoScroll = true;
            BackColor = System.Drawing.Color.Lavender;
            Controls.Add(panelMainSubject);
            Controls.Add(panel3);
            Name = "PageSubjects";
            Size = new System.Drawing.Size(1215, 705);
            ClientSizeChanged += PageSubjects_ClientSizeChanged;
            panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)pictureBox2).EndInit();
            panel1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)pictureBox1).EndInit();
            panel3.ResumeLayout(false);
            ResumeLayout(false);
        }

        #endregion
        private System.Windows.Forms.Panel panelMainSubject;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.PictureBox pictureBox2;
        private System.Windows.Forms.Button buttonGrades;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Button buttonParticipation;
        private System.Windows.Forms.Panel panel3;
    }
}
