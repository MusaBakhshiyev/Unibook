namespace Unibook.UnibookTeacher
{
    partial class PageGroups
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(PageGroups));
            panelGroups = new System.Windows.Forms.Panel();
            panelOption = new System.Windows.Forms.Panel();
            panel2 = new System.Windows.Forms.Panel();
            pictureBox1 = new System.Windows.Forms.PictureBox();
            buttonParticipation = new System.Windows.Forms.Button();
            panel4 = new System.Windows.Forms.Panel();
            pictureBox2 = new System.Windows.Forms.PictureBox();
            buttonGrades = new System.Windows.Forms.Button();
            panelMain = new System.Windows.Forms.Panel();
            buttonLessonTime = new System.Windows.Forms.Button();
            panelOption.SuspendLayout();
            panel2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)pictureBox1).BeginInit();
            panel4.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)pictureBox2).BeginInit();
            SuspendLayout();
            // 
            // panelGroups
            // 
            panelGroups.BackColor = System.Drawing.SystemColors.GradientInactiveCaption;
            panelGroups.Dock = System.Windows.Forms.DockStyle.Top;
            panelGroups.Location = new System.Drawing.Point(0, 0);
            panelGroups.Name = "panelGroups";
            panelGroups.Size = new System.Drawing.Size(1366, 90);
            panelGroups.TabIndex = 2;
            panelGroups.ControlAdded += panelGroups_ControlAdded;
            // 
            // panelOption
            // 
            panelOption.BackColor = System.Drawing.SystemColors.GradientInactiveCaption;
            panelOption.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            panelOption.Controls.Add(buttonLessonTime);
            panelOption.Controls.Add(panel2);
            panelOption.Controls.Add(panel4);
            panelOption.Dock = System.Windows.Forms.DockStyle.Top;
            panelOption.Location = new System.Drawing.Point(0, 90);
            panelOption.Name = "panelOption";
            panelOption.Size = new System.Drawing.Size(1366, 66);
            panelOption.TabIndex = 51;
            panelOption.Visible = false;
            // 
            // panel2
            // 
            panel2.BackColor = System.Drawing.Color.SteelBlue;
            panel2.Controls.Add(pictureBox1);
            panel2.Controls.Add(buttonParticipation);
            panel2.Dock = System.Windows.Forms.DockStyle.Left;
            panel2.Location = new System.Drawing.Point(0, 0);
            panel2.Name = "panel2";
            panel2.Size = new System.Drawing.Size(327, 64);
            panel2.TabIndex = 0;
            // 
            // pictureBox1
            // 
            pictureBox1.Dock = System.Windows.Forms.DockStyle.Right;
            pictureBox1.Image = (System.Drawing.Image)resources.GetObject("pictureBox1.Image");
            pictureBox1.Location = new System.Drawing.Point(241, 0);
            pictureBox1.Name = "pictureBox1";
            pictureBox1.Size = new System.Drawing.Size(86, 64);
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
            buttonParticipation.Size = new System.Drawing.Size(239, 64);
            buttonParticipation.TabIndex = 47;
            buttonParticipation.Text = "Modify Participation\r\n";
            buttonParticipation.UseVisualStyleBackColor = false;
            buttonParticipation.Click += buttonParticipation_Click;
            // 
            // panel4
            // 
            panel4.BackColor = System.Drawing.Color.SteelBlue;
            panel4.Controls.Add(pictureBox2);
            panel4.Controls.Add(buttonGrades);
            panel4.Dock = System.Windows.Forms.DockStyle.Right;
            panel4.Location = new System.Drawing.Point(1070, 0);
            panel4.Name = "panel4";
            panel4.Size = new System.Drawing.Size(294, 64);
            panel4.TabIndex = 49;
            // 
            // pictureBox2
            // 
            pictureBox2.Dock = System.Windows.Forms.DockStyle.Left;
            pictureBox2.Image = (System.Drawing.Image)resources.GetObject("pictureBox2.Image");
            pictureBox2.Location = new System.Drawing.Point(0, 0);
            pictureBox2.Name = "pictureBox2";
            pictureBox2.Size = new System.Drawing.Size(86, 64);
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
            buttonGrades.Location = new System.Drawing.Point(85, 0);
            buttonGrades.Name = "buttonGrades";
            buttonGrades.Size = new System.Drawing.Size(209, 64);
            buttonGrades.TabIndex = 47;
            buttonGrades.Text = "Modify Grades";
            buttonGrades.UseVisualStyleBackColor = false;
            buttonGrades.Click += buttonGrades_Click;
            // 
            // panelMain
            // 
            panelMain.BackColor = System.Drawing.Color.Lavender;
            panelMain.Dock = System.Windows.Forms.DockStyle.Fill;
            panelMain.Location = new System.Drawing.Point(0, 156);
            panelMain.Name = "panelMain";
            panelMain.Size = new System.Drawing.Size(1366, 432);
            panelMain.TabIndex = 52;
            // 
            // buttonLessonTime
            // 
            buttonLessonTime.BackColor = System.Drawing.Color.LightSteelBlue;
            buttonLessonTime.Dock = System.Windows.Forms.DockStyle.Fill;
            buttonLessonTime.FlatAppearance.BorderSize = 0;
            buttonLessonTime.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            buttonLessonTime.Font = new System.Drawing.Font("Segoe UI", 20.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            buttonLessonTime.ForeColor = System.Drawing.Color.White;
            buttonLessonTime.Location = new System.Drawing.Point(327, 0);
            buttonLessonTime.Name = "buttonLessonTime";
            buttonLessonTime.Size = new System.Drawing.Size(743, 64);
            buttonLessonTime.TabIndex = 50;
            buttonLessonTime.Text = "Lesson Time";
            buttonLessonTime.UseVisualStyleBackColor = false;
            buttonLessonTime.Click += buttonLessonTime_Click;
            // 
            // PageGroups
            // 
            AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            Controls.Add(panelMain);
            Controls.Add(panelOption);
            Controls.Add(panelGroups);
            Name = "PageGroups";
            Size = new System.Drawing.Size(1366, 588);
            panelOption.ResumeLayout(false);
            panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)pictureBox1).EndInit();
            panel4.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)pictureBox2).EndInit();
            ResumeLayout(false);
        }

        #endregion

        private System.Windows.Forms.Panel panelGroups;
        private System.Windows.Forms.Panel panelOption;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Button buttonParticipation;
        private System.Windows.Forms.Panel panel4;
        private System.Windows.Forms.PictureBox pictureBox2;
        private System.Windows.Forms.Button buttonGrades;
        private System.Windows.Forms.Panel panelMain;
        private System.Windows.Forms.Button buttonLessonTime;
    }
}
